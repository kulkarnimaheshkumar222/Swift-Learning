import Playgrounds

#Playground {
    
    // ======================================================
    // THE BASICS
    // ======================================================

    // 1. CONSTANTS AND VARIABLES

    let name = "Alex"
    let country = "India"

    var age = 21
    age = 22

    print(name)
    print(age)


    // 2. TYPE ANNOTATIONS

    let username: String = "Alex"
    let marks: Int = 95
    let percentage: Double = 89.5
    let isPassed: Bool = true

    print(username)
    print(marks)
    print(percentage)
    print(isPassed)


    // 3. TYPE INFERENCE

    let number = 100
    let price = 99.99
    let message = "Hello"
    let isActive = true

    print(type(of: number))
    print(type(of: price))
    print(type(of: message))
    print(type(of: isActive))


    // 4. PRINTING VALUES

    print("Hello Swift")

    let studentName = "Alex"
    let studentAge = 21

    print("Student: \(studentName)")
    print("Age: \(studentAge)")


    // 5. COMMENTS

    // Single-line comment

    /*
     Multi-line comment
    */


    // 6. SEMICOLONS

    let x = 10
    let y = 20

    let a = 5; let b = 10

    print(x + y)
    print(a + b)


    // 7. INTEGER TYPES

    let intValue: Int = 100

    let int8Value: Int8 = 100
    let int16Value: Int16 = 100
    let int32Value: Int32 = 100
    let int64Value: Int64 = 100

    let uintValue: UInt = 100

    let uint8Value: UInt8 = 200
    let uint16Value: UInt16 = 500
    let uint32Value: UInt32 = 1000
    let uint64Value: UInt64 = 10000

    print(intValue)
    print(uint8Value)


    // 8. INTEGER LITERALS

    let decimalNumber = 17

    let binaryNumber = 0b10001

    let octalNumber = 0o21

    let hexadecimalNumber = 0x11

    print(decimalNumber)
    print(binaryNumber)
    print(octalNumber)
    print(hexadecimalNumber)

    // Underscores for readability

    let largeNumber = 1_000_000

    print(largeNumber)


    // 9. FLOATING-POINT NUMBERS

    let doubleNumber: Double = 3.1415926535

    let floatNumber: Float = 3.14

    print(doubleNumber)
    print(floatNumber)

    // Scientific notation

    let scientificNumber = 1.25e2

    let hexadecimalFloat = 0xFp2

    print(scientificNumber)
    print(hexadecimalFloat)


    // 10. TYPE SAFETY

    let integerValue: Int = 10

    let stringValue: String = "Hello"

    // let invalidValue: Int = "Hello" // Error

    print(integerValue)
    print(stringValue)


    // 11. TYPE CONVERSION

    let myInteger: Int = 10

    let myDouble = Double(myInteger)

    print(myDouble)

    let decimalValue: Double = 9.8

    let wholeValue = Int(decimalValue)

    print(wholeValue)


    // 12. INTEGER CONVERSION AND OVERFLOW

    print(Int8.min)
    print(Int8.max)

    print(UInt8.min)
    print(UInt8.max)

    // Failable integer conversion

    let safeInteger = Int8(exactly: 100)

    print(safeInteger as Any)

    // Overflow operators

    let overflowResult = UInt8.max &+ 1

    print(overflowResult)


    // 13. TYPE ALIASES

    typealias Age = Int

    typealias StudentName = String

    let myAge: Age = 21

    let myName: StudentName = "Alex"

    print(myAge)
    print(myName)


    // 14. BOOLEAN VALUES

    let isLoggedIn: Bool = true

    let isAdmin: Bool = false

    print(isLoggedIn)
    print(isAdmin)


    // 15. TUPLES

    let student = ("Alex", 21, "Computer Science")

    // Access tuple elements

    print(student.0)
    print(student.1)
    print(student.2)

    // Named tuple

    let studentDetails = (
        name: "Alex",
        age: 21,
        course: "Computer Science"
    )

    print(studentDetails.name)
    print(studentDetails.age)
    print(studentDetails.course)

    // Tuple decomposition

    let (personName, personAge, personCourse) = student

    print(personName)
    print(personAge)
    print(personCourse)

    // Ignore tuple values

    let (onlyName, _, _) = student

    print(onlyName)

    // Modify tuple

    var employee = (name: "John", age: 25)

    employee.age = 26

    print(employee)


    // 16. OPTIONALS

    var optionalName: String? = "Alex"

    print(optionalName as Any)

    optionalName = nil

    print(optionalName as Any)


    // 17. OPTIONAL BINDING - IF LET

    let userAge: Int? = 25

    if let actualAge = userAge {
        print("Age: \(actualAge)")
    } else {
        print("Age unavailable")
    }

    // Shorthand optional binding

    if let userAge {
        print("User age: \(userAge)")
    }


    // 18. OPTIONAL BINDING - GUARD LET

    func checkUsername(_ username: String?) {

        guard let username else {
            print("Username is missing")
            return
        }

        print("Welcome \(username)")
    }

    checkUsername("Alex")

    checkUsername(nil)


    // 19. NIL COALESCING OPERATOR

    let optionalCity: String? = nil

    let cityName = optionalCity ?? "Pune"

    print(cityName)


    // 20. FORCE UNWRAPPING

    let optionalCountry: String? = "India"

    if optionalCountry != nil {
        print(optionalCountry!)
    }


    // 21. IMPLICITLY UNWRAPPED OPTIONALS

    var optionalCompany: String! = "Apple"

    print(optionalCompany as Any)

    if optionalCompany != nil {
        let company: String = optionalCompany
        print(company)
    }


    // 22. ERROR HANDLING

    enum LoginError: Error {
        case invalidUsername
        case invalidPassword
    }

    func login(
        username: String,
        password: String
    ) throws {

        if username.isEmpty {
            throw LoginError.invalidUsername
        }

        if password.isEmpty {
            throw LoginError.invalidPassword
        }

        print("Login successful!")
    }

    // do, try and catch

    do {
        try login(
            username: "Alex",
            password: "12345"
        )
    } catch LoginError.invalidUsername {
        print("Username is missing")
    } catch LoginError.invalidPassword {
        print("Password is missing")
    } catch {
        print("Unknown error: \(error)")
    }

    // try?

    let optionalResult = try? login(
        username: "Alex",
        password: "12345"
    )

    print(optionalResult as Any)


    // 23. ASSERTIONS

    let marksValue = 90

    assert(
        marksValue >= 0,
        "Marks cannot be negative"
    )

    print("Assertion passed")


    // 24. PRECONDITIONS

    let userBalance = 500

    precondition(
        userBalance >= 0,
        "Balance cannot be negative"
    )

    print("Precondition passed")


    // ======================================================
    // END OF SWIFT BASICS
    // ======================================================

    print("Swift Basics Completed!")

}
