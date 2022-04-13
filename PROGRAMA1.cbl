      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-DADO       PIC X(10).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'DIGITE UM DADO: '
            ACCEPT WS-DADO
            DISPLAY 'DADO DIGITADO: ' WS-DADO
            STOP RUN.
       END PROGRAM PROGRAMA1.
