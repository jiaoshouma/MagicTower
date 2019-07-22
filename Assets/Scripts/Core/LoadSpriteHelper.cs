using System.Collections.Generic;
using UnityEngine;

public static class LoadSpriteHelper
{
    /// <summary>
    /// SpriteData缓存
    /// </summary>
    private static Dictionary<Object, SpriteData> spriteDates = new Dictionary<Object, SpriteData>();

    public static Sprite LoadSprite(Object atlas, string spriteName)
    {
        if (!spriteDates.ContainsKey(atlas))
        {
            GameObject atl = (GameObject)GameObject.Instantiate(atlas);
            spriteDates.Add(atlas, atl.GetComponent<SpriteData>());
        }
        return spriteDates[atlas].GetSprite(spriteName);
    }
}