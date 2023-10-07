SCREEN 0, 0, 0: WIDTH 80: CLS : BEEP
LOCATE , , , 5
h = 1: v = 1: C = 0: hm = 1: vm = 0: CAP$ = "": l = 1
DIM LIN$(15), CH$(780), l$(10), D$(15), T$(15), DE$(15), DIT$(25), n$(15)
CLS
PRINT "Enter Password, please?"
SKIP2:
TT$ = "F:\GREGOR~1\DIARY.LOG\GREGORY\GDD"
JUMP:
SKIP = 0
CLS
ON ERROR GOTO E:
FOR B = 1 TO 99999
fil = B
fil$ = STRING$(5 - LEN(LTRIM$(STR$((fil)))), "0") + LTRIM$(STR$(fil))
F$ = TT$ + fil$ + ".LOG"
OPEN F$ FOR INPUT AS #1
CLOSE #1
IF SKIP = 2 THEN GOTO T:
NEXT B
T:
COLOR 31: LOCATE 2, 2: PRINT "THIS IS MAIN MENU LOG..."
COLOR 14: LOCATE 3, 2: PRINT STRING$(78, 196)
COLOR 25: LOCATE 4, 2: PRINT "Commands"
COLOR 26: LOCATE 9, 2: PRINT "R"; : COLOR 10: PRINT "ead"; : COLOR 15: PRINT "................... read your own logs"
COLOR 28: LOCATE 13, 2: PRINT "W"; : COLOR 12: PRINT "rite"; : COLOR 15: PRINT ".................. make your own logs"
COLOR 31: LOCATE 17, 2: PRINT "Q"; : COLOR 15: PRINT "uit"; : COLOR 15: PRINT "................... end the program"
COLOR 15: LOCATE 2, 50: PRINT "YOU HAVE"; B - 1; "LOGS"
DO
'gosub w
K$ = INKEY$
K$ = UCASE$(K$)
LOOP UNTIL K$ = "R" OR K$ = "W" OR K$ = "Q"
IF K$ = "Q" THEN END
IF K$ = "R" THEN GOTO READLOG:
IF K$ = "W" THEN GOTO WRITELOG:
GOTO JUMP:
READLOG:
reading = fil - 1
listing = reading
IF reading > 15 THEN
number = 15
listing = 15
ELSE
number = reading
listing = reading
END IF
LISTS = 1: Z = 1
CLS
GOSUB listing:
LOCATE 5 + Z, 2: COLOR 14, 9: PRINT n$(Z); TAB(15); DE$(Z); TAB(45); D$(Z); TAB(60); T$(Z): COLOR 0, 0
RERUN:
COLOR 31: LOCATE 2, 2: PRINT "READING YOUR LOGS"; : COLOR 15: PRINT TAB(55); " YOU HAVE"; reading; "LOGS."
COLOR 14: LOCATE 3, 2: PRINT STRING$(78, 196)
COLOR 11: LOCATE 4, 2: PRINT "LOGS"; TAB(15); "Type of Log"; TAB(45); "Date"; TAB(60); "Time"
COLOR 12: LOCATE 5, 2: PRINT STRING$(78, 196)
COLOR 12: LOCATE 21, 2: PRINT STRING$(78, 196)
COLOR 15: LOCATE 22, 2: PRINT "Press "; CHR$(24); " as up and "; CHR$(25); " as down and Press ENTER to read"; : COLOR 31: PRINT TAB(60); "Press Esc to Quit"
DO
'
IF A$ = CHR$(0) + CHR$(72) THEN Z = Z - 1
IF A$ = CHR$(0) + CHR$(80) THEN Z = Z + 1
IF A$ = CHR$(0) + CHR$(73) THEN Z = 0
IF A$ = CHR$(0) + CHR$(81) THEN Z = 16
IF Z = 0 AND LISTS = 1 THEN Z = 1
IF Z = 0 AND LISTS <> 1 THEN Z = 1: LISTS = LISTS - 15: GOSUB listing
IF Z = reading - LISTS + 2 THEN Z = reading - LISTS + 1
IF Z = 16 THEN
Z = 1
LISTS = LISTS + 15
IF LISTS > reading THEN LISTS = LISTS - 15
GOSUB listing
END IF
IF ok$ = "Y" THEN LOCATE 5 + Z, 2: COLOR 14, 9: PRINT n$(Z); TAB(15); DE$(Z); TAB(45); D$(Z); TAB(60); T$(Z): COLOR 0, 0
ok$ = "N"
A$ = INKEY$
IF A$ = CHR$(0) + CHR$(72) THEN ok$ = "Y"
IF A$ = CHR$(0) + CHR$(80) THEN ok$ = "Y"
IF ok$ = "Y" THEN LOCATE 5 + Z, 2: COLOR 10, 0: PRINT n$(Z); TAB(15); DE$(Z); TAB(45); D$(Z); TAB(60); T$(Z)
COLOR 0, 0
LOOP UNTIL A$ = CHR$(27) OR A$ = CHR$(13)
R$ = "N"
IF A$ = CHR$(13) THEN R$ = "Y": GOSUB reading:
IF R$ = "Y" THEN GOTO RERUN
GOTO JUMP:
WRITELOG:
SKIP = 0
ON ERROR GOTO THATIT:
FOR B = 1 TO 99999
fil = B
fil$ = STRING$(5 - LEN(LTRIM$(STR$((fil)))), "0") + LTRIM$(STR$(fil))
F$ = TT$ + fil$ + ".LOG"
OPEN F$ FOR INPUT AS #1
CLOSE #1
IF SKIP = 1 THEN GOTO SKIP
NEXT B
SKIP:
NEWLOG = B
FOR B = 1 TO 780: CH$(B) = "": NEXT B
T$ = "": D$ = "": DE$ = "": FOR B = 1 TO 25: DI$(B) = "": NEXT B
CLS
COLOR 31: LOCATE 2, 2: PRINT "This is Writing Log"
COLOR 14: LOCATE 3, 2: PRINT STRING$(78, 196)
COLOR 13: LOCATE 4, 2: PRINT "DATE: "; DATE$; TAB(30); "LOG: "; LOG$; TAB(60); "TIME: "; TIME$
COLOR 14: LOCATE 5, 2: PRINT STRING$(78, 196)
COLOR 14: LOCATE 16, 2: PRINT STRING$(78, 196)
LOGS = NEWLOG
NEWLOG$ = STRING$(5 - LEN(LTRIM$(STR$((LOGS)))), "0") + LTRIM$(STR$(LOGS))
LOCATE 22, 2: COLOR 31: PRINT "PRESS ESC TO QUIT"
LOCATE 17, 2: COLOR 15: PRINT "The new log is "; NEWLOG$
LOCATE 18, 2: COLOR 7: PRINT "Accepted Yes, No (Y/N)";
DO:  A$ = INKEY$: A$ = UCASE$(A$): LOOP UNTIL A$ = "Y" OR A$ = "N" OR A$ = CHR$(27)
IF A$ = CHR$(27) THEN GOTO JUMP
IF A$ = "Y" THEN LOG$ = NEWLOG$
IF A$ = "Y" THEN COLOR 13: LOCATE 4, 2: PRINT "DATE: "; DATE$; TAB(30); "LOG: "; LOG$; TAB(60); "TIME: "; TIME$
IF A$ = "N" THEN GOTO JUMP
COLOR 7: LOCATE 17, 2: PRINT "Type your log between the 2 yellow lines"
LOCATE 18, 2: PRINT "Press ESC when you are done"
LOCATE 22, 2: COLOR 31, 0: PRINT STRING$(78, 32)
l = 1: CH = 1
DO
IF A$ = CHR$(0) + CHR$(72) THEN l = l - 1: ok$ = "N"
IF l = 0 THEN l = 10
IF A$ = CHR$(0) + CHR$(80) THEN l = l + 1: ok$ = "N"
IF A$ = CHR$(13) THEN l = l + 1: CH = 1: ok$ = "N"
IF l = 11 THEN l = 1
IF A$ = CHR$(0) + CHR$(75) THEN CH = CH - 1: ok$ = "N"
IF A$ = CHR$(8) THEN CH = CH - 1: ok$ = "N"
IF CH = 0 THEN CH = 78: l = l - 1: IF l = 0 THEN l = 10
IF A$ = CHR$(0) + CHR$(77) THEN CH = CH + 1: ok$ = "N"
IF CH = 79 THEN CH = 1: l = l + 1: IF l = 11 THEN l = 1
IF A$ = CHR$(27) THEN ok$ = "N"
IF l = 79 THEN CH = 1: l = l + 1
IF l = 11 THEN l = 1
IF ok$ = "Y" THEN LOCATE l + 5, CH + 1: COLOR 7: PRINT A$
IF ok$ = "Y" AND A$ <> "" THEN CH$((l - 1) * 78 + CH) = A$
'GOSUB W
IF ok$ = "Y" AND A$ <> "" THEN CH = CH + 1
A$ = INKEY$: ok$ = "Y"
A$ = UCASE$(A$)
LOOP UNTIL A$ = CHR$(27)
LOCATE 22, 2: COLOR 31: PRINT "Press ESC to quit without saving"
LOCATE 17, 2: COLOR 7: PRINT "Enter your description for this whole log, summary it in 25 letters."
LOCATE 18, 2: PRINT "Press ENTER when you are done."
LOCTE = 1
DO
IF ok$ = "OK" THEN LOCTE = LOCTE + 1
ok$ = ""
'GOSUB W
A$ = INKEY$
A$ = UCASE$(A$)
IF A$ <> "" THEN ok$ = "OK"
IF A$ = CHR$(13) THEN ok$ = ""
IF A$ = CHR$(8) THEN LOCTE = LOCTE - 1: ok$ = ""
IF A$ = CHR$(27) THEN ok$ = ""
IF LOCTE < 2 THEN LOCTE = 2
IF LOCTE > 25 THEN LOCTE = 2
LOCATE 20, LOCTE: COLOR 13
IF ok$ = "OK" THEN PRINT A$
IF ok$ = "OK" THEN DIT$(LOCTE - 1) = A$
LOOP UNTIL A$ = CHR$(13) OR A$ = CHR$(27)
IF A$ = CHR$(27) THEN GOTO JUMP
FOR B = 1 TO 25: DE$ = DE$ + DIT$(B): NEXT B
FOR B = 1 TO 780
C$ = CH$(B)
GOSUB CHANGEWORDSTOCHARACTERS:
CH$(B) = C$
NEXT B
FOR B = 1 TO 10: l$(B) = "": NEXT B
q$ = ""
FOR B = 1 TO 10: FOR W = 1 TO 78
l$(B) = l$(B) + CH$(W + ((B - 1) * 78))
NEXT W: NEXT B
F$ = TT$ + LOG$ + ".LOG"
D$ = DATE$: T$ = TIME$
FOR B = 1 TO LEN(D$)
C$ = MID$(D$, B, 1)
GOSUB CHANGEWORDSTOCHARACTERS:
q$ = q$ + C$
NEXT B
D$ = q$
q$ = ""
FOR B = 1 TO LEN(T$)
C$ = MID$(T$, B, 1)
GOSUB CHANGEWORDSTOCHARACTERS:
q$ = q$ + C$
NEXT B
T$ = q$
q$ = ""
FOR B = 1 TO LEN(DE$)
C$ = MID$(DE$, B, 1)
GOSUB CHANGEWORDSTOCHARACTERS:
q$ = q$ + C$
NEXT B
DE$ = q$
OPEN F$ FOR OUTPUT AS #1
PRINT #1, D$
PRINT #1, T$
PRINT #1, DE$
FOR B = 1 TO 10
PRINT #1, l$(B)
NEXT B
CLOSE #1
GOTO JUMP
CHANGECHARACTERSTOWORDS:
IF C$ = CHR$(250) THEN C$ = " "
IF C$ = CHR$(32) THEN C$ = " "
IF C$ = CHR$(218) THEN C$ = "A"
IF C$ = CHR$(187) THEN C$ = "B"
IF C$ = CHR$(197) THEN C$ = "C"
IF C$ = CHR$(205) THEN C$ = "D"
IF C$ = CHR$(210) THEN C$ = "E"
IF C$ = CHR$(204) THEN C$ = "F"
IF C$ = CHR$(179) THEN C$ = "G"
IF C$ = CHR$(192) THEN C$ = "H"
IF C$ = CHR$(180) THEN C$ = "I"
IF C$ = CHR$(203) THEN C$ = "J"
IF C$ = CHR$(215) THEN C$ = "K"
IF C$ = CHR$(206) THEN C$ = "L"
IF C$ = CHR$(189) THEN C$ = "M"
IF C$ = CHR$(202) THEN C$ = "N"
IF C$ = CHR$(212) THEN C$ = "O"
IF C$ = CHR$(183) THEN C$ = "P"
IF C$ = CHR$(188) THEN C$ = "Q"
IF C$ = CHR$(217) THEN C$ = "R"
IF C$ = CHR$(199) THEN C$ = "S"
IF C$ = CHR$(194) THEN C$ = "T"
IF C$ = CHR$(181) THEN C$ = "U"
IF C$ = CHR$(185) THEN C$ = "V"
IF C$ = CHR$(184) THEN C$ = "W"
IF C$ = CHR$(208) THEN C$ = "X"
IF C$ = CHR$(216) THEN C$ = "Y"
IF C$ = CHR$(207) THEN C$ = "Z"
IF C$ = CHR$(209) THEN C$ = "0"
IF C$ = CHR$(211) THEN C$ = "1"
IF C$ = CHR$(213) THEN C$ = "2"
IF C$ = CHR$(214) THEN C$ = "3"
IF C$ = CHR$(182) THEN C$ = "4"
IF C$ = CHR$(186) THEN C$ = "5"
IF C$ = CHR$(190) THEN C$ = "6"
IF C$ = CHR$(201) THEN C$ = "7"
IF C$ = CHR$(196) THEN C$ = "8"
IF C$ = CHR$(195) THEN C$ = "9"
IF C$ = CHR$(169) THEN C$ = "&"
IF C$ = CHR$(198) THEN C$ = "#"
IF C$ = CHR$(244) THEN C$ = "["
IF C$ = CHR$(245) THEN C$ = "]"
IF C$ = CHR$(200) THEN C$ = "$"
IF C$ = CHR$(191) THEN C$ = "!"
IF C$ = CHR$(168) THEN C$ = "%"
IF C$ = CHR$(247) THEN C$ = ";"
IF C$ = CHR$(229) THEN C$ = "^"
IF C$ = CHR$(227) THEN C$ = "."
IF C$ = CHR$(225) THEN C$ = ","
IF C$ = CHR$(231) THEN C$ = ":"
IF C$ = CHR$(234) THEN C$ = "/"
IF C$ = CHR$(173) THEN C$ = "("
IF C$ = CHR$(171) THEN C$ = ")"
IF C$ = CHR$(246) THEN C$ = "="
IF C$ = CHR$(232) THEN C$ = "+"
IF C$ = CHR$(228) THEN C$ = CHR$(34)
IF C$ = CHR$(221) THEN C$ = "\"
IF C$ = CHR$(238) THEN C$ = "<"
IF C$ = CHR$(239) THEN C$ = ">"
IF C$ = CHR$(224) THEN C$ = "?"
IF C$ = CHR$(170) THEN C$ = "*"
IF C$ = CHR$(193) THEN C$ = "@"
IF C$ = CHR$(172) THEN C$ = "-"
IF C$ = CHR$(240) THEN C$ = "_"
IF C$ = CHR$(237) THEN C$ = "'"
RETURN
CHANGEWORDSTOCHARACTERS:
IF C$ = "" THEN C$ = CHR$(250)
IF C$ = " " THEN C$ = CHR$(32)
IF C$ = "A" THEN C$ = CHR$(218)
IF C$ = "B" THEN C$ = CHR$(187)
IF C$ = "C" THEN C$ = CHR$(197)
IF C$ = "D" THEN C$ = CHR$(205)
IF C$ = "E" THEN C$ = CHR$(210)
IF C$ = "F" THEN C$ = CHR$(204)
IF C$ = "G" THEN C$ = CHR$(179)
IF C$ = "H" THEN C$ = CHR$(192)
IF C$ = "I" THEN C$ = CHR$(180)
IF C$ = "J" THEN C$ = CHR$(203)
IF C$ = "K" THEN C$ = CHR$(215)
IF C$ = "L" THEN C$ = CHR$(206)
IF C$ = "M" THEN C$ = CHR$(189)
IF C$ = "N" THEN C$ = CHR$(202)
IF C$ = "O" THEN C$ = CHR$(212)
IF C$ = "P" THEN C$ = CHR$(183)
IF C$ = "Q" THEN C$ = CHR$(188)
IF C$ = "R" THEN C$ = CHR$(217)
IF C$ = "S" THEN C$ = CHR$(199)
IF C$ = "T" THEN C$ = CHR$(194)
IF C$ = "U" THEN C$ = CHR$(181)
IF C$ = "V" THEN C$ = CHR$(185)
IF C$ = "W" THEN C$ = CHR$(184)
IF C$ = "X" THEN C$ = CHR$(208)
IF C$ = "Y" THEN C$ = CHR$(216)
IF C$ = "Z" THEN C$ = CHR$(207)
IF C$ = "0" THEN C$ = CHR$(209)
IF C$ = "1" THEN C$ = CHR$(211)
IF C$ = "2" THEN C$ = CHR$(213)
IF C$ = "3" THEN C$ = CHR$(214)
IF C$ = "4" THEN C$ = CHR$(182)
IF C$ = "5" THEN C$ = CHR$(186)
IF C$ = "6" THEN C$ = CHR$(190)
IF C$ = "7" THEN C$ = CHR$(201)
IF C$ = "8" THEN C$ = CHR$(196)
IF C$ = "9" THEN C$ = CHR$(195)
IF C$ = "&" THEN C$ = CHR$(169)
IF C$ = "#" THEN C$ = CHR$(198)
IF C$ = "[" THEN C$ = CHR$(244)
IF C$ = "]" THEN C$ = CHR$(245)
IF C$ = "$" THEN C$ = CHR$(200)
IF C$ = "!" THEN C$ = CHR$(191)
IF C$ = "%" THEN C$ = CHR$(168)
IF C$ = ";" THEN C$ = CHR$(247)
IF C$ = "^" THEN C$ = CHR$(229)
IF C$ = "." THEN C$ = CHR$(227)
IF C$ = "," THEN C$ = CHR$(225)
IF C$ = ":" THEN C$ = CHR$(231)
IF C$ = "/" THEN C$ = CHR$(234)
IF C$ = "(" THEN C$ = CHR$(173)
IF C$ = ")" THEN C$ = CHR$(171)
IF C$ = "=" THEN C$ = CHR$(246)
IF C$ = "+" THEN C$ = CHR$(232)
IF C$ = CHR$(34) THEN C$ = CHR$(228)
IF C$ = "\" THEN C$ = CHR$(221)
IF C$ = "<" THEN C$ = CHR$(238)
IF C$ = ">" THEN C$ = CHR$(239)
IF C$ = "?" THEN C$ = CHR$(224)
IF C$ = "*" THEN C$ = CHR$(170)
IF C$ = "@" THEN C$ = CHR$(193)
IF C$ = "-" THEN C$ = CHR$(172)
IF C$ = "_" THEN C$ = CHR$(240)
IF C$ = "'" THEN C$ = CHR$(237)
RETURN
W:
IF h = 1 AND v = 1 THEN C = C + 1
IF C = 16 THEN C = 1
LOCATE v, h: COLOR C: PRINT CHR$(219)
IF h = 1 AND v = 1 THEN LOCATE 1, 1: PRINT CHR$(201)
IF v = 1 AND h = 80 THEN LOCATE 1, 80: PRINT CHR$(187)
IF v = 23 AND h = 80 THEN LOCATE 23, 80: PRINT CHR$(188)
IF v = 22 AND h = 1 THEN LOCATE 23, 1: PRINT CHR$(200)
IF h > 1 AND h < 80 THEN LOCATE v, h: PRINT CHR$(205)
IF v > 1 AND v < 23 THEN LOCATE v, h: PRINT CHR$(186)
IF hm = 1 THEN h = h + 1
IF h = 81 THEN hm = 0: vm = 1: h = 80
IF vm = 1 THEN v = v + 1
IF v = 24 THEN vm = 0: hm = 2: v = 23
IF hm = 2 THEN h = h - 1
IF h = 1 AND v = 23 THEN hm = 0: vm = 2
IF vm = 2 THEN v = v - 1
IF v = 1 THEN vm = 0: hm = 1
RETURN
THATIT:
SKIP = 1
RESUME NEXT
E:
SKIP = 2
RESUME NEXT
listing:
FOR B = 1 TO 15: T$(B) = "": D$(B) = "": DE$(B) = "": n$(B) = "": NEXT B
LOCATE 4, 70: COLOR 29: PRINT "WORKING"
fil = LISTS - 1
FOR B = 1 TO number
fil = fil + 1
IF fil = reading + 1 THEN GOTO SKIP5:
fil$ = STRING$(5 - LEN(LTRIM$(STR$((fil)))), "0") + LTRIM$(STR$(fil))
F$ = TT$ + fil$ + ".LOG"
OPEN F$ FOR INPUT AS #1
INPUT #1, D$(B)
INPUT #1, T$(B)
INPUT #1, DE$(B)
CLOSE #1
NEXT B
SKIP5:
FOR AAA = 1 TO number
q$ = ""
FOR B = 1 TO LEN(D$(AAA))
C$ = MID$(D$(AAA), B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
D$(AAA) = q$
q$ = ""
FOR B = 1 TO LEN(T$(AAA))
C$ = MID$(T$(AAA), B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
T$(AAA) = q$
q$ = ""
FOR B = 1 TO LEN(DE$(AAA))
C$ = MID$(DE$(AAA), B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
DE$(AAA) = q$
NEXT AAA
fil = LISTS - 1
FOR B = 1 TO number
fil = fil + 1
IF fil = reading + 1 THEN GOTO skip6:
n$(B) = STRING$(5 - LEN(LTRIM$(STR$((fil)))), "0") + LTRIM$(STR$(fil))
NEXT B
skip6:
FOR B = 1 TO 15: COLOR 0, 0: LOCATE B + 5, 2: PRINT STRING$(78, " "): NEXT B
FOR B = 1 TO number
COLOR 10: LOCATE 5 + B, 2: PRINT n$(B); TAB(15); DE$(B); TAB(45); D$(B); TAB(60); T$(B)
NEXT B
LOCATE 4, 70: PRINT STRING$(9, " ")
RETURN
reading:
readfile = LISTS + Z - 1
readfile$ = STRING$(5 - LEN(LTRIM$(STR$((readfile)))), "0") + LTRIM$(STR$(readfile))
CLS
LOCATE 2, 2: COLOR 31: PRINT "You are reading..."
LOCATE 3, 2: COLOR 14: PRINT STRING$(78, 196)
F$ = TT$ + readfile$ + ".LOG"
OPEN F$ FOR INPUT AS #1
INPUT #1, D$
INPUT #1, T$
INPUT #1, DE$
FOR B = 1 TO 10
INPUT #1, l$(B)
NEXT B
CLOSE #1
q$ = ""
FOR B = 1 TO LEN(D$)
C$ = MID$(D$, B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
D$ = q$
q$ = ""
FOR B = 1 TO LEN(T$)
C$ = MID$(T$, B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
T$ = q$
q$ = ""
FOR B = 1 TO LEN(DE$)
C$ = MID$(DE$, B, 1)
GOSUB CHANGECHARACTERSTOWORDS:
q$ = q$ + C$
NEXT B
DE$ = q$
COLOR 11: LOCATE 4, 2: PRINT readfile$; TAB(15); DE$; TAB(45); D$; TAB(60); T$
FOR B = 1 TO 10
P$ = ""
FOR X = 1 TO 78
C$ = MID$(l$(B), X, 1)
GOSUB CHANGECHARACTERSTOWORDS:
P$ = P$ + C$
NEXT X
l$(B) = P$
NEXT B
COLOR 14: LOCATE 5, 2: PRINT STRING$(78, 196)
LOCATE 16, 2: PRINT STRING$(78, 196)
COLOR 7
FOR B = 1 TO 10
LOCATE B + 5, 2: PRINT l$(B)
NEXT B
LOCATE 20, 2: COLOR 31: PRINT "PRESS "; CHR$(34); "ESC"; CHR$(34); " TO BACK UP"
DO
'gosub w:
LOOP UNTIL INKEY$ = CHR$(27)
CLS
GOSUB listing:
RETURN

