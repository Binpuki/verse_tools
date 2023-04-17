string_tools<public><final> := class<unique>:
    UppercaseAlphabet : string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    LowercaseAlphabet : string = "abcdefghijklmnopqrstuvwxyz"

    UpperToLower : [char]char = map{}
    LowerToUpper : [char]char = map{}

    block: # Initialize the maps
        for (i := 0..UppercaseAlphabet.Length - 1):
            if (upperChar := UppercaseAlphabet[i]):
                if (lowerChar := LowercaseAlphabet[i]):
                    set UpperToLower[upperChar] = lowerChar
                    set LowerToUpper[lowerChar] = upperChar

    # IndexOf(String : string, Char : char)
    # Finds the FIRST index of the specified char
    #
    # String = The input string
    # Char = The char to find
    # Returns = The index found in integer form (-1 if nothing is found)
    IndexOf<public>(String : string, Char : char) : int =
        for (i := 0..String.Length - 1):
            if (curChar := String[i]):
                if (curChar = Char):
                    return i
        return -1

        # alternative method (wrapper for []char.Find)
        # if (i := String.Find(Char)):
        #     return i
        # return -1

    # LastIndexOf(String : string, Char : char)
    # Finds the LAST index of the specified char
    #
    # String = The input string
    # Char = The char to find
    # Returns = The index found in integer form (-1 if nothing is found)
    LastIndexOf<public>(String : string, Char : char) : int =
        for (i := String.Length - 1..0):
            if (curChar := String[i]):
                if (curChar = Char):
                    return i
        return -1

    # ToLowercase(String : string)
    # Makes the entire string lowercase.
    #
    # String = The input string
    # Returns = The same string in lower case
    ToLowercase<public>(String : string) : string =
        var finalString : string = ""

        for (i := 0..String.Length - 1):
            if (curChar := String[i]):
                if (lowerChar := UpperToLower[curChar]):
                    set curChar = lowerChar
                set finalString = "{finalString}{curChar}"

        return finalString

        # alternative method
        # for (i := 0..String.Length - 1):
        #     if (curChar := String[i]):
        #         if (lowerChar := UppercaseAlphabet[IndexOf(LowercaseAlphabet, curChar)]):
        #             set curChar = lowerChar
        #         set finalString = "{finalString}{curChar}"

    # ToUppercase(String : string)
    # Makes the entire string uppercase.
    #
    # String = The input string
    # Returns = The same string in upper case
    ToUppercase<public>(String : string) : string =
        var finalString : string = ""

        for (i := 0..String.Length - 1):
            if (curChar := String[i]):
                if (upperChar := LowerToUpper[curChar]):
                    set curChar = upperChar
                set finalString = "{finalString}{curChar}"

        return finalString

    # Trim(String : string, Char : char)
    # Removes every instance of the specified char from the string
    #
    # String = The input string
    # Char = The char you want to remove
    # Returns = The same string without that char
    Trim<public>(String : string, Char : char) : string =
        # string is just a []char
        return String.RemoveAllElements(Char)
