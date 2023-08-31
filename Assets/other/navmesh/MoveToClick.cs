using UnityEngine;
using UnityEngine.AI;

public class MoveToClick : MonoBehaviour
{
	[SerializeField]
	private Camera cam;
	public NavMeshAgent agent;

	[SerializeField]
	private LayerMask mask;

	private Animator anim;
	private Rigidbody rb;

	void Start()
	{
		anim = transform.GetChild(0).GetComponent<Animator>();
		rb = GetComponent<Rigidbody>();
	}

	void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			Ray movePos = cam.ScreenPointToRay(Input.mousePosition);
			if (Physics.Raycast(movePos, out var hitInfo, mask))
			{
				agent.SetDestination(hitInfo.point);
				Debug.Log("hi");
			}
		}

		anim.SetFloat("Velocity", agent.velocity.magnitude);
	}

	public void Teleport(Vector3 nextPos)
	{
		// Set the new position directly
		transform.position = nextPos;

		// Reset the NavMeshAgent's path and update its position
		agent.Warp(nextPos);

		// Optional: Set the destination to the new position
		agent.SetDestination(nextPos);
	}
}
