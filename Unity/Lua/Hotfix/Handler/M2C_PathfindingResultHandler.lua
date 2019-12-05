-- Generated by CSharp.lua Compiler
local System = System
local DCETModel = DCET.Model
local UnityEngine = UnityEngine
System.namespace("DCET.Hotfix", function (namespace)
  namespace.class("M2C_PathfindingResultHandler", function (namespace)
    local Run
    Run = function (this, session, message)
      return System.async(function (async, this, session, message)
        local unit = DCETModel.Game.getScene():GetComponent(DCETModel.UnitComponent):Get(message:getId())


        unit:GetComponent(DCETModel.AnimatorComponent):SetFloatValue("Speed", 5)
        local unitPathComponent = unit:GetComponent(DCETModel.UnitPathComponent)

        unitPathComponent:StartMove(message):Coroutine()

        DCETModel.GizmosDebug.getInstance().Path:Clear()
        DCETModel.GizmosDebug.getInstance().Path:Add(UnityEngine.Vector3(message:getX(), message:getY(), message:getZ()))
        for i = 0, message:getXs():getCount() - 1 do
          DCETModel.GizmosDebug.getInstance().Path:Add(UnityEngine.Vector3(message:getXs():get(i), message:getYs():get(i), message:getZs():get(i)))
        end

        async:Await(DCETModel.ETTask.getCompletedTask())
      end, nil, this, session, message)
    end
    return {
      __inherits__ = function (out)
        return {
          out.DCET.Hotfix.AMHandler_1(out.DCET.Model.M2C_PathfindingResult)
        }
      end,
      Run = Run
    }
  end)
end)