using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

[ExecuteInEditMode] 
public class OptionScr : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{
	private TMP_Text text;

	//passage the option links to
	public PassageMngr nextPassage;

	//point to draw connection to next passage from
	[SerializeField]
	private Transform passageLinkAnchor;

	void Start()
	{
		text = gameObject.GetComponent<TMP_Text>();
		passageLinkAnchor = transform.GetChild(0).GetChild(0).transform;
    }

	//go to next passage and update history
	public void OnPointerClick(PointerEventData eventData)
	{
		if (nextPassage != null)
		{
			Vector3 nextPos = nextPassage.transform.position;
			nextPos.z = -10;
			Camera.main.transform.position = nextPos;

			nextPassage.AddToHistory();
		}
	}

	//signify interactivity on hover
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
		//draw line in scene view connecting passages
		if (nextPassage != null)
		{
			Gizmos.color = Color.red;
            Gizmos.DrawLine(passageLinkAnchor.position, nextPassage.anchor.position);
            //Gizmos.DrawMesh(arrow, )//(passageLinkAnchor.position, nextPassage.anchor.position);
        }
    }
}
