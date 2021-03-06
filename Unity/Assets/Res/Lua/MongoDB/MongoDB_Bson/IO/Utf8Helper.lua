-- Generated by CSharp.lua Compiler
--[[ Copyright 2010-present MongoDB Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
]]
local System = System
local ArrayString = System.Array(System.String)
System.namespace("MongoDB.Bson.IO", function (namespace)
  -- <summary>
  -- Represents a class that has some helper methods for decoding UTF8 strings.
  -- </summary>
  namespace.class("Utf8Helper", function (namespace)
    local __asciiStringTable, DecodeUtf8String, static
    static = function (this)
      __asciiStringTable = ArrayString:new(128)
      for i = 0, #__asciiStringTable - 1 do
        __asciiStringTable:set(i, System.String(System.toUInt16(i), 1))
      end
    end
    -- <summary>
    -- Decodes a UTF8 string.
    -- </summary>
    -- <param name="index">The index.</param>
    -- <param name="count">The count.</param>
    -- <param name="encoding">The encoding.</param>
    -- <returns>The decoded string.</returns>
    DecodeUtf8String = function (bytes, index, count, encoding)
      repeat
        local default = count
        if default == 0 then
          return ""
        elseif default == 1 then
          local byte1 = bytes:get(index)
          if byte1 < #__asciiStringTable then
            return __asciiStringTable:get(byte1)
          end
          break
        end
      until 1

      return encoding:GetString(bytes, index, count)
    end
    return {
      DecodeUtf8String = DecodeUtf8String,
      static = static
    }
  end)
end)
