-- Generated by CSharp.lua Compiler
--[[ Copyright 2016-present MongoDB Inc.
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
System.namespace("MongoDB.Bson.IO", function (namespace)
  namespace.class("CStringUtf8Encoding", function (namespace)
    local GetBytes, GetMaxByteCount
    GetBytes = function (value, bytes, byteIndex, fallbackEncoding)
      local charLength = #value
      local initialByteIndex = byteIndex

      for charIndex = 0, charLength - 1 do
        local c = value:get(charIndex)
        if c == 0 then
          System.throw(System.ArgumentException("A CString cannot contain null bytes.", "value"))
        elseif c <= 0x7f then
          local default = byteIndex
          byteIndex = default + 1
          bytes:set(default, System.toByte(c))
        elseif c <= 0x7ff then
          local byte1 = System.bor(0xc0, (System.sr(c, 6)))
          local byte2 = System.bor(0x80, (System.band(c, 0x3f)))
          local default = byteIndex
          byteIndex = default + 1
          bytes:set(default, System.toByte(byte1))
          local extern = byteIndex
          byteIndex = extern + 1
          bytes:set(extern, System.toByte(byte2))
        elseif c <= 0xd7ff or c >= 0xe000 then
          local byte1 = System.bor(0xe0, (System.sr(c, 12)))
          local byte2 = System.bor(0x80, (System.band((System.sr(c, 6)), 0x3f)))
          local byte3 = System.bor(0x80, (System.band(c, 0x3f)))
          local default = byteIndex
          byteIndex = default + 1
          bytes:set(default, System.toByte(byte1))
          local extern = byteIndex
          byteIndex = extern + 1
          bytes:set(extern, System.toByte(byte2))
          local ref = byteIndex
          byteIndex = ref + 1
          bytes:set(ref, System.toByte(byte3))
        else
          -- let fallback encoding handle surrogate pairs
          local bytesWritten = fallbackEncoding:GetBytes(value, 0, #value, bytes, byteIndex)
          if System.Array.IndexOf(bytes, 0, initialByteIndex, bytesWritten) ~= - 1 then
            System.throw(System.ArgumentException("A CString cannot contain null bytes.", "value"))
          end
          return bytesWritten
        end
      end

      return byteIndex - initialByteIndex
    end
    GetMaxByteCount = function (charCount)
      return charCount * 3
    end
    return {
      GetBytes = GetBytes,
      GetMaxByteCount = GetMaxByteCount
    }
  end)
end)
