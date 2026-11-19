import Playgrounds

#Playground {
    // ============================================================
    // FUNCTIONS — Swift Playground Notes
    // (Simplified examples based on the official Swift book concepts)
    // ============================================================

    // ------------------------------------------------------------
    // 1. DEFINING AND CALLING FUNCTIONS
    // ------------------------------------------------------------
    // func name(parameter: Type) -> ReturnType { ... }
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting                       // sends the value back to the caller
    }
    print(greet(person: "Mahesh"))            // Hello, Mahesh!


    // ------------------------------------------------------------
    // 2. FUNCTION PARAMETERS AND RETURN VALUES
    // ------------------------------------------------------------

    // 2a. Functions Without Parameters — still need ()
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    print(sayHelloWorld())                    // hello, world

    // 2b. Functions With Multiple Parameters — separated by commas
    // Same base name as greet(person:), but a different function: greet(person:alreadyGreeted:)
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return "Hello again, \(person)!"
        } else {
            return greet(person: person)      // calls the first greet function
        }
    }
    print(greet(person: "Tim", alreadyGreeted: true))   // Hello again, Tim!
    print(greet(person: "Tim", alreadyGreeted: false))  // Hello, Tim!

    // 2c. Functions Without Return Values — no "->"
    func printWelcome(name: String) {
        print("Welcome, \(name)!")
    }
    printWelcome(name: "Asha")                // Welcome, Asha!

    // Such functions actually return Void, which is an empty tuple ()
    let nothing: Void = printWelcome(name: "Ravi")   // Welcome, Ravi!
    print(nothing)                            // ()

    // A return value can be ignored by the caller using "let _ ="
    func printAndCount(text: String) -> Int {
        print(text)
        return text.count
    }
    func printWithoutCounting(text: String) {
        let _ = printAndCount(text: text)     // value is thrown away
    }
    let characterCount = printAndCount(text: "hello, world")   // hello, world
    print(characterCount)                     // 12
    printWithoutCounting(text: "hello, world")                 // hello, world  (count not used)

    // 2d. Functions With Multiple Return Values — return a named tuple
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]             // assumes the array is NOT empty
        var currentMax = array[0]
        for value in array.dropFirst() {
            if value < currentMin { currentMin = value }
            if value > currentMax { currentMax = value }
        }
        return (currentMin, currentMax)
    }
    let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
    print("min is \(bounds.min) and max is \(bounds.max)")    // min is -6 and max is 109

    // 2e. Optional Tuple Return Types — the WHOLE tuple may be nil: (Int, Int)?
    func safeMinMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }       // no result possible
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array.dropFirst() {
            if value < currentMin { currentMin = value }
            if value > currentMax { currentMax = value }
        }
        return (currentMin, currentMax)
    }
    if let result = safeMinMax(array: [4, 9, 1]) {
        print("min is \(result.min) and max is \(result.max)")  // min is 1 and max is 9
    }
    if let result = safeMinMax(array: []) {
        print("min is \(result.min)")
    } else {
        print("Array is empty, no min/max")   // Array is empty, no min/max
    }

    // 2f. Functions With an Implicit Return — single expression, no "return" needed
    func greeting(for person: String) -> String {
        "Hello, " + person + "!"
    }
    print(greeting(for: "Dave"))              // Hello, Dave!


    // ------------------------------------------------------------
    // 3. FUNCTION ARGUMENT LABELS AND PARAMETER NAMES
    // ------------------------------------------------------------

    // 3a. Specifying Argument Labels — "from" is the label (caller), "hometown" is the name (inside)
    func introduce(person: String, from hometown: String) -> String {
        "Hello \(person)! Glad you could visit from \(hometown)."
    }
    print(introduce(person: "Asha", from: "Pune"))
    // Hello Asha! Glad you could visit from Pune.

    // 3b. Omitting Argument Labels — use _
    func multiply(_ number: Int, by factor: Int) -> Int {
        number * factor
    }
    print(multiply(4, by: 5))                 // 20

    // 3c. Default Parameter Values — caller may leave the argument out
    func makeTea(cups: Int = 1) -> String {
        "Making \(cups) cup(s) of tea"
    }
    print(makeTea())                          // Making 1 cup(s) of tea
    print(makeTea(cups: 3))                   // Making 3 cup(s) of tea

    // 3d. Variadic Parameters — Type... arrives inside as an array [Type]
    func average(_ numbers: Double...) -> Double {
        if numbers.isEmpty { return 0 }       // zero values is allowed, so handle it
        var total = 0.0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    print(average(1, 2, 3, 4, 5))             // 3.0
    print(average(3, 8.25, 18.75))            // 10.0
    print(average())                          // 0.0

    // Multiple variadic parameters: the parameter AFTER a variadic one needs a label
    func showTeam(_ players: String..., coaches: String...) {
        print("Players: \(players.joined(separator: ", "))")
        print("Coaches: \(coaches.joined(separator: ", "))")
    }
    showTeam("Rohit", "Virat", "Jasprit", coaches: "Rahul")
    // Players: Rohit, Virat, Jasprit
    // Coaches: Rahul

    // 3e. In-Out Parameters — function can change the caller's variable
    func swapValues(_ a: inout Int, _ b: inout Int) {
        let temp = a
        a = b
        b = temp
    }
    var first = 3
    var second = 107
    swapValues(&first, &second)               // pass variables with &
    print("first is now \(first), second is now \(second)")
    // first is now 107, second is now 3
    // Not allowed: swapValues(&3, &4) or passing a "let" constant


    // ------------------------------------------------------------
    // 4. FUNCTION TYPES
    // ------------------------------------------------------------
    // Type of these two functions: (Int, Int) -> Int
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        a * b
    }
    // Type of this function: () -> Void
    func printHelloWorld() {
        print("hello, world")
    }

    // 4a. Using Function Types — store a function in a variable
    var mathFunction: (Int, Int) -> Int = addTwoInts
    print("Result: \(mathFunction(2, 3))")    // Result: 5

    mathFunction = multiplyTwoInts            // same type, so it can be reassigned
    print("Result: \(mathFunction(2, 3))")    // Result: 6

    let anotherMathFunction = addTwoInts      // type inferred as (Int, Int) -> Int
    print(anotherMathFunction(10, 20))        // 30

    let sayHello: () -> Void = printHelloWorld
    sayHello()                                // hello, world

    // 4b. Function Types as Parameter Types — pass a function into a function
    func printMathResult(_ operation: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(operation(a, b))")
    }
    printMathResult(addTwoInts, 3, 5)         // Result: 8
    printMathResult(multiplyTwoInts, 3, 5)    // Result: 15

    // 4c. Function Types as Return Types — return a function from a function
    func stepForward(_ input: Int) -> Int {
        input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        input - 1
    }
    // Returns "a function that takes an Int and returns an Int"
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        backward ? stepBackward : stepForward
    }

    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)  // gets stepBackward
    print("Counting to zero:")
    while currentValue != 0 {
        print("\(currentValue)...")
        currentValue = moveNearerToZero(currentValue)
    }
    print("zero!")
    // Counting to zero:
    // 3...
    // 2...
    // 1...
    // zero!


    // ------------------------------------------------------------
    // 5. NESTED FUNCTIONS
    // ------------------------------------------------------------
    // Helpers live INSIDE the outer function and are hidden from outside code.
    func chooseStepFunctionNested(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { input + 1 }
        func stepBackward(input: Int) -> Int { input - 1 }
        return backward ? stepBackward : stepForward   // a nested function can be returned
    }

    var value = -4
    let moveTowardZero = chooseStepFunctionNested(backward: value > 0)   // gets nested stepForward
    while value != 0 {
        print("\(value)... ")
        value = moveTowardZero(value)
    }
    print("zero!")
    // -4...
    // -3...
    // -2...
    // -1...
    // zero!
}
