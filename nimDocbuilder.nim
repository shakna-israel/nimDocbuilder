import strutils
import os

proc readinput(): auto =
    var input: string
    stdout.write("-> ")
    input = readLine(stdin)
    return input

proc makestrings(input: string): auto =
    # Check if ', ' in string, if so, make a sequence, else make a sequence of one.
    var stringList: seq[string]
    if ", " in input:
        stringList = split(input, ", ")
    else:
        stringList = @[input]
    return stringList

# For each in sequence
# check if filename in string by checking if file exists
proc filecheck(stringList: seq): auto =
    var inFile: File
    var outString: string
    outString = ""
    for file in stringList:
        if existsFile(file):
            inFile = open(file)
            for line in infile.lines:
                outString = outString & string(line) & "\n"
            inFile.close()
        else:
            outString = outString & string(file)
    return outString

proc markdown(fileString: string): auto =
    var outString: string
    outString = ""
    var mdChar: string
    mdChar = "#"
    var strippedLine: string
    for line in fileString.split("\n"):
        strippedLine = line.strip()
        if line == "":
            continue
        elif mdChar in strippedLine[0 .. 2]:
            outString = outString & strippedLine[2 .. ^1] & "\n\n"
        else:
            outString = outString & "```nim\n" & line & "\n```\n\n"
    return outString

proc writetofile(outString: string, outFile: string): auto =
    writeFile(outFile, outString)
    return outString

proc main(): auto =
    var nimDocbuilder_version: string
    nimDocbuilder_version = "0.0.0"
    var input: string
    input = readinput()
    var stringList = makestrings(input)
    var parseString = filecheck(stringList)
    var md = markdown(parseString)
    var outFile: string
    if ".nim" in input[^4 .. ^1]:
        outFile = input[0 .. ^5] & ".docb.md"
    else:
        outFile = input & ".docb.md"
    
    discard writetofile(md, outFile)

main()
