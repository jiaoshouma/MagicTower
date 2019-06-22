sun = sun or {}
-- global variables / functions
function import(filename)
    return CS.KSFramework.LuaModule.Instance:Import(filename)

end

--also can use this to extends instead
function class(classname,super)
    local superType = type(super)
    local cls
    if superType ~= "table" then
        superType = nil
        super = nil
    end

    if super then
        cls = {}
        setmetatable(cls,{__index = super})
        cls.super = super
    else
        cls = {ctor = function() end}       
    end
    cls.__cname = classname
    cls.__index = cls

    function cls.new(...)
        local instance = setmetatable({},cls)
        instance.class = cls
        instance:ctor(...)
        return instance
    end

    return cls
end

function IsNil(obj)
    if type(obj) ~= "userdata" then
        return obj == nil 
    else
        return obj:Equals(nil)
    end
end

function handler(obj,func)
    return function()
        if not IsNil(obj) then
            func(obj)
        end 
    end
end

-- simple class extends
function extends(class, base)
    base.__index = base
    setmetatable(class, base)
end

-- simple new table to a object
function new(table, ctorFunc)
    assert(table ~= nil)

    table.__index = table

    local tb = {}
    setmetatable(tb, table)

    if ctorFunc then
        ctorFunc(tb)
    end

    return tb
end

function __TRACE(...)
    print(...)
    print(debug.traceback())
end

function print_r ( t )  
    local printStr = ""
    function printStrAdd(str)
        printStr = printStr .. str .. "\n"
    end
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            printStrAdd(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        printStrAdd(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        printStrAdd(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        printStrAdd(indent.."["..pos..'] => "'..val..'"')
                    else
                        printStrAdd(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                printStrAdd(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        printStrAdd(tostring(t).." {")
        sub_print_r(t,"  ")
        printStrAdd("}")
    else
        sub_print_r(t,"  ")
    end
    print(printStr)
end

---@type KSFramework.Cookie
Cookie = CS.KSFramework.Cookie
---@type KEngine.Log
Log = CS.KEngine.Log
---@type KSFramework.I18N
I18N = CS.KSFramework.I18N
---@type KEngine.UI.UIModule
UIModule = CS.KEngine.UI.UIModule
---@type KEngine.SceneLoader
SceneLoader = CS.KEngine.SceneLoader
---@type KEngine.LoaderMode
LoaderMode = CS.KEngine.LoaderMode
---@type AppSettings.BillboardSettings
BillboardSettings = CS.AppSettings.BillboardSettings
---@type AppSettings.GameConfigSettings
GameConfigSettings = CS.AppSettings.GameConfigSettings
---@type AppSettings.TestSettings
TestSettings = CS.AppSettings.TestSettings

Enums = import("Enums")
Const = import("Const")
Utils = import("Utils")
UIBase = import("UI/UIBase")
Tools 		= import("Tools")
import("Coroutine")
import("UpdateBeat")
import("Timer")
import("CSharpBinding")
print("Init.lua script finish!Start lua logic----")
--set lang here
sun.lang = PlayerPrefs.GetString("GameLang","zh_CN")
CS.KSFramework.I18NModule.SetLang(sun.lang)
print("RunForLang:"..sun.lang)
sun.Game = import("Game")
sun.Game.get():startGame()