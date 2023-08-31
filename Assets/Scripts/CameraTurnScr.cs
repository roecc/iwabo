using UnityEngine;

public class CameraTurnScr : MonoBehaviour
{
	Quaternion rot;

	// Start is called before the first frame update
	void Start()
	{
		rot = gameObject.transform.rotation;
	}

	// Update is called once per frame
	void Update()
	{
		gameObject.transform.rotation = rot;
	}
}
