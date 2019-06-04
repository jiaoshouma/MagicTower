
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
import("CSharpBinding")
print("Init.lua script finish!Start lua logic----")
import("Game")
