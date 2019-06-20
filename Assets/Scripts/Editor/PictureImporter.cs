using UnityEngine;
using UnityEditor;
public class PictureImporter : EditorWindow
{
    enum MaxSize
    {
        Size_32 = 32,
        Size_64 = 64,
        Size_128 = 128,
        Size_256 = 256,
        Size_512 = 512,
        Size_1024 = 1024,
        Size_2048 = 2048,
        Size_4096 = 4096,
        Size_8192 = 8192,
    }

    // ----------------------------------------------------------------------------  
    TextureImporterType textureType = TextureImporterType.Sprite;
    TextureImporterFormat textureFormat = TextureImporterFormat.Automatic;
    MaxSize textureSize = MaxSize.Size_512;
    TextureImporterCompression textureCompression = TextureImporterCompression.Uncompressed;

    bool ifAllowsAlphaSplitting = true;
    bool ifMipmapEnabled = false;

    float secs = 10.0f;
    double startVal = 0;
    float progress = 0f;
    static string packingTag = "";

    static PictureImporter window;
    [@MenuItem("Custom/SettingTextures")]
    private static void Init()
    {
        Rect wr = new Rect(0, 0,200, 200);
        window = (PictureImporter)EditorWindow.GetWindowWithRect(typeof(PictureImporter), wr, false, "图片格式设置");
        window.Show();
    }

    private void OnGUI()
    {
        EditorGUILayout.Space();
        EditorGUILayout.HelpBox("设置选中图片或选中路径下的图片属性",MessageType.Info);
        EditorGUILayout.Space();

        textureType = (TextureImporterType)EditorGUILayout.EnumPopup("类型:", textureType);
        textureFormat = (TextureImporterFormat)EditorGUILayout.EnumPopup("格式:", textureFormat);
        textureSize = (MaxSize)EditorGUILayout.EnumPopup("尺寸:", textureSize);
        textureCompression = (TextureImporterCompression)EditorGUILayout.EnumPopup("压缩:", textureCompression);
        ifAllowsAlphaSplitting = EditorGUILayout.Toggle("是否允许透明分离:",ifAllowsAlphaSplitting);
        ifMipmapEnabled = EditorGUILayout.Toggle("是否允许Mipmap:", ifMipmapEnabled);
        packingTag = EditorGUILayout.TextField("PackTag:",packingTag);

        EditorGUILayout.Space();

        if (GUILayout.Button("设置"))
        {
            TextureImporterPlatformSettings t = new TextureImporterPlatformSettings();

            t.allowsAlphaSplitting = ifAllowsAlphaSplitting;
            t.format = textureFormat;
            
            t.maxTextureSize = (int)textureSize;
            t.textureCompression = textureCompression;

            SelectedChangeTextureFormatSettings(t, textureType);
        }

    }

    static void SelectedChangeTextureFormatSettings(TextureImporterPlatformSettings _t, TextureImporterType  _type)
    {

        Object[] textures = GetSelectedTextures();
        if (window == null)
            Init();
        if (textures != null)
        {
            if(textures.Length < 1)
            {
                window.ShowNotification(new GUIContent("找不到图片!"));
                return;
            }
        }
        else
        {
            window.ShowNotification(new GUIContent("请选中图片或路径!"));
            return;
        }
        Selection.objects = new Object[0];
        int i = 0;
        foreach (Texture2D texture in textures)
        {
            string path = AssetDatabase.GetAssetPath(texture);
            //Debug.Log("path: " + path);  
            TextureImporter textureImporter = AssetImporter.GetAtPath(path) as TextureImporter;
            textureImporter.textureType = _type;
            textureImporter.spritePackingTag = packingTag;
            // textureImporter.SetPlatformTextureSettings("Default",_t.maxTextureSize,_t.format,_t.allowsAlphaSplitting);

            ShowProgress((float)i / (float)textures.Length, textures.Length, i);
            i++;
            AssetDatabase.ImportAsset(path);

        }
        AssetDatabase.Refresh();
        EditorUtility.ClearProgressBar();
        textures = null;
    }
    public static void ShowProgress(float val, int total, int cur)
    {
        EditorUtility.DisplayProgressBar("设置图片中...",string.Format("请稍等({0}/{1}) ", cur, total), val);
    }


    static Object[] GetSelectedTextures()
    {
        return Selection.GetFiltered(typeof(Texture2D), SelectionMode.DeepAssets);
    }
    void OnInspectorUpdate()
    {
        Repaint();
    }
}