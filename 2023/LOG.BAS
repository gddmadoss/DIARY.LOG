Screen 0, 0, 0: Width 80: Cls: Beep
Locate , , , 5
h = 1: v = 1: C = 0: hm = 1: vm = 0: CAP$ = "": l = 1
Dim LIN$(15), CH$(780), l$(10), D$(15), T$(15), DE$(15), DIT$(25), n$(15)
Cls
Print "Enter Password, please?"
SKIP2:
' TT$ = "F:\GREGOR~1\DIARY.LOG\GREGORY\GDD" 'Example
TT$ = "C:\Users\Ethan\Documents\GitHub\DIARY.LOG\GREGORY\GDD"
LOG_INDEX = 0
STOP_AT_INDEX = 59
JUMP:
SKIP = 0
Cls
On Error GoTo E:
For B = 1 To 99999
    fil = B
    fil$ = String$(5 - Len(LTrim$(Str$((fil)))), "0") + LTrim$(Str$(fil))
    F$ = TT$ + fil$ + ".LOG"
    Open F$ For Input As #1
    Close #1
    If SKIP = 2 Then GoTo T:
Next B
T:
Color 31: Locate 2, 2: Print "THIS IS MAIN MENU LOG..."
Color 14: Locate 3, 2: Print String$(78, 196)
Color 25: Locate 4, 2: Print "Commands"
Color 26: Locate 9, 2: Print "R";: Color 10: Print "ead";: Color 15: Print "................... read your own logs"
Color 28: Locate 13, 2: Print "W";: Color 12: Print "rite";: Color 15: Print ".................. make your own logs"
Color 31: Locate 17, 2: Print "Q";: Color 15: Print "uit";: Color 15: Print "................... end the program"
Color 15: Locate 2, 50: Print "YOU HAVE"; B - 1; "LOGS"
Do
    'gosub w
    K$ = InKey$
    K$ = UCase$(K$)

    ' Automate "R" inkey to continue reading.
    K$ = "R"

Loop Until K$ = "R" Or K$ = "W" Or K$ = "Q"
If K$ = "Q" Then End
If K$ = "R" Then GoTo READLOG:
If K$ = "W" Then GoTo WRITELOG:
GoTo JUMP:
READLOG:
reading = fil - 1
listing = reading
If reading > 15 Then
    number = 15
    listing = 15
Else
    number = reading
    listing = reading
End If
LISTS = 1: Z = 1
Cls
GoSub listing:
Locate 5 + Z, 2: Color 14, 9: Print n$(Z); Tab(15); DE$(Z); Tab(45); D$(Z); Tab(60); T$(Z): Color 0, 0
RERUN:
Color 31: Locate 2, 2: Print "READING YOUR LOGS";: Color 15: Print Tab(55); " YOU HAVE"; reading; "LOGS."
Color 14: Locate 3, 2: Print String$(78, 196)
Color 11: Locate 4, 2: Print "LOGS"; Tab(15); "Type of Log"; Tab(45); "Date"; Tab(60); "Time"
Color 12: Locate 5, 2: Print String$(78, 196)
Color 12: Locate 21, 2: Print String$(78, 196)
Color 15: Locate 22, 2: Print "Press "; Chr$(24); " as up and "; Chr$(25); " as down and Press ENTER to read";: Color 31: Print Tab(60); "Press Esc to Quit"
Do
    ' Automate pressing down to continue reading.
    If LOG_INDEX > 0 Then A$ = Chr$(0) + Chr$(80)

    If A$ = Chr$(0) + Chr$(72) Then Z = Z - 1
    If A$ = Chr$(0) + Chr$(80) Then Z = Z + 1
    If A$ = Chr$(0) + Chr$(73) Then Z = 0
    If A$ = Chr$(0) + Chr$(81) Then Z = 16
    If Z = 0 And LISTS = 1 Then Z = 1
    If Z = 0 And LISTS <> 1 Then Z = 1: LISTS = LISTS - 15: GoSub listing
    If Z = reading - LISTS + 2 Then Z = reading - LISTS + 1
    If Z = 16 Then
        Z = 1
        LISTS = LISTS + 15
        If LISTS > reading Then LISTS = LISTS - 15
        GoSub listing
    End If
    If ok$ = "Y" Then Locate 5 + Z, 2: Color 14, 9: Print n$(Z); Tab(15); DE$(Z); Tab(45); D$(Z); Tab(60); T$(Z): Color 0, 0
    ok$ = "N"
    A$ = InKey$
    If A$ = Chr$(0) + Chr$(72) Then ok$ = "Y"
    If A$ = Chr$(0) + Chr$(80) Then ok$ = "Y"
    If ok$ = "Y" Then Locate 5 + Z, 2: Color 10, 0: Print n$(Z); Tab(15); DE$(Z); Tab(45); D$(Z); Tab(60); T$(Z)
    Color 0, 0

    If LOG_INDEX < STOP_AT_INDEX Then
        ' Automate "ENTER" inkey to continue reading.
        A$ = Chr$(13)
        LOG_INDEX = LOG_INDEX + 1
    Else
        ' Automate program end.
        A$ = Chr$(27)
    End If

