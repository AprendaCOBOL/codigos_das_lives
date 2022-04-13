      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTE2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       COPY LAYOUT001.
       LINKAGE SECTION.
       01 WS-VAR.
           03 WS-N1          PIC 99V99.
           03 WS-N2          PIC 99V99.
           03 WS-RESULT      PIC 99V99.
       PROCEDURE DIVISION USING WS-VAR.
       MAIN-PROCEDURE.
            DISPLAY "TESTE 2"

            COMPUTE WS-RESULT = WS-N1 + WS-N2

            GOBACK.
       END PROGRAM TESTE2.
