string_tools<public><final> := class<unique>:
    UppercaseAlphabet : string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    LowercaseAlphabet : string = "abcdefghijklmnopqrstuvwxyz"

    var UpperToLower : [char]char = map{}
    var LowerToUpper : [char]char = map{}

    block: # Initialize the maps
        for (i := 0..UppercaseAlphabet.Length - 1):
            if (upperChar := UppercaseAlphabet[i]):
                if (lowerChar := LowercaseAlphabet[i]):
                    if:
                        set UpperToLower[upperChar] = lowerChar
                        set LowerToUpper[lowerChar] = upperChar

    # IndexOf(String : string, Char : char)
    # Finds the FIRST index of the specified char
    #
    # String = The input string
    # Char = The char to find
    # Returns = The index found in integer form (-1 if nothing is found)
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "fortnite"
    # Index : int = strTools.IndexOf(String, t)
    # Print("{Index}")
    #
    # Output:
    # 3
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
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "fortnite"
    # Index : int = strTools.LastIndexOf(String, t)
    # Print("{Index}")
    #
    # Output:
    # 6
    LastIndexOf<public>(String : string, Char : char) : int =
        for (i := String.Length - 1..0):
            if (curChar := String[i]):
                if (curChar = Char):
                    return i
        return -1

    # ToLower(String : string)
    # Makes the entire string lowercase.
    #
    # String = The input string
    # Returns = The same string in lower case
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "FORTNITE"
    # Lower : string = strTools.ToLower(String)
    # Print(Lower)
    #
    # Output:
    # fortnite
    ToLower<public>(String : string) : string =
        var finalString : string = ""

        for (i := 0..String.Length - 1):
            if (var curChar : char = String[i]):
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

    # ToUpper(String : string)
    # Makes the entire string uppercase.
    #
    # String = The input string
    # Returns = The same string in upper case
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "fortnite"
    # Upper : string = strTools.ToUpper(String)
    # Print(Upper)
    #
    # Output:
    # FORTNITE
    ToUpper<public>(String : string) : string =
        var finalString : string = ""

        for (i := 0..String.Length - 1):
            if (var curChar : char = String[i]):
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
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "f o r t n i t e"
    # Trimmed : string = strTools.Trim(String, ' ')
    # Print(CutoffString)
    #
    # Output:
    # fortnite
    Trim<public>(String : string, Char : char) : string =
        # string is just a []char
        return String.RemoveAllElements(Char)

    # Substring(String : string, Pos : Int, ?End : Int)
    # Cuts off a string at the specified starting index to whatever the length is
    #
    # String = The input string
    # Pos = The index you would like to start with
    # End = The index you would like to end at
    # Returns = The string but cut off
    #
    # Example:
    # strTools : string_tools = string_tools{}
    # 
    # String : string = "fortnite"
    # CutoffString : string = strTools.Substring(String, 0, ?End := 4)
    # Print(CutoffString)
    #
    # Output:
    # fort
    Substring<public>(String : string, Pos : int, ?End : int = String.Length) : string =
        var finalString : string = ""

        if (Pos >= End - 1):
            return String

        for (i := Pos..End - 1):
            if (curChar : char = String[i]):
                set finalString = "{finalString}{curChar}"

        return finalString