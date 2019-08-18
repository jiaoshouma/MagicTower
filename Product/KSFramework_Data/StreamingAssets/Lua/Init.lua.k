sun = sun or {}
-- global variables / functions
function import(filename)
    return CS.KSFramework.LuaModule.Instance:Import(filename)
end
import("functions")

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

RoleCardSettings = CS.AppSettings.RoleCardSettings
StgCardSettings = CS.AppSettings.StgCardSettings
FoodCardSettings = CS.AppSettings.FoodCardSettings
SoldierCardSettings = CS.AppSettings.SoldierCardSettings
---@type AppSettings.GameConfigSettings
GameConfigSettings = CS.AppSettings.GameConfigSettings

SunUtils = CS.SunUtils
---@type AppSettings.TestSettings
TestSettings = CS.AppSettings.TestSettings

import("Enums")
import("Const")
import("Event")
import("Utils")
import("Global")
import("DataModule/tables")
UIBase = import("UI/UIBase")
Tools 		= import("Tools")
import("Coroutine")
import("UpdateBeat")
import("Timer")
import("CSharpBinding")
import("LuaConfig")
print("Init.lua script finish!Start lua logic----")
--set lang here
--Tools model:
sun.lang = PlayerPrefs.GetString("GameLang","zh_CN")
CS.KSFramework.I18NModule.SetLang(sun.lang)
-->>local logic module
sun.GameLogic = import("Backend/GameLogic")
sun.GameMatcher = import("Backend/GameMatcher")
--<<
sun.Backend = import("Backend/Backend")
sun.GameOperator = import("Behaviour/GameOperator")
sun.ModelManager = import("ModelManager")
sun.AssetsLoader = import("AssetsLoader")
sun.EventDispatcher = import("EventDispatcher")
sun.KeyboardListener = import("KeyboardListener")
sun.KeyboardListener.get()
math.randomseed(os.time())

print("RunForLang:"..sun.lang)

-------------------------------------------
--Logic model:
sun.CardManager = import("Cards/CardManager")

-------------------------------------------

sun.Game = import("Game")
sun.Game.get():startGame()