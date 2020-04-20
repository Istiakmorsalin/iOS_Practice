let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John"
let informalGreeting = "Hi \(nickName ?? fullName)"

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0

for(kind, numbers) in interestingNumbers {
    for number in numbers {
        if(number > largest) {
            largest = number
        }
    }
}

print(largest)

func greet(person: String, day: String) -> String {
    return "Hello \(person) todays is \(day)"
}

greet(person: "fuck", day: "today")

var numbers = [20, 19, 7, 12]
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

let birthday = {
    print("")
}

birthday()

let birthdajy : (String) -> ()  =  { name in
    print("Happy birthday, \(name)")
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print(numberOfChoices)

for beverage in Beverage.allCases {
    print(beverage)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 8, 8, 8)
productBarcode = .qrCode("fjhdsjfgjds")


enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

struct CompactRect {
    var origin = Point()
    var size = Size()
    var volume: Double {
        return origin.x * origin.y * origin.x
    }
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//read only computer property
//willset is called just before the value is stored
//didset is called immediately after the new value is stored

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

struct Residence {
    var location: Double?
    var name: String?
}

class Person {
    var residence: Residence?
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
size: Size(width: 3.0, height: 3.0))

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

class Stack {
    public private(set) var items = [Int]() // Empty items array
    
     func push(_ item: Int) {
        items.append(item)
    }
    
     func pop() -> Int? {
        if !items.isEmpty {
           return items.removeLast()
        }
        return nil
    }
}

protocol SomeProtocol {
    func test()
}

class SomeStructure: SomeProtocol {
     func test() {
        print("protocol")
    }
}

protocol TestProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int{get}
}

protocol AnotherProtocl {
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String {get}
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, On
    mutating func toggle() {
        switch self {
        case .off:
            self = .off
            break;
        case .On:
            self = .On
            break;
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

protocol DiceGame {
    var dice: Int {get}
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, di: Int)
    func gameDidEnd(_ game: DiceGame)
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

