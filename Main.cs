using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Main : MonoBehaviour
{
    
        private static Main instance;
        public GameObject main;
        public Web Web;

        public static Main Instance { get => instance; set => instance = value; }

        void Start()
        {
            Instance = this;
            Web = GetComponent<Web>();
        }
    

}
