from __future__ import print_function
import argparse
import os
import shutil
import sys
import xlrd
import base64
import re
import msvcrt
import traceback
import imp

default_encoding = "utf-8"

if sys.getdefaultencoding != default_encoding:
	imp.reload(sys)
	# for reload,imp need to be imported in python 3 
	# no this function in python 3.in python 3 string use unicode defaultly
	# sys.setdefaultencoding(default_encoding)

CONFIG_PATH = "./"
OUTPUT_PATH = "./tables/"
APP_TABLE_PATH = "../Product/Lua/Data/tables/"

CELL_TYPE_EMPTY = 0
CELL_TYPE_TEXT = 1
CELL_TYPE_NUMBER = 2
CELL_TYPE_DATE = 3
CELL_TYPE_BOOLEAN = 4
CELL_TYPE_ERROR = 5
CELL_TYPE_BLANK = 6

class LangConf:
	def __init__(self,lang,directory,colOffset):
		self.lang = lang
		self.directory = directory
		self.colOffset = colOffset

def find_split_chars(chars):
	result = []
	charDict = {}
	for char in chars:
		# print(char,ord(char),"char_value-------")
		if (ord(char) == 124 or ord(char) == 58 or ord(char) == 59) and not (char in charDict):
			result.append(char)
			charDict[char] = True
	return result

def is_number(s):
	try:
		float(s)
		return True
	except ValueError:
		pass
	return False

def split_chars(chars,splitChars,totalResult):
	# print(chars,splitChars,totalResult,"------split_chars----")
	if len(splitChars) == 0:
		formatStr = "{0}"
		if not is_number(chars):
			formatStr = "\"{0}\""	
		totalResult.append(formatStr.format(chars))
		# print(totalResult,chars,"==========")
	else:
		splitChar = splitChars.pop()
		result = chars.split(splitChar)
		for i,childChars in enumerate(result):
			splitCharsCopy = splitChars[:]
			if i == 0:
				totalResult.append("{")
			split_chars(childChars,splitCharsCopy,totalResult)
			if i == len(result) - 1:
				totalResult.append("}")
			else:
				totalResult.append(",")
def convert_misc(filename,name):
	print("Converting file(new) '{0}' ...".format(filename))
	workbook = xlrd.open_workbook(filename)
	sheetnames = workbook.sheet_names()
	outputfile = ""
	for sheetname in sheetnames:
		print("Converting sheet '{0}'...".format(sheetname))
		worksheet = workbook.sheet_by_name(sheetname)

		if worksheet.nrows < 2:
			print("Mailformed sheet '{0}',at least 2 rows.".format(sheetname))
			return
		outputfile = os.path.join(OUTPUT_PATH,name + ".lua")

		with open(outputfile,"w",encoding="utf-8") as fout:
			fout.write("local tables = {}\n")

			fout.write("table.data = {\n")
			for i in range(2,worksheet.nrows):
				for j in range(0,worksheet.ncols):
					celltype = worksheet.cell_type(i,j)
					cellvalue = worksheet.cell_value(i,j)
					if j == 0:
						fout.write("{0} = ".format(cellvalue))
						continue
					else:
						if j == 1:
							fout.write("{")
					if celltype == CELL_TYPE_EMPTY:
						cellvalue = "\"\""
					elif celltype == CELL_TYPE_TEXT:
						# cellvalue = cellvalue.encode("utf-8")
						splitChars = find_split_chars(cellvalue)
						totalResult = []
						split_chars(cellvalue,splitChars,totalResult)
						totalResult = "".join(totalResult)
						cellvalue = totalResult
						# cellvalue = "\"{0}\"".format(totalResult)
						# print(cellvalue,"----------------cellvalue-------------------")
					elif celltype == CELL_TYPE_NUMBER:
						num = int(cellvalue)
						if num == cellvalue:
							cellvalue = num
					else:
						print("Sheet {0} contains invalid cell at ({1} {2})".format(sheetname,i,j))
						cellvalue = "\"\""
					fout.write("{0},".format(cellvalue))
				fout.write("},\n")
			fout.write("}\n")

			fout.write("return table\n")
