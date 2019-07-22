using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

[RequireComponent(typeof(UnityEngine.UI.Image))]
[ExecuteInEditMode]
public class UIAtlas : MonoBehaviour
{
	public string spriteName;
    public Object atlas;

    private string mLastSpriteName;
    private Object mLastAtlas;
    // private SpriteData spriteData;
    private UnityEngine.UI.Image img;

    void Awake()
    {
        img = this.GetComponent<UnityEngine.UI.Image>();
        UpdateImg();
        // img.sprite = loadSprite(spriteName);
    }

    // Update is called once per frame
    void Update()
    {   
        UpdateImg();
    }

    void UpdateSpriteData()
    {
        // if (mAtlas != null) {
        //     spriteData = atlas.GetComponent<SpriteData>();
        // }
        // else
        // {
        //     spriteData = null;
        // }
    }

    void UpdateImg()
    {   
        // Debug.Log(atlas+" "+spriteName+"-------");
        // Debug.Log(mLastAtlas+" "+mLastSpriteName+"m-------");
        if (atlas==null||spriteName=="")
        {
            return;
        }
        if (atlas == mLastAtlas && spriteName == mLastSpriteName)
        {
            return;
        }
        // Debug.Log(LoadSprite(atlas,spriteName)+"SetSprite");
        img.sprite = LoadSprite(atlas,spriteName);
        mLastSpriteName = spriteName;
        mLastAtlas = atlas;
    }

    private Sprite LoadSprite(Object atlas,string spriteName)
    {
        // return spriteData.GetSprite(spriteName);
       return LoadSpriteHelper.LoadSprite(atlas,spriteName);
    }


	// [ContextMenu("Execute")]
 //    public void ExecuteImgInfo()
 //    {
    	
 //    }
}
