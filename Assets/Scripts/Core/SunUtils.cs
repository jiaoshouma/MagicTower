using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class SunUtils
{
    public static GameObject AddChild(GameObject parent,GameObject res)
    {
    	GameObject go = GameObject.Instantiate(res);
        go.transform.parent = parent.transform;
        go.transform.localPosition = new Vector3(0,0,0);
        return go;     
    }

    public static GameObject AddChild(GameObject parent,string childName)
    {
    	GameObject go = new GameObject(childName);
        go.transform.parent = parent.transform;
        go.transform.localPosition = new Vector3(0,0,0);
        return go;     
    }
}
