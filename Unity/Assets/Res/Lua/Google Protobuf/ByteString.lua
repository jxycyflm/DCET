-- Generated by CSharp.lua Compiler
--#region Copyright notice and license
-- Protocol Buffers - Google's data interchange format
-- Copyright 2008 Google Inc.  All rights reserved.
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
local SystemIO = System.IO
local SystemText = System.Text
local ArrayByte = System.Array(System.Byte)
local GoogleProtobuf
System.import(function (out)
  GoogleProtobuf = Google.Protobuf
end)
System.namespace("Google.Protobuf", function (namespace)
  -- <summary>
  -- Immutable array of bytes.
  -- </summary>
  namespace.class("ByteString", function (namespace)
    local empty, AttachBytes, getEmpty, getLength, getIsEmpty, ToByteArray, ToBase64, FromBase64, 
    FromStream, CopyFrom, CopyFrom1, CopyFrom2, CopyFromUtf8, get, ToString1, ToStringUtf8, 
    GetEnumerator, GetEnumerator1, CreateCodedInput, op_Equality, op_Inequality, EqualsObj, GetHashCode, Equals, 
    WriteRawBytesTo, CopyTo, WriteTo, class, static, __ctor1__, __ctor2__, __ctor3__
    -- <summary>
    -- Unsafe operations that can cause IO Failure and/or other catestrophic side-effects.
    -- </summary>
    namespace.class("Unsafe", function (namespace)
      local FromBytes, GetBuffer
      -- <summary>
      -- Constructs a new ByteString from the given byte array. The array is
      -- *not* copied, and must not be modified after this constructor is called.
      -- </summary>
      FromBytes = function (bytes)
        return System.new(GoogleProtobuf.ByteString, 3, bytes)
      end
      -- <summary>
      -- Provides direct, unrestricted access to the bytes contained in this instance.
      -- You must not modify or resize the byte array returned by this method.
      -- </summary>
      GetBuffer = function (bytes)
        return bytes.bytes
      end
      return {
        FromBytes = FromBytes,
        GetBuffer = GetBuffer
      }
    end)
    static = function (this)
      empty = System.new(class, 3, ArrayByte:new(0))
    end
    __ctor1__ = function (this)
    end
    __ctor2__ = function (this, list)
      this.bytes = list:ToArray()
    end
    -- <summary>
    -- Constructs a new ByteString from the given byte array. The array is
    -- *not* copied, and must not be modified after this constructor is called.
    -- </summary>
    __ctor3__ = function (this, bytes)
      this.bytes = bytes
    end
    -- <summary>
    -- Internal use only.  Ensure that the provided array is not mutated and belongs to this instance.
    -- </summary>
    AttachBytes = function (bytes)
      return System.new(class, 3, bytes)
    end
    getEmpty = function ()
      return empty
    end
    getLength = function (this)
      return #this.bytes
    end
    getIsEmpty = function (this)
      return getLength(this) == 0
    end
    -- <summary>
    -- Converts this <see cref="ByteString"/> into a byte array.
    -- </summary>
    -- <returns>A byte array with the same data as this <c>ByteString</c>.</returns>
    ToByteArray = function (this)
      return System.cast(ArrayByte, this.bytes:Clone())
    end
    -- <summary>
    -- Converts this <see cref="ByteString"/> into a standard base64 representation.
    -- </summary>
    ToBase64 = function (this)
      return System.Convert.ToBase64String(this.bytes)
    end
    -- <summary>
    -- Constructs a <see cref="ByteString" /> from the Base64 Encoded String.
    -- </summary>
    FromBase64 = function (bytes)
      -- By handling the empty string explicitly, we not only optimize but we fix a
      -- problem on CF 2.0. See issue 61 for details.
      local default
      if bytes == "" then
        default = getEmpty()
      else
        default = System.new(class, 3, System.Convert.FromBase64String(bytes))
      end
      return default
    end
    -- <summary>
    -- Constructs a <see cref="ByteString"/> from data in the given stream, synchronously.
    -- </summary>
    -- at the start of the call.</remarks>
    -- <param name="stream">The stream to copy into a ByteString.</param>
    -- <returns>A ByteString with content read from the given stream.</returns>
    FromStream = function (stream)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(stream, "stream", SystemIO.Stream)
      local capacity = stream:getCanSeek() and System.toInt32(stream:getLength() - stream:getPosition(), true) or 0
      local memoryStream = SystemIO.MemoryStream(capacity)
      stream:CopyTo(memoryStream)

      -- Avoid an extra copy if we can.
      local default
      if memoryStream:getLength() == memoryStream:getCapacity() then
        default = memoryStream:GetBuffer()
      else
        default = memoryStream:ToArray()
      end
      local bytes = default

      return AttachBytes(bytes)
    end
    -- <summary>
    -- Constructs a <see cref="ByteString" /> from the given array. The contents
    -- are copied, so further modifications to the array will not
    -- be reflected in the returned ByteString.
    -- This method can also be invoked in <c>ByteString.CopyFrom(0xaa, 0xbb, ...)</c> form
    -- which is primarily useful for testing.
    -- </summary>
    CopyFrom = function (bytes)
      return System.new(class, 3, System.cast(ArrayByte, bytes:Clone()))
    end
    -- <summary>
    -- Constructs a <see cref="ByteString" /> from a portion of a byte array.
    -- </summary>
    CopyFrom1 = function (bytes, offset, count)
      local portion = ArrayByte:new(count)
      GoogleProtobuf.ByteArray.Copy(bytes, offset, portion, 0, count)
      return System.new(class, 3, portion)
    end
    -- <summary>
    -- Creates a new <see cref="ByteString" /> by encoding the specified text with
    -- the given encoding.
    -- </summary>
    CopyFrom2 = function (text, encoding)
      return System.new(class, 3, encoding:GetBytes(text))
    end
    -- <summary>
    -- Creates a new <see cref="ByteString" /> by encoding the specified text in UTF-8.
    -- </summary>
    CopyFromUtf8 = function (text)
      return CopyFrom2(text, SystemText.Encoding.getUTF8())
    end
    get = function (this, index)
      return this.bytes:get(index)
    end
    -- <summary>
    -- Converts this <see cref="ByteString"/> into a string by applying the given encoding.
    -- </summary>
    -- This method should only be used to convert binary data which was the result of encoding
    -- text with the given encoding.
    -- </remarks>
    -- <param name="encoding">The encoding to use to decode the binary data into text.</param>
    -- <returns>The result of decoding the binary data with the given decoding.</returns>
    ToString1 = function (this, encoding)
      return encoding:GetString(this.bytes, 0, #this.bytes)
    end
    -- <summary>
    -- Converts this <see cref="ByteString"/> into a string by applying the UTF-8 encoding.
    -- </summary>
    -- This method should only be used to convert binary data which was the result of encoding
    -- text with UTF-8.
    -- </remarks>
    -- <returns>The result of decoding the binary data with the given decoding.</returns>
    ToStringUtf8 = function (this)
      return ToString1(this, SystemText.Encoding.getUTF8())
    end
    -- <summary>
    -- Returns an iterator over the bytes in this <see cref="ByteString"/>.
    -- </summary>
    GetEnumerator = function (this)
      return this.bytes:GetEnumerator()
    end
    -- <summary>
    -- Returns an iterator over the bytes in this <see cref="ByteString"/>.
    -- </summary>
    GetEnumerator1 = function (this)
      return GetEnumerator(this)
    end
    -- <summary>
    -- Creates a CodedInputStream from this ByteString's data.
    -- </summary>
    CreateCodedInput = function (this)
      -- We trust CodedInputStream not to reveal the provided byte array or modify it
      return GoogleProtobuf.CodedInputStream(this.bytes)
    end
    -- <summary>
    -- Compares two byte strings for equality.
    -- </summary>
    -- <param name="rhs">The second byte string to compare.</param>
    -- <returns><c>true</c> if the byte strings are equal; false otherwise.</returns>
    op_Equality = function (lhs, rhs)
      if System.Object.ReferenceEquals(lhs, rhs) then
        return true
      end
      if System.Object.ReferenceEquals(lhs) or System.Object.ReferenceEquals(rhs) then
        return false
      end
      if #lhs.bytes ~= #rhs.bytes then
        return false
      end
      for i = 0, getLength(lhs) - 1 do
        if rhs.bytes:get(i) ~= lhs.bytes:get(i) then
          return false
        end
      end
      return true
    end
    -- <summary>
    -- Compares two byte strings for inequality.
    -- </summary>
    -- <param name="rhs">The second byte string to compare.</param>
    -- <returns><c>false</c> if the byte strings are equal; true otherwise.</returns>
    op_Inequality = function (lhs, rhs)
      return not (op_Equality(lhs, rhs))
    end
    -- <summary>
    -- Compares this byte string with another object.
    -- </summary>
    -- <returns><c>true</c> if <paramref name="obj"/> refers to an equal <see cref="ByteString"/>; <c>false</c> otherwise.</returns>
    EqualsObj = function (this, obj)
      return op_Equality(this, (System.as(obj, class)))
    end
    -- <summary>
    -- Returns a hash code for this object. Two equal byte strings
    -- will return the same hash code.
    -- </summary>
    GetHashCode = function (this)
      local ret = 23
      for _, b in System.each(this.bytes) do
        ret = (ret * 31) + b
      end
      return ret
    end
    -- <summary>
    -- Compares this byte string with another.
    -- </summary>
    -- <returns><c>true</c> if <paramref name="other"/> refers to an equal byte string; <c>false</c> otherwise.</returns>
    Equals = function (this, other)
      return op_Equality(this, other)
    end
    -- <summary>
    -- Used internally by CodedOutputStream to avoid creating a copy for the write
    -- </summary>
    WriteRawBytesTo = function (this, outputStream)
      outputStream:WriteRawBytes1(this.bytes, 0, #this.bytes)
    end
    -- <summary>
    -- Copies the entire byte array to the destination array provided at the offset specified.
    -- </summary>
    CopyTo = function (this, array, position)
      GoogleProtobuf.ByteArray.Copy(this.bytes, 0, array, position, #this.bytes)
    end
    -- <summary>
    -- Writes the entire byte array to the provided stream
    -- </summary>
    WriteTo = function (this, outputStream)
      outputStream:Write(this.bytes, 0, #this.bytes)
    end
    class = {
      __genericT__ = System.Byte,
      base = function (out)
        return {
          System.IEnumerable_1(System.Byte),
          System.IEquatable_1(out.Google.Protobuf.ByteString)
        }
      end,
      AttachBytes = AttachBytes,
      getEmpty = getEmpty,
      getLength = getLength,
      getIsEmpty = getIsEmpty,
      ToByteArray = ToByteArray,
      ToBase64 = ToBase64,
      FromBase64 = FromBase64,
      FromStream = FromStream,
      CopyFrom = CopyFrom,
      CopyFrom1 = CopyFrom1,
      CopyFrom2 = CopyFrom2,
      CopyFromUtf8 = CopyFromUtf8,
      get = get,
      ToString1 = ToString1,
      ToStringUtf8 = ToStringUtf8,
      GetEnumerator = GetEnumerator,
      GetEnumerator1 = GetEnumerator1,
      CreateCodedInput = CreateCodedInput,
      op_Equality = op_Equality,
      op_Inequality = op_Inequality,
      EqualsObj = EqualsObj,
      GetHashCode = GetHashCode,
      Equals = Equals,
      WriteRawBytesTo = WriteRawBytesTo,
      CopyTo = CopyTo,
      WriteTo = WriteTo,
      static = static,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "IsEmpty", 0x206, System.Boolean, getIsEmpty, out.MongoDB.Bson.Serialization.Attributes.BsonIgnoreAttribute() },
            { "Length", 0x206, System.Int32, getLength, out.MongoDB.Bson.Serialization.Attributes.BsonIgnoreAttribute() }
          }
        }
      end
    }
    return class
  end)
end)
