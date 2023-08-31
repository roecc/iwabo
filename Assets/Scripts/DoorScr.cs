using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorScr : MonoBehaviour
{
    [SerializeField]
    private Material doorMat;
    [SerializeField]
    private Material highlightMat;

    [SerializeField]
    private Transform target;

    public GameObject Player;

    [SerializeField]
    private AudioLowPassFilter filter;

    [SerializeField]
    private AudioSource audio;

    private void OnMouseEnter()
    {
        transform.parent.GetComponent<Renderer>().material = highlightMat;
    }

    private void OnMouseExit()
    {
        transform.parent.GetComponent<Renderer>().material = doorMat;
    }

    private void OnMouseDown()
    {
        Debug.Log("switchRoom");
        Player.GetComponent<MoveToClick>().Teleport(target.position);
        if (filter != null)
            filter.enabled = !filter.enabled;
        audio.time = 0.4f;
        audio.Play();
    }
}
