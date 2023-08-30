using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;
using System;

[ExecuteInEditMode] 
public class OptionScr : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{
	private TMP_Text text;

	public PassageMngr nextPassage;
	[SerializeField]
	private Transform passageLinkAnchor;

	void Start()
	{
		text = gameObject.GetComponent<TMP_Text>();
		passageLinkAnchor = transform.GetChild(0).GetChild(0).transform;
	}

	public void OnPointerClick(PointerEventData eventData)
	{
		//text.text = "click";
		if (nextPassage != null)
		{
			Vector3 nextPos = nextPassage.transform.position;
			nextPos.z = -10;
			Camera.main.transform.position = nextPos;
		}
	}

	public void OnPointerEnter(PointerEventData eventData)
	{
		text.color = Color.red;
	}

	public void OnPointerExit(PointerEventData eventData)
	{
		text.color = Color.black;
	}

	private void OnDrawGizmos()
	{
		if (nextPassage != null)
		{
			Gizmos.color = Color.red;
			Gizmos.DrawLine(passageLinkAnchor.position, nextPassage.anchor.position);
		}
		//Gizmos.color = Color.red;
		//Gizmos.DrawLine(transform.position, Vector3.up);
	}


	// Update is called once per frame
	void Update()
	{
		
	}
}