Loop Until A$ = Chr$(27) Or A$ = Chr$(13)
If A$ = Chr$(27) Then Stop
R$ = "N"
If A$ = Chr$(13) Then R$ = "Y": GoSub reading:
If R$ = "Y" Then GoTo RERUN

GoTo JUMP:
WRITELOG:
SKIP = 0
On Error GoTo THATIT:
For B = 1 To 99999
    fil = B
    fil$ = String$(5 - Len(LTrim$(Str$((fil)))), "0") + LTrim$(Str$(fil))
    F$ = TT$ + fil$ + ".LOG"
    Open F$ For Input As #1
    Close #1
    If SKIP = 1 Then GoTo SKIP
Next B
SKIP:
NEWLOG = B
For B = 1 To 780: CH$(B) = "": Next B
T$ = "": D$ = "": DE$ = "": For B = 1 To 25: DI$(B) = "": Next B
Cls
Color 31: Locate 2, 2: Print "This is Writing Log"
Color 14: Locate 3, 2: Print String$(78, 196)
Color 13: Locate 4, 2: Print "DATE: "; Date$; Tab(30); "LOG: "; LOG$; Tab(60); "TIME: "; Time$
Color 14: Locate 5, 2: Print String$(78, 196)
Color 14: Locate 16, 2: Print String$(78, 196)
LOGS = NEWLOG
NEWLOG$ = String$(5 - Len(LTrim$(Str$((LOGS)))), "0") + LTrim$(Str$(LOGS))
Locate 22, 2: Color 31: Print "PRESS ESC TO QUIT"
Locate 17, 2: Color 15: Print "The new log is "; NEWLOG$
Locate 18, 2: Color 7: Print "Accepted Yes, No (Y/N)";
Do: A$ = InKey$: A$ = UCase$(A$): Loop Until A$ = "Y" Or A$ = "N" Or A$ = Chr$(27)
If A$ = Chr$(27) Then GoTo JUMP
If A$ = "Y" Then LOG$ = NEWLOG$
If A$ = "Y" Then Color 13: Locate 4, 2: Print "DATE: "; Date$; Tab(30); "LOG: "; LOG$; Tab(60); "TIME: "; Time$
If A$ = "N" Then GoTo JUMP
Color 7: Locate 17, 2: Print "Type your log between the 2 yellow lines"
Locate 18, 2: Print "Press ESC when you are done"
Locate 22, 2: Color 31, 0: Print String$(78, 32)
l = 1: CH = 1
Do
    If A$ = Chr$(0) + Chr$(72) Then l = l - 1: ok$ = "N"
    If l = 0 Then l = 10
    If A$ = Chr$(0) + Chr$(80) Then l = l + 1: ok$ = "N"
    If A$ = Chr$(13) Then l = l + 1: CH = 1: ok$ = "N"
    If l = 11 Then l = 1
    If A$ = Chr$(0) + Chr$(75) Then CH = CH - 1: ok$ = "N"
    If A$ = Chr$(8) Then CH = CH - 1: ok$ = "N"
    If CH = 0 Then CH = 78: l = l - 1: If l = 0 Then l = 10
    If A$ = Chr$(0) + Chr$(77) Then CH = CH + 1: ok$ = "N"
    If CH = 79 Then CH = 1: l = l + 1: If l = 11 Then l = 1
    If A$ = Chr$(27) Then ok$ = "N"
    If l = 79 Then CH = 1: l = l + 1
    If l = 11 Then l = 1
    If ok$ = "Y" Then Locate l + 5, CH + 1: Color 7: Print A$
    If ok$ = "Y" And A$ <> "" Then CH$((l - 1) * 78 + CH) = A$
    'GOSUB W
    If ok$ = "Y" And A$ <> "" Then CH = CH + 1
    A$ = InKey$: ok$ = "Y"
    A$ = UCase$(A$)
