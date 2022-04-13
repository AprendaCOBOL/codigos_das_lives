      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTE1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VAR.
           03 WS-N1          PIC 99V99.
           03 WS-N2          PIC 99V99.
           03 WS-RESULT      PIC 99V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "TESTE 1"

            DISPLAY 'DIGITE UM NUMERO: '
            ACCEPT WS-N1

            DISPLAY 'DIGITE OUTRO NUMERO: '
            ACCEPT WS-N2

            CALL 'C:\CursoCOBOL\COBOL\01 - Basico\bin\TESTE2'
                USING WS-VAR

            DISPLAY 'RESULTADO: ' WS-RESULT

            STOP RUN.
       END PROGRAM TESTE1.
