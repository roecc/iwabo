using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KitchenSoundController : MonoBehaviour
{
    private AudioLowPassFilter filter;

    private void Start()
    {
        filter = transform.parent.GetComponent<AudioLowPassFilter>();
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("entered");
        filter.enabled = false;
    }
    private void OnTriggerExit(Collider other)
    {
        filter.enabled = true;
    }
}
