using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KitchenSoundController : MonoBehaviour
{
    [SerializeField]
    private AudioLowPassFilter filter;

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
