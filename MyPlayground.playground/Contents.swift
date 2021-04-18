// this is a comment
// everything after \ helps us in running the actual mathematical code.
// this is called String interpolation  
print("Hello \(2+3) world")

var a = 5
var b = 8

print("the value of a is \(a)")
print(b)
 
var numbers = [45, 73, 109, 53 ]

var computedNumbers = [numbers[0] * numbers[1] , numbers[1] * numbers[2]]

print(computedNumbers)


// the less than sign mean to not include the upper bound number , i.e., 3 in this case
let randomNumber = Int.random(in: 1 ..< 3)

let randomNumber2 = Float.random(in: 1 ..< 3)


func greeting() {
    for _ in 0...3 {
        print("hello")
    }
    
    // we can write function inside function too
    func greeting2() {
        print("hey")
    }
    
    greeting2()
}

greeting()

// the following variable myAge automatically infers the type based on the value
// this is called Type Inference
var myAge = 12
myAge = 13

var testString: String = "Three"

func greeting2(whoToGreet: String) {
    print("hello \(whoToGreet)")
}

greeting2(whoToGreet: "Arnav")

// closed range -> a...b (between a and b)
// half open range -> a..<b (between a and b-1 )
// one sided range -> ...b (upto b)
// The above can be used as cases inside a switch statement

// example of how to use dictionary in swift
var stocks : [String: Int] = ["A": 10, "B": 20]
print(stocks["A"]!)


// example of how to use structures
struct Town {
    // these are called as properties
    let name = "Angeland"
    var citizens = ["angela", "jack"]
    var resources = ["Grain": 100, "Ore": 42, "Wool": 75] // This is a dictionary
    
    // these are called methods
    func fortify() {
        print("Defences increased!")
    }
}

var myTown = Town()
print(myTown.name)
print("\(myTown.name) has \(myTown.resources["Grain"]!) bags of grain")

myTown.citizens.append("Keanu Reeves")
print(myTown.citizens.count)

myTown.fortify()

struct Town2 {
    // these are called as properties
    let name : String
    var citizens : [String]
    // the following is called a dictionary
    var resources : [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        // self basically is equivalent to this in java
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    // these are called methods
    func fortify() {
        print("Defences increased!")
    }
    
    // if there is some method within the struct that is modifying the property of the struct then we
    // have to mark the method as mutating.
    // As doing so, it will make self behave as var and then we can change any such property
    mutating func harvestRice() {
        resources["Rice"] = 100
    }
}

var anotherTown = Town2(name: "Nameless Island", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])
print(anotherTown.citizens)

anotherTown.citizens.append("Random guy")
print(anotherTown.citizens)

// This works ONLY because that anotherTown is declared as var and not as let.
print(anotherTown.harvestRice())


// Closures example

import UIKit

func calculator(n1: Int, n2:Int,operation: (Int, Int) -> Int) -> Int{
    return operation(n1, n2)
}

// The following function has a syntax like the following:
// (Int, Int) -> Int
func add(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

func multiply(no1: Int, no2: Int) -> Int {
    return no1 * no2
}

print(calculator(n1: 2, n2: 3, operation: add))
print(calculator(n1: 2, n2: 3, operation: multiply))

// passing the actual closure as a param
calculator(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

// $0 means the 1st parameter and $1 means the 2nd parameter
// if the last param is a closure, then we can simply remove the last operation name
print(calculator(n1: 4, n2: 3 ) { $0 * $1 })

let array = [1,2,3,4,5,6]

func addOne(n1: Int) -> Int {
    return n1+1
}

array.map(addOne)
// doing the same thing with closures
array.map{ $0 + 1 }


//extensions example 1
import UIKit

var myDouble = 3.14159

let myRoundedDouble = String(format: "%.1f", myDouble)
print(myRoundedDouble)

extension Double {
    // this is an extension method to an already existing function but has different arguments to it
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}
print(myDouble.round(to: 3))

// extensions example 2
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red
extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
button.makeCircular()


//-------------------LOOPS-------------------
// _ (underscore) is used when we dont want any variable name as no variable is requried inside the loop
for _ in 1...5 {
    print("Hello")
}

for no in 1..<5 {
    print(no)
}

var a1 = 1
var b1 = 5
while a1 < b1 {
    print("hello")
    a1 = a1 + 1
}


