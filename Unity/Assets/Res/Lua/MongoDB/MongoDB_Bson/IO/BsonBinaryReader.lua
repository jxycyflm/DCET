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
local SystemGlobalization = System.Globalization
local MongoDBBson
local MongoDBBsonIO
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonIO = MongoDB.Bson.IO
end)
System.namespace("MongoDB.Bson.IO", function (namespace)
  -- <summary>
  -- Represents a BSON reader for a binary BSON byte array.
  -- </summary>
  namespace.class("BsonBinaryReader", function (namespace)
    local getBaseStream, getBsonStream, Close, GetBookmark, IsAtEndOfFile, ReadBinaryData, ReadBoolean, ReadBsonType, 
    ReadBytes, ReadDateTime, ReadDecimal128, ReadDouble, ReadEndArray, ReadEndDocument, ReadInt32, ReadInt64, 
    ReadJavaScript, ReadJavaScriptWithScope, ReadMaxKey, ReadMinKey, ReadName, ReadNull, ReadObjectId, ReadRawBsonArray, 
    ReadRawBsonDocument, ReadRegularExpression, ReadStartArray, ReadStartDocument, ReadString, ReadSymbol, ReadTimestamp, ReadUndefined, 
    ReturnToBookmark, SkipName, SkipValue, Dispose1, GenerateDottedElementName, GenerateDottedElementName1, GetNextState, ReadSize, 
    __ctor1__, __ctor2__
    -- <summary>
    -- Initializes a new instance of the BsonBinaryReader class.
    -- </summary>
    __ctor1__ = function (this, stream)
      __ctor2__(this, stream, MongoDBBsonIO.BsonBinaryReaderSettings.getDefaults())
    end
    -- <summary>
    -- Initializes a new instance of the BsonBinaryReader class.
    -- </summary>
    -- <param name="settings">A BsonBinaryReaderSettings.</param>
    __ctor2__ = function (this, stream, settings)
      MongoDBBsonIO.BsonReader.__ctor__(this, settings)
      if stream == nil then
        System.throw(System.ArgumentNullException("stream"))
      end
      if not stream:getCanSeek() then
        System.throw(System.ArgumentException("The stream must be capable of seeking.", "stream"))
      end

      this._baseStream = stream
      this._bsonStream = (System.as(stream, MongoDBBsonIO.BsonStream)) or MongoDBBsonIO.BsonStreamAdapter(stream, false)
      this._settings = settings
      -- already frozen by base class

      this._context = MongoDBBsonIO.BsonBinaryReaderContext(nil, 0 --[[ContextType.TopLevel]], 0, 0)
    end
    getBaseStream = function (this)
      return this._baseStream
    end
    getBsonStream = function (this)
      return this._bsonStream
    end
    -- <summary>
    -- Closes the reader.
    -- </summary>
    Close = function (this)
      -- Close can be called on Disposed objects
      this:setState(8 --[[BsonReaderState.Closed]])
    end
    -- <summary>
    -- Gets a bookmark to the reader's current position and state.
    -- </summary>
    GetBookmark = function (this)
      return MongoDBBsonIO.BsonBinaryReaderBookmark(this:getState(), this:getCurrentBsonType(), this:getCurrentName(), this._context, this._bsonStream:getPosition())
    end
    -- <summary>
    -- Determines whether this reader is at end of file.
    -- </summary>
    -- Whether this reader is at end of file.
    -- </returns>
    IsAtEndOfFile = function (this)
      return this._bsonStream:getPosition() >= this._bsonStream:getLength()
    end
    -- <summary>
    -- Reads BSON binary data from the reader.
    -- </summary>
    ReadBinaryData = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadBinaryData", 5 --[[BsonType.Binary]])

      local size = ReadSize(this)

      local subType = MongoDBBsonIO.BsonStreamExtensions.ReadBinarySubType(this._bsonStream)
      if subType == 2 --[[BsonBinarySubType.OldBinary]] then
        -- sub type OldBinary has two sizes (for historical reasons)
        local size2 = ReadSize(this)
        if size2 ~= size - 4 then
          System.throw(System.FormatException("Binary sub type OldBinary has inconsistent sizes"))
        end
        size = size2

        if this._settings:getFixOldBinarySubTypeOnInput() then
          subType = 0 --[[BsonBinarySubType.Binary]]
          -- replace obsolete OldBinary with new Binary sub type
        end
      end

      local bytes = MongoDBBsonIO.BsonStreamExtensions.ReadBytes1(this._bsonStream, size)

      local guidRepresentation
      repeat
        local default = subType
        if default == 3 --[[BsonBinarySubType.UuidLegacy]] then
          guidRepresentation = this._settings:getGuidRepresentation()
          break
        elseif default == 4 --[[BsonBinarySubType.UuidStandard]] then
          guidRepresentation = 1 --[[GuidRepresentation.Standard]]
          break
        else
          guidRepresentation = 0 --[[GuidRepresentation.Unspecified]]
          break
        end
      until 1

      this:setState(GetNextState(this))
      return System.new(MongoDBBson.BsonBinaryData, 3, bytes, subType, guidRepresentation)
    end
    -- <summary>
    -- Reads a BSON boolean from the reader.
    -- </summary>
    ReadBoolean = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadBoolean", 8 --[[BsonType.Boolean]])
      this:setState(GetNextState(this))
      return MongoDBBsonIO.BsonStreamExtensions.ReadBoolean(this._bsonStream)
    end
    -- <summary>
    -- Reads a BsonType from the reader.
    -- </summary>
    ReadBsonType = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this:getState() == 0 --[[BsonReaderState.Initial]] or this:getState() == 4 --[[BsonReaderState.ScopeDocument]] then
        -- there is an implied type of Document for the top level and for scope documents
        this:setCurrentBsonType(3 --[[BsonType.Document]])
        this:setState(3 --[[BsonReaderState.Value]])
        return this:getCurrentBsonType()
      end
      if this:getState() ~= 1 --[[BsonReaderState.Type]] then
        this:ThrowInvalidState("ReadBsonType", System.Array(System.Int32)(1 --[[BsonReaderState.Type]]))
      end

      if this._context:getContextType() == 2 --[[ContextType.Array]] then
        local default = this._context
        default:setCurrentArrayIndex(default:getCurrentArrayIndex() + 1)
      end

      System.try(function ()
        this:setCurrentBsonType(MongoDBBsonIO.BsonStreamExtensions.ReadBsonType(this._bsonStream))
      end, function (default)
        if System.is(default, System.FormatException) then
          local ex = default
          if ex:getMessage():StartsWith("Detected unknown BSON type") then
            -- insert the element name into the error message
            local periodIndex = ex:getMessage():IndexOf(46 --[['.']])
            local dottedElementName = GenerateDottedElementName(this)
            local message = ex:getMessage():Substring(0, periodIndex) .. " for fieldname \"" .. dottedElementName .. "\"" .. ex:getMessage():Substring(periodIndex)
            System.throw(System.FormatException(message))
          end
          System.throw(default)
        else
          return 1, default
        end
      end)

      if this:getCurrentBsonType() == 0 --[[BsonType.EndOfDocument]] then
        repeat
          local default = this._context:getContextType()
          if default == 2 --[[ContextType.Array]] then
            this:setState(6 --[[BsonReaderState.EndOfArray]])
            return 0 --[[BsonType.EndOfDocument]]
          elseif default == 1 --[[ContextType.Document]] or default == 4 --[[ContextType.ScopeDocument]] then
            this:setState(5 --[[BsonReaderState.EndOfDocument]])
            return 0 --[[BsonType.EndOfDocument]]
          else
            local message = System.String.Format("BsonType EndOfDocument is not valid when ContextType is {0}.", this._context:getContextType())
            System.throw(System.FormatException(message))
          end
        until 1
      else
        repeat
          local default = this._context:getContextType()
          if default == 2 --[[ContextType.Array]] then
            this._bsonStream:SkipCString()
            this:setState(3 --[[BsonReaderState.Value]])
            break
          elseif default == 1 --[[ContextType.Document]] or default == 4 --[[ContextType.ScopeDocument]] then
            this:setState(2 --[[BsonReaderState.Name]])
            break
          else
            System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
          end
        until 1

        return this:getCurrentBsonType()
      end
    end
    -- <summary>
    -- Reads BSON binary data from the reader.
    -- </summary>
    ReadBytes = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadBytes", 5 --[[BsonType.Binary]])

      local size = ReadSize(this)

      local subType = MongoDBBsonIO.BsonStreamExtensions.ReadBinarySubType(this._bsonStream)
      if subType ~= 0 --[[BsonBinarySubType.Binary]] and subType ~= 2 --[[BsonBinarySubType.OldBinary]] then
        local message = System.String.Format("ReadBytes requires the binary sub type to be Binary, not {0}.", subType)
        System.throw(System.FormatException(message))
      end

      this:setState(GetNextState(this))
      return MongoDBBsonIO.BsonStreamExtensions.ReadBytes1(this._bsonStream, size)
    end
    -- <summary>
    -- Reads a BSON DateTime from the reader.
    -- </summary>
    ReadDateTime = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadDateTime", 9 --[[BsonType.DateTime]])
      this:setState(GetNextState(this))
      local value = this._bsonStream:ReadInt64()
      if value == MongoDBBson.BsonConstants.getDateTimeMaxValueMillisecondsSinceEpoch() + 1 then
        if this._settings:getFixOldDateTimeMaxValueOnInput() then
          value = MongoDBBson.BsonConstants.getDateTimeMaxValueMillisecondsSinceEpoch()
        end
      end
      return value
    end
    ReadDecimal128 = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadDecimal128" --[[nameof(ReadDecimal128)]], 19 --[[BsonType.Decimal128]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadDecimal128()
    end
    -- <summary>
    -- Reads a BSON Double from the reader.
    -- </summary>
    ReadDouble = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadDouble", 1 --[[BsonType.Double]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadDouble()
    end
    -- <summary>
    -- Reads the end of a BSON array from the reader.
    -- </summary>
    ReadEndArray = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this._context:getContextType() ~= 2 --[[ContextType.Array]] then
        this:ThrowInvalidContextType("ReadEndArray", this._context:getContextType(), System.Array(System.Int32)(2 --[[ContextType.Array]]))
      end
      if this:getState() == 1 --[[BsonReaderState.Type]] then
        this:ReadBsonType()
        -- will set state to EndOfArray if at end of array
      end
      if this:getState() ~= 6 --[[BsonReaderState.EndOfArray]] then
        this:ThrowInvalidState("ReadEndArray", System.Array(System.Int32)(6 --[[BsonReaderState.EndOfArray]]))
      end

      this._context = this._context:PopContext(this._bsonStream:getPosition())
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(0 --[[BsonReaderState.Initial]])
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1
    end
    -- <summary>
    -- Reads the end of a BSON document from the reader.
    -- </summary>
    ReadEndDocument = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this._context:getContextType() ~= 1 --[[ContextType.Document]] and this._context:getContextType() ~= 4 --[[ContextType.ScopeDocument]] then
        this:ThrowInvalidContextType("ReadEndDocument", this._context:getContextType(), System.Array(System.Int32)(1 --[[ContextType.Document]], 4 --[[ContextType.ScopeDocument]]))
      end
      if this:getState() == 1 --[[BsonReaderState.Type]] then
        this:ReadBsonType()
        -- will set state to EndOfDocument if at end of document
      end
      if this:getState() ~= 5 --[[BsonReaderState.EndOfDocument]] then
        this:ThrowInvalidState("ReadEndDocument", System.Array(System.Int32)(5 --[[BsonReaderState.EndOfDocument]]))
      end

      this._context = this._context:PopContext(this._bsonStream:getPosition())
      if this._context:getContextType() == 3 --[[ContextType.JavaScriptWithScope]] then
        this._context = this._context:PopContext(this._bsonStream:getPosition())
        -- JavaScriptWithScope
      end
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(0 --[[BsonReaderState.Initial]])
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1
    end
    -- <summary>
    -- Reads a BSON Int32 from the reader.
    -- </summary>
    ReadInt32 = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadInt32", 16 --[[BsonType.Int32]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadInt32()
    end
    -- <summary>
    -- Reads a BSON Int64 from the reader.
    -- </summary>
    ReadInt64 = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadInt64", 18 --[[BsonType.Int64]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadInt64()
    end
    -- <summary>
    -- Reads a BSON JavaScript from the reader.
    -- </summary>
    ReadJavaScript = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadJavaScript", 13 --[[BsonType.JavaScript]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadString(this._settings:getEncoding())
    end
    -- <summary>
    -- Reads a BSON JavaScript with scope from the reader (call ReadStartDocument next to read the scope).
    -- </summary>
    ReadJavaScriptWithScope = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadJavaScriptWithScope", 15 --[[BsonType.JavaScriptWithScope]])

      local startPosition = this._bsonStream:getPosition()
      -- position of size field
      local size = ReadSize(this)
      this._context = MongoDBBsonIO.BsonBinaryReaderContext(this._context, 3 --[[ContextType.JavaScriptWithScope]], startPosition, size)
      local code = this._bsonStream:ReadString(this._settings:getEncoding())

      this:setState(4 --[[BsonReaderState.ScopeDocument]])
      return code
    end
    -- <summary>
    -- Reads a BSON MaxKey from the reader.
    -- </summary>
    ReadMaxKey = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadMaxKey", 127 --[[BsonType.MaxKey]])
      this:setState(GetNextState(this))
    end
    -- <summary>
    -- Reads a BSON MinKey from the reader.
    -- </summary>
    ReadMinKey = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadMinKey", 255 --[[BsonType.MinKey]])
      this:setState(GetNextState(this))
    end
    -- <summary>
    -- Reads the name of an element from the reader.
    -- </summary>
    -- <returns>The name of the element.</returns>
    ReadName = function (this, nameDecoder)
      if nameDecoder == nil then
        System.throw(System.ArgumentNullException("nameDecoder"))
      end

      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this:getState() == 1 --[[BsonReaderState.Type]] then
        this:ReadBsonType()
      end
      if this:getState() ~= 2 --[[BsonReaderState.Name]] then
        this:ThrowInvalidState("ReadName", System.Array(System.Int32)(2 --[[BsonReaderState.Name]]))
      end

      this:setCurrentName(nameDecoder:Decode(this._bsonStream, this._settings:getEncoding()))
      this:setState(3 --[[BsonReaderState.Value]])

      if this._context:getContextType() == 1 --[[ContextType.Document]] then
        this._context:setCurrentElementName(this:getCurrentName())
      end

      return this:getCurrentName()
    end
    -- <summary>
    -- Reads a BSON null from the reader.
    -- </summary>
    ReadNull = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadNull", 10 --[[BsonType.Null]])
      this:setState(GetNextState(this))
    end
    -- <summary>
    -- Reads a BSON ObjectId from the reader.
    -- </summary>
    ReadObjectId = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadObjectId", 7 --[[BsonType.ObjectId]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadObjectId()
    end
    -- <summary>
    -- Reads a raw BSON array.
    -- </summary>
    -- The raw BSON array.
    -- </returns>
    ReadRawBsonArray = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadRawBsonArray", 4 --[[BsonType.Array]])

      local slice = this._bsonStream:ReadSlice()

      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(0 --[[BsonReaderState.Initial]])
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1

      return slice
    end
    -- <summary>
    -- Reads a raw BSON document.
    -- </summary>
    -- The raw BSON document.
    -- </returns>
    ReadRawBsonDocument = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadRawBsonDocument", 3 --[[BsonType.Document]])

      local slice = this._bsonStream:ReadSlice()

      if this._context:getContextType() == 3 --[[ContextType.JavaScriptWithScope]] then
        this._context = this._context:PopContext(this._bsonStream:getPosition())
        -- JavaScriptWithScope
      end
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(0 --[[BsonReaderState.Initial]])
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1

      return slice
    end
    -- <summary>
    -- Reads a BSON regular expression from the reader.
    -- </summary>
    ReadRegularExpression = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadRegularExpression", 11 --[[BsonType.RegularExpression]])
      this:setState(GetNextState(this))
      local pattern = this._bsonStream:ReadCString(this._settings:getEncoding())
      local options = this._bsonStream:ReadCString(this._settings:getEncoding())
      return System.new(MongoDBBson.BsonRegularExpression, 2, pattern, options)
    end
    -- <summary>
    -- Reads the start of a BSON array.
    -- </summary>
    ReadStartArray = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadStartArray", 4 --[[BsonType.Array]])

      local startPosition = this._bsonStream:getPosition()
      -- position of size field
      local size = ReadSize(this)
      this._context = MongoDBBsonIO.BsonBinaryReaderContext(this._context, 2 --[[ContextType.Array]], startPosition, size)
      this:setState(1 --[[BsonReaderState.Type]])
    end
    -- <summary>
    -- Reads the start of a BSON document.
    -- </summary>
    ReadStartDocument = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadStartDocument", 3 --[[BsonType.Document]])

      local contextType = (this:getState() == 4 --[[BsonReaderState.ScopeDocument]]) and 4 --[[ContextType.ScopeDocument]] or 1 --[[ContextType.Document]]
      local startPosition = this._bsonStream:getPosition()
      -- position of size field
      local size = ReadSize(this)
      this._context = MongoDBBsonIO.BsonBinaryReaderContext(this._context, contextType, startPosition, size)
      this:setState(1 --[[BsonReaderState.Type]])
    end
    -- <summary>
    -- Reads a BSON string from the reader.
    -- </summary>
    ReadString = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadString", 2 --[[BsonType.String]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadString(this._settings:getEncoding())
    end
    -- <summary>
    -- Reads a BSON symbol from the reader.
    -- </summary>
    ReadSymbol = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadSymbol", 14 --[[BsonType.Symbol]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadString(this._settings:getEncoding())
    end
    -- <summary>
    -- Reads a BSON timestamp from the reader.
    -- </summary>
    ReadTimestamp = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadTimestamp", 17 --[[BsonType.Timestamp]])
      this:setState(GetNextState(this))
      return this._bsonStream:ReadInt64()
    end
    -- <summary>
    -- Reads a BSON undefined from the reader.
    -- </summary>
    ReadUndefined = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadUndefined", 6 --[[BsonType.Undefined]])
      this:setState(GetNextState(this))
    end
    -- <summary>
    -- Returns the reader to previously bookmarked position and state.
    -- </summary>
    ReturnToBookmark = function (this, bookmark)
      local binaryReaderBookmark = System.cast(MongoDBBsonIO.BsonBinaryReaderBookmark, bookmark)
      this:setState(binaryReaderBookmark:getState())
      this:setCurrentBsonType(binaryReaderBookmark:getCurrentBsonType())
      this:setCurrentName(binaryReaderBookmark:getCurrentName())
      this._context = binaryReaderBookmark:CloneContext()
      this._bsonStream:setPosition(binaryReaderBookmark:getPosition())
    end
    -- <summary>
    -- Skips the name (reader must be positioned on a name).
    -- </summary>
    SkipName = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this:getState() ~= 2 --[[BsonReaderState.Name]] then
        this:ThrowInvalidState("SkipName", System.Array(System.Int32)(2 --[[BsonReaderState.Name]]))
      end

      this._bsonStream:SkipCString()
      this:setCurrentName(nil)
      this:setState(3 --[[BsonReaderState.Value]])

      if this._context:getContextType() == 1 --[[ContextType.Document]] then
        this._context:setCurrentElementName(this:getCurrentName())
      end
    end
    -- <summary>
    -- Skips the value (reader must be positioned on a value).
    -- </summary>
    SkipValue = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      if this:getState() ~= 3 --[[BsonReaderState.Value]] then
        this:ThrowInvalidState("SkipValue", System.Array(System.Int32)(3 --[[BsonReaderState.Value]]))
      end

      local skip
      repeat
        local default = this:getCurrentBsonType()
        if default == 4 --[[BsonType.Array]] then
          skip = ReadSize(this) - 4
          break
        elseif default == 5 --[[BsonType.Binary]] then
          skip = ReadSize(this) + 1
          break
        elseif default == 8 --[[BsonType.Boolean]] then
          skip = 1
          break
        elseif default == 9 --[[BsonType.DateTime]] then
          skip = 8
          break
        elseif default == 3 --[[BsonType.Document]] then
          skip = ReadSize(this) - 4
          break
        elseif default == 19 --[[BsonType.Decimal128]] then
          skip = 16
          break
        elseif default == 1 --[[BsonType.Double]] then
          skip = 8
          break
        elseif default == 16 --[[BsonType.Int32]] then
          skip = 4
          break
        elseif default == 18 --[[BsonType.Int64]] then
          skip = 8
          break
        elseif default == 13 --[[BsonType.JavaScript]] then
          skip = ReadSize(this)
          break
        elseif default == 15 --[[BsonType.JavaScriptWithScope]] then
          skip = ReadSize(this) - 4
          break
        elseif default == 127 --[[BsonType.MaxKey]] then
          skip = 0
          break
        elseif default == 255 --[[BsonType.MinKey]] then
          skip = 0
          break
        elseif default == 10 --[[BsonType.Null]] then
          skip = 0
          break
        elseif default == 7 --[[BsonType.ObjectId]] then
          skip = 12
          break
        elseif default == 11 --[[BsonType.RegularExpression]] then
          this._bsonStream:SkipCString()
          this._bsonStream:SkipCString()
          skip = 0
          break
        elseif default == 2 --[[BsonType.String]] then
          skip = ReadSize(this)
          break
        elseif default == 14 --[[BsonType.Symbol]] then
          skip = ReadSize(this)
          break
        elseif default == 17 --[[BsonType.Timestamp]] then
          skip = 8
          break
        elseif default == 6 --[[BsonType.Undefined]] then
          skip = 0
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected BsonType."))
        end
      until 1
      this._bsonStream:Seek(skip, 1 --[[SeekOrigin.Current]])

      this:setState(1 --[[BsonReaderState.Type]])
    end
    -- <summary>
    -- Disposes of any resources used by the reader.
    -- </summary>
    Dispose1 = function (this, disposing)
      -- don't Dispose the _stream because we don't own it
      if disposing then
        System.try(function ()
          this:Close()
        end, function (default)
        end)
        -- ignore exceptions
      end
      MongoDBBsonIO.BsonReader.Dispose1(this, disposing)
    end
    GenerateDottedElementName = function (this)
      local elementName
      if this._context:getContextType() == 1 --[[ContextType.Document]] then
        System.try(function ()
          elementName = this._bsonStream:ReadCString(MongoDBBsonIO.Utf8Encodings.getLenient())
        end, function (default)
          elementName = "?"
          -- ignore exception
        end)
      elseif this._context:getContextType() == 2 --[[ContextType.Array]] then
        elementName = this._context:getCurrentArrayIndex():ToString(SystemGlobalization.NumberFormatInfo.getInvariantInfo())
      else
        elementName = "?"
      end

      return GenerateDottedElementName1(this, this._context:getParentContext(), elementName)
    end
    GenerateDottedElementName1 = function (this, context, elementName)
      if context:getContextType() == 1 --[[ContextType.Document]] then
        return GenerateDottedElementName1(this, context:getParentContext(), (context:getCurrentElementName() or "?") .. "." .. elementName)
      elseif context:getContextType() == 2 --[[ContextType.Array]] then
        local indexElementName = context:getCurrentArrayIndex():ToString(SystemGlobalization.NumberFormatInfo.getInvariantInfo())
        return GenerateDottedElementName1(this, context:getParentContext(), indexElementName .. "." .. elementName)
      elseif context:getParentContext() ~= nil then
        return GenerateDottedElementName1(this, context:getParentContext(), "?." .. elementName)
      else
        return elementName
      end
    end
    GetNextState = function (this)
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] or default == 1 --[[ContextType.Document]] or default == 4 --[[ContextType.ScopeDocument]] then
          return 1 --[[BsonReaderState.Type]]
        elseif default == 0 --[[ContextType.TopLevel]] then
          return 0 --[[BsonReaderState.Initial]]
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1
    end
    ReadSize = function (this)
      local size = this._bsonStream:ReadInt32()
      if size < 0 then
        local message = System.String.Format("Size {0} is not valid because it is negative.", size)
        System.throw(System.FormatException(message))
      end
      if size > this._settings:getMaxDocumentSize() then
        local message = System.String.Format("Size {0} is not valid because it is larger than MaxDocumentSize {1}.", size, this._settings:getMaxDocumentSize())
        System.throw(System.FormatException(message))
      end
      return size
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.IO.BsonReader
        }
      end,
      getBaseStream = getBaseStream,
      getBsonStream = getBsonStream,
      Close = Close,
      GetBookmark = GetBookmark,
      IsAtEndOfFile = IsAtEndOfFile,
      ReadBinaryData = ReadBinaryData,
      ReadBoolean = ReadBoolean,
      ReadBsonType = ReadBsonType,
      ReadBytes = ReadBytes,
      ReadDateTime = ReadDateTime,
      ReadDecimal128 = ReadDecimal128,
      ReadDouble = ReadDouble,
      ReadEndArray = ReadEndArray,
      ReadEndDocument = ReadEndDocument,
      ReadInt32 = ReadInt32,
      ReadInt64 = ReadInt64,
      ReadJavaScript = ReadJavaScript,
      ReadJavaScriptWithScope = ReadJavaScriptWithScope,
      ReadMaxKey = ReadMaxKey,
      ReadMinKey = ReadMinKey,
      ReadName = ReadName,
      ReadNull = ReadNull,
      ReadObjectId = ReadObjectId,
      ReadRawBsonArray = ReadRawBsonArray,
      ReadRawBsonDocument = ReadRawBsonDocument,
      ReadRegularExpression = ReadRegularExpression,
      ReadStartArray = ReadStartArray,
      ReadStartDocument = ReadStartDocument,
      ReadString = ReadString,
      ReadSymbol = ReadSymbol,
      ReadTimestamp = ReadTimestamp,
      ReadUndefined = ReadUndefined,
      ReturnToBookmark = ReturnToBookmark,
      SkipName = SkipName,
      SkipValue = SkipValue,
      Dispose1 = Dispose1,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
  end)
end)
