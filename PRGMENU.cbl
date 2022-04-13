      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 29/07/2021
      * Purpose: APRESENTAR A LINKAGE SECTION
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGMENU.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VAR.
           03 WS-N1                   PIC 99V99.
           03 WS-N2                   PIC 99V99.
           03 WS-RESULT               PIC 99V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY "PROGRAMA DE MENU"

            INITIALIZE WS-VAR

            DISPLAY 'INFORME O PRIMEIRO NUMERO: '
            ACCEPT WS-N1

            DISPLAY 'INFORME O ULTIMO NUMERO: '
            ACCEPT WS-N2

            CALL 'C:\CursoCOBOL\COBOL\01 - Basico\bin\PRGCALC'
                                             USING WS-VAR

            DISPLAY WS-RESULT

            DISPLAY 'PROCESSAMENTO ENCERRADO.'

            STOP RUN.
       END PROGRAM PRGMENU.
