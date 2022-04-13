      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 05/08/2021
      * Purpose: DEMONSTRAR O COMANDO COPY
      * ****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGRLAYOUT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       COPY BOOKLOUT.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 5    TO WS-VAR-1
            MOVE 'A'  TO WS-VAR-2

            DISPLAY 'WS-VAR-1: ' WS-VAR-1
            DISPLAY 'WS-VAR-2: ' WS-VAR-2

            STOP RUN.
       END PROGRAM PGRLAYOUT.
