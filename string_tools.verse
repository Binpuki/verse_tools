string_tools<public><final> := class<unique>:
    UppercaseAlphabet : string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    LowercaseAlphabet : string = "abcdefghijklmnopqrstuvwxyz"

    # IndexOf(String : string, Char : char)
    # Finds the FIRST index of the specified char
    #
    # String = The input string
    # Char = The char to find
    # Returns = The index found in integer form (-1 if nothing is found)
    IndexOf<public>(String : string, Char : char) : int =
        var i : int = 0
        loop:
            if (i >= String.Length):
                set i = -1
                break

            if (curChar : char = String[i]):
                if (curChar = Char):
                    break

            set i = i + 1

        return i

    # LastIndexOf(String : string, Char : char)
    # Finds the LAST index of the specified char
    #
    # String = The input string
    # Char = The char to find
    # Returns = The index found in integer form (-1 if nothing is found)
    LastIndexOf<public>(String : string, Char : char) : int =
        var i : int = String.Length - 1
        loop:
            if (i < 0):
                set i = -1
                break

            if (curChar : char = String[i]):
                if (curChar = Char):
                    break

            set i = i - 1

        return i

    # ToLowercase(String : string)
    # Makes the entire string lowercase.
    #
    # String = The input string
    # Returns = The same string in lower case
    ToLowercase<public>(String : string) : string =
        var finalString : string = ""

        var i : int = 0
        loop:
            if (i >= String.Length):
                break

            if:
                var chosenChar : char = String[i]

                var j : int = 0
                loop:
                    if (j >= UppercaseAlphabet.Length):
                        break

                    if (upperChar : char = UppercaseAlphabet[j]):
                        if (lowerChar : char = LowercaseAlphabet[j]):
                            if (chosenChar = upperChar):
                                set chosenChar = lowerChar
                                break

                    set j = j + 1

                set finalString = "{finalString}{chosenChar}"

            set i = i + 1

        return finalString

    # ToUppercase(String : string)
    # Makes the entire string uppercase.
    #
    # String = The input string
    # Returns = The same string in upper case
    ToUppercase<public>(String : string) : string =
        var finalString : string = ""

        var i : int = 0
        loop:
            if (i >= String.Length):
                break

            if:
                var chosenChar : char = String[i]

                var j : int = 0
                loop:
                    if (j >= LowercaseAlphabet.Length):
                        break

                    if (upperChar : char = UppercaseAlphabet[j]):
                        if (lowerChar : char = LowercaseAlphabet[j]):
                            if (chosenChar = lowerChar):
                                set chosenChar = upperChar
                                break

                    set j = j + 1

                set finalString = "{finalString}{chosenChar}"

            set i = i + 1

        return finalString

    # Trim(String : string, Char : char)
    # Removes every instance of the specified char from the string
    #
    # String = The input string
    # Char = The char you want to remove
    # Returns = The same string without that char
    Trim<public>(String : string, Char : char) : string =
        var finalString : string = ""

        var i : int = 0
        loop:
            if (i >= String.Length):
                break

            if (curChar : char = String[i]):
                var isChosenChar : logic = false

                if (curChar = Char):
                    set isChosenChar = true
                
                if (isChosenChar = false):
                    set finalString = "{finalString}{curChar}"

            set i = i + 1
        
        return finalString