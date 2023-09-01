using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractionDistance : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        //transform.parent.GetComponent<DoorScr>().enabled = true;
        transform.parent.GetChild(0).gameObject.SetActive(true);
    }

    private void OnTriggerExit(Collider other)
    {
        //transform.parent.GetComponent<DoorScr>().enabled = false;
        transform.parent.GetChild(0).gameObject.SetActive(false);
    }
}
