using System;
using System.Collections.Generic;
using KEngine;
using UnityEngine;

/// <summary>
/// I need these extensions to be more convenient.
/// </summary>
public static class SunExtensions
{ 
    public static object ComponentByName(this Transform t, string relaPath, string type)
    {
    	Transform trans = t.Find(relaPath);
    	return trans.GetComponent(type);
    }

    public static void SetActive(this Transform t, bool show)
    {
    	t.gameObject.SetActive(show);
    }

    public static object NodeByName(this Transform t,string relaPath)
    {
    	Transform trans = t.Find(relaPath);
    	return trans.gameObject;
    }

}