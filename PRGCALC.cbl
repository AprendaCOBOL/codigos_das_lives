      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 29/07/2021
      * Purpose: APRESENTAR A LIKAGE SECTION
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGCALC.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 WS-VAR.
           03 WS-N1                   PIC 99V99.
           03 WS-N2                   PIC 99V99.
           03 WS-RESULT               PIC 99V99.
       PROCEDURE DIVISION USING WS-VAR.
       MAIN-PROCEDURE.
            DISPLAY "ENTROU NO PROGRAMA DE CALCULO"

            COMPUTE WS-RESULT = WS-N1 + WS-N2

            GOBACK
            .
       END PROGRAM PRGCALC.
