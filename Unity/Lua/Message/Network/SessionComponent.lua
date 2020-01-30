-- Generated by CSharp.lua Compiler
local System = System
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("SessionComponentAwakeSystem", function (namespace)
    local Awake
    Awake = function (this, self)
      self:Awake()
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.AwakeSystem_1(out.DCET.Hotfix.SessionComponent)
        }
      end,
      Awake = Awake
    }
  end)

  namespace.class("SessionComponent", function (namespace)
    local getSession, setSession, Awake, Dispose, class, __ctor__
    __ctor__ = function (this)
      System.base(this).__ctor__(this)
    end
    getSession = function (this)
      return this.session
    end
    setSession = function (this, value)
      this.session = value

      if this.session ~= nil then
        this.session:setParent(this)
      end
    end
    Awake = function (this)
      class.Instance = this
    end
    Dispose = function (this)
      if this:getIsDisposed() then
        return
      end

      System.base(this).Dispose(this)

      getSession(this):Dispose()
      setSession(this, nil)
      class.Instance = nil
    end
    class = {
      base = function (out)
        return {
          out.DCET.Hotfix.Entity
        }
      end,
      getSession = getSession,
      setSession = setSession,
      Awake = Awake,
      Dispose = Dispose,
      __ctor__ = __ctor__
    }
    return class
  end)
end)
