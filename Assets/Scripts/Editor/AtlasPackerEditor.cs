using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using System.Text.RegularExpressions;
using System.Diagnostics;

/// <summary>
/// 图集打包
/// </summary>
public class AtlasPackerEditor: Editor
{

    static private string uiOriginPath = "Res/UI/Texture/Package";
    static private string uiMobilePath = "Res/UI/Texture/Atlas";

    [MenuItem("Assets/GenerateAtlas")]
    static void GenAtlas()
    {
        string[] strs = Selection.assetGUIDs;
        if (strs.Length <= 0)
        {
            return;
        }
        string AtlasPath = AssetDatabase.GUIDToAssetPath(strs[0]);

        // string tempPath = dirs[i].Replace("\\", "/");
        DirectoryInfo dir = new DirectoryInfo(AtlasPath);
        string folderName = dir.Name;

        // png路径
        string pngFilePath = AtlasPath + "/" + folderName + ".png";
        // tpsheet路径
        string tpsheetFilePath = AtlasPath + "/" + folderName + ".tpsheet";
        //来源
        string imagePath = AtlasPath + "/images";

        UnityEngine.Debug.Log("source::" + imagePath);
        UnityEngine.Debug.Log("pngFilePath:" + pngFilePath);
        UnityEngine.Debug.Log("tpsheetFilePath:" + tpsheetFilePath);

        // 获取文件夹名称，图集已文件夹名称命名
        string commandline = "{0} --max-size 2048 --no-trim --allow-free-size " +
            "--format unity-texture2d --shape-padding 0 --border-padding 0 --disable-rotation " +
            "--algorithm MaxRects --opt RGBA8888 --scale 1 --sheet {1} --data {2}";
        commandline = string.Format(commandline, imagePath, pngFilePath, tpsheetFilePath);

        Process myprocess = new Process();
        ProcessStartInfo startInfo = new ProcessStartInfo("TexturePacker.exe", commandline);
        myprocess.StartInfo = startInfo;
        myprocess.StartInfo.UseShellExecute = false;
        myprocess.Start();

        // var sprite = AssetDatabase.LoadAssetAtPath<Sprite>(pngFilePath) as Sprite;
        // EditorUtility.SetDirty(sprite);
        // AssetDatabase.SaveAssets();
        // AssetDatabase.Refresh();

        // CreateAtlasPrefabHelper(AtlasPath);
    }

    public static void CreateAtlasPrefabHelper(string AtlasPath)
    {
        string[] _patterns = new string[] { "*.png" };
        string multiTag = "_multi_";
        Dictionary<string, List<string>> _allFilePaths = new Dictionary<string, List<string>>();
        string _tempName = String.Empty;
        foreach (var item in _patterns)
        {
            // string[] _temp = Directory.GetFiles(AtlasPath, item, SearchOption.AllDirectories);
            string[] _temp = Directory.GetFiles(AtlasPath, item, SearchOption.TopDirectoryOnly);
            foreach (string path in _temp)
            {
                System.IO.FileInfo _fi = new System.IO.FileInfo(path);
                _tempName = _fi.Name.Replace(_fi.Extension, "").ToLower();
                if (!_tempName.Contains(multiTag))
                {
                    _tempName = _tempName;
                }
                else
                {
                    _tempName = _tempName.Split(multiTag)[0];
                }
                if (!_allFilePaths.ContainsKey(_tempName))
                {
                    _allFilePaths.Add(_tempName, new List<string>());
                }
                _allFilePaths[_tempName].Add(path);
            }
        }

        foreach (var item in _allFilePaths)
        {
            CreateAtlasPrefab(item.Key, item.Value.ToArray(),AtlasPath);
        }
    }


    [MenuItem("Assets/GenerateAtlasPrefab")]
    public static void GenAtlasPrefab()
    {
        string[] strs = Selection.assetGUIDs;
        if (strs.Length <= 0)
        {
            return;
        }
        string AtlasPath = AssetDatabase.GUIDToAssetPath(strs[0]);

        CreateAtlasPrefabHelper(AtlasPath);
    }

    //创建图集预设
    public static void CreateAtlasPrefab(string atlasName, string[] atlPath,string outputPath)
    {
        List<Sprite> _texs = new List<Sprite>();
        foreach (string path in atlPath)
        {
            _texs.AddRange(AssetDatabase.LoadAllAssetsAtPath(path).OfType<Sprite>().ToArray());
        }
        if (null != _texs)
        {
            string path1 = outputPath + "/" + atlasName + ".prefab";
            GameObject _originGo = AssetDatabase.LoadAssetAtPath(path1, typeof(GameObject)) as GameObject;
            GameObject _go;
            SpriteData _spData;
            if(_originGo!=null)
            {
                _go = PrefabUtility.InstantiatePrefab(_originGo) as GameObject;
                _spData = _go.GetComponent<SpriteData>();
            }
            else
            {
                _go = new GameObject();
                _spData = _go.AddComponent<SpriteData>();
            }
            _go.name = atlasName;
            _spData.SetSP = _texs.ToArray();

            
            if (_originGo!=null) 
            {
                PrefabUtility.ReplacePrefab(_go, _originGo, ReplacePrefabOptions.ConnectToPrefab);
                GameObject.DestroyImmediate(_go);
                UnityEngine.Debug.Log("AtlasPrefabReplaced:"+path1);
            }
            else
            {
                GameObject temp = PrefabUtility.CreatePrefab(path1, _go);
                UnityEngine.Debug.Log("AtlasPrefabCreated:"+path1);

                GameObject.DestroyImmediate(_go);
                EditorUtility.SetDirty(temp);
            }

            // AssetImporter importer = AssetImporter.GetAtPath(path1);
            // if (importer == null || temp == null)
            // {
            //     Debug.LogError("error: " + path1);
            //     return;
            // }
            // importer.assetBundleName = "";
            AssetDatabase.SaveAssets();
        }
        Resources.UnloadUnusedAssets();
        AssetDatabase.Refresh();
    }
}

public static class ExtensionTools
{
    /// 根据字符串来分割字符串
    public static string[] Split(this string str, string separator)
    {
		return Regex.Split(str, separator, RegexOptions.IgnoreCase);
    }
}