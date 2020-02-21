-- Generated by CSharp.lua Compiler
local System = System
local DCETHotfix = DCET.Hotfix
local FairyGUI = FairyGUI
local DCETHotfix
System.import(function (out)
  DCETHotfix = DCET.Hotfix
end)
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("FUILoginAwakeSystem", function (namespace)
    local Awake
    Awake = function (this, self, go)
      self:Awake(go)
    end
    return {
      base = function (out)
        return {
          out.DCET.Hotfix.AwakeSystem_2(out.DCET.Hotfix.FUILogin, out.FairyGUI.GObject)
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

  namespace.class("FUILogin", function (namespace)
    local CreateGObject, CreateGObjectAsync, CreateInstance, CreateInstanceAsync, Create, GetFormPool, Awake, Dispose, 
    class
    CreateGObject = function ()
      return FairyGUI.UIPackage.CreateObject("Hotfix" --[[FUILogin.UIPackageName]], "Login" --[[FUILogin.UIResName]])
    end
    CreateGObjectAsync = function (result)
      FairyGUI.UIPackage.CreateObjectAsync("Hotfix" --[[FUILogin.UIPackageName]], "Login" --[[FUILogin.UIResName]], result)
    end
    CreateInstance = function (domain)
      return DCETHotfix.EntityFactory.Create2(domain, CreateGObject(), class, FairyGUI.GObject)
    end
    CreateInstanceAsync = function (domain)
      local tcs = System.TaskCompletionSource()

      CreateGObjectAsync(function (go)
        tcs:SetResult(DCETHotfix.EntityFactory.Create2(domain, go, class, FairyGUI.GObject))
      end)

      return tcs:getTask()
    end
    Create = function (domain, go)
      return DCETHotfix.EntityFactory.Create2(domain, go, class, FairyGUI.GObject)
    end
    -- <summary>
    -- 通过此方法获取的FUI，在Dispose时不会释放GObject，需要自行管理（一般在配合FGUI的Pool机制时使用）。
    -- </summary>
    GetFormPool = function (domain, go)
      local fui = DCETHotfix.GObjectHelper.Get(go, class)

      if fui == nil then
        fui = Create(domain, go)
      end

      fui.isFromFGUIPool = true

      return fui
    end
    Awake = function (this, go)
      if go == nil then
        return
      end

      this.GObject = go

      if System.String.IsNullOrWhiteSpace(this:getName()) then
        this:setName(this.Id:ToString())
      end

      this.self = System.cast(FairyGUI.GComponent, go)

      DCETHotfix.GObjectHelper.Add(this.self, this)

      local com = go:getasCom()

      if com ~= nil then
        this.bg = System.cast(FairyGUI.GImage, com:GetChild("bg"))
        this.contentBG = System.cast(FairyGUI.GImage, com:GetChild("contentBG"))
        this.accountBg = System.cast(FairyGUI.GImage, com:GetChild("accountBg"))
        this.accountInput = System.cast(FairyGUI.GTextInput, com:GetChild("accountInput"))
        this.passwordBg = System.cast(FairyGUI.GImage, com:GetChild("passwordBg"))
        this.passwordInput = System.cast(FairyGUI.GTextInput, com:GetChild("passwordInput"))
        this.loginButton = DCETHotfix.FUITitleButton.Create(this.domain, com:GetChild("loginButton"))
        this.content = System.cast(FairyGUI.GGroup, com:GetChild("content"))
      end
    end
    Dispose = function (this)
      if this:getIsDisposed() then
        return
      end

      System.base(this).Dispose(this)

      DCETHotfix.GObjectHelper.Remove(this.self)
      this.self = nil
      this.bg = nil
      this.contentBG = nil
      this.accountBg = nil
      this.accountInput = nil
      this.passwordBg = nil
      this.passwordInput = nil
      this.loginButton:Dispose()
      this.loginButton = nil
      this.content = nil
    end
    class = {
      base = function (out)
        return {
          out.DCET.Hotfix.FUI
        }
      end,
      CreateInstance = CreateInstance,
      CreateInstanceAsync = CreateInstanceAsync,
      Create = Create,
      GetFormPool = GetFormPool,
      Awake = Awake,
      Dispose = Dispose
    }
    return class
  end)
end)
