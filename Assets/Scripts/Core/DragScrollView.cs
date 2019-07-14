using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DragScrollView : MonoBehaviour
{
	public ScrollRect scrollView;

    // Start is called before the first frame update
    void Start()
    {
        if (scrollView == null)
        {
        	//try to find scrollrect in parent
        	scrollView = this.GetComponentInParent<ScrollRect>();
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
