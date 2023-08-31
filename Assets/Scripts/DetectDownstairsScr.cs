using UnityEngine;
using Unity.AI.Navigation;


public class DetectDownstairsScr : MonoBehaviour
{
	[SerializeField]
	private GameObject upstairs;

	[SerializeField]
	private NavMeshSurface surface;
	
	//public NavMeshSurface[] surfaces;   

	private void OnTriggerEnter(Collider other)
	{
		Debug.Log("is downstairs");
		upstairs.SetActive(false);
		surface.BuildNavMesh();
	}

	private void OnTriggerExit(Collider other)
	{
		Debug.Log("is upstairs");
		upstairs.SetActive(true);
		surface.BuildNavMesh();
	}
}