Loop Until A$ = Chr$(27)
Locate 22, 2: Color 31: Print "Press ESC to quit without saving"
Locate 17, 2: Color 7: Print "Enter your description for this whole log, summary it in 25 letters."
Locate 18, 2: Print "Press ENTER when you are done."
LOCTE = 1
Do
    If ok$ = "OK" Then LOCTE = LOCTE + 1
    ok$ = ""
    'GOSUB W
    A$ = InKey$
    A$ = UCase$(A$)
    If A$ <> "" Then ok$ = "OK"
    If A$ = Chr$(13) Then ok$ = ""
    If A$ = Chr$(8) Then LOCTE = LOCTE - 1: ok$ = ""
    If A$ = Chr$(27) Then ok$ = ""
    If LOCTE < 2 Then LOCTE = 2
    If LOCTE > 25 Then LOCTE = 2
    Locate 20, LOCTE: Color 13
    If ok$ = "OK" Then Print A$
    If ok$ = "OK" Then DIT$(LOCTE - 1) = A$
Loop Until A$ = Chr$(13) Or A$ = Chr$(27)
If A$ = Chr$(27) Then GoTo JUMP
For B = 1 To 25: DE$ = DE$ + DIT$(B): Next B
For B = 1 To 780
    C$ = CH$(B)
    GoSub CHANGEWORDSTOCHARACTERS:
    CH$(B) = C$
Next B
For B = 1 To 10: l$(B) = "": Next B
q$ = ""
For B = 1 To 10: For W = 1 To 78
        l$(B) = l$(B) + CH$(W + ((B - 1) * 78))
Next W: Next B
F$ = TT$ + LOG$ + ".LOG"
D$ = Date$: T$ = Time$
For B = 1 To Len(D$)
    C$ = Mid$(D$, B, 1)
    GoSub CHANGEWORDSTOCHARACTERS:
    q$ = q$ + C$
Next B
D$ = q$
q$ = ""
For B = 1 To Len(T$)
    C$ = Mid$(T$, B, 1)
    GoSub CHANGEWORDSTOCHARACTERS:
    q$ = q$ + C$
Next B
T$ = q$
q$ = ""
For B = 1 To Len(DE$)
    C$ = Mid$(DE$, B, 1)
    GoSub CHANGEWORDSTOCHARACTERS:
    q$ = q$ + C$
Next B
DE$ = q$
Open F$ For Output As #1
Print #1, D$
Print #1, T$
Print #1, DE$
For B = 1 To 10
    Print #1, l$(B)
