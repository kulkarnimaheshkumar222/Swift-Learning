import Playgrounds

#Playground {
    // ============================================================
    // STRINGS AND CHARACTERS — Playground Notes
    // Source chapter: The Swift Programming Language (6.4), "Strings and Characters"
    // Examples marked (official) are from the docs; others are simplified
    // examples based on the official concepts.
    // ============================================================


    // MARK: - 1. STRING LITERALS
    // Text in double quotes. Swift infers the type String.
    let appName = "Swift Notes"
    print(appName)                                   // Swift Notes


    // MARK: - 1a. MULTILINE STRING LITERALS
    // Three quotes. Text starts after the opening """ and ends before the closing """.
    let poem = """
    Roses are red,
    Swift is fast.
    "Quotes" need no escaping here.
    """
    print(poem)
    // Roses are red,
    // Swift is fast.
    // "Quotes" need no escaping here.

    // The opening/closing line breaks are NOT part of the value:
    let oneLine = "Same text"
    let multiLine = """
    Same text
    """
    print(oneLine == multiLine)                      // true

    // Backslash at line end = soft wrap (break in source code only)
    let softWrapped = """
    This is one sentence written \
    across two lines of source code.
    """
    print(softWrapped)
    // This is one sentence written across two lines of source code.

    // Blank first and last lines = string starts and ends with a line break
    let withLineBreaks = """

    Starts and ends with a line break.

    """
    print("[\(withLineBreaks)]")
    // [
    // Starts and ends with a line break.
    // ]

    // Indentation: whitespace before the closing """ is removed from every line.
    // Extra whitespace beyond that is kept.
    let indentedText = """
        Line one
            Line two (4 extra spaces kept)
        Line three
        """
    print(indentedText)
    // Line one
    //     Line two (4 extra spaces kept)
    // Line three


    // MARK: - 1b. SPECIAL CHARACTERS
    let quote = "\"Practice beats memory\" - a learner"   // \"  double quote
    print(quote)                                     // "Practice beats memory" - a learner

    let tabbed = "Name:\tSwift"                      // \t  tab
    print(tabbed)                                    // Name:    Swift

    let twoLines = "Line 1\nLine 2"                  // \n  line feed
    print(twoLines)
    // Line 1
    // Line 2

    let backslashPath = "C:\\Users\\Learner"         // \\  backslash
    print(backslashPath)                             // C:\Users\Learner

    let singleQuote = "It\'s fine"                   // \'  single quote
    print(singleQuote)                               // It's fine

    let nullExample = "A\0B"                         // \0  null character (invisible)
    print(nullExample.count)                         // 3

    let carriageReturnExample = "Before\rAfter"      // \r  carriage return
    // (not printed: how \r displays depends on the console)

    // Unicode scalars: \u{n}, n = 1–8 hex digits  (official)
    let dollarSign = "\u{24}"                        // $
    let blackHeart = "\u{2665}"                      // ♥
    let sparklingHeart = "\u{1F496}"                 // 💖
    print(dollarSign, blackHeart, sparklingHeart)    // $ ♥ 💖

    // Writing """ inside a multiline string: escape at least one quote
    let tripleQuotes = """
    Escaped: \"""
    """
    print(tripleQuotes)                              // Escaped: """


    // MARK: - 1c. EXTENDED STRING DELIMITERS  #"..."#
    let rawEscape = #"Line 1\nLine 2"#               // \n is NOT a line break here
    print(rawEscape)                                 // Line 1\nLine 2

    let activeEscape = #"Line 1\#nLine 2"#           // \#n matches one # → real line break
    print(activeEscape)
    // Line 1
    // Line 2

    let tripleHash = ###"A\###nB"###                 // three # → \###n
    print(tripleHash)
    // A
    // B

    let rawMultiline = #"""
    Contains """ safely
    """#
    print(rawMultiline)                              // Contains """ safely


    // MARK: - 2. INITIALIZING AN EMPTY STRING
    var emptyLiteral = ""                            // empty string literal
    var emptyInit = String()                         // initializer syntax
    print(emptyLiteral.isEmpty, emptyInit.isEmpty)   // true true

    if emptyLiteral.isEmpty {
        print("Nothing to see here")                 // Nothing to see here
    }
    emptyLiteral += "Now filled"
    emptyInit.append("X")
    print(emptyLiteral, emptyInit)                   // Now filled X


    // MARK: - 3. STRING MUTABILITY
    var vehicle = "Horse"
    vehicle += " and carriage"
    print(vehicle)                                   // Horse and carriage

    let fixedName = "Highlander"
    // fixedName += " again"   // ❌ Compile-time error: a constant can't be modified
    print(fixedName)                                 // Highlander


    // MARK: - 4. STRINGS ARE VALUE TYPES
    let original = "Apple"
    var copiedString = original                      // a copy is made
    copiedString += " Pie"                           // only the copy changes
    print(original)                                  // Apple
    print(copiedString)                              // Apple Pie


    // MARK: - 5. WORKING WITH CHARACTERS
    for character in "Hi!🐶" {
        print(character)
    }
    // H
    // i
    // !
    // 🐶

    let questionMark: Character = "?"                // annotation makes it a Character
    print(questionMark)                              // ?

    let letters: [Character] = ["S", "w", "i", "f", "t", "!"]
    let wordFromLetters = String(letters)            // build a String from Characters
    print(wordFromLetters)                           // Swift!


    // MARK: - 6. CONCATENATING STRINGS AND CHARACTERS
    let firstPart = "good"
    let secondPart = " morning"
    var greetingText = firstPart + secondPart        // +  creates a new String
    print(greetingText)                              // good morning

    var instruction = "look over"
    instruction += " there"                          // += appends to a variable
    print(instruction)                               // look over there

    let bang: Character = "!"
    greetingText.append(bang)                        // append a Character
    print(greetingText)                              // good morning!
    // You can't append to a Character variable: it must hold exactly one character.

    // Multiline gotcha  (official)
    let badStart = """
        one
        two
        """
    let lastLine = """
        three
        """
    print(badStart + lastLine)
    // one
    // twothree      ← last line of badStart had no line break

    let goodStart = """
        one
        two

        """
    print(goodStart + lastLine)
    // one
    // two
    // three


    // MARK: - 7. STRING INTERPOLATION
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"   // (official)
    print(message)                                   // 3 times 2.5 is 7.5

    let interpolatedMultiline = """
    Multiplier: \(multiplier)
    Squared: \(multiplier * multiplier)
    """
    print(interpolatedMultiline)
    // Multiplier: 3
    // Squared: 9

    // In extended delimiters, \( ) is plain text...
    print(#"Write an interpolated string using \(multiplier)."#)
    // Write an interpolated string using \(multiplier).
    // ...unless the # count matches:
    print(#"6 times 7 is \#(6 * 7)."#)               // 6 times 7 is 42.


    // MARK: - 8a. UNICODE SCALAR VALUES (21-bit numbers)
    let letterA: Character = "\u{61}"               // U+0061 LATIN SMALL LETTER A
    let babyChick: Character = "\u{1F425}"          // U+1F425 FRONT-FACING BABY CHICK
    print(letterA, babyChick)                       // a 🐥


    // MARK: - 8b. EXTENDED GRAPHEME CLUSTERS  (official)
    let eAcute: Character = "\u{E9}"                 // é  (1 scalar)
    let combinedEAcute: Character = "\u{65}\u{301}"  // e + combining accent = é (2 scalars)
    print(eAcute, combinedEAcute)                    // é é
    print(eAcute == combinedEAcute)                  // true

    let precomposed: Character = "\u{D55C}"                   // 한
    let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"    // ᄒ ᅡ ᆫ → 한
    print(precomposed, decomposed)                   // 한 한

    let enclosedEAcute: Character = "\u{E9}\u{20DD}"  // é inside a circle
    print(enclosedEAcute)                            // é⃝

    let usFlag: Character = "\u{1F1FA}\u{1F1F8}"      // two regional indicators
    print(usFlag)                                    // 🇺🇸


    // MARK: - 9. COUNTING CHARACTERS
    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"   // (official)
    print("unusualMenagerie has \(unusualMenagerie.count) characters")
    // unusualMenagerie has 40 characters

    var cafeWord = "cafe"
    print("the number of characters in \(cafeWord) is \(cafeWord.count)")
    // the number of characters in cafe is 4
    cafeWord += "\u{301}"                            // COMBINING ACUTE ACCENT
    print("the number of characters in \(cafeWord) is \(cafeWord.count)")
    // the number of characters in café is 4   ← count did NOT change
    print(cafeWord.unicodeScalars.count)             // 5  ← but there are 5 scalars


    // MARK: - 10a. STRING INDICES  (official)
    let greeting = "Guten Tag!"
    print(greeting[greeting.startIndex])                          // G
    print(greeting[greeting.index(before: greeting.endIndex)])    // !
    print(greeting[greeting.index(after: greeting.startIndex)])   // u
    let seventhIndex = greeting.index(greeting.startIndex, offsetBy: 7)
    print(greeting[seventhIndex])                                 // a

    // ⚠️ Out-of-range access crashes at runtime, so these stay commented out:
    // greeting[greeting.endIndex]               // Error
    // greeting.index(after: greeting.endIndex)  // Error

    let emptyForIndex = ""
    print(emptyForIndex.startIndex == emptyForIndex.endIndex)     // true

    for index in greeting.indices {
        print("\(greeting[index]) ", terminator: "")
    }
    print("")
    // G u t e n   T a g !


    // MARK: - 10b. INSERTING AND REMOVING  (official)
    var welcome = "hello"
    welcome.insert("!", at: welcome.endIndex)
    print(welcome)                                   // hello!

    welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
    print(welcome)                                   // hello there!

    let removedCharacter = welcome.remove(at: welcome.index(before: welcome.endIndex))
    print(removedCharacter)                          // !
    print(welcome)                                   // hello there

    let lastSix = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
    welcome.removeSubrange(lastSix)
    print(welcome)                                   // hello


    // MARK: - 10c. SUBSTRINGS
    let sentence = "Hello, world!"
    let commaIndex = sentence.firstIndex(of: ",") ?? sentence.endIndex
    let beginning = sentence[..<commaIndex]          // Substring (shares memory with sentence)
    print(beginning)                                 // Hello
    print(type(of: beginning))                       // Substring

    let firstThree = sentence.prefix(3)              // prefix(_:) also returns a Substring
    print(firstThree)                                // Hel

    let savedBeginning = String(beginning)           // convert for long-term storage
    print(type(of: savedBeginning))                  // String


    // MARK: - 11a. STRING AND CHARACTER EQUALITY
    let quotation = "We're a lot alike, you and I."
    let sameQuotation = "We're a lot alike, you and I."
    if quotation == sameQuotation {
        print("These two strings are considered equal")
    }
    // These two strings are considered equal

    // Canonical equivalence: different scalars, same meaning → equal  (official)
    let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
    let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
    print(eAcuteQuestion == combinedEAcuteQuestion)   // true

    // Look alike, different meaning → NOT equal  (official)
    let latinCapitalLetterA: Character = "\u{41}"     // A (English)
    let cyrillicCapitalLetterA: Character = "\u{0410}" // А (Russian)
    if latinCapitalLetterA != cyrillicCapitalLetterA {
        print("These two characters aren't equivalent.")
    }
    // These two characters aren't equivalent.


    // MARK: - 11b. PREFIX AND SUFFIX EQUALITY
    let fileNames = [
        "notes-strings.txt",
        "notes-characters.txt",
        "photo-cat.png",
        "photo-dog.png",
        "notes-unicode.png"
    ]

    var notesCount = 0
    var pngCount = 0
    for file in fileNames {
        if file.hasPrefix("notes-") { notesCount += 1 }
        if file.hasSuffix(".png") { pngCount += 1 }
    }
    print("\(notesCount) notes files; \(pngCount) png files")
    // 3 notes files; 3 png files

    // hasPrefix also uses canonical equivalence:
    print("caf\u{E9}".hasPrefix("caf\u{65}\u{301}"))  // true


    // MARK: - 12. UNICODE REPRESENTATIONS OF STRINGS  (official)
    let dogString = "Dog‼🐶"

    // Characters (grapheme clusters)
    print(dogString.count)                           // 5

    // UTF-8 → UInt8 code units
    for codeUnit in dogString.utf8 {
        print("\(codeUnit) ", terminator: "")
    }
    print("")
    // 68 111 103 226 128 188 240 159 144 182

    // UTF-16 → UInt16 code units (🐶 = surrogate pair 55357 56374)
    for codeUnit in dogString.utf16 {
        print("\(codeUnit) ", terminator: "")
    }
    print("")
    // 68 111 103 8252 55357 56374

    // Unicode scalars → .value is UInt32 (UTF-32 equivalent)
    for scalar in dogString.unicodeScalars {
        print("\(scalar.value) ", terminator: "")
    }
    print("")
    // 68 111 103 8252 128054

    // A scalar can also be turned into text with interpolation
    for scalar in dogString.unicodeScalars {
        print("\(scalar) ")
    }
    // D
    // o
    // g
    // ‼
    // 🐶

    print(dogString.utf8.count, dogString.utf16.count, dogString.unicodeScalars.count)
    // 10 6 5
}
