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
local MongoDBBson
local MongoDBBsonIO
System.import(function (out)
  MongoDBBson = MongoDB.Bson
  MongoDBBsonIO = MongoDB.Bson.IO
end)
System.namespace("MongoDB.Bson.IO", function (namespace)
  -- <summary>
  -- Represents a BSON reader for a BsonDocument.
  -- </summary>
  namespace.class("BsonDocumentReader", function (namespace)
    local Close, GetBookmark, IsAtEndOfFile, ReadBinaryData, ReadBoolean, ReadBsonType, ReadBytes, ReadDateTime, 
    ReadDecimal128, ReadDouble, ReadEndArray, ReadEndDocument, ReadInt32, ReadInt64, ReadJavaScript, ReadJavaScriptWithScope, 
    ReadMaxKey, ReadMinKey, ReadName, ReadNull, ReadObjectId, ReadRegularExpression, ReadStartArray, ReadStartDocument, 
    ReadString, ReadSymbol, ReadTimestamp, ReadUndefined, ReturnToBookmark, SkipName, SkipValue, Dispose1, 
    GetNextState, __ctor1__, __ctor2__
    -- <summary>
    -- Initializes a new instance of the BsonDocumentReader class.
    -- </summary>
    __ctor1__ = function (this, document)
      __ctor2__(this, document, MongoDBBsonIO.BsonDocumentReaderSettings.getDefaults())
    end
    -- <summary>
    -- Initializes a new instance of the BsonDocumentReader class.
    -- </summary>
    -- <param name="settings">The reader settings.</param>
    __ctor2__ = function (this, document, settings)
      MongoDBBsonIO.BsonReader.__ctor__(this, settings)
      if MongoDBBson.BsonDocument.op_Equality1(document, nil) then
        System.throw(System.ArgumentNullException("document"))
      end

      this._context = System.new(MongoDBBsonIO.BsonDocumentReaderContext, 2, nil, 0 --[[ContextType.TopLevel]], document)
      this._currentValue = document
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
      return MongoDBBsonIO.BsonDocumentReaderBookmark(this:getState(), this:getCurrentBsonType(), this:getCurrentName(), this._context, this._currentValue)
    end
    -- <summary>
    -- Determines whether this reader is at end of file.
    -- </summary>
    -- Whether this reader is at end of file.
    -- </returns>
    IsAtEndOfFile = function (this)
      return this:getState() == 7 --[[BsonReaderState.Done]]
    end
    -- <summary>
    -- Reads BSON binary data from the reader.
    -- </summary>
    ReadBinaryData = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadBinaryData", 5 --[[BsonType.Binary]])

      this:setState(GetNextState(this))
      return this._currentValue:getAsBsonBinaryData()
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
      return this._currentValue:getAsBoolean()
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

      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          local extern
          extern, this._currentValue = this._context:TryGetNextValue()
          if not extern then
            this:setState(6 --[[BsonReaderState.EndOfArray]])
            return 0 --[[BsonType.EndOfDocument]]
          end
          this:setState(3 --[[BsonReaderState.Value]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          local currentElement
          local extern
          extern, currentElement = this._context:TryGetNextElement()
          if not extern then
            this:setState(5 --[[BsonReaderState.EndOfDocument]])
            return 0 --[[BsonType.EndOfDocument]]
          end
          this:setCurrentName(currentElement:getName())
          this._currentValue = currentElement:getValue()
          this:setState(2 --[[BsonReaderState.Name]])
          break
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Invalid ContextType."))
        end
      until 1

      this:setCurrentBsonType(this._currentValue:getBsonType())
      return this:getCurrentBsonType()
    end
    -- <summary>
    -- Reads BSON binary data from the reader.
    -- </summary>
    ReadBytes = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadBytes", 5 --[[BsonType.Binary]])

      this:setState(GetNextState(this))
      local binaryData = this._currentValue:getAsBsonBinaryData()

      local subType = binaryData:getSubType()
      if subType ~= 0 --[[BsonBinarySubType.Binary]] and subType ~= 2 --[[BsonBinarySubType.OldBinary]] then
        local message = System.String.Format("ReadBytes requires the binary sub type to be Binary, not {0}.", subType)
        System.throw(System.FormatException(message))
      end

      return binaryData:getBytes()
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
      return this._currentValue:getAsBsonDateTime():getMillisecondsSinceEpoch()
    end
    ReadDecimal128 = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadDecimal128" --[[nameof(ReadDecimal128)]], 19 --[[BsonType.Decimal128]])
      this:setState(GetNextState(this))
      return this._currentValue:getAsDecimal128()
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
      return this._currentValue:getAsDouble()
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

      this._context = this._context:PopContext()
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(7 --[[BsonReaderState.Done]])
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

      this._context = this._context:PopContext()
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 1 --[[ContextType.Document]] then
          this:setState(1 --[[BsonReaderState.Type]])
          break
        elseif default == 0 --[[ContextType.TopLevel]] then
          this:setState(7 --[[BsonReaderState.Done]])
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
      return this._currentValue:getAsInt32()
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
      return this._currentValue:getAsInt64()
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
      return this._currentValue:getAsBsonJavaScript():getCode()
    end
    -- <summary>
    -- Reads a BSON JavaScript with scope from the reader (call ReadStartDocument next to read the scope).
    -- </summary>
    ReadJavaScriptWithScope = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadJavaScriptWithScope", 15 --[[BsonType.JavaScriptWithScope]])

      this:setState(4 --[[BsonReaderState.ScopeDocument]])
      return this._currentValue:getAsBsonJavaScriptWithScope():getCode()
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
    -- <returns>
    -- The name of the element.
    -- </returns>
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

      nameDecoder:Inform(this:getCurrentName())
      this:setState(3 --[[BsonReaderState.Value]])
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
      return this._currentValue:getAsObjectId()
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
      return this._currentValue:getAsBsonRegularExpression()
    end
    -- <summary>
    -- Reads the start of a BSON array.
    -- </summary>
    ReadStartArray = function (this)
      if this:getDisposed() then
        this:ThrowObjectDisposedException()
      end
      this:VerifyBsonType("ReadStartArray", 4 --[[BsonType.Array]])

      local array = this._currentValue:getAsBsonArray()
      this._context = MongoDBBsonIO.BsonDocumentReaderContext(this._context, 2 --[[ContextType.Array]], array)
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

      local document
      local script = System.as(this._currentValue, MongoDBBson.BsonJavaScriptWithScope)
      if MongoDBBson.BsonJavaScriptWithScope.op_Inequality2(script, nil) then
        document = script:getScope()
      else
        document = this._currentValue:getAsBsonDocument()
      end
      this._context = System.new(MongoDBBsonIO.BsonDocumentReaderContext, 2, this._context, 1 --[[ContextType.Document]], document)
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
      return this._currentValue:getAsString()
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
      return this._currentValue:getAsBsonSymbol():getName()
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
      return this._currentValue:getAsBsonTimestamp():getValue()
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
      local documentReaderBookmark = System.cast(MongoDBBsonIO.BsonDocumentReaderBookmark, bookmark)
      this:setState(documentReaderBookmark:getState())
      this:setCurrentBsonType(documentReaderBookmark:getCurrentBsonType())
      this:setCurrentName(documentReaderBookmark:getCurrentName())
      this._context = documentReaderBookmark:CloneContext()
      this._currentValue = documentReaderBookmark:getCurrentValue()
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

      this:setState(3 --[[BsonReaderState.Value]])
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
      this:setState(1 --[[BsonReaderState.Type]])
    end
    -- <summary>
    -- Disposes of any resources used by the reader.
    -- </summary>
    Dispose1 = function (this, disposing)
      if disposing then
        System.try(function ()
          this:Close()
        end, function (default)
        end)
        -- ignore exceptions
      end
      MongoDBBsonIO.BsonReader.Dispose1(this, disposing)
    end
    GetNextState = function (this)
      repeat
        local default = this._context:getContextType()
        if default == 2 --[[ContextType.Array]] or default == 1 --[[ContextType.Document]] then
          return 1 --[[BsonReaderState.Type]]
        elseif default == 0 --[[ContextType.TopLevel]] then
          return 7 --[[BsonReaderState.Done]]
        else
          System.throw(System.new(MongoDBBson.BsonInternalException, 2, "Unexpected ContextType."))
        end
      until 1
    end
    return {
      base = function (out)
        return {
          out.MongoDB.Bson.IO.BsonReader
        }
      end,
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
