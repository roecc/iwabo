using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableScr : MonoBehaviour
{
    [SerializeField]
    private GameObject historyObj;

    [SerializeField]
    private PassageMngr startPassage;

    [SerializeField]
    private Material standardMat;
    [SerializeField]
    private Material highlightMat;

    public void SwitchMat(bool active)
    { 
        if (active)
            transform.GetComponent<Renderer>().material = highlightMat;
        else
            transform.GetComponent<Renderer>().material = standardMat;
    }

    public void StartPassage()
    {
        historyObj.SetActive(true);
        startPassage.isActive = true;
        startPassage.StartConversation();
    }

   
}
