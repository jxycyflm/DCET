﻿using BehaviorDesigner.Runtime;
using DCET.Runtime;
using UnityEngine;

namespace DCET
{
    public class BehaviorTreeHelper
    {
        public static void Init(UnityEngine.Object _object)
        {
            if(_object is GameObject)
            {
                var go = _object as GameObject;

                if (go)
                {
                    var bts = go.GetComponentsInChildren<BehaviorDesigner.Runtime.BehaviorTree>();

                    if (bts != null)
                    {
                        foreach (var bt in bts)
                        {
                            if (bt)
                            {
                                (bt.gameObject.Ensure(typeof(BehaviorTreeController)) as BehaviorTreeController).Init();
                            }
                        }
                    }
                }
            }
            else if(_object is ExternalBehavior)
            {
                var externalBehavior = _object as ExternalBehavior;

                if (externalBehavior)
                {
                    externalBehavior.Init();
                }
            }            
        }
    }
}
