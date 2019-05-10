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
    public class KEngineKAsyncWrap 
    {
        public static void __Register(RealStatePtr L)
        {
			ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			System.Type type = typeof(KEngine.KAsync);
			Utils.BeginObjectRegister(type, L, translator, 0, 10, 1, 0);
			
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "WaitFinish", _m_WaitFinish);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Then", _m_Then);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Until", _m_Until);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "When", _m_When);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Thread", _m_Thread);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "_Thread", _m__Thread);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "Coroutine", _m_Coroutine);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "WaitForFrames", _m_WaitForFrames);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "WaitForSeconds", _m_WaitForSeconds);
			Utils.RegisterFunc(L, Utils.METHOD_IDX, "WaitForEndOfFrame", _m_WaitForEndOfFrame);
			
			
			Utils.RegisterFunc(L, Utils.GETTER_IDX, "IsFinished", _g_get_IsFinished);
            
			
			
			Utils.EndObjectRegister(type, L, translator, null, null,
			    null, null, null);

		    Utils.BeginClassRegister(type, L, __CreateInstance, 3, 0, 0);
			Utils.RegisterFunc(L, Utils.CLS_IDX, "AddMainThreadCall", _m_AddMainThreadCall_xlua_st_);
            Utils.RegisterFunc(L, Utils.CLS_IDX, "Start", _m_Start_xlua_st_);
            
			
            
			
			
			
			Utils.EndClassRegister(type, L, translator);
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int __CreateInstance(RealStatePtr L)
        {
            return LuaAPI.luaL_error(L, "KEngine.KAsync does not have a constructor!");
        }
        
		
        
		
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_WaitFinish(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    
                        UnityEngine.Coroutine gen_ret = gen_to_be_invoked.WaitFinish(  );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_AddMainThreadCall_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
                
                {
                    System.Action _call = translator.GetDelegate<System.Action>(L, 1);
                    
                    KEngine.KAsync.AddMainThreadCall( _call );
                    
                    
                    
                    return 0;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Start_xlua_st_(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 0) 
                {
                    
                        KEngine.KAsync gen_ret = KEngine.KAsync.Start(  );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& translator.Assignable<System.Action>(L, 1)) 
                {
                    System.Action _callback = translator.GetDelegate<System.Action>(L, 1);
                    
                        KEngine.KAsync gen_ret = KEngine.KAsync.Start( _callback );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 1&& translator.Assignable<KEngine.KAsync.AsyncThenDelegateEasy>(L, 1)) 
                {
                    KEngine.KAsync.AsyncThenDelegateEasy _callback = translator.GetDelegate<KEngine.KAsync.AsyncThenDelegateEasy>(L, 1);
                    
                        KEngine.KAsync gen_ret = KEngine.KAsync.Start( _callback );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.Start!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Then(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& translator.Assignable<System.Action>(L, 2)) 
                {
                    System.Action _callback = translator.GetDelegate<System.Action>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Then( _callback );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<KEngine.KAsync.AsyncThenDelegate>(L, 2)) 
                {
                    KEngine.KAsync.AsyncThenDelegate _thenFunc = translator.GetDelegate<KEngine.KAsync.AsyncThenDelegate>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Then( _thenFunc );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<KEngine.KAsync.AsyncThenDelegateEasy>(L, 2)) 
                {
                    KEngine.KAsync.AsyncThenDelegateEasy _thenFunc = translator.GetDelegate<KEngine.KAsync.AsyncThenDelegateEasy>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Then( _thenFunc );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.Then!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Until(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 3&& translator.Assignable<System.Func<bool>>(L, 2)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 3)) 
                {
                    System.Func<bool> _retBool = translator.GetDelegate<System.Func<bool>>(L, 2);
                    float _timeout = (float)LuaAPI.lua_tonumber(L, 3);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Until( _retBool, _timeout );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<System.Func<bool>>(L, 2)) 
                {
                    System.Func<bool> _retBool = translator.GetDelegate<System.Func<bool>>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Until( _retBool );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.Until!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_When(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 3&& translator.Assignable<System.Func<bool>>(L, 2)&& LuaTypes.LUA_TNUMBER == LuaAPI.lua_type(L, 3)) 
                {
                    System.Func<bool> _retBool = translator.GetDelegate<System.Func<bool>>(L, 2);
                    float _timeout = (float)LuaAPI.lua_tonumber(L, 3);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.When( _retBool, _timeout );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<System.Func<bool>>(L, 2)) 
                {
                    System.Func<bool> _retBool = translator.GetDelegate<System.Func<bool>>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.When( _retBool );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.When!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Thread(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& translator.Assignable<KEngine.KAsync.AsyncThreadDelegate>(L, 2)) 
                {
                    KEngine.KAsync.AsyncThreadDelegate _threadCalAction = translator.GetDelegate<KEngine.KAsync.AsyncThreadDelegate>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Thread( _threadCalAction );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<System.Action>(L, 2)) 
                {
                    System.Action _threadCalAction = translator.GetDelegate<System.Action>(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Thread( _threadCalAction );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 3&& translator.Assignable<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2)&& translator.Assignable<object>(L, 3)) 
                {
                    KEngine.KAsync.AsyncThreadDelegateFull _threadCalAction = translator.GetDelegate<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2);
                    object _param = translator.GetObject(L, 3, typeof(object));
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Thread( _threadCalAction, _param );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.Thread!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m__Thread(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 3&& translator.Assignable<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2)&& translator.Assignable<object>(L, 3)) 
                {
                    KEngine.KAsync.AsyncThreadDelegateFull _threadCalAction = translator.GetDelegate<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2);
                    object _param = translator.GetObject(L, 3, typeof(object));
                    
                        System.Collections.IEnumerator gen_ret = gen_to_be_invoked._Thread( _threadCalAction, _param );
                        translator.PushAny(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2)) 
                {
                    KEngine.KAsync.AsyncThreadDelegateFull _threadCalAction = translator.GetDelegate<KEngine.KAsync.AsyncThreadDelegateFull>(L, 2);
                    
                        System.Collections.IEnumerator gen_ret = gen_to_be_invoked._Thread( _threadCalAction );
                        translator.PushAny(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync._Thread!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_Coroutine(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
			    int gen_param_count = LuaAPI.lua_gettop(L);
            
                if(gen_param_count == 2&& translator.Assignable<System.Collections.IEnumerator>(L, 2)) 
                {
                    System.Collections.IEnumerator _enumtor = (System.Collections.IEnumerator)translator.GetObject(L, 2, typeof(System.Collections.IEnumerator));
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Coroutine( _enumtor );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                if(gen_param_count == 2&& translator.Assignable<UnityEngine.Coroutine>(L, 2)) 
                {
                    UnityEngine.Coroutine _co = (UnityEngine.Coroutine)translator.GetObject(L, 2, typeof(UnityEngine.Coroutine));
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.Coroutine( _co );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
            return LuaAPI.luaL_error(L, "invalid arguments to KEngine.KAsync.Coroutine!");
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_WaitForFrames(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    int _frameCount = LuaAPI.xlua_tointeger(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.WaitForFrames( _frameCount );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_WaitForSeconds(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    float _time = (float)LuaAPI.lua_tonumber(L, 2);
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.WaitForSeconds( _time );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _m_WaitForEndOfFrame(RealStatePtr L)
        {
		    try {
            
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
            
            
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
            
            
                
                {
                    
                        KEngine.KAsync gen_ret = gen_to_be_invoked.WaitForEndOfFrame(  );
                        translator.Push(L, gen_ret);
                    
                    
                    
                    return 1;
                }
                
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            
        }
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_IsFinished(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                KEngine.KAsync gen_to_be_invoked = (KEngine.KAsync)translator.FastGetCSObj(L, 1);
                LuaAPI.lua_pushboolean(L, gen_to_be_invoked.IsFinished);
            } catch(System.Exception gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + gen_e);
            }
            return 1;
        }
        
        
        
		
		
		
		
    }
}
