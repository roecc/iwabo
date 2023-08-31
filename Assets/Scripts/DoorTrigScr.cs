using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorTrigScr : MonoBehaviour
{
    [SerializeField]
    private DoorScr doorInteract;

    private void OnTriggerEnter(Collider other)
    {
        //transform.parent.GetComponent<DoorScr>().enabled = true;
        doorInteract.gameObject.SetActive(true);
        doorInteract.Player = other.gameObject;
    }

    private void OnTriggerExit(Collider other)
    {
        //transform.parent.GetComponent<DoorScr>().enabled = false;
        doorInteract.gameObject.SetActive(false);
    }
}
