#if USE_UNI_LUA
using LuaAPI = UniLua.Lua;
using RealStatePtr = UniLua.ILuaState;
using LuaCSFunction = UniLua.CSharpFunctionDelegate;
#else
using LuaAPI = XLua.LuaDLL.Lua;
using RealStatePtr = System.IntPtr;
using LuaCSFunction = XLua.LuaDLL.lua_CSFunction;
#endif

using XLua;
using System.Collections.Generic;


namespace XLua.CSObjectWrap
{
    using Utils = XLua.Utils;
    public class KEngineKToolWrap 
    {
        public static void __Register(RealStatePtr L)
        {
			ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			System.Type type = typeof(KEngine.KTool);
			Utils.BeginObjectRegister(type, L, translator, 0, 0, 0, 0);
			
			
			
			
			
			
			Utils.EndObjectRegister(type, L, translator, null, null,
			    null, null, null);

		    Utils.BeginClassRegister(type, L, __CreateInstance, 65, 0, 0);
			Utils.RegisterFunc(L, Utils.CLS_IDX, "IsWifi", _m_IsWifi_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetNearestPower2", _m_GetNearestPower2_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "CheckPow2", _m_CheckPow2_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ResetLocalTransform", _m_ResetLocalTransform_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetGCD", _m_GetGCD_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "FindType", _m_FindType_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "DestroyGameObjectChildren", _m_DestroyGameObjectChildren_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetWaveRandomNumberInt", _m_GetWaveRandomNumberInt_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetWaveRandomNumber", _m_GetWaveRandomNumber_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ParseMinMaxNumber", _m_ParseMinMaxNumber_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "IsBetweenWave", _m_IsBetweenWave_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "IsContains", _m_IsContains_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "FindShader", _m_FindShader_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "StructToBytes", _m_StructToBytes_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MakeDword", _m_MakeDword_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "LoWord", _m_LoWord_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "HiWord", _m_HiWord_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "FormatToAssetUrl", _m_FormatToAssetUrl_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MakeLong", _m_MakeLong_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "HiInt", _m_HiInt_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "LowInt", _m_LowInt_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "HumanizeTimeString", _m_HumanizeTimeString_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetUtcDay", _m_GetUtcDay_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetDeltaMinutes", _m_GetDeltaMinutes_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetDeltaHours", _m_GetDeltaHours_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetDeltaDay", _m_GetDeltaDay_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetDateTimeByUtcMilliseconds", _m_GetDateTimeByUtcMilliseconds_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetDateTimeByUtcSeconds", _m_GetDateTimeByUtcSeconds_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetUtcMilliseconds", _m_GetUtcMilliseconds_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetUtcSeconds", _m_GetUtcSeconds_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "HumanizeNumber", _m_HumanizeNumber_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "Match", _m_Match_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "Format", _m_Format_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "FormatArgs", _m_FormatArgs_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "SetLayer", _m_SetLayer_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "DFSFindObject", _m_DFSFindObject_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetGameObject", _m_GetGameObject_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "SetChild", _m_SetChild_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ResetTransform", _m_ResetTransform_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetRootPathName", _m_GetRootPathName_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MD5_Stream", _m_MD5_Stream_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MD5_File", _m_MD5_File_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MD5_bytes", _m_MD5_bytes_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "MD5_16bit", _m_MD5_16bit_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "IntLerp", _m_IntLerp_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ScaleParticleSystem", _m_ScaleParticleSystem_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "SetParticleSystemRenderQueue", _m_SetParticleSystemRenderQueue_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "CopyTransformToTarget", _m_CopyTransformToTarget_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "HasWriteAccessToFolder", _m_HasWriteAccessToFolder_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "SetStaticRecursively", _m_SetStaticRecursively_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetNormalizedAngle", _m_GetNormalizedAngle_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "AdjustCollidersCenterZ", _m_AdjustCollidersCenterZ_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ToTitleCase", _m_ToTitleCase_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "ToSentenceCase", _m_ToSentenceCase_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "Probability", _m_Probability_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetSmartNpcPoints", _m_GetSmartNpcPoints_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetParallelPoints", _m_GetParallelPoints_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "LineIntersectionPoint", _m_LineIntersectionPoint_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "IsNumber", _m_IsNumber_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetRelativePositionOfEllipse", _m_GetRelativePositionOfEllipse_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "Angle", _m_Angle_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "NumberFormatTo3", _m_NumberFormatTo3_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetIpAddressFromIpHostEntry", _m_GetIpAddressFromIpHostEntry_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "GetIpAddress", _m_GetIpAddress_xlua_st_);
            
			
            
			
			
			
			Utils.EndClassRegister(type, L, translator);
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int __CreateInstance(RealStatePtr L)
        {
            
			try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
				if(LuaAPI.lua_gettop(L) == 1)
				{
					
					KEngine.KTool gen_ret = new KEngine.KTool();
					translator.Push(L, gen_ret);
                    
					return 1;
				}
				
			}
			catch(System.Exception gen_e) {
				return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
			}
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool constructor!");
            
        }
        
		
        
		
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_IsWifi_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    
                        bool gen_ret = KEngine.KTool.IsWifi(  );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetNearestPower2_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _num = LuaAPI.xlua_tointeger(L, 1);
                    
                        int gen_ret = KEngine.KTool.GetNearestPower2( _num );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_CheckPow2_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _num = LuaAPI.xlua_tointeger(L, 1);
                    
                        bool gen_ret = KEngine.KTool.CheckPow2( _num );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ResetLocalTransform_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Transform _t = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    
                    KEngine.KTool.ResetLocalTransform( _t );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetGCD_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _a = LuaAPI.xlua_tointeger(L, 1);
                    int _b = LuaAPI.xlua_tointeger(L, 2);
                    
                        int gen_ret = KEngine.KTool.GetGCD( _a, _b );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_FindType_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _qualifiedTypeName = LuaAPI.lua_tostring(L, 1);
                    
                        System.Type gen_ret = KEngine.KTool.FindType( _qualifiedTypeName );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_DestroyGameObjectChildren_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.GameObject _go = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    
                    KEngine.KTool.DestroyGameObjectChildren( _go );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetWaveRandomNumberInt_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _waveNumberStr = LuaAPI.lua_tostring(L, 1);
                    
                        int gen_ret = KEngine.KTool.GetWaveRandomNumberInt( _waveNumberStr );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetWaveRandomNumber_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _waveNumberStr = LuaAPI.lua_tostring(L, 1);
                    
                        float gen_ret = KEngine.KTool.GetWaveRandomNumber( _waveNumberStr );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ParseMinMaxNumber_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _str = LuaAPI.lua_tostring(L, 1);
                    
                        KEngine.KTool.FromToNumber gen_ret = KEngine.KTool.ParseMinMaxNumber( _str );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_IsBetweenWave_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _waveNumberStr = LuaAPI.lua_tostring(L, 1);
                    int _testNumber = LuaAPI.xlua_tointeger(L, 2);
                    
                        bool gen_ret = KEngine.KTool.IsBetweenWave( _waveNumberStr, _testNumber );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_IsContains_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 3&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)&& (LuaAPI.lua_isnil(L, 2) || LuaAPI.lua_type(L, 2) == LuaTypes.LUA_TSTRING)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 3)) 
                {
                    string _numberStr = LuaAPI.lua_tostring(L, 1);
                    string _testValue = LuaAPI.lua_tostring(L, 2);
                    char _sp = (char)LuaAPI.xlua_tointeger(L, 3);
                    
                        bool gen_ret = KEngine.KTool.IsContains( _numberStr, _testValue, _sp );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)&& (LuaAPI.lua_isnil(L, 2) || LuaAPI.lua_type(L, 2) == LuaTypes.LUA_TSTRING)) 
                {
                    string _numberStr = LuaAPI.lua_tostring(L, 1);
                    string _testValue = LuaAPI.lua_tostring(L, 2);
                    
                        bool gen_ret = KEngine.KTool.IsContains( _numberStr, _testValue );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.IsContains!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_FindShader_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _shaderName = LuaAPI.lua_tostring(L, 1);
                    
                        UnityEngine.Shader gen_ret = KEngine.KTool.FindShader( _shaderName );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_StructToBytes_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    object _structObject = translator.GetObject(L, 1, typeof(object));
                    
                        byte[] gen_ret = KEngine.KTool.StructToBytes( _structObject );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MakeDword_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    ushort _high = (ushort)LuaAPI.xlua_tointeger(L, 1);
                    ushort _low = (ushort)LuaAPI.xlua_tointeger(L, 2);
                    
                        uint gen_ret = KEngine.KTool.MakeDword( _high, _low );
                        LuaAPI.xlua_pushuint(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_LoWord_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    uint _low = LuaAPI.xlua_touint(L, 1);
                    
                        ushort gen_ret = KEngine.KTool.LoWord( _low );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_HiWord_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    uint _high = LuaAPI.xlua_touint(L, 1);
                    
                        ushort gen_ret = KEngine.KTool.HiWord( _high );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_FormatToAssetUrl_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _filePath = LuaAPI.lua_tostring(L, 1);
                    
                        string gen_ret = KEngine.KTool.FormatToAssetUrl( _filePath );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MakeLong_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    uint _high = LuaAPI.xlua_touint(L, 1);
                    uint _low = LuaAPI.xlua_touint(L, 2);
                    
                        ulong gen_ret = KEngine.KTool.MakeLong( _high, _low );
                        LuaAPI.lua_pushuint64(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_HiInt_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    ulong _l = LuaAPI.lua_touint64(L, 1);
                    
                        uint gen_ret = KEngine.KTool.HiInt( _l );
                        LuaAPI.xlua_pushuint(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_LowInt_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    ulong _l = LuaAPI.lua_touint64(L, 1);
                    
                        uint gen_ret = KEngine.KTool.LowInt( _l );
                        LuaAPI.xlua_pushuint(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_HumanizeTimeString_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _seconds = LuaAPI.xlua_tointeger(L, 1);
                    
                        string gen_ret = KEngine.KTool.HumanizeTimeString( _seconds );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetUtcDay_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    
                        int gen_ret = KEngine.KTool.GetUtcDay(  );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetDeltaMinutes_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.DateTime _origin;translator.Get(L, 1, out _origin);
                    
                        int gen_ret = KEngine.KTool.GetDeltaMinutes( _origin );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetDeltaHours_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.DateTime _origin;translator.Get(L, 1, out _origin);
                    
                        int gen_ret = KEngine.KTool.GetDeltaHours( _origin );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetDeltaDay_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.DateTime _origin;translator.Get(L, 1, out _origin);
                    
                        int gen_ret = KEngine.KTool.GetDeltaDay( _origin );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetDateTimeByUtcMilliseconds_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& (LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1) || LuaAPI.lua_isint64(L, 1))&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 2)) 
                {
                    long _utcTime = LuaAPI.lua_toint64(L, 1);
                    int _zone = LuaAPI.xlua_tointeger(L, 2);
                    
                        System.DateTime gen_ret = KEngine.KTool.GetDateTimeByUtcMilliseconds( _utcTime, _zone );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& (LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1) || LuaAPI.lua_isint64(L, 1))) 
                {
                    long _utcTime = LuaAPI.lua_toint64(L, 1);
                    
                        System.DateTime gen_ret = KEngine.KTool.GetDateTimeByUtcMilliseconds( _utcTime );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetDateTimeByUtcMilliseconds!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetDateTimeByUtcSeconds_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 2)) 
                {
                    double _unixTimeStamp = LuaAPI.lua_tonumber(L, 1);
                    int _zone = LuaAPI.xlua_tointeger(L, 2);
                    
                        System.DateTime gen_ret = KEngine.KTool.GetDateTimeByUtcSeconds( _unixTimeStamp, _zone );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1)) 
                {
                    double _unixTimeStamp = LuaAPI.lua_tonumber(L, 1);
                    
                        System.DateTime gen_ret = KEngine.KTool.GetDateTimeByUtcSeconds( _unixTimeStamp );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetDateTimeByUtcSeconds!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetUtcMilliseconds_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 0) 
                {
                    
                        double gen_ret = KEngine.KTool.GetUtcMilliseconds(  );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& translator.Assignable<System.DateTime>(L, 1)) 
                {
                    System.DateTime _date;translator.Get(L, 1, out _date);
                    
                        double gen_ret = KEngine.KTool.GetUtcMilliseconds( _date );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetUtcMilliseconds!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetUtcSeconds_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 0) 
                {
                    
                        double gen_ret = KEngine.KTool.GetUtcSeconds(  );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& translator.Assignable<System.DateTime>(L, 1)) 
                {
                    System.DateTime _date;translator.Get(L, 1, out _date);
                    
                        double gen_ret = KEngine.KTool.GetUtcSeconds( _date );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetUtcSeconds!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_HumanizeNumber_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _number = LuaAPI.xlua_tointeger(L, 1);
                    
                        string gen_ret = KEngine.KTool.HumanizeNumber( _number );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Match_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _find = LuaAPI.lua_tostring(L, 1);
                    string _pattern = LuaAPI.lua_tostring(L, 2);
                    
                        string[] gen_ret = KEngine.KTool.Match( _find, _pattern );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Format_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _source = LuaAPI.lua_tostring(L, 1);
                    object[] _args = translator.GetParams<object>(L, 2);
                    
                        string gen_ret = KEngine.KTool.Format( _source, _args );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_FormatArgs_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    string _source = LuaAPI.lua_tostring(L, 1);
                    object[] _args = (object[])translator.GetObject(L, 2, typeof(object[]));
                    
                        string gen_ret = KEngine.KTool.FormatArgs( _source, _args );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_SetLayer_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.GameObject _go = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    int _layer = LuaAPI.xlua_tointeger(L, 2);
                    
                    KEngine.KTool.SetLayer( _go, _layer );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_DFSFindObject_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    string _name = LuaAPI.lua_tostring(L, 2);
                    
                        UnityEngine.GameObject gen_ret = KEngine.KTool.DFSFindObject( _parent, _name );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetGameObject_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 3&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)&& translator.Assignable<UnityEngine.Transform>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)) 
                {
                    string _name = LuaAPI.lua_tostring(L, 1);
                    UnityEngine.Transform _findTrans = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    bool _isLog = LuaAPI.lua_toboolean(L, 3);
                    
                        UnityEngine.GameObject gen_ret = KEngine.KTool.GetGameObject( _name, _findTrans, _isLog );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)&& translator.Assignable<UnityEngine.Transform>(L, 2)) 
                {
                    string _name = LuaAPI.lua_tostring(L, 1);
                    UnityEngine.Transform _findTrans = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    
                        UnityEngine.GameObject gen_ret = KEngine.KTool.GetGameObject( _name, _findTrans );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetGameObject!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_SetChild_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 5&& translator.Assignable<UnityEngine.GameObject>(L, 1)&& translator.Assignable<UnityEngine.GameObject>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 4)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 5)) 
                {
                    UnityEngine.GameObject _child = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    UnityEngine.GameObject _parent = (UnityEngine.GameObject)translator.GetObject(L, 2, typeof(UnityEngine.GameObject));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 4);
                    bool _selfScale = LuaAPI.lua_toboolean(L, 5);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos, _selfRotation, _selfScale );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 4&& translator.Assignable<UnityEngine.GameObject>(L, 1)&& translator.Assignable<UnityEngine.GameObject>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 4)) 
                {
                    UnityEngine.GameObject _child = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    UnityEngine.GameObject _parent = (UnityEngine.GameObject)translator.GetObject(L, 2, typeof(UnityEngine.GameObject));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 4);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos, _selfRotation );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 3&& translator.Assignable<UnityEngine.GameObject>(L, 1)&& translator.Assignable<UnityEngine.GameObject>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)) 
                {
                    UnityEngine.GameObject _child = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    UnityEngine.GameObject _parent = (UnityEngine.GameObject)translator.GetObject(L, 2, typeof(UnityEngine.GameObject));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.GameObject>(L, 1)&& translator.Assignable<UnityEngine.GameObject>(L, 2)) 
                {
                    UnityEngine.GameObject _child = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    UnityEngine.GameObject _parent = (UnityEngine.GameObject)translator.GetObject(L, 2, typeof(UnityEngine.GameObject));
                    
                    KEngine.KTool.SetChild( _child, _parent );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 5&& translator.Assignable<UnityEngine.Transform>(L, 1)&& translator.Assignable<UnityEngine.Transform>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 4)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 5)) 
                {
                    UnityEngine.Transform _child = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 4);
                    bool _selfScale = LuaAPI.lua_toboolean(L, 5);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos, _selfRotation, _selfScale );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 4&& translator.Assignable<UnityEngine.Transform>(L, 1)&& translator.Assignable<UnityEngine.Transform>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 4)) 
                {
                    UnityEngine.Transform _child = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 4);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos, _selfRotation );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 3&& translator.Assignable<UnityEngine.Transform>(L, 1)&& translator.Assignable<UnityEngine.Transform>(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)) 
                {
                    UnityEngine.Transform _child = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 3);
                    
                    KEngine.KTool.SetChild( _child, _parent, _selfPos );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.Transform>(L, 1)&& translator.Assignable<UnityEngine.Transform>(L, 2)) 
                {
                    UnityEngine.Transform _child = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    
                    KEngine.KTool.SetChild( _child, _parent );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.SetChild!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ResetTransform_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 4&& translator.Assignable<UnityEngine.Transform>(L, 1)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 4)) 
                {
                    UnityEngine.Transform _transform = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 2);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 3);
                    bool _selfScale = LuaAPI.lua_toboolean(L, 4);
                    
                    KEngine.KTool.ResetTransform( _transform, _selfPos, _selfRotation, _selfScale );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 3&& translator.Assignable<UnityEngine.Transform>(L, 1)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 2)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 3)) 
                {
                    UnityEngine.Transform _transform = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 2);
                    bool _selfRotation = LuaAPI.lua_toboolean(L, 3);
                    
                    KEngine.KTool.ResetTransform( _transform, _selfPos, _selfRotation );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.Transform>(L, 1)&& LuaTypes.LUA_TBOOLEAN == LuaAPI.lua_type(L, 2)) 
                {
                    UnityEngine.Transform _transform = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    bool _selfPos = LuaAPI.lua_toboolean(L, 2);
                    
                    KEngine.KTool.ResetTransform( _transform, _selfPos );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 1&& translator.Assignable<UnityEngine.Transform>(L, 1)) 
                {
                    UnityEngine.Transform _transform = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    
                    KEngine.KTool.ResetTransform( _transform );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.ResetTransform!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetRootPathName_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Transform _transform = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    
                        string gen_ret = KEngine.KTool.GetRootPathName( _transform );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MD5_Stream_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.IO.Stream _stream = (System.IO.Stream)translator.GetObject(L, 1, typeof(System.IO.Stream));
                    
                        string gen_ret = KEngine.KTool.MD5_Stream( _stream );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MD5_File_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _filePath = LuaAPI.lua_tostring(L, 1);
                    
                        string gen_ret = KEngine.KTool.MD5_File( _filePath );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MD5_bytes_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _str = LuaAPI.lua_tostring(L, 1);
                    
                        byte[] gen_ret = KEngine.KTool.MD5_bytes( _str );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_MD5_16bit_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _str = LuaAPI.lua_tostring(L, 1);
                    
                        string gen_ret = KEngine.KTool.MD5_16bit( _str );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_IntLerp_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    int _from = LuaAPI.xlua_tointeger(L, 1);
                    int _to = LuaAPI.xlua_tointeger(L, 2);
                    
                        int gen_ret = KEngine.KTool.IntLerp( _from, _to );
                        LuaAPI.xlua_pushinteger(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ScaleParticleSystem_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.GameObject _gameObj = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    float _scale = (float)LuaAPI.lua_tonumber(L, 2);
                    
                    KEngine.KTool.ScaleParticleSystem( _gameObj, _scale );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_SetParticleSystemRenderQueue_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.Transform>(L, 1)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 2)) 
                {
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    int _renderQueue = LuaAPI.xlua_tointeger(L, 2);
                    
                    KEngine.KTool.SetParticleSystemRenderQueue( _parent, _renderQueue );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 1&& translator.Assignable<UnityEngine.Transform>(L, 1)) 
                {
                    UnityEngine.Transform _parent = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    
                    KEngine.KTool.SetParticleSystemRenderQueue( _parent );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.SetParticleSystemRenderQueue!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_CopyTransformToTarget_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Transform _sourceTrans = (UnityEngine.Transform)translator.GetObject(L, 1, typeof(UnityEngine.Transform));
                    UnityEngine.Transform _targetTrans = (UnityEngine.Transform)translator.GetObject(L, 2, typeof(UnityEngine.Transform));
                    
                    KEngine.KTool.CopyTransformToTarget( _sourceTrans, _targetTrans );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_HasWriteAccessToFolder_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _folderPath = LuaAPI.lua_tostring(L, 1);
                    
                        bool gen_ret = KEngine.KTool.HasWriteAccessToFolder( _folderPath );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_SetStaticRecursively_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.GameObject _obj = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    
                    KEngine.KTool.SetStaticRecursively( _obj );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetNormalizedAngle_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    float __anyAngle = (float)LuaAPI.lua_tonumber(L, 1);
                    
                        float gen_ret = KEngine.KTool.GetNormalizedAngle( __anyAngle );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_AdjustCollidersCenterZ_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.GameObject>(L, 1)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 2)) 
                {
                    UnityEngine.GameObject _gameObj = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    float _z = (float)LuaAPI.lua_tonumber(L, 2);
                    
                    KEngine.KTool.AdjustCollidersCenterZ( _gameObj, _z );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 1&& translator.Assignable<UnityEngine.GameObject>(L, 1)) 
                {
                    UnityEngine.GameObject _gameObj = (UnityEngine.GameObject)translator.GetObject(L, 1, typeof(UnityEngine.GameObject));
                    
                    KEngine.KTool.AdjustCollidersCenterZ( _gameObj );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.AdjustCollidersCenterZ!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ToTitleCase_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _word = LuaAPI.lua_tostring(L, 1);
                    
                        string gen_ret = KEngine.KTool.ToTitleCase( _word );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_ToSentenceCase_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _str = LuaAPI.lua_tostring(L, 1);
                    
                        string gen_ret = KEngine.KTool.ToSentenceCase( _str );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Probability_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 1&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1)) 
                {
                    float _chancePercent = (float)LuaAPI.lua_tonumber(L, 1);
                    
                        bool gen_ret = KEngine.KTool.Probability( _chancePercent );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1)) 
                {
                    byte _chancePercent = (byte)LuaAPI.xlua_tointeger(L, 1);
                    
                        bool gen_ret = KEngine.KTool.Probability( _chancePercent );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.Probability!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetSmartNpcPoints_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Vector3 _startDirection;translator.Get(L, 1, out _startDirection);
                    int _nNum = LuaAPI.xlua_tointeger(L, 2);
                    UnityEngine.Vector3 _pAnchorPos;translator.Get(L, 3, out _pAnchorPos);
                    float _fAngle = (float)LuaAPI.lua_tonumber(L, 4);
                    float _nRadius = (float)LuaAPI.lua_tonumber(L, 5);
                    
                        UnityEngine.Vector3[] gen_ret = KEngine.KTool.GetSmartNpcPoints( _startDirection, _nNum, _pAnchorPos, _fAngle, _nRadius );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetParallelPoints_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Vector3 _startPos;translator.Get(L, 1, out _startPos);
                    UnityEngine.Vector3 _startDirection;translator.Get(L, 2, out _startDirection);
                    int _nNum = LuaAPI.xlua_tointeger(L, 3);
                    float _meterInterval = (float)LuaAPI.lua_tonumber(L, 4);
                    
                        UnityEngine.Vector3[] gen_ret = KEngine.KTool.GetParallelPoints( _startPos, _startDirection, _nNum, _meterInterval );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_LineIntersectionPoint_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Vector2 _intersectPoint;
                    UnityEngine.Vector2 _ps1;translator.Get(L, 1, out _ps1);
                    UnityEngine.Vector2 _pe1;translator.Get(L, 2, out _pe1);
                    UnityEngine.Vector2 _ps2;translator.Get(L, 3, out _ps2);
                    UnityEngine.Vector2 _pe2;translator.Get(L, 4, out _pe2);
                    
                        bool gen_ret = KEngine.KTool.LineIntersectionPoint( out _intersectPoint, _ps1, _pe1, _ps2, _pe2 );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    translator.PushUnityEngineVector2(L, _intersectPoint);
                        
                    
                    
                    
                    return 2;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_IsNumber_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
                
                {
                    string _str = LuaAPI.lua_tostring(L, 1);
                    
                        bool gen_ret = KEngine.KTool.IsNumber( _str );
                        LuaAPI.lua_pushboolean(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetRelativePositionOfEllipse_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    float _长半轴即目标距离 = (float)LuaAPI.lua_tonumber(L, 1);
                    float _短半轴 = (float)LuaAPI.lua_tonumber(L, 2);
                    float _angle = (float)LuaAPI.lua_tonumber(L, 3);
                    
                        UnityEngine.Vector2 gen_ret = KEngine.KTool.GetRelativePositionOfEllipse( _长半轴即目标距离, _短半轴, _angle );
                        translator.PushUnityEngineVector2(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Angle_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    UnityEngine.Vector2 _from;translator.Get(L, 1, out _from);
                    UnityEngine.Vector2 _to;translator.Get(L, 2, out _to);
                    
                        float gen_ret = KEngine.KTool.Angle( _from, _to );
                        LuaAPI.lua_pushnumber(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_NumberFormatTo3_xlua_st_(RealStatePtr L)
        {
		    try {
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& (LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1) || LuaAPI.lua_isint64(L, 1))&& (LuaAPI.lua_isnil(L, 2) || LuaAPI.lua_type(L, 2) == LuaTypes.LUA_TSTRING)) 
                {
                    long _num = LuaAPI.lua_toint64(L, 1);
                    string _sp = LuaAPI.lua_tostring(L, 2);
                    
                        string gen_ret = KEngine.KTool.NumberFormatTo3( _num, _sp );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& (LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 1) || LuaAPI.lua_isint64(L, 1))) 
                {
                    long _num = LuaAPI.lua_toint64(L, 1);
                    
                        string gen_ret = KEngine.KTool.NumberFormatTo3( _num );
                        LuaAPI.lua_pushstring(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.NumberFormatTo3!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetIpAddressFromIpHostEntry_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.Net.IPHostEntry _ipHostEntry = (System.Net.IPHostEntry)translator.GetObject(L, 1, typeof(System.Net.IPHostEntry));
                    
                        System.Net.IPAddress gen_ret = KEngine.KTool.GetIpAddressFromIpHostEntry( _ipHostEntry );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_GetIpAddress_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)&& translator.Assignable<System.Action<System.Net.IPAddress>>(L, 2)) 
                {
                    string _host = LuaAPI.lua_tostring(L, 1);
                    System.Action<System.Net.IPAddress> _callback = translator.GetDelegate<System.Action<System.Net.IPAddress>>(L, 2);
                    
                    KEngine.KTool.GetIpAddress( _host, _callback );
                    
                    
                    
                    return 0;
                }
                if(gen_param_count == 1&& (LuaAPI.lua_isnil(L, 1) || LuaAPI.lua_type(L, 1) == LuaTypes.LUA_TSTRING)) 
                {
                    string _host = LuaAPI.lua_tostring(L, 1);
                    
                    KEngine.KTool.GetIpAddress( _host );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KTool.GetIpAddress!");
            
        }
        
        
        
        
        
        
		
		
		
		
    }
}
