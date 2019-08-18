using System.IO;
using UnityEditor;
using UnityEngine;

public class AutoProcessEditor : AssetPostprocessor
{
    void OnPreprocessTexture()
    {
        string dirName = Path.GetDirectoryName(assetPath);
        if (dirName.Contains("UIAtlas")) 
        {
            // 改用TexturePacker
            // //自动设置类型;  
            // TextureImporter textureImporter = (TextureImporter)assetImporter;
            // textureImporter.textureType = TextureImporterType.Sprite;

            // //自动设置打包tag;  
            // string folderStr = Path.GetFileName(dirName);
            // if (!folderStr.Contains("images"))
            // {
            //     textureImporter.spritePackingTag = folderStr;
            // }
        }
        else if (dirName.Contains("Images")) 
        {
            //自动设置类型;  
            TextureImporter textureImporter = (TextureImporter)assetImporter;
            textureImporter.textureType = TextureImporterType.Sprite;
        }
    }
}