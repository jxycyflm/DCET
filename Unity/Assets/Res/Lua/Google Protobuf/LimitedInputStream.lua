-- Generated by CSharp.lua Compiler
--#region Copyright notice and license
-- Protocol Buffers - Google's data interchange format
-- Copyright 2015 Google Inc.  All rights reserved.
-- https://developers.google.com/protocol-buffers/
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:
--
--     * Redistributions of source code must retain the above copyright
-- notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above
-- copyright notice, this list of conditions and the following disclaimer
-- in the documentation and/or other materials provided with the
-- distribution.
--     * Neither the name of Google Inc. nor the names of its
-- contributors may be used to endorse or promote products derived from
-- this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-- OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-- LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-- DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-- THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--#endregion
local System = System
System.namespace("Google.Protobuf", function (namespace)
  -- <summary>
  -- Stream implementation which proxies another stream, only allowing a certain amount
  -- of data to be read. Note that this is only used to read delimited streams, so it
  -- doesn't attempt to implement everything.
  -- </summary>
  namespace.class("LimitedInputStream", function (namespace)
    local getCanRead, getCanSeek, getCanWrite, Flush, getLength, getPosition, setPosition, Read, 
    Seek, SetLength, Write, __ctor__
    __ctor__ = function (this, proxied, size)
      System.base(this).__ctor__(this)
      this.proxied = proxied
      this.bytesLeft = size
    end
    getCanRead = function (this)
      return true
    end
    getCanSeek = function (this)
      return false
    end
    getCanWrite = function (this)
      return false
    end
    Flush = function (this)
    end
    getLength = function (this)
      System.throw(System.NotSupportedException())
    end
    getPosition = function (this)
      System.throw(System.NotSupportedException())
    end
    setPosition = function (this, value)
      System.throw(System.NotSupportedException())
    end
    Read = function (this, buffer, offset, count)
      if this.bytesLeft > 0 then
        local bytesRead = this.proxied:Read(buffer, offset, math.Min(this.bytesLeft, count))
        this.bytesLeft = this.bytesLeft - bytesRead
        return bytesRead
      end
      return 0
    end
    Seek = function (this, offset, origin)
      System.throw(System.NotSupportedException())
    end
    SetLength = function (this, value)
      System.throw(System.NotSupportedException())
    end
    Write = function (this, buffer, offset, count)
      System.throw(System.NotSupportedException())
    end
    return {
      base = function (out)
        return {
          System.IO.Stream
        }
      end,
      bytesLeft = 0,
      getCanRead = getCanRead,
      getCanSeek = getCanSeek,
      getCanWrite = getCanWrite,
      Flush = Flush,
      getLength = getLength,
      getPosition = getPosition,
      setPosition = setPosition,
      Read = Read,
      Seek = Seek,
      SetLength = SetLength,
      Write = Write,
      __ctor__ = __ctor__
    }
  end)
end)
