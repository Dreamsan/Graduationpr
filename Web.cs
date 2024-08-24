using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using static System.Net.WebRequestMethods;

public class Web : MonoBehaviour
{
    void Start()
    {
        StartCoroutine(RegisterUser("testuser3", "1234561", "testuser3@email.com"));
    }

    public IEnumerator login(string player_name, string password)
    {
        WWWForm form = new WWWForm();
        form.AddField("loginUser", player_name);
        form.AddField("loginPass", password);

        using UnityWebRequest www = UnityWebRequest.Post("http://localhost/AloneinthedarknessBackend/login.php", form);
        yield return www.SendWebRequest();

        if (www.result != UnityWebRequest.Result.Success)
        {
            Debug.LogError(www.error);
        }
        else
        {
            Debug.Log(www.downloadHandler.text);
        }
    }

    IEnumerator RegisterUser(string player_name, string password, string email)
    {
        WWWForm form = new WWWForm();
        form.AddField("loginUser", player_name);
        form.AddField("loginPass", password);
        form.AddField("email", email);

        using (UnityWebRequest www = UnityWebRequest.Post("http://localhost/AloneinthedarknessBackend/RegisterUser.php", form))
        {
            yield return www.SendWebRequest();

            if (www.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError(www.error);
            }
            else
            {
                Debug.Log(www.downloadHandler.text);
            }
        }
    }
}

