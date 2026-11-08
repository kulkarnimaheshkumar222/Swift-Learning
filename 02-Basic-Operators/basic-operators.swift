import Playgrounds

#Playground {
    
    // ======================================================
    // SWIFT - BASIC OPERATORS
    // ======================================================


    // 1. ASSIGNMENT OPERATOR (=)

    // Assigns a value to a variable or constant.

    let name = "Alex"

    var age = 21
    age = 22

    print(name)
    print(age)

    // Tuple assignment

    var (x, y) = (10, 20)

    print(x)
    print(y)

    (x, y) = (30, 40)

    print(x)
    print(y)


    // ======================================================
    // 2. ARITHMETIC OPERATORS
    // ======================================================

    // Addition (+)

    let addition = 10 + 5
    print(addition)

    // Subtraction (-)

    let subtraction = 10 - 5
    print(subtraction)

    // Multiplication (*)

    let multiplication = 10 * 5
    print(multiplication)

    // Division (/)

    let division = 10 / 5
    print(division)

    // Integer division removes the decimal part

    let integerDivision = 9 / 4
    print(integerDivision) // 2

    // Double division

    let doubleDivision = 9.0 / 4.0
    print(doubleDivision) // 2.25

    // Remainder (%)

    let remainder = 10 % 3
    print(remainder) // 1

    // Remainder with negative numbers

    let negativeRemainder = -9 % 4
    print(negativeRemainder) // -1


    // ======================================================
    // 3. UNARY OPERATORS
    // ======================================================

    // Unary minus (-)

    let number = 10

    let negativeNumber = -number

    print(negativeNumber)

    // Unary plus (+)

    let positiveNumber = +number

    print(positiveNumber)

    // Unary minus can reverse the sign

    var value = 20

    value = -value

    print(value)

    value = -value

    print(value)


    // ======================================================
    // 4. COMPOUND ASSIGNMENT OPERATORS
    // ======================================================

    // Addition assignment (+=)

    var a = 10
    a += 5
    print(a) // 15

    // Subtraction assignment (-=)

    var b = 10
    b -= 5
    print(b) // 5

    // Multiplication assignment (*=)

    var c = 10
    c *= 5
    print(c) // 50

    // Division assignment (/=)

    var d = 10
    d /= 5
    print(d) // 2

    // Remainder assignment (%=)

    var e = 10
    e %= 3
    print(e) // 1


    // ======================================================
    // 5. COMPARISON OPERATORS
    // ======================================================

    // Equal to (==)

    print(10 == 10) // true

    // Not equal to (!=)

    print(10 != 5) // true

    // Greater than (>)

    print(10 > 5) // true

    // Less than (<)

    print(5 < 10) // true

    // Greater than or equal to (>=)

    print(10 >= 10) // true

    // Less than or equal to (<=)

    print(5 <= 10) // true

    // String comparison

    print("Apple" == "Apple")

    print("Apple" != "Mango")


    // ======================================================
    // 6. TERNARY CONDITIONAL OPERATOR
    // ======================================================

    // Syntax:
    // condition ? valueIfTrue : valueIfFalse

    let studentMarks = 85

    let result = studentMarks >= 40
        ? "Pass"
        : "Fail"

    print(result)

    // Another example

    let numberValue = 10

    let check = numberValue % 2 == 0
        ? "Even"
        : "Odd"

    print(check)

    // Nested ternary operator

    let score = 75

    let grade = score >= 90
        ? "A"
        : score >= 75
            ? "B"
            : "C"

    print(grade)


    // ======================================================
    // 7. NIL-COALESCING OPERATOR (??)
    // ======================================================

    // Provides a default value if an optional is nil.

    // Syntax:
    // optionalValue ?? defaultValue

    let username: String? = nil

    let displayName = username ?? "Guest"

    print(displayName)

    // When optional contains a value

    let user: String? = "Alex"

    let actualName = user ?? "Guest"

    print(actualName)

    // Multiple nil-coalescing operators

    let firstName: String? = nil
    let secondName: String? = nil
    let defaultName = "Guest"

    let finalName = firstName ?? secondName ?? defaultName

    print(finalName)


    // ======================================================
    // 8. CLOSED RANGE OPERATOR (...)
    // ======================================================

    // Includes both starting and ending values.

    // Syntax:
    // start...end

    let closedRange = 1...5

    print(closedRange)

    // Check if a value exists in the range

    print(closedRange.contains(3)) // true

    print(closedRange.contains(6)) // false

    // Using closed range with a loop

    for number in 1...5 {
        print(number)
    }


    // ======================================================
    // 9. HALF-OPEN RANGE OPERATOR (..<)
    // ======================================================

    // Includes the starting value.
    // Excludes the ending value.

    // Syntax:
    // start..<end

    let halfOpenRange = 1..<5

    print(halfOpenRange)

    // Using half-open range with a loop

    for number in 1..<5 {
        print(number)
    }

    // Check range

    print(halfOpenRange.contains(3)) // true

    print(halfOpenRange.contains(5)) // false


    // ======================================================
    // 10. ONE-SIDED RANGES
    // ======================================================

    // Range from beginning up to a value

    let numbers = [10, 20, 30, 40, 50]

    let firstThree = numbers[..<3]

    print(firstThree)

    // Range from a value to the end

    let lastThree = numbers[2...]

    print(lastThree)

    // Range from beginning through a value

    let firstFour = numbers[...3]

    print(firstFour)

    // Closed range from a value to the end

    let fromThree = numbers[3...]

    print(fromThree)

    // One-sided range with contains

    let rangeFromThree = 3...

    print(rangeFromThree.contains(5)) // true

    print(rangeFromThree.contains(2)) // false

    let rangeUntilThree = ...3

    print(rangeUntilThree.contains(2)) // true

    print(rangeUntilThree.contains(4)) // false


    // ======================================================
    // 11. LOGICAL OPERATORS
    // ======================================================

    // Logical NOT (!)

    // Reverses a Boolean value.

    let isLoggedIn = true

    print(!isLoggedIn) // false

    // Logical AND (&&)

    // Both conditions must be true.

    let ageValue = 25
    let hasID = true

    let canEnter = ageValue >= 18 && hasID

    print(canEnter) // true

    // Logical OR (||)

    // At least one condition must be true.

    let isWeekend = false
    let isHoliday = true

    let canRelax = isWeekend || isHoliday

    print(canRelax) // true


    // ======================================================
    // 12. COMBINING LOGICAL OPERATORS
    // ======================================================

    let ageCheck = 22
    let hasLicense = true
    let hasVehicle = false

    let canDrive = ageCheck >= 18
        && hasLicense
        && hasVehicle

    print(canDrive)

    // Combining AND and OR

    let isStudent = true
    let isEmployed = false
    let hasDiscount = isStudent || isEmployed

    print(hasDiscount)

    // Using NOT with AND

    let isBlocked = false
    let isVerified = true

    let canLogin = !isBlocked && isVerified

    print(canLogin)


    // ======================================================
    // 13. LOGICAL OPERATOR SHORT-CIRCUIT EVALUATION
    // ======================================================

    // AND (&&):
    // If the first condition is false,
    // the second condition isn't evaluated.

    let firstCondition = false

    let andResult = firstCondition && (10 > 5)

    print(andResult)

    // OR (||):
    // If the first condition is true,
    // the second condition isn't evaluated.

    let secondCondition = true

    let orResult = secondCondition || (10 < 5)

    print(orResult)


    // ======================================================
    // 14. OPERATOR PRECEDENCE AND ASSOCIATIVITY
    // ======================================================

    // Multiplication has higher precedence than addition.

    let resultOne = 2 + 3 * 4

    print(resultOne) // 14

    // Parentheses change evaluation order.

    let resultTwo = (2 + 3) * 4

    print(resultTwo) // 20

    // Remainder and multiplication are evaluated
    // before addition.

    let resultThree = 2 + 3 % 4 * 5

    print(resultThree) // 17

    // Left associativity

    let resultFour = 20 - 5 - 3

    print(resultFour) // 12

    // Equivalent to:

    let resultFive = (20 - 5) - 3

    print(resultFive) // 12

    // Use parentheses to make expressions clear.

    let finalResult = (10 + 5) * (20 - 10)

    print(finalResult) // 150


    // ======================================================
    // END OF BASIC OPERATORS
    // ======================================================

    print("================================")
    print("BASIC OPERATORS COMPLETED!")
    print("================================")

}
