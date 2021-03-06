-- Generated by CSharp.lua Compiler
local System = System
local DCET = DCET
local DCETRuntime = DCET.Runtime
local UnityEngine = UnityEngine
local DCET
System.import(function (out)
  DCET = out.DCET
end)
System.namespace("DCET", function (namespace)
  namespace.class("M2C_PathfindingResultHandler", function (namespace)
    local Run
    Run = function (this, session, message)
      return System.async(function (async, this, session, message)
        local unit = DCET.Game.Scene:GetComponent(DCET.UnitComponent):Get(message:getId())


        unit:GetComponent(DCET.AnimatorComponent):SetFloatValue("Speed", 5)
        local unitPathComponent = unit:GetComponent(DCET.UnitPathComponent)

        unitPathComponent:StartMove1(message)

        DCETRuntime.GizmosDebug.getInstance().Path:Clear()
        DCETRuntime.GizmosDebug.getInstance().Path:Add(UnityEngine.Vector3(message:getX(), message:getY(), message:getZ()))
        for i = 0, message:getXs():getCount() - 1 do
          DCETRuntime.GizmosDebug.getInstance().Path:Add(UnityEngine.Vector3(message:getXs():get(i), message:getYs():get(i), message:getZs():get(i)))
        end

        async:await(System.Task.getCompletedTask())
      end, nil, this, session, message)
    end
    return {
      base = function (out)
        return {
          out.DCET.AMHandler_1(out.DCET.M2C_PathfindingResult)
        }
      end,
      Run = Run,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.DCET.MessageHandlerAttribute() }
        }
      end
    }
  end)
end)
