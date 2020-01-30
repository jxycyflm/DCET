-- Generated by CSharp.lua Compiler
local System = System
local DCETHotfix = DCET.Hotfix
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("LogActionComponentAwakeSystem", function (namespace)
    local Awake
    Awake = function (this, self, behaviorTreeParent, hotfixAction, behaviorTreeConfig)
      self:Awake(behaviorTreeParent, hotfixAction, behaviorTreeConfig)
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.AwakeSystem_4(out.DCET.Hotfix.LogActionComponent, out.DCET.Hotfix.Entity, out.BehaviorDesigner.Runtime.Tasks.HotfixAction, out.DCET.Hotfix.BehaviorTreeConfig)
        }
      end,
      Awake = Awake
    }
  end)

  namespace.class("LogActionComponent", function (namespace)
    local Awake, OnTick, Dispose, __ctor__
    __ctor__ = function (this)
      System.base(this).__ctor__(this)
    end
    Awake = function (this, behaviorTreeParent, hotfixAction, behaviorTreeConfig)
      this.hotfixAction = hotfixAction

      if this.hotfixAction ~= nil then
        this.hotfixAction.onTick = System.fn(this, OnTick)
      end
    end
    OnTick = function (this)
      DCETHotfix.Log.Error("Hello HotfixAction")
      return 2 --[[TaskStatus.Success]]
    end
    Dispose = function (this)
      if this:getIsDisposed() then
        return
      end

      System.base(this).Dispose(this)

      if this.hotfixAction ~= nil then
        this.hotfixAction.onTick = nil
      end

      this.hotfixAction = nil
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.Entity
        }
      end,
      Awake = Awake,
      Dispose = Dispose,
      __ctor__ = __ctor__
    }
  end)
end)
