import Playgrounds

#Playground {
    // ============================================================
    // COLLECTION TYPES — Playground Notes
    // Source chapter: The Swift Programming Language (6.4), "Collection Types"
    // Examples marked (official) are from the docs; others are simplified
    // examples based on the official concepts.
    // NOTE: Sets and dictionaries have no defined order. Where order could
    // vary, the output comment says so, or the code uses sorted().
    // ============================================================


    // MARK: - 1. MUTABILITY OF COLLECTIONS
    let fixedNumbers = [1, 2, 3]          // let → immutable
    // fixedNumbers.append(4)             // ❌ Compile-time error: can't change a constant
    print(fixedNumbers)                   // [1, 2, 3]


    // ============================================================
    // MARK: - 2. ARRAYS
    // ============================================================

    // MARK: 2a. Type syntax: Array<Element> vs [Element]
    let fullFormArray: Array<Int> = [10, 20]
    let shorthandArray: [Int] = [10, 20]   // preferred
    print(fullFormArray == shorthandArray) // true (same type, same values)


    // MARK: 2b. Creating an empty array  (official)
    var someInts: [Int] = []               // empty array literal (type already known)
    print("someInts is of type [Int] with \(someInts.count) items.")
    // someInts is of type [Int] with 0 items.

    let someIntsFromInit = [Int]()         // initializer syntax
    print(someIntsFromInit.count)          // 0

    someInts.append(3)
    print(someInts)                        // [3]
    someInts = []                          // empty again, still [Int]
    print(someInts)                        // []


    // MARK: 2c. Array with a default value  (official)
    let threeDoubles = Array(repeating: 0.0, count: 3)
    print(threeDoubles)                    // [0.0, 0.0, 0.0]


    // MARK: 2d. Adding two arrays together  (official)
    let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    let sixDoubles = threeDoubles + anotherThreeDoubles   // inferred as [Double]
    print(sixDoubles)                      // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


    // MARK: 2e. Array literal  (official)
    var shoppingList: [String] = ["Eggs", "Milk"]
    // Shorter, inferred form would be: ["Eggs", "Milk"]

    // Trailing comma (simplified example): every line ends the same way
    let weekendPlans = [
        "Sleep",
        "Read",
        "Walk",
    ]
    print(weekendPlans)                    // ["Sleep", "Read", "Walk"]


    // MARK: 2f. Accessing and modifying an array  (official)
    print("The shopping list contains \(shoppingList.count) items.")
    // The shopping list contains 2 items.

    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    } else {
        print("The shopping list isn't empty.")
    }
    // The shopping list isn't empty.

    shoppingList.append("Flour")                                   // 3 items
    shoppingList += ["Baking Powder"]                              // 4 items
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]       // 7 items
    print(shoppingList)
    // ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

    var firstItem = shoppingList[0]        // index 0 = first item
    print(firstItem)                       // Eggs

    shoppingList[0] = "Six eggs"           // change the value at index 0
    print(shoppingList[0])                 // Six eggs

    // Replace a range (indexes 4, 5, 6) with 2 items → array shrinks to 6
    shoppingList[4...6] = ["Bananas", "Apples"]
    print(shoppingList)
    // ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]

    // ⚠️ Invalid index = runtime crash, so it stays commented out:
    // shoppingList[shoppingList.count] = "Salt"   // Error (use append instead)
    print("Largest valid index: \(shoppingList.count - 1)")   // Largest valid index: 5

    shoppingList.insert("Maple Syrup", at: 0)   // now 7 items, Maple Syrup first
    print(shoppingList[0])                       // Maple Syrup

    let mapleSyrup = shoppingList.remove(at: 0) // removes and returns the item
    print(mapleSyrup)                            // Maple Syrup

    firstItem = shoppingList[0]                  // gap closed, items shifted left
    print(firstItem)                             // Six eggs

    let apples = shoppingList.removeLast()       // removes and returns the last item
    print(apples)                                // Apples
    print(shoppingList)
    // ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]


    // MARK: 2g. Iterating over an array  (official)
    for item in shoppingList {
        print(item)
    }
    // Six eggs
    // Milk
    // Flour
    // Baking Powder
    // Bananas

    for (index, value) in shoppingList.enumerated() {
        print("Item \(index + 1): \(value)")
    }
    // Item 1: Six eggs
    // Item 2: Milk
    // Item 3: Flour
    // Item 4: Baking Powder
    // Item 5: Bananas


    // ============================================================
    // MARK: - 3. SETS
    // ============================================================

    // MARK: 3a. Hashable types
    // String, Int, Double, Bool (and simple enum cases) are hashable,
    // so they can be stored in a set or used as dictionary keys.
    let luckyNumbers: Set<Int> = [7, 3, 7, 3, 9]   // duplicates are dropped
    print(luckyNumbers.count)                       // 3
    print(luckyNumbers.sorted())                    // [3, 7, 9]


    // MARK: 3b + 3c. Set<Element> syntax and empty set  (official)
    var letters = Set<Character>()                  // no shorthand for sets
    print("letters is of type Set<Character> with \(letters.count) items.")
    // letters is of type Set<Character> with 0 items.

    letters.insert("a")
    print(letters.count)                            // 1
    letters = []                                    // empty, still Set<Character>
    print(letters.isEmpty)                          // true


    // MARK: 3d. Set from an array literal  (official)
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
    // Must write `Set`; without it this would be an Array.
    // Element type String is inferred → Set<String>


    // MARK: 3e. Accessing and modifying a set  (official)
    print("I have \(favoriteGenres.count) favorite music genres.")
    // I have 3 favorite music genres.

    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    // I have particular music preferences.

    favoriteGenres.insert("Jazz")                   // now 4 items

    // remove(_:) returns the removed value, or nil if it wasn't there
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    // Rock? I'm over it.

    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
    // It's too funky in here.

    // removeAll() — done on a copy so favoriteGenres stays intact (simplified example)
    var genresToClear = favoriteGenres
    genresToClear.removeAll()
    print(genresToClear.isEmpty)                    // true


    // MARK: 3f. Iterating over a set  (official)
    for genre in favoriteGenres {
        print(genre)
    }
    // Classical, Jazz, Hip hop — ORDER MAY VARY each run

    for genre in favoriteGenres.sorted() {          // sorted() returns an Array
        print(genre)
    }
    // Classical
    // Hip hop
    // Jazz


    // MARK: 3g. Fundamental set operations  (official)
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

    print(oddDigits.union(evenDigits).sorted())
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]       ← everything from both

    print(oddDigits.intersection(evenDigits).sorted())
    // []                                   ← nothing in common

    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    // [1, 9]                               ← odd digits that aren't prime

    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
    // [1, 2, 9]                            ← in one set or the other, not both


    // MARK: 3h. Set membership and equality  (official + simplified)
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]

    print(houseAnimals.isSubset(of: farmAnimals))      // true
    print(farmAnimals.isSuperset(of: houseAnimals))    // true
    print(farmAnimals.isDisjoint(with: cityAnimals))   // true (nothing shared)

    // Simplified examples for == and "strict" checks:
    let samePets: Set = ["🐱", "🐶"]
    print(houseAnimals == samePets)                        // true (order doesn't matter)
    print(houseAnimals.isSubset(of: samePets))             // true  (equal sets count)
    print(houseAnimals.isStrictSubset(of: samePets))       // false (equal, so not strict)
    print(houseAnimals.isStrictSubset(of: farmAnimals))    // true
    print(farmAnimals.isStrictSuperset(of: houseAnimals))  // true


    // ============================================================
    // MARK: - 4. DICTIONARIES
    // ============================================================

    // MARK: 4a. Type syntax: Dictionary<Key, Value> vs [Key: Value]
    let fullFormDictionary: Dictionary<String, Int> = ["one": 1]
    let shorthandDictionary: [String: Int] = ["one": 1]       // preferred
    print(fullFormDictionary == shorthandDictionary)          // true


    // MARK: 4b. Creating an empty dictionary  (official + simplified)
    var namesOfIntegers: [Int: String] = [:]   // empty dictionary literal
    let emptyScores = [String: Int]()          // initializer syntax
    print(namesOfIntegers.isEmpty, emptyScores.isEmpty)   // true true

    namesOfIntegers[16] = "sixteen"            // now 1 pair
    print(namesOfIntegers.count)               // 1
    namesOfIntegers = [:]                      // empty again, still [Int: String]
    print(namesOfIntegers.count)               // 0


    // MARK: 4c. Dictionary literal  (official)
    var airports: [String: String] = [
        "YYZ": "Toronto Pearson",
        "DUB": "Dublin",                       // trailing comma allowed
    ]


    // MARK: 4d. Accessing and modifying a dictionary  (official)
    print("The airports dictionary contains \(airports.count) items.")
    // The airports dictionary contains 2 items.

    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary isn't empty.")
    }
    // The airports dictionary isn't empty.

    airports["LHR"] = "London"                 // new key → adds a pair (3 items)
    airports["LHR"] = "London Heathrow"        // existing key → changes the value

    // updateValue returns the OLD value (optional)
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    // The old value for DUB was Dublin.

    // Simplified example: a new key has no old value → nil
    if airports.updateValue("Sydney", forKey: "SYD") == nil {
        print("SYD was a new key.")
    }
    // SYD was a new key.
    airports["SYD"] = nil                      // clean up

    // Reading with a subscript returns an optional
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport isn't in the airports dictionary.")
    }
    // The name of the airport is Dublin Airport.

    // Remove by assigning nil
    airports["APL"] = "Apple International"
    airports["APL"] = nil                      // APL removed

    // Remove with removeValue(forKey:) → returns the removed value or nil
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary doesn't contain a value for DUB.")
    }
    // The removed airport's name is Dublin Airport.


    // MARK: 4e. Iterating over a dictionary  (official)
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    // LHR: London Heathrow
    // YYZ: Toronto Pearson        ← ORDER MAY VARY

    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }
    // Airport code: LHR / YYZ     ← ORDER MAY VARY

    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    // Airport name: London Heathrow / Toronto Pearson   ← ORDER MAY VARY

    // Turn keys/values into real Arrays
    let airportCodes = [String](airports.keys)
    let airportNames = [String](airports.values)
    print(airportCodes.count, airportNames.count)    // 2 2

    // Fixed order: use sorted()
    for airportCode in airports.keys.sorted() {
        print(airportCode)
    }
    // LHR
    // YYZ
    print(airports.values.sorted())                  // ["London Heathrow", "Toronto Pearson"]
}
