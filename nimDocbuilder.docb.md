```nim
import strutils
```

```nim
import os
```

```nim
proc readinput(): auto =
```

```nim
    var input: string
```

```nim
    stdout.write("-> ")
```

```nim
    input = readLine(stdin)
```

```nim
    return input
```

```nim
proc makestrings(input: string): auto =
```

Check if ', ' in string, if so, make a sequence, else make a sequence of one.

```nim
    var stringList: seq[string]
```

```nim
    if ", " in input:
```

```nim
        stringList = split(input, ", ")
```

```nim
    else:
```

```nim
        stringList = @[input]
```

```nim
    return stringList
```

For each in sequence

check if filename in string by checking if file exists

```nim
proc filecheck(stringList: seq): auto =
```

```nim
    var inFile: File
```

```nim
    var outString: string
```

```nim
    outString = ""
```

```nim
    for file in stringList:
```

```nim
        if existsFile(file):
```

```nim
            inFile = open(file)
```

```nim
            for line in infile.lines:
```

```nim
                outString = outString & string(line) & "\n"
```

```nim
            inFile.close()
```

```nim
        else:
```

```nim
            outString = outString & string(file)
```

```nim
    return outString
```

```nim
proc markdown(fileString: string): auto =
```

```nim
    var outString: string
```

```nim
    outString = ""
```

```nim
    var mdChar: string
```

```nim
    mdChar = "#"
```

```nim
    var strippedLine: string
```

```nim
    for line in fileString.split("\n"):
```

```nim
        strippedLine = line.strip()
```

```nim
        if line == "":
```

```nim
            continue
```

```nim
        elif mdChar in strippedLine[0 .. 2]:
```

```nim
            outString = outString & strippedLine[2 .. ^1] & "\n\n"
```

```nim
        else:
```

```nim
            outString = outString & "```nim\n" & line & "\n```\n\n"
```

```nim
    return outString
```

```nim
proc writetofile(outString: string, outFile: string): auto =
```

```nim
    writeFile(outFile, outString)
```

```nim
    return outString
```

```nim
proc main(): auto =
```

```nim
    var nimDocbuilder_version: string
```

```nim
    nimDocbuilder_version = "0.0.0"
```

```nim
    var input: string
```

```nim
    input = readinput()
```

```nim
    var stringList = makestrings(input)
```

```nim
    var parseString = filecheck(stringList)
```

```nim
    var md = markdown(parseString)
```

```nim
    var outFile: string
```

```nim
    if ".nim" in input[^4 .. ^1]:
```

```nim
        outFile = input[0 .. ^5] & ".docb.md"
```

```nim
    else:
```

```nim
        outFile = input & ".docb.md"
```

```nim
    
```

```nim
    discard writetofile(md, outFile)
```

```nim
main()
```