Next B
Close #1
GoTo JUMP
CHANGECHARACTERSTOWORDS:
If C$ = Chr$(250) Then C$ = " "
If C$ = Chr$(32) Then C$ = " "
If C$ = Chr$(218) Then C$ = "A"
If C$ = Chr$(187) Then C$ = "B"
If C$ = Chr$(197) Then C$ = "C"
If C$ = Chr$(205) Then C$ = "D"
If C$ = Chr$(210) Then C$ = "E"
If C$ = Chr$(204) Then C$ = "F"
If C$ = Chr$(179) Then C$ = "G"
If C$ = Chr$(192) Then C$ = "H"
If C$ = Chr$(180) Then C$ = "I"
If C$ = Chr$(203) Then C$ = "J"
If C$ = Chr$(215) Then C$ = "K"
If C$ = Chr$(206) Then C$ = "L"
If C$ = Chr$(189) Then C$ = "M"
If C$ = Chr$(202) Then C$ = "N"
If C$ = Chr$(212) Then C$ = "O"
If C$ = Chr$(183) Then C$ = "P"
If C$ = Chr$(188) Then C$ = "Q"
If C$ = Chr$(217) Then C$ = "R"
If C$ = Chr$(199) Then C$ = "S"
If C$ = Chr$(194) Then C$ = "T"
If C$ = Chr$(181) Then C$ = "U"
If C$ = Chr$(185) Then C$ = "V"
If C$ = Chr$(184) Then C$ = "W"
If C$ = Chr$(208) Then C$ = "X"
If C$ = Chr$(216) Then C$ = "Y"
If C$ = Chr$(207) Then C$ = "Z"
If C$ = Chr$(209) Then C$ = "0"
If C$ = Chr$(211) Then C$ = "1"
If C$ = Chr$(213) Then C$ = "2"
If C$ = Chr$(214) Then C$ = "3"
If C$ = Chr$(182) Then C$ = "4"
If C$ = Chr$(186) Then C$ = "5"
If C$ = Chr$(190) Then C$ = "6"
If C$ = Chr$(201) Then C$ = "7"
If C$ = Chr$(196) Then C$ = "8"
If C$ = Chr$(195) Then C$ = "9"
If C$ = Chr$(169) Then C$ = "&"
If C$ = Chr$(198) Then C$ = "#"
If C$ = Chr$(244) Then C$ = "["
If C$ = Chr$(245) Then C$ = "]"
If C$ = Chr$(200) Then C$ = "$"
If C$ = Chr$(191) Then C$ = "!"
If C$ = Chr$(168) Then C$ = "%"
If C$ = Chr$(247) Then C$ = ";"
If C$ = Chr$(229) Then C$ = "^"
If C$ = Chr$(227) Then C$ = "."
If C$ = Chr$(225) Then C$ = ","
If C$ = Chr$(231) Then C$ = ":"
If C$ = Chr$(234) Then C$ = "/"
If C$ = Chr$(173) Then C$ = "("
If C$ = Chr$(171) Then C$ = ")"
If C$ = Chr$(246) Then C$ = "="
If C$ = Chr$(232) Then C$ = "+"
If C$ = Chr$(228) Then C$ = Chr$(34)
If C$ = Chr$(221) Then C$ = "\"
If C$ = Chr$(238) Then C$ = "<"
If C$ = Chr$(239) Then C$ = ">"
If C$ = Chr$(224) Then C$ = "?"
If C$ = Chr$(170) Then C$ = "*"
If C$ = Chr$(193) Then C$ = "@"
If C$ = Chr$(172) Then C$ = "-"
If C$ = Chr$(240) Then C$ = "_"
If C$ = Chr$(237) Then C$ = "'"
Return
CHANGEWORDSTOCHARACTERS:
If C$ = "" Then C$ = Chr$(250)
If C$ = " " Then C$ = Chr$(32)
If C$ = "A" Then C$ = Chr$(218)
If C$ = "B" Then C$ = Chr$(187)
If C$ = "C" Then C$ = Chr$(197)
If C$ = "D" Then C$ = Chr$(205)
If C$ = "E" Then C$ = Chr$(210)
If C$ = "F" Then C$ = Chr$(204)
If C$ = "G" Then C$ = Chr$(179)
If C$ = "H" Then C$ = Chr$(192)
If C$ = "I" Then C$ = Chr$(180)
If C$ = "J" Then C$ = Chr$(203)
If C$ = "K" Then C$ = Chr$(215)
If C$ = "L" Then C$ = Chr$(206)
If C$ = "M" Then C$ = Chr$(189)
If C$ = "N" Then C$ = Chr$(202)
If C$ = "O" Then C$ = Chr$(212)
If C$ = "P" Then C$ = Chr$(183)
If C$ = "Q" Then C$ = Chr$(188)
If C$ = "R" Then C$ = Chr$(217)
If C$ = "S" Then C$ = Chr$(199)
If C$ = "T" Then C$ = Chr$(194)
If C$ = "U" Then C$ = Chr$(181)
If C$ = "V" Then C$ = Chr$(185)
If C$ = "W" Then C$ = Chr$(184)
If C$ = "X" Then C$ = Chr$(208)
If C$ = "Y" Then C$ = Chr$(216)
If C$ = "Z" Then C$ = Chr$(207)
If C$ = "0" Then C$ = Chr$(209)
If C$ = "1" Then C$ = Chr$(211)
If C$ = "2" Then C$ = Chr$(213)
If C$ = "3" Then C$ = Chr$(214)
If C$ = "4" Then C$ = Chr$(182)
If C$ = "5" Then C$ = Chr$(186)
If C$ = "6" Then C$ = Chr$(190)
If C$ = "7" Then C$ = Chr$(201)
If C$ = "8" Then C$ = Chr$(196)
If C$ = "9" Then C$ = Chr$(195)
If C$ = "&" Then C$ = Chr$(169)
If C$ = "#" Then C$ = Chr$(198)
If C$ = "[" Then C$ = Chr$(244)
If C$ = "]" Then C$ = Chr$(245)
If C$ = "$" Then C$ = Chr$(200)
If C$ = "!" Then C$ = Chr$(191)
If C$ = "%" Then C$ = Chr$(168)
If C$ = ";" Then C$ = Chr$(247)
If C$ = "^" Then C$ = Chr$(229)
If C$ = "." Then C$ = Chr$(227)
If C$ = "," Then C$ = Chr$(225)
If C$ = ":" Then C$ = Chr$(231)
If C$ = "/" Then C$ = Chr$(234)
If C$ = "(" Then C$ = Chr$(173)
If C$ = ")" Then C$ = Chr$(171)
If C$ = "=" Then C$ = Chr$(246)
If C$ = "+" Then C$ = Chr$(232)
If C$ = Chr$(34) Then C$ = Chr$(228)
If C$ = "\" Then C$ = Chr$(221)
If C$ = "<" Then C$ = Chr$(238)
If C$ = ">" Then C$ = Chr$(239)
If C$ = "?" Then C$ = Chr$(224)
If C$ = "*" Then C$ = Chr$(170)
If C$ = "@" Then C$ = Chr$(193)
If C$ = "-" Then C$ = Chr$(172)
If C$ = "_" Then C$ = Chr$(240)
If C$ = "'" Then C$ = Chr$(237)
Return
W:
If h = 1 And v = 1 Then C = C + 1
If C = 16 Then C = 1
Locate v, h: Color C: Print Chr$(219)
If h = 1 And v = 1 Then Locate 1, 1: Print Chr$(201)
If v = 1 And h = 80 Then Locate 1, 80: Print Chr$(187)
If v = 23 And h = 80 Then Locate 23, 80: Print Chr$(188)
If v = 22 And h = 1 Then Locate 23, 1: Print Chr$(200)
If h > 1 And h < 80 Then Locate v, h: Print Chr$(205)
If v > 1 And v < 23 Then Locate v, h: Print Chr$(186)
If hm = 1 Then h = h + 1
If h = 81 Then hm = 0: vm = 1: h = 80
If vm = 1 Then v = v + 1
If v = 24 Then vm = 0: hm = 2: v = 23
If hm = 2 Then h = h - 1
If h = 1 And v = 23 Then hm = 0: vm = 2
If vm = 2 Then v = v - 1
If v = 1 Then vm = 0: hm = 1
Return
THATIT:
SKIP = 1
Resume Next
E:
SKIP = 2
Resume Next
listing:
For B = 1 To 15: T$(B) = "": D$(B) = "": DE$(B) = "": n$(B) = "": Next B
Locate 4, 70: Color 29: Print "WORKING"
fil = LISTS - 1
For B = 1 To number
    fil = fil + 1
    If fil = reading + 1 Then GoTo SKIP5:
    fil$ = String$(5 - Len(LTrim$(Str$((fil)))), "0") + LTrim$(Str$(fil))
    F$ = TT$ + fil$ + ".LOG"
    Open F$ For Input As #1
    Input #1, D$(B)
    Input #1, T$(B)
    Input #1, DE$(B)
    Close #1
