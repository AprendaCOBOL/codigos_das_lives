       Identification Division.
       Program-Id. TSCREEN.
       Data Division.
       Working-Storage Section.

       01  AAAA PIC XXXXX  VALUE "   ".
       01  i PIC 99.
       01  j PIC 99.
       01  ll PIC 99.
       01  cc PIC 99.
       01  r1c1.
           05 r1   PIC 99 VALUE 01.
           05 c1   PIC 99 VALUE 01.
       01  r2c2.
           05 r2   PIC 99 VALUE 25.
           05 c2   PIC 99 VALUE 80.
       01  bco  PIC 9 VALUE 0.
       Linkage Section.


      *> **************************************************************
      *>           P R O C E D U R E   D I V I S I O N
      *> **************************************************************
       PROCEDURE DIVISION.
           move "0415" to r1c1
           move "1248" to r2c2
           move 04 to bco

           perform varying i from r1 by 1 until i > r2
             perform varying j from c1 by 1 until j > c2
               display " " AT LINE i COL j with background-color bco
                       end-display
             end-perform
             *> CALL "C$SLEEP" using 1 END-CALL
           end-perform

           accept  AAAA at 2001 WITH PROMPT.

           *> call "CBL_OC_DUMP" using cstruct ON EXCEPTION CONTINUE end-call

           *> display "11111111111111111111111111111111111111111111111111111111111111111111111111111111"   AT 0101
           *> display "22222222222222222222222222222222222222222222222222222222222222222222222222222222"   AT 0201
           *> display "33333333333333333333333333333333333333333333333333333333333333333333333333333333"   AT 0301
           *> display "44444444444444444444444444444444444444444444444444444444444444444444444444444444"   AT 0401
           *> display "55555555555555555555555555555555555555555555555555555555555555555555555555555555"   AT 0501
           *> display "66666666666666666666666666666666666666666666666666666666666666666666666666666666"   AT 0601
           *> display "77777777777777777777777777777777777777777777777777777777777777777777777777777777"   AT 0701
           *> display "88888888888888888888888888888888888888888888888888888888888888888888888888888888"   AT 0801
           *> display "99999999999999999999999999999999999999999999999999999999999999999999999999999999"   AT 0901
           *> display "00000000000000000000000000000000000000000000000000000000000000000000000000000000"   AT 1001
           *> display "11111111111111111111111111111111111111111111111111111111111111111111111111111111"   AT 1101
           *> display "22222222222222222222222222222222222222222222222222222222222222222222222222222222"   AT 1201
           *> display "33333333333333333333333333333333333333333333333333333333333333333333333333333333"   AT 1301
           *> accept  AAAA at 2001 WITH PROMPT.
           *> display "----------"   AT 1305 WITH SCROLL UP BY 4 LINES
           *> accept  AAAA at 2001 WITH PROMPT.
           *> display "++++++++++"   AT 1305 WITH SCROLL DOWN BY 2 LINES
           *> accept  AAAA at 2001 WITH PROMPT.
           Goback.
       End-Program.
