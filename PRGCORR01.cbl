      ******************************************************************
      * Author: ANDRE COSTA
      * Date:   15/06/2021
      * Purpose: APRESENTAÇÃO DA LINGUAGEM COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGCORR01.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-REG-1.
          03 C-1      PIC X(02).
          03 C-2      PIC 9(02).
          03 C-X      PIC 9.
          03 C-3      PIC 9(04).

       01 WS-REG-2.
          03 C-1      PIC X(02).
          03 C-2      PIC 9(02).
          03 C-3      PIC 9(04).
          03 C-X      PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 'RJ' TO C-1 OF WS-REG-1
            MOVE 10   TO C-2 OF WS-REG-1
            MOVE 5    TO C-X OF WS-REG-1
            MOVE 100  TO C-3 OF WS-REG-1

            MOVE CORR WS-REG-1 TO WS-REG-2

            DISPLAY 'WS-REG-1: '
            DISPLAY C-1 OF WS-REG-1
            DISPLAY C-2 OF WS-REG-1
            DISPLAY C-X OF WS-REG-1
            DISPLAY C-3 OF WS-REG-1

            DISPLAY 'WS-REG-2: '
            DISPLAY C-1 OF WS-REG-2
            DISPLAY C-2 OF WS-REG-2
            DISPLAY C-X OF WS-REG-2
            DISPLAY C-3 OF WS-REG-2

            ADD 2 TO C-2 OF WS-REG-1
            SUBTRACT 10 FROM C-3 OF WS-REG-1

            DISPLAY 'WS-REG-1: '
            DISPLAY C-1 OF WS-REG-1
            DISPLAY C-2 OF WS-REG-1
            DISPLAY C-X OF WS-REG-1
            DISPLAY C-3 OF WS-REG-1

            ADD CORR WS-REG-1 TO WS-REG-2

            DISPLAY 'WS-REG-2: '
            DISPLAY C-1 OF WS-REG-2
            DISPLAY C-2 OF WS-REG-2
            DISPLAY C-X OF WS-REG-2
            DISPLAY C-3 OF WS-REG-2

            MOVE CORR WS-REG-1 TO WS-REG-2

            SUBTRACT CORR WS-REG-1 from  WS-REG-2

            DISPLAY 'WS-REG-2: '
            DISPLAY C-1 OF WS-REG-2
            DISPLAY C-2 OF WS-REG-2
            DISPLAY C-X OF WS-REG-2
            DISPLAY C-3 OF WS-REG-2

            STOP RUN.

       END PROGRAM PRGCORR01.
