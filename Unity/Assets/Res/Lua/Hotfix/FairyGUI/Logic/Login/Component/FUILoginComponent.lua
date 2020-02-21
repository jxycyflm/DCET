-- Generated by CSharp.lua Compiler
local System = System
local DCETHotfix
System.import(function (out)
  DCETHotfix = DCET.Hotfix
end)
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("FUILoginComponentAwakeSystem", function (namespace)
    local Awake
    Awake = function (this, self)
      self:Awake()
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.AwakeSystem_1(out.DCET.Hotfix.FUILoginComponent)
        }
      end,
      Awake = Awake,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.DCET.Hotfix.ObjectSystemAttribute() }
        }
      end
    }
  end)

  namespace.class("FUILoginComponent", function (namespace)
    local Awake, OnClickLogin, __ctor__
    __ctor__ = function (this)
      System.base(this).__ctor__(this)
    end
    Awake = function (this)
      this.fuiLogin = this:GetParent(DCETHotfix.FUILogin)
      this.fuiLogin.loginButton.self:getonClick():Set(System.fn(this, OnClickLogin))
    end
    OnClickLogin = function (this)
      DCETHotfix.LoginHelper.OnLoginAsync(this.fuiLogin.accountInput:gettext())
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.Entity
        }
      end,
      Awake = Awake,
      OnClickLogin = OnClickLogin,
      __ctor__ = __ctor__
    }
  end)
end)