Next B
SKIP5:
For AAA = 1 To number
    q$ = ""
    For B = 1 To Len(D$(AAA))
        C$ = Mid$(D$(AAA), B, 1)
        GoSub CHANGECHARACTERSTOWORDS:
        q$ = q$ + C$
    Next B
    D$(AAA) = q$
    q$ = ""
    For B = 1 To Len(T$(AAA))
        C$ = Mid$(T$(AAA), B, 1)
        GoSub CHANGECHARACTERSTOWORDS:
        q$ = q$ + C$
    Next B
    T$(AAA) = q$
    q$ = ""
    For B = 1 To Len(DE$(AAA))
        C$ = Mid$(DE$(AAA), B, 1)
        GoSub CHANGECHARACTERSTOWORDS:
        q$ = q$ + C$
    Next B
    DE$(AAA) = q$
Next AAA
fil = LISTS - 1
For B = 1 To number
    fil = fil + 1
    If fil = reading + 1 Then GoTo skip6:
    n$(B) = String$(5 - Len(LTrim$(Str$((fil)))), "0") + LTrim$(Str$(fil))
Next B
skip6:
For B = 1 To 15: Color 0, 0: Locate B + 5, 2: Print String$(78, " "): Next B
For B = 1 To number
    Color 10: Locate 5 + B, 2: Print n$(B); Tab(15); DE$(B); Tab(45); D$(B); Tab(60); T$(B)
