using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateRunner : MonoBehaviour
{
	public delegate void onUpdate(); 
	public onUpdate luaUpdate;

	public delegate void onLateUpdate(); 
	public onLateUpdate luaLateUpdate;

	public delegate void onFixedUpdate(); 
	public onFixedUpdate luaFixedUpdate;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
    	luaUpdate();
    }

    void LateUpdate()
    {
    	luaLateUpdate();
    }

    void FixedUpdate()
    {
    	luaFixedUpdate();
    }
}
