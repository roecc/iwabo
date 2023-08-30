using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using TMPro;
using System;

[ExecuteInEditMode]
public class PassageMngr : MonoBehaviour
{
	[SerializeField]
	private GameObject optionPrefab;
	public Transform anchor;

	[SerializeField]
	private TMP_Text title;
	[SerializeField]
	private TMP_Text passage;
	[SerializeField]
	private Transform optionPanel;
	private TMP_Text[] options;

	[TextArea(2, 7)]
	[SerializeField]
	private string titleText;
	[TextArea(10,7)]
	[SerializeField]
	private string passageText;
    [SerializeField]
	private optionLink[] optionLinks;

	// Start is called before the first frame update
	void Start()
	{
		
	}

	private void OnValidate()
	{
		title.text = titleText;
		passage.text = passageText;
		gameObject.name = titleText;

		if (optionLinks.Length > optionPanel.childCount)
		{
			GameObject.Instantiate(optionPrefab, optionPanel);
		}
		
		for (int i = 0; i < optionPanel.childCount; i++)
		{
			if (i >= optionLinks.Length)
				optionPanel.GetChild(i).gameObject.SetActive(false);
			else
			{
				optionPanel.GetChild(i).GetComponent<TMP_Text>().text = optionLinks[i].option;
				optionPanel.GetChild(i).gameObject.SetActive(true);
				optionPanel.GetChild(i).GetComponent<OptionScr>().nextPassage = optionLinks[i].nextPassage;
			}
		}
	}

	/*
	private void OnDrawGizmos()
	{
		Gizmos.color = Color.cyan;
		Gizmos.DrawLine(transform.position, Vector3.zero);
		Gizmos.color = Color.red;
		Gizmos.DrawLine(transform.position, Vector3.up);
	}
	*/
}

[Serializable]
public struct optionLink
{
    [TextArea(4, 7)]
    public string option;
    public PassageMngr nextPassage;
}
