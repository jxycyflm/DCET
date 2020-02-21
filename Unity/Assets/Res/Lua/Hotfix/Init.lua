-- Generated by CSharp.lua Compiler
local System = System
local BehaviorDesignerRuntime = BehaviorDesigner.Runtime
local DCETHotfix = DCET.Hotfix
local DCETModel = DCET.Model
local UnityEngine = UnityEngine
local DCETHotfix
System.import(function (out)
  DCETHotfix = DCET.Hotfix
end)
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("Init", function (namespace)
    local Start, TestBehaviorTree, Update, LateUpdate, OnApplicationQuit
    Start = function ()
      System.async(function (async)
        System.try(function ()
          DCETHotfix.TypeHelper.InitHotfixType()

          -- 注册热更层回调
          DCETModel.GameLoop.onUpdate = DCETModel.GameLoop.onUpdate + Update
          DCETModel.GameLoop.onLateUpdate = DCETModel.GameLoop.onLateUpdate + LateUpdate
          DCETModel.GameLoop.onApplicationQuit = DCETModel.GameLoop.onApplicationQuit + OnApplicationQuit

          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.OpcodeTypeComponent)
          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.MessageDispatcherComponent)

          -- 加载热更配置
          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.ResourcesComponent):LoadBundle("config.unity3d")
          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.ConfigComponent)
          DCETHotfix.Game.getScene():GetComponent(DCETHotfix.ResourcesComponent):UnloadBundle("config.unity3d")

          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.FUIPackageComponent)
          DCETHotfix.Game.getScene():AddComponent(DCETHotfix.FUIComponent)
          async:await(DCETHotfix.Game.getScene():AddComponent(DCETHotfix.FUIInitComponent):Init())
          DCETHotfix.Game.getEventSystem():Run("InitSceneStart" --[[EventIdType.InitSceneStart]])

          -- 演示行为树用法
          --TestBehaviorTree();
        end, function (default)
          local e = default
          DCETHotfix.Log.Error(e)
        end)
      end, true)
    end
    -- <summary>
    -- 演示行为树用法，使用时可以删除
    -- </summary>
    TestBehaviorTree = function ()
      -- 全局共享变量用法
      DCETHotfix.Game.getScene():AddComponent(DCETHotfix.BehaviorTreeVariableComponent):SetVariable("全局变量", 1, System.Int32)

      local runtimeBehaivorTree = UnityEngine.Object.Instantiate(System.as(DCETModel.ResourcesHelper.Load("Cube"), UnityEngine.GameObject)):GetComponent(BehaviorDesignerRuntime.BehaviorTree)

      if UnityEngine.op_Implicit(runtimeBehaivorTree) then
        --建议在资源预加载时进行初始化，以免游戏对局中反序列化GC卡顿
        DCETHotfix.BehaviorTreeHelper.Init(runtimeBehaivorTree:getgameObject())

        --动态加载外部行为树用法
        --UnityEngine.Object externalBehavior = 加载("外部行为树资源");
        --BehaviorTreeHelper.Init(externalBehavior);
        --runtimeBehaivorTree.Ensure<BehaviorTreeController>().SetExternalBehavior(externalBehavior);

        ;
        (System.as(DCETModel.GameObjectHelper.Ensure(runtimeBehaivorTree:getgameObject(), System.typeof(BehaviorDesignerRuntime.BehaviorTreeController)), BehaviorDesignerRuntime.BehaviorTreeController)):Init()
      end

      local behaviorTree = DCETHotfix.BehaviorTreeFactory.Create4(DCETHotfix.Game.getScene(), runtimeBehaivorTree)

      -- 新增行为树共享变量用法
      local p1 = behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):GetVariable("变量1", System.Int32)

      DCETHotfix.Log.Info("行为树变量：" .. System.toString(p1))

      behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):SetVariable("变量1", 2, System.Int32)

      p1 = behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):GetVariable("变量1", System.Int32)

      DCETHotfix.Log.Info("行为树变量：" .. System.toString(p1))

      behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):SetVariable("变量2", "", System.String)
      behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):SetVariable("变量3", behaviorTree, DCETHotfix.BehaviorTree)
      behaviorTree:GetComponent(DCETHotfix.BehaviorTreeVariableComponent):SetVariable("变量4", runtimeBehaivorTree, BehaviorDesignerRuntime.BehaviorTree)
    end
    Update = function ()
      DCETHotfix.Game.getEventSystem():Update()
    end
    LateUpdate = function ()
      DCETHotfix.Game.getEventSystem():LateUpdate()
    end
    OnApplicationQuit = function ()
      DCETHotfix.Game.Close()
    end
    return {
      Start = Start,
      Update = Update,
      LateUpdate = LateUpdate,
      OnApplicationQuit = OnApplicationQuit
    }
  end)
end)