def convert(filename,name):
	if name == "misc":
		convert_misc(filename,name)
		return
	print("Converting file '{0}' ...".format(filename))
	workbook = xlrd.open_workbook(filename)
	sheetnames = workbook.sheet_names()
	outputfile = ""

	for sheetname in sheetnames:
		print("Converting sheet '{0}'...".format(sheetname))
		worksheet = workbook.sheet_by_name(sheetname)

		if worksheet.nrows < 2:
			print("Mailformed sheet '{0}',at least 2 rows.".format(sheetname))
			return
		outputfile = os.path.join(OUTPUT_PATH,name + ".lua")

		with open(outputfile,"w",encoding="utf-8") as fout:
			fout.write("local tables = {}\n")

			fout.write("table.keys = {")

			emptyRow = {}
			for j in range(0,worksheet.ncols):
				celltype = worksheet.cell_type(1,j)
				cellvalue = worksheet.cell_value(1,j)
				if celltype == CELL_TYPE_TEXT:
					# cellvalue = cellvalue.encode("utf-8")
					cellvalue = cellvalue
				elif celltype == CELL_TYPE_NUMBER:
					num = int(cellvalue)
					if num == cellvalue:
						cellvalue = num
				else:
					cellvalue = ""
					emptyRow[j] = True
					continue
				fout.write("\"{0}\",".format(cellvalue))
			fout.write("}\n")

			fout.write("table.rows = {\n")
			for i in range(2,worksheet.nrows):
				fout.write("{")
				for j in range(0,worksheet.ncols):
					if emptyRow.get(j,False):
						continue
					celltype = worksheet.cell_type(i,j)
					cellvalue = worksheet.cell_value(i,j)
					if celltype == CELL_TYPE_EMPTY:
						cellvalue = "\"\""
					elif celltype == CELL_TYPE_TEXT:
						# cellvalue = cellvalue.encode("utf-8")
						cellvalue = "[==[{0}]==]".format(cellvalue)
					elif celltype == CELL_TYPE_NUMBER:
						num = int(cellvalue)
						if num == cellvalue:
							cellvalue = num
						cellvalue = "\"{0}\"".format(cellvalue)
					else:
						print("Sheet {0} contains invalid cell at ({1} {2})".format(sheetname,i,j))
						cellvalue = "\"\""
					fout.write("{0},".format(cellvalue))
				fout.write("},\n")
			fout.write("}\n")

			fout.write("return table\n")

def convert_translation(langPath,lang,colOffset,langfile):
	print("Converting translation directory'{0}'... ".format(langPath))


def convert_translation_init(langPath,lang,colOffset):
	print("Converting translation directory'{0}'... ".format(langPath))

def mainFunction(args):
	allLogString = ""
	if args.file:
		filename = args.file
		name,ext = os.path.splitext(filename)
		if ext == ".xls" or ext == ".xlsx":
			convert(CONFIG_PATH + filename,name)
			outputName = name + ".lua"
			shutil.move(OUTPUT_PATH + outputName,APP_TABLE_PATH + outputName)
	else:
		if not args.lang:
			for filename in os.listdir(CONFIG_PATH):
				name,ext = os.path.splitext(filename)
				if ext == ".xls" or ext == ".xlsx":
					convert(CONFIG_PATH + filename,name)
		if args.command != "skip_translation":
			print("===========start gen translation===============")
		for filename in os.listdir(OUTPUT_PATH):
			name,ext = os.path.splitext(filename)
			if ext == ".lua":
				shutil.move(OUTPUT_PATH + filename,APP_TABLE_PATH + filename)

def waitForInput(msg):
	print(msg)
	print("Press Q to exit...")
	while True:
		ch = ord(msvcrt.getch())
		if ch == 113 or ch == 81:
			break

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Converts excel file to lua script.")
	parser.add_argument("-f","--file")
	parser.add_argument("-l","--lang")
	parser.add_argument("-c","--command")

	args = parser.parse_args()

	if os.path.exists(OUTPUT_PATH):
		shutil.rmtree(OUTPUT_PATH)
	os.makedirs(OUTPUT_PATH)
	try:
		mainFunction(args)
	except:
		msg = traceback.format_exc()
		print(msg)
		waitForInput("error!!!")
	else:
		waitForInput("Suceess.")