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
local SystemIO = System.IO
local ArrayByte = System.Array(System.Byte)
local GoogleProtobuf
System.import(function (out)
  GoogleProtobuf = Google.Protobuf
end)
System.namespace("Google.Protobuf", function (namespace)
  -- <summary>
  -- Extension methods on <see cref="IMessage"/> and <see cref="IMessage{T}"/>.
  -- </summary>
  namespace.class("MessageExtensions", function (namespace)
    local MergeFrom, MergeFrom1, MergeFrom2, MergeFrom3, MergeDelimitedFrom, ToByteArray, WriteTo, WriteDelimitedTo, 
    ToByteString, class, static
    static = function (this)
      this.inputStream = GoogleProtobuf.CodedInputStream(ArrayByte:new(0))
      this.outputStream = GoogleProtobuf.CodedOutputStream(ArrayByte:new(0))
    end
    -- <summary>
    -- Merges data from the given byte array into an existing message.
    -- </summary>
    -- <param name="data">The data to merge, which must be protobuf-encoded binary data.</param>
    MergeFrom = function (message, data)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(data, "data", ArrayByte)
      class.inputStream:Reset(data, 0, #data)
      local input = class.inputStream
      message:MergeFrom(input)
      input:CheckReadEndOfStreamTag()
    end
    -- <summary>
    -- Merges data from the given byte array into an existing message.
    -- </summary>
    -- <param name="data">The data to merge, which must be protobuf-encoded binary data.</param>
    MergeFrom1 = function (message, data, offset, length)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(data, "data", ArrayByte)
      class.inputStream:Reset(data, offset, length)
      local input = class.inputStream
      --CodedInputStream input = new CodedInputStream(data, offset, length);
      message:MergeFrom(input)
      input:CheckReadEndOfStreamTag()
    end
    -- <summary>
    -- Merges data from the given byte string into an existing message.
    -- </summary>
    -- <param name="data">The data to merge, which must be protobuf-encoded binary data.</param>
    MergeFrom2 = function (message, data)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(data, "data", GoogleProtobuf.ByteString)
      local input = data:CreateCodedInput()
      message:MergeFrom(input)
      input:CheckReadEndOfStreamTag()
    end
    -- <summary>
    -- Merges data from the given stream into an existing message.
    -- </summary>
    -- <param name="input">Stream containing the data to merge, which must be protobuf-encoded binary data.</param>
    MergeFrom3 = function (message, input)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(input, "input", SystemIO.Stream)
      local codedInput = System.new(GoogleProtobuf.CodedInputStream, 3, input)
      message:MergeFrom(codedInput)
      codedInput:CheckReadEndOfStreamTag()
    end
    -- <summary>
    -- Merges length-delimited data from the given stream into an existing message.
    -- </summary>
    -- The stream is expected to contain a length and then the data. Only the amount of data
    -- specified by the length will be consumed.
    -- </remarks>
    -- <param name="message">The message to merge the data into.</param>
    -- <param name="input">Stream containing the data to merge, which must be protobuf-encoded binary data.</param>
    MergeDelimitedFrom = function (message, input)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(input, "input", SystemIO.Stream)
      local size = System.toInt32(GoogleProtobuf.CodedInputStream.ReadRawVarint321(input))
      local limitedStream = GoogleProtobuf.LimitedInputStream(input, size)
      MergeFrom3(message, limitedStream)
    end
    -- <summary>
    -- Converts the given message into a byte array in protobuf encoding.
    -- </summary>
    -- <returns>The message data as a byte array.</returns>
    ToByteArray = function (message)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      local result = ArrayByte:new(message:CalculateSize())
      local output = GoogleProtobuf.CodedOutputStream(result)
      message:WriteTo(output)
      output:CheckNoSpaceLeft()
      return result
    end
    -- <summary>
    -- Writes the given message data to the given stream in protobuf encoding.
    -- </summary>
    -- <param name="output">The stream to write to.</param>
    WriteTo = function (message, output)
      -- 这里做了修改，去掉CodedOutputStream的gc
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(output, "output", SystemIO.MemoryStream)
      class.outputStream:Reset(output:GetBuffer(), System.toInt32(output:getLength()), System.toInt32(output:getCapacity() - output:getLength()))
      message:WriteTo(class.outputStream)
      output:SetLength(class.outputStream:getPosition())
    end
    -- <summary>
    -- Writes the length and then data of the given message to a stream.
    -- </summary>
    -- <param name="output">The output stream to write to.</param>
    WriteDelimitedTo = function (message, output)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(output, "output", SystemIO.Stream)
      local codedOutput = System.new(GoogleProtobuf.CodedOutputStream, 4, output)
      codedOutput:WriteRawVarint32(System.toUInt32(message:CalculateSize()))
      message:WriteTo(codedOutput)
      codedOutput:Flush()
    end
    -- <summary>
    -- Converts the given message into a byte string in protobuf encoding.
    -- </summary>
    -- <returns>The message data as a byte string.</returns>
    ToByteString = function (message)
      GoogleProtobuf.ProtoPreconditions.CheckNotNull(message, "message", GoogleProtobuf.IMessage)
      return GoogleProtobuf.ByteString.AttachBytes(ToByteArray(message))
    end
    class = {
      MergeFrom = MergeFrom,
      MergeFrom1 = MergeFrom1,
      MergeFrom2 = MergeFrom2,
      MergeFrom3 = MergeFrom3,
      MergeDelimitedFrom = MergeDelimitedFrom,
      ToByteArray = ToByteArray,
      WriteTo = WriteTo,
      WriteDelimitedTo = WriteDelimitedTo,
      ToByteString = ToByteString,
      static = static
    }
    return class
  end)
end)
