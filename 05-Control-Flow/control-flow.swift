import Playgrounds

#Playground {
    // ============================================================
    // SWIFT CONTROL FLOW – COMPLETE PLAYGROUND
    // Copy everything into a Playground and run.
    // ============================================================

    // ------------------------------------------------------------
    // 1. FOR-IN LOOPS
    // ------------------------------------------------------------

    // 1a. Looping over an array
    let fruits = ["Apple", "Banana", "Cherry"]
    for fruit in fruits {
        print("Fruit: \(fruit)")
    }
    // Fruit: Apple
    // Fruit: Banana
    // Fruit: Cherry

    // 1b. Looping over a dictionary (each item is a (key, value) tuple).
    // Dictionaries are unordered; .sorted is used ONLY to make output predictable.
    let legCounts = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in legCounts.sorted(by: { $0.key < $1.key }) {
        print("\(animalName)s have \(legCount) legs")
    }
    // ants have 6 legs
    // cats have 4 legs
    // spiders have 8 legs

    // 1c. Closed range (includes both ends)
    for number in 1...3 {
        print("\(number) times 5 is \(number * 5)")
    }
    // 1 times 5 is 5
    // 2 times 5 is 10
    // 3 times 5 is 15

    // 1d. Half-open range (excludes the end)
    for index in 0..<3 {
        print("Index \(index)")
    }
    // Index 0
    // Index 1
    // Index 2

    // 1e. Underscore when you don't need the loop value
    var repeatedValue = 1
    for _ in 1...3 {
        repeatedValue *= 2
    }
    print("2 to the power 3 is \(repeatedValue)")   // 2 to the power 3 is 8

    // 1f. stride: custom step size
    for tick in stride(from: 0, to: 12, by: 3) {     // end (12) is EXCLUDED
        print("to: \(tick)")
    }
    // to: 0, to: 3, to: 6, to: 9

    for tick in stride(from: 0, through: 12, by: 3) { // end (12) is INCLUDED
        print("through: \(tick)")
    }
    // through: 0, through: 3, through: 6, through: 9, through: 12

    // ------------------------------------------------------------
    // 2. WHILE LOOPS
    // ------------------------------------------------------------

    // 2a. while: condition checked BEFORE each pass
    var countdown = 3
    while countdown > 0 {
        print("Countdown: \(countdown)")
        countdown -= 1
    }
    // Countdown: 3 / 2 / 1

    // 2b. repeat-while: condition checked AFTER each pass (runs at least once)
    var attempts = 0
    repeat {
        attempts += 1
        print("Attempt number \(attempts)")
    } while attempts < 0   // condition is false from the start
    // Attempt number 1   (body still ran once)

    // ------------------------------------------------------------
    // 3. CONDITIONAL STATEMENTS
    // ------------------------------------------------------------

    // 3a. if / else if / else
    let temperature = 25
    if temperature <= 10 {
        print("It's cold.")
    } else if temperature >= 30 {
        print("It's hot.")
    } else {
        print("It's comfortable.")   // this runs
    }

    // 3b. switch with compound cases (no implicit fallthrough, must be exhaustive)
    let letter: Character = "e"
    switch letter {
    case "a", "e", "i", "o", "u":      // compound case
        print("\(letter) is a vowel")  // this runs
    default:
        print("\(letter) is not a vowel")
    }

    // 3c. Interval matching
    let itemCount = 62
    let naturalCount: String
    switch itemCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    default:
        naturalCount = "many"
    }
    print("There are \(naturalCount) items.")   // There are dozens of items.

    // 3d. Tuples (with ranges and _ wildcard)
    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("At the origin")
    case (_, 0):
        print("On the x-axis")
    case (0, _):
        print("On the y-axis")
    case (-2...2, -2...2):
        print("Inside the box")          // this runs
    default:
        print("Outside the box")
    }

    // 3e. Value bindings
    let anotherPoint = (2, 0)
    switch anotherPoint {
    case (let x, 0):
        print("On the x-axis with x = \(x)")   // x = 2
    case (0, let y):
        print("On the y-axis with y = \(y)")
    case let (x, y):
        print("Somewhere else at (\(x), \(y))")
    }

    // 3f. where: extra condition on a case
    let diagonalPoint = (1, -1)
    switch diagonalPoint {
    case let (x, y) where x == y:
        print("On the line x == y")
    case let (x, y) where x == -y:
        print("On the line x == -y")      // this runs
    case let (x, y):
        print("Just some point (\(x), \(y))")
    }

    // 3g. Compound cases WITH value binding (every pattern must bind the same names/types)
    let axisPoint = (9, 0)
    switch axisPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")   // 9
    default:
        print("Not on an axis")
    }

    // ------------------------------------------------------------
    // 4. CONTROL TRANSFER STATEMENTS
    // ------------------------------------------------------------

    // 4a. continue: skip the rest of this pass, start the next one
    let puzzleInput = "great minds think alike"
    var puzzleOutput = ""
    let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
    for character in puzzleInput {
        if charactersToRemove.contains(character) {
            continue                     // skip vowels and spaces
        }
        puzzleOutput.append(character)
    }
    print(puzzleOutput)                  // grtmndsthnklk

    // 4b. break inside a loop: end the loop immediately
    for number in 1...10 {
        if number == 4 {
            break
        }
        print("Number \(number)")
    }
    // Number 1 / 2 / 3

    // 4c. break inside a switch: end the switch early / ignore a case
    let symbol: Character = "x"
    var possibleInt: Int? = nil
    switch symbol {
    case "1":
        possibleInt = 1
    case "x":
        break                            // deliberately do nothing
    default:
        break
    }
    print("possibleInt is \(String(describing: possibleInt))")   // possibleInt is nil

    // 4d. fallthrough: continue into the next case's body (its condition is NOT checked)
    var numberDescription = "The number 5 is"
    switch 5 {
    case 2, 3, 5, 7, 11:
        numberDescription += " a prime number, and also"
        fallthrough
    default:
        numberDescription += " an integer."
    }
    print(numberDescription)   // The number 5 is a prime number, and also an integer.

    // 4e. Labeled statements: break out of an OUTER loop
    outerLoop: for row in 1...3 {
        for column in 1...3 {
            if row * column == 4 {
                print("Found 4 at row \(row), column \(column). Stopping both loops.")
                break outerLoop
            }
            print("row \(row), column \(column)")
        }
    }
    // row 1, column 1 / 2 / 3, then row 2, column 1,
    // then: Found 4 at row 2, column 2. Stopping both loops.

    // ------------------------------------------------------------
    // 5. EARLY EXIT: guard
    // ------------------------------------------------------------
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            print("No name given.")
            return                       // else block MUST leave the scope
        }
        print("Hello \(name)!")          // name is usable after the guard

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }
        print("I hope the weather is nice in \(location).")
    }
    greet(person: ["name": "John"])
    // Hello John!
    // I hope the weather is nice near you.
    greet(person: ["name": "Jane", "location": "Cupertino"])
    // Hello Jane!
    // I hope the weather is nice in Cupertino.
    greet(person: [:])
    // No name given.

    // ------------------------------------------------------------
    // 6. DEFERRED ACTIONS: defer
    // ------------------------------------------------------------
    func deferDemo() {
        print("Start")
        defer { print("Cleanup A (written first, runs last)") }
        defer { print("Cleanup B (written last, runs first)") }
        print("End of function body")
    }
    deferDemo()
    // Start
    // End of function body
    // Cleanup B (written last, runs first)
    // Cleanup A (written first, runs last)

    // ------------------------------------------------------------
    // 7. CHECKING API AVAILABILITY
    // ------------------------------------------------------------
    if #available(iOS 15, macOS 12, *) {
        print("Running on iOS 15+/macOS 12+ (or another platform): newer APIs are safe.")
    } else {
        print("Older OS: use a fallback.")
    }
}
