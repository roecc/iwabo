using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;

[RequireComponent(typeof(TMP_Text))]
public class LinkHandlerForTMP : MonoBehaviour, IPointerClickHandler
{
    private TMP_Text tmpTextBox;
    private Canvas canvas;
    [SerializeField]
    private Camera cam;

    public delegate void ClickOnLinkEvent(string keyword);
    public static event ClickOnLinkEvent OnClickedOnLinkEvent;


    private void Awake()
    {
        tmpTextBox = GetComponent<TMP_Text>();
        canvas = GetComponentInParent<Canvas>();

        if (canvas.renderMode == RenderMode.ScreenSpaceOverlay)
            cam = null;
        else
            cam = canvas.worldCamera;

        tmpTextBox.text = "";
    }
    public void OnPointerClick(PointerEventData eventData)
    {
        Vector3 mousePos = new Vector3(eventData.position.x, eventData.position.y, 0);

        int linkTaggedText = TMP_TextUtilities.FindIntersectingLink(tmpTextBox, mousePos, cam);
        if (linkTaggedText != -1)
        {
            TMP_LinkInfo linkInfo = tmpTextBox.textInfo.linkInfo[linkTaggedText];

            OnClickedOnLinkEvent?.Invoke(linkInfo.GetLinkText());
        }
    }
}
