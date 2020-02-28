import UIKit

// MARK: - Declarations, Data Types

let number: Int = 5																	// declaration with type annotation
let name = "Matt"																		// declaration without type annotation

var volume = 10
volume = 20																					// variables can be mutated
let perfectScore = 100
//perfectScore = 50																	// error: constants can't be mutated
//volume = "Matt"																		// error: can't assign string to int type

var integer: Int = 1																// positive integer
integer = -3																				// negative integer
integer =	0xff0000																	// hexadecimal
integer = 0b1101																		// binary
integer = 0o12																			// octal

var double = 3.14159265359													// positive
double = -0.33333																		// negative
double = 1.1e4																			// exponent notation
double = 6.62607004e-34															// exponent notation

let isTrue: Bool = true															// booleans
let isFalse = false

let string: String = "Hello world! 😁"							// string literals can have emojis
let char: Character = "c"
let emoji: Character = "❤️"													// emojis are valid chars
let 🐷 = "pig"																			// emojis can be used as constant names

var anyVar: Any = 1																	// the Any type accepts any type
anyVar = "Now it's a string"
anyVar = false

var anyObject: AnyObject = UILabel()								// AnyObject accepts instances of classes
anyObject = BlockOperation()

anyVar = UILabel()																	// Any can hold objects
//anyObject = 5																			// AnyObject can't hold non-objects

// MARK: - Arrays

var integers = [-2, 0, 1, 5, 10]
integers[0] // -2
integers.count
integers[0] = -4
integers.append(12)
//integers.append(3.14159265359)										// COMPILE ERROR

integers = []
var newArray = [String]()
let randomArray: [Any] = [1, 0.3333, true, "Matt", [1, 3.1415, "Quiros"]]

// MARK: - Dictionaries

var user: [String : String] = [
	"email": "matt@email.com",
	"password": "pass1234"
]
user["email"] = "bogus@email.com"
user = [:]
var emptyDictionary = [Int : String]()

let badJson: [AnyHashable : Any] = [
	"key" : "value",
	1 : true,
	5.5555 : ["Hello", false, -3.33]
]
badJson

// MARK: - Sets

var starks: Set<String> = ["Robb", "Sansa", "Bran", "Arya", "Rickon"]
starks.contains("Jon")
starks.insert("Jon")
starks = []
starks.count

// MARK: - Tuples

// Labelled elements
let httpResponse = (statusCode: 404, message: "Page not found")
httpResponse.statusCode
httpResponse.message

// Access by index
let httpResponse2 = (200, "Success")
httpResponse.0
httpResponse.1

// Tuple decomposition
let (statusCode, message) = (500, "Internal server error")
statusCode
message

// MARK: - Conditionals

let grade = Int.random(in: 0...100)
if grade < 80 {																			// braces are required even for one-line ifs
	print("Failed")
} else if grade < 100 {
	print("Passed")
} else {
	print("Excellent!")
}

// MARK: - Optionals

var objectId: Int?																	// Use the question mark to make an optional type
if objectId != nil {																// Optionals can be used in equality checks against nil
	// do something
}

// Forced unwrapping
var someInt: Int?
if someInt != nil {
	print("someInt is \(someInt!)")
}

// Optional chaining
var users: [String]?
print(users?.count)
users = ["Me"]
print(users?.count) // Optional("1")

// Optional binding
if let objectId = objectId {
	print(objectId)
	// do something else with objectId
}

let userJson: [String : Any] = [
	"images" : [
		"sm" : "https://dummyimage.url/sm",
		"lg" : "https://dummyimage.url/lg"
	]
]

// Using if-let
if let images = userJson["images"] as? [String : String],
	   let largeImage = images["lg"] {
	   print(largeImage) // largeImage accessible only inside if-let block
}

// Using guard block ("early exit")
func someFunc() {
	guard let images = userJson["images"] as? [String : String],
		let largeImage = images["lg"]
		else {
			return
	}
	print(largeImage) // largeImage accessible outside the guard block
}

// Nil-coalescing operator
var members: [String]?
let numberOfMembers = members?.count ?? 0

// Implicitly unwrapped optionals
var database: [Int : String]!

if database == nil {
	print("database is nil")
}

if let database = database {
	// do something ...
}

let itemId = 1101
database[itemId]
