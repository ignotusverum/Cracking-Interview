# Hash Table

A hash table allows you to store and retrieve objects by a "key".

A hash table is used to implement structures, such as a dictionary, a map, and an associative array. These structures can be implemented by a tree or a plain array, but it is efficient to use a hash table.

This should explain why Swift's built-in `Dictionary` type requires that keys conform to the `Hashable` protocol: internally it uses a hash table, like the one you will learn about here.

## How it works

A hash table is nothing more than an array. Initially, this array is empty. When you put a value into the hash table under a certain key, it uses that key to calculate an index in the array. Here is an example:

```swift
hashTable["firstName"] = "Steve"

	The hashTable array:
	+--------------+
	| 0:           |
	+--------------+
	| 1:           |
	+--------------+
	| 2:           |
	+--------------+
	| 3: firstName |---> Steve
	+--------------+
	| 4:           |
	+--------------+
```

In this example, the key `"firstName"` maps to array index 3.

Adding a value under a different key puts it at another array index:

```swift
hashTable["hobbies"] = "Programming Swift"

	The hashTable array:
	+--------------+
	| 0:           |
	+--------------+
	| 1: hobbies   |---> Programming Swift
	+--------------+
	| 2:           |
	+--------------+
	| 3: firstName |---> Steve
	+--------------+
	| 4:           |
	+--------------+
```

The trick is how the hash table calculates those array indices. That is where the hashing comes in. When you write the following statement,

```swift
hashTable["firstName"] = "Steve"
```

the hash table takes the key `"firstName"` and asks it for its `hashValue` property. Hence, keys must be `Hashable`.

When you write `"firstName".hashValue`, it returns a big integer: -4799450059917011053. Likewise, `"hobbies".hashValue` has the hash value 4799450060928805186. (The values you see may vary.)

These numbers are big to be used as indices into our array, and one of them is even negative! A common way to make these big numbers  suitable is to first make the hash positive and then take the modulo with the array size.

Our array has size 5, so the index for the `"firstName"` key becomes `abs(-4799450059917011053) % 5 = 3`. You can calculate that the array index for `"hobbies"` is 1.

Using hashes in this manner is what makes the dictionary efficient: to find an element in the hash table, you must hash the key to get an array index and then look up the element in the underlying array. All these operations take a constant amount of time, so inserting, retrieving, and removing are all **O(1)**.

> **Note:** It is difficult to predict where in the array your objects end up. Hence, dictionaries do not guarantee any particular order of the elements in the hash table.

## Avoiding collisions

There is one problem: because we take the modulo of the hash value with the size of the array, it can happen that two or more keys get assigned the same array index. This is called a collision.

One way to avoid collisions is to have a large array which reduces the likelihood of two keys mapping to the same index. Another trick is to use a prime number for the array size. However, collisions are bound to occur, so you need to find a way to handle them.

Because our table is small, it is easy to show a collision. For example, the array index for the key `"lastName"` is also 3, but we do not want to overwrite the value that is already at this array index.

A common way to handle collisions is to use chaining. The array looks as follows:

```swift
	buckets:
	+-----+
	|  0  |
	+-----+     +----------------------------+
	|  1  |---> | hobbies: Programming Swift |
	+-----+     +----------------------------+
	|  2  |
	+-----+     +------------------+     +----------------+
	|  3  |---> | firstName: Steve |---> | lastName: Jobs |
	+-----+     +------------------+     +----------------+
	|  4  |
	+-----+
```

With chaining, keys and their values are not stored directly in the array. Instead, each array element is a list of zero or more key/value pairs. The array elements are usually called the *buckets* and the lists are called the *chains*. Here we have 5 buckets, and two of these buckets have chains. The other three buckets are empty.

If we write the following statement to retrieve an item from the hash table,

```swift
let x = hashTable["lastName"]
```

it first hashes the key `"lastName"` to calculate the array index, which is 3. Since bucket 3 has a chain, we step through the list to find the value with the key `"lastName"`. This is done by comparing the keys using a string comparison. The hash table checks that the key belongs to the last item in the chain and returns the corresponding value, `"Jobs"`.

Common ways to implement this chaining mechanism are to use a linked list or another array. Since the order of the items in the chain does not matter, you can think of it as a set instead of a list. (Now you can also imagine where the term "bucket" comes from; we just dump all the objects together into the bucket.)

Chains should not become long because the slow process of looking up items in the hash table. Ideally, we would have no chains at all, but in practice it is impossible to avoid collisions. You can improve the odds by giving the hash table enough buckets using high-quality hash functions.

> **Note:** An alternative to chaining is "open addressing". The idea is this: if an array index is already taken, we put the element in the next unused bucket. This approach has its own upsides and downsides.


Source: https://github.com/raywenderlich/swift-algorithm-club/edit/master/Hash%20Table/README.markdown