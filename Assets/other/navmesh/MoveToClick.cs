using UnityEngine;
using UnityEngine.AI;

public class MoveToClick : MonoBehaviour
{
	[SerializeField]
	private Camera cam;
	public NavMeshAgent agent;

	[SerializeField]
	private LayerMask mask;

	// Start is called before the first frame update
	void Start()
	{
		
	}

	// Update is called once per frame
	void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			Ray movePos = cam.ScreenPointToRay(Input.mousePosition);
			if (Physics.Raycast(movePos, out var hitInfo, mask))
			{
				agent.SetDestination(hitInfo.point);
			}
		}
	}
}
