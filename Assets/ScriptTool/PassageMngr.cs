using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System;

[ExecuteInEditMode]
public class PassageMngr : MonoBehaviour
{
	[SerializeField]
	private GameObject optionPrefab;
	public Transform anchor;

	//TMP text objects
	[SerializeField]
	private TMP_Text title;
	[SerializeField]
	private TMP_Text passage;
	[SerializeField]
	private Transform optionPanel;
	private TMP_Text[] options;

	//content
	[TextArea(2, 7)]
	[SerializeField]
	private string titleText;
	[TextArea(10,7)]
	[SerializeField]
	private string passageText;
    [SerializeField]
	private optionLink[] optionLinks;


	public void AddToHistory()
	{
		//add passage to history
		TMP_Text history = GameObject.FindGameObjectWithTag("History").GetComponent<TMP_Text>();
		history.text += passageText + "\n\n";
		//scroll to bottom of history
		StartCoroutine(DelayScrollUpdate(history));
    }

    private IEnumerator DelayScrollUpdate(TMP_Text history)
	{
		//wait for scrollrect update
        yield return new WaitForEndOfFrame();
		//scroll to bottom of text
        history.transform.parent.GetComponent<ScrollRect>().verticalNormalizedPosition = 0f;
    }

	private void OnValidate()
	{
		//update TMP objects
		title.text = titleText;
		passage.text = passageText;
		gameObject.name = titleText;

		//update objects to reflect inspector settings
		if (optionLinks.Length > optionPanel.childCount)
			GameObject.Instantiate(optionPrefab, optionPanel);
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
}

[Serializable]
public struct optionLink
{
    [TextArea(4, 7)]
    public string option;
    public PassageMngr nextPassage;
}
