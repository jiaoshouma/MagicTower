using UnityEngine;
using System.Collections;
using System;
 
public class CoroutineRunner : MonoBehaviour
{
    public void YieldAndCallback(object to_yield, Action callback)
    {
        StartCoroutine(CoBody(to_yield, callback));
    }
 
    private IEnumerator CoBody(object to_yield, Action callback)
    {
        if (to_yield is IEnumerator)
            yield return StartCoroutine((IEnumerator)to_yield);
        else
            yield return to_yield;
        callback();
    }
}