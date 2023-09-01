using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractionHandler : MonoBehaviour
{
    private InteractableScr interactible;

    private void Start()
    {
        interactible = transform.parent.GetComponent<InteractableScr>();
    }

    private void OnMouseEnter()
    {
        interactible.SwitchMat(true);
    }

    private void OnMouseExit()
    {
        interactible.SwitchMat(false);
    }

    //should be an interface
    private void OnMouseDown()
    {
        interactible.StartPassage();
        Debug.Log("test");
    }
}
