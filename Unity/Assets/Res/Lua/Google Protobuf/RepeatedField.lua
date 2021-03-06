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
local GoogleProtobuf
System.import(function (out)
  GoogleProtobuf = Google.Protobuf
end)
System.namespace("Google.Protobuf.Collections", function (namespace)
  -- <summary>
  -- The contents of a repeated field: essentially, a collection with some extra
  -- restrictions (no null values) and capabilities (deep cloning).
  -- </summary>
  -- This implementation does not generally prohibit the use of types which are not
  -- supported by Protocol Buffers but nor does it guarantee that all operations will work in such cases.
  -- </remarks>
  -- <typeparam name="T">The element type of the repeated field.</typeparam>
  namespace.class("RepeatedField_1", function (namespace)
    return function (T)
      local EmptyArray, AddEntriesFrom, CalculateSize, CalculatePackedDataSize, WriteTo, EnsureSize, Add, Clear, 
      Contains, CopyTo, Remove, getCount, getIsReadOnly, AddRange, Add2, GetEnumerator, 
      EqualsObj, GetEnumerator1, GetHashCode, Equals, IndexOf, Insert, RemoveAt, get, 
      set, getIsFixedSize, CopyTo1, getIsSynchronized, getSyncRoot, get1, set1, Add1, 
      Contains1, IndexOf1, Insert1, Remove1, class, static, __ctor__
      local ArrayT = System.Array(T)
      local FieldCodec_1T = Google.Protobuf.FieldCodec_1(T)
      local IEnumerable_1T = System.IEnumerable_1(T)
      local EqualityComparerT = System.EqualityComparer(T)
      static = function (this)
        EmptyArray = ArrayT:new(0)
      end
      __ctor__ = function (this)
        this.array = EmptyArray
      end
      -- <summary>
      -- Adds the entries from the given input stream, decoding them with the specified codec.
      -- </summary>
      -- <param name="codec">The codec to use in order to read each entry.</param>
      AddEntriesFrom = function (this, input, codec)
        -- TODO: Inline some of the Add code, so we can avoid checking the size on every
        -- iteration.
        local tag = input:getLastTag()
        local reader = codec.ValueReader
        -- Non-nullable value types can be packed or not.
        if FieldCodec_1T.IsPackedRepeatedField(tag) then
          local length = input:ReadLength()
          if length > 0 then
            local oldLimit = input:PushLimit(length)
            while not input:getReachedLimit() do
              Add(this, reader(input, T))
            end
            input:PopLimit(oldLimit)
          end
          -- Empty packed field. Odd, but valid - just ignore.
        else
          -- Not packed... (possibly not packable)
          repeat
            Add(this, reader(input, T))
          until not input:MaybeConsumeTag(tag)
        end
      end
      -- <summary>
      -- Calculates the size of this collection based on the given codec.
      -- </summary>
      -- <returns>The number of bytes that would be written to a <see cref="CodedOutputStream"/> by <see cref="WriteTo"/>,
      -- using the same codec.</returns>
      CalculateSize = function (this, codec)
        if this.count == 0 then
          return 0
        end
        local tag = codec.Tag
        if codec.PackedRepeatedField then
          local dataSize = CalculatePackedDataSize(this, codec)
          return GoogleProtobuf.CodedOutputStream.ComputeRawVarint32Size(tag) + GoogleProtobuf.CodedOutputStream.ComputeLengthSize(dataSize) + dataSize
        else
          local sizeCalculator = codec.ValueSizeCalculator
          local size = this.count * GoogleProtobuf.CodedOutputStream.ComputeRawVarint32Size(tag)
          do
            local i = 0
            while i < this.count do
              size = size + sizeCalculator(this.array:get(i), T)
              i = i + 1
            end
          end
          return size
        end
      end
      CalculatePackedDataSize = function (this, codec)
        local fixedSize = codec.FixedSize
        if fixedSize == 0 then
          local calculator = codec.ValueSizeCalculator
          local tmp = 0
          do
            local i = 0
            while i < this.count do
              tmp = tmp + calculator(this.array:get(i), T)
              i = i + 1
            end
          end
          return tmp
        else
          return fixedSize * getCount(this)
        end
      end
      -- <summary>
      -- Writes the contents of this collection to the given <see cref="CodedOutputStream"/>,
      -- encoding each value using the specified codec.
      -- </summary>
      -- <param name="codec">The codec to use when encoding each value.</param>
      WriteTo = function (this, output, codec)
        if this.count == 0 then
          return
        end
        local writer = codec.ValueWriter
        local tag = codec.Tag
        if codec.PackedRepeatedField then
          -- Packed primitive type
          local size = System.toUInt32(CalculatePackedDataSize(this, codec))
          output:WriteTag1(tag)
          output:WriteRawVarint32(size)
          do
            local i = 0
            while i < this.count do
              writer(output, this.array:get(i), T)
              i = i + 1
            end
          end
        else
          -- Not packed: a simple tag/value pair for each value.
          -- Can't use codec.WriteTagAndValue, as that omits default values.
          do
            local i = 0
            while i < this.count do
              output:WriteTag1(tag)
              writer(output, this.array:get(i), T)
              i = i + 1
            end
          end
        end
      end
      EnsureSize = function (this, size)
        if #this.array < size then
          size = math.Max(size, 8 --[[RepeatedField.MinArraySize]])
          local newSize = math.Max(#this.array * 2, size)
          local tmp = ArrayT:new(newSize)
          System.Array.Copy(this.array, 0, tmp, 0, #this.array)
          this.array = tmp
        end
      end
      -- <summary>
      -- Adds the specified item to the collection.
      -- </summary>
      Add = function (this, item)
        GoogleProtobuf.ProtoPreconditions.CheckNotNullUnconstrained(item, "item", T)
        EnsureSize(this, this.count + 1)
        local default = this.count
        this.count = default + 1
        this.array:set(default, item)
      end
      -- <summary>
      -- Removes all items from the collection.
      -- </summary>
      Clear = function (this)
        -- ET修改，这里不释放数组，避免gc
        --array = EmptyArray;
        this.count = 0
      end
      -- <summary>
      -- Determines whether this collection contains the given item.
      -- </summary>
      -- <returns><c>true</c> if this collection contains the given item; <c>false</c> otherwise.</returns>
      Contains = function (this, item)
        return IndexOf(this, item) ~= - 1
      end
      -- <summary>
      -- Copies this collection to the given array.
      -- </summary>
      -- <param name="arrayIndex">The first index of the array to copy to.</param>
      CopyTo = function (this, array, arrayIndex)
        System.Array.Copy(this.array, 0, array, arrayIndex, this.count)
      end
      -- <summary>
      -- Removes the specified item from the collection
      -- </summary>
      -- <returns><c>true</c> if the item was found and removed; <c>false</c> otherwise.</returns>
      Remove = function (this, item)
        local index = IndexOf(this, item)
        if index == - 1 then
          return false
        end
        System.Array.Copy(this.array, index + 1, this.array, index, this.count - index - 1)
        this.count = this.count - 1
        this.array:set(this.count, System.default(T))
        return true
      end
      getCount = function (this)
        return this.count
      end
      getIsReadOnly = function (this)
        return false
      end
      -- <summary>
      -- Adds all of the specified values into this collection.
      -- </summary>
      AddRange = function (this, values)
        GoogleProtobuf.ProtoPreconditions.CheckNotNull(values, "values", IEnumerable_1T)

        -- Optimization 1: If the collection we're adding is already a RepeatedField<T>,
        -- we know the values are valid.
        local otherRepeatedField = System.as(values, class)
        if otherRepeatedField ~= nil then
          EnsureSize(this, this.count + otherRepeatedField.count)
          System.Array.Copy(otherRepeatedField.array, 0, this.array, this.count, otherRepeatedField.count)
          this.count = this.count + otherRepeatedField.count
          return
        end

        -- Optimization 2: The collection is an ICollection, so we can expand
        -- just once and ask the collection to copy itself into the array.
        local collection = System.as(values, System.ICollection)
        if collection ~= nil then
          local extraCount = collection:getCount()
          -- For reference types and nullable value types, we need to check that there are no nulls
          -- present. (This isn't a thread-safe approach, but we don't advertise this is thread-safe.)
          -- We expect the JITter to optimize this test to true/false, so it's effectively conditional
          -- specialization.
          if System.default(T) == nil then
            -- TODO: Measure whether iterating once to check and then letting the collection copy
            -- itself is faster or slower than iterating and adding as we go. For large
            -- collections this will not be great in terms of cache usage... but the optimized
            -- copy may be significantly faster than doing it one at a time.
            for _, item in System.each(collection) do
              if item == nil then
                System.throw(System.ArgumentException("Sequence contained null element", "values"))
              end
            end
          end
          EnsureSize(this, this.count + extraCount)
          collection:CopyTo(this.array, this.count)
          this.count = this.count + extraCount
          return
        end

        -- We *could* check for ICollection<T> as well, but very very few collections implement
        -- ICollection<T> but not ICollection. (HashSet<T> does, for one...)

        -- Fall back to a slower path of adding items one at a time.
        for _, item in System.each(values) do
          Add(this, item)
        end
      end
      -- <summary>
      -- Adds all of the specified values into this collection. This method is present to
      -- allow repeated fields to be constructed from queries within collection initializers.
      -- Within non-collection-initializer code, consider using the equivalent <see cref="AddRange"/>
      -- method instead for clarity.
      -- </summary>
      Add2 = function (this, values)
        AddRange(this, values)
      end
      -- <summary>
      -- Returns an enumerator that iterates through the collection.
      -- </summary>
      -- An enumerator that can be used to iterate through the collection.
      -- </returns>
      GetEnumerator = function (this)
        return System.yieldIEnumerator(function (this)
          do
            local i = 0
            while i < this.count do
              System.yield(this.array:get(i))
              i = i + 1
            end
          end
        end, T, this)
      end
      -- <summary>
      -- Determines whether the specified <see cref="System.Object" />, is equal to this instance.
      -- </summary>
      -- <returns>
      -- <c>true</c> if the specified <see cref="System.Object" /> is equal to this instance; otherwise, <c>false</c>.
      -- </returns>
      EqualsObj = function (this, obj)
        return Equals(this, System.as(obj, class))
      end
      -- <summary>
      -- Returns an enumerator that iterates through a collection.
      -- </summary>
      -- An <see cref="T:System.Collections.IEnumerator" /> object that can be used to iterate through the collection.
      -- </returns>
      GetEnumerator1 = function (this)
        return GetEnumerator(this)
      end
      -- <summary>
      -- Returns a hash code for this instance.
      -- </summary>
      -- A hash code for this instance, suitable for use in hashing algorithms and data structures like a hash table.
      -- </returns>
      GetHashCode = function (this)
        local hash = 0
        do
          local i = 0
          while i < this.count do
            hash = hash * 31 + this.array:get(i):GetHashCode()
            i = i + 1
          end
        end
        return hash
      end
      -- <summary>
      -- Compares this repeated field with another for equality.
      -- </summary>
      -- <returns><c>true</c> if <paramref name="other"/> refers to an equal repeated field; <c>false</c> otherwise.</returns>
      Equals = function (this, other)
        if System.Object.ReferenceEquals(other) then
          return false
        end
        if System.Object.ReferenceEquals(other, this) then
          return true
        end
        if getCount(other) ~= getCount(this) then
          return false
        end
        local comparer = EqualityComparerT.getDefault()
        do
          local i = 0
          while i < this.count do
            if not comparer:EqualsOf(this.array:get(i), other.array:get(i)) then
              return false
            end
            i = i + 1
          end
        end
        return true
      end
      -- <summary>
      -- Returns the index of the given item within the collection, or -1 if the item is not
      -- present.
      -- </summary>
      -- <returns>The zero-based index of the item, or -1 if it is not found.</returns>
      IndexOf = function (this, item)
        GoogleProtobuf.ProtoPreconditions.CheckNotNullUnconstrained(item, "item", T)
        local comparer = EqualityComparerT.getDefault()
        do
          local i = 0
          while i < this.count do
            if comparer:EqualsOf(this.array:get(i), item) then
              return i
            end
            i = i + 1
          end
        end
        return - 1
      end
      -- <summary>
      -- Inserts the given item at the specified index.
      -- </summary>
      -- <param name="item">The item to insert.</param>
      Insert = function (this, index, item)
        GoogleProtobuf.ProtoPreconditions.CheckNotNullUnconstrained(item, "item", T)
        if index < 0 or index > this.count then
          System.throw(System.ArgumentOutOfRangeException("index"))
        end
        EnsureSize(this, this.count + 1)
        System.Array.Copy(this.array, index, this.array, index + 1, this.count - index)
        this.array:set(index, item)
        this.count = this.count + 1
      end
      -- <summary>
      -- Removes the item at the given index.
      -- </summary>
      RemoveAt = function (this, index)
        if index < 0 or index >= this.count then
          System.throw(System.ArgumentOutOfRangeException("index"))
        end
        System.Array.Copy(this.array, index + 1, this.array, index, this.count - index - 1)
        this.count = this.count - 1
        this.array:set(this.count, System.default(T))
      end
      get = function (this, index)
        if index < 0 or index >= this.count then
          System.throw(System.ArgumentOutOfRangeException("index"))
        end
        return this.array:get(index)
      end
      set = function (this, index, value)
        if index < 0 or index >= this.count then
          System.throw(System.ArgumentOutOfRangeException("index"))
        end
        GoogleProtobuf.ProtoPreconditions.CheckNotNullUnconstrained(value, "value", T)
        this.array:set(index, value)
      end
      getIsFixedSize = function (this)
        return false
      end
      CopyTo1 = function (this, array, index)
        System.Array.Copy(this.array, 0, array, index, this.count)
      end
      getIsSynchronized = function (this)
        return false
      end
      getSyncRoot = function (this)
        return this
      end
      get1 = function (this, index)
        return this:get(index)
      end
      set1 = function (this, index, value)
        this:set(index, System.cast(T, value))
      end
      Add1 = function (this, value)
        Add(this, System.cast(T, value))
        return this.count - 1
      end
      Contains1 = function (this, value)
        return (System.is(value, T) and Contains(this, System.cast(T, value)))
      end
      IndexOf1 = function (this, value)
        if not (System.is(value, T)) then
          return - 1
        end
        return IndexOf(this, System.cast(T, value))
      end
      Insert1 = function (this, index, value)
        Insert(this, index, System.cast(T, value))
      end
      Remove1 = function (this, value)
        if not (System.is(value, T)) then
          return
        end
        Remove(this, System.cast(T, value))
      end
      class = {
        __genericT__ = T,
        base = function (out)
          return {
            System.IList_1(T),
            System.IList
          }
        end,
        count = 0,
        AddEntriesFrom = AddEntriesFrom,
        CalculateSize = CalculateSize,
        WriteTo = WriteTo,
        Add = Add,
        Clear = Clear,
        Contains = Contains,
        CopyTo = CopyTo,
        Remove = Remove,
        getCount = getCount,
        getIsReadOnly = getIsReadOnly,
        AddRange = AddRange,
        Add2 = Add2,
        GetEnumerator = GetEnumerator,
        EqualsObj = EqualsObj,
        GetEnumerator1 = GetEnumerator1,
        GetHashCode = GetHashCode,
        Equals = Equals,
        IndexOf = IndexOf,
        Insert = Insert,
        RemoveAt = RemoveAt,
        get = get,
        set = set,
        getIsFixedSize = getIsFixedSize,
        CopyTo1 = CopyTo1,
        getIsSynchronized = getIsSynchronized,
        getSyncRoot = getSyncRoot,
        Add1 = Add1,
        Contains1 = Contains1,
        IndexOf1 = IndexOf1,
        Insert1 = Insert1,
        Remove1 = Remove1,
        static = static,
        __ctor__ = __ctor__
      }
      return class
    end
  end)
end)