Next B
Locate 4, 70: Print String$(9, " ")
Return
reading:
readfile = LISTS + Z - 1
readfile$ = String$(5 - Len(LTrim$(Str$((readfile)))), "0") + LTrim$(Str$(readfile))
Cls
Locate 2, 2: Color 31: Print "You are reading..."
Locate 3, 2: Color 14: Print String$(78, 196)
F$ = TT$ + readfile$ + ".LOG"
Open F$ For Input As #1
Input #1, D$
Input #1, T$
Input #1, DE$
For B = 1 To 10
    Input #1, l$(B)
Next B
Close #1
q$ = ""
For B = 1 To Len(D$)
    C$ = Mid$(D$, B, 1)
    GoSub CHANGECHARACTERSTOWORDS:
    q$ = q$ + C$
Next B
D$ = q$
q$ = ""
For B = 1 To Len(T$)
    C$ = Mid$(T$, B, 1)
    GoSub CHANGECHARACTERSTOWORDS:
    q$ = q$ + C$
Next B
T$ = q$
q$ = ""
For B = 1 To Len(DE$)
    C$ = Mid$(DE$, B, 1)
    GoSub CHANGECHARACTERSTOWORDS:
    q$ = q$ + C$
Next B
DE$ = q$
Color 11: Locate 4, 2: Print readfile$; Tab(15); DE$; Tab(45); D$; Tab(60); T$
For B = 1 To 10
    P$ = ""
    For X = 1 To 78
        C$ = Mid$(l$(B), X, 1)
        GoSub CHANGECHARACTERSTOWORDS:
        P$ = P$ + C$
    Next X
    l$(B) = P$
Next B
Color 14: Locate 5, 2: Print String$(78, 196)
Locate 16, 2: Print String$(78, 196)
Color 7
' Print l$ to readfile$ + ".TXT"
Open F$ For Input As #1
For B = 1 To 10
    Locate B + 5, 2: Print l$(B)
Next B
Locate 20, 2: Color 31: Print "PRESS "; Chr$(34); "ESC"; Chr$(34); " TO BACK UP"
Do
    'gosub w:

    ' Automate "ESC" to continue reading logs.
    K$ = InKey$
    K$ = Chr$(27)
Loop Until K$ = Chr$(27)
Cls
GoSub listing:
Return
