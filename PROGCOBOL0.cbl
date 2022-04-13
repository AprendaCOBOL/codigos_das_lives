           IDENTIFICATION DIVISION.
           PROGRAM-ID. PROGCOBOL0.
           ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
           INPUT-OUTPUT SECTION.
           DATA DIVISION.
           FILE SECTION.
           WORKING-STORAGE SECTION.
           77 WS-MOSTRA        PIC X(20) VALUE SPACES.
           LINKAGE SECTION.
           SCREEN SECTION.
           PROCEDURE DIVISION.
      *-------------------- PRIMEIRA SESSAO ---------------------------*
           MAIN-PROC SECTION.
      *------------ PARAGRAFOS DA PRIMEIRA SESSAO ---------------------*
           S001-PROC1.
               MOVE 'S001-PROC1'       TO WS-MOSTRA
               DISPLAY WS-MOSTRA
               PERFORM SEC-PROC.

           S001-PROC2.
               MOVE 'S001-PROC2'       TO WS-MOSTRA
               DISPLAY WS-MOSTRA
               PERFORM SEC-PROC.

           S001-PROC3.
               IF WS-MOSTRA NOT EQUAL 'S002-PROC3' THEN
                  MOVE 'S001-PROC3'       TO WS-MOSTRA
                  DISPLAY WS-MOSTRA
                  PERFORM S002-PROC3
               ELSE
                  PERFORM FIM-PROC
               END-IF.

      *--------------------- SEGUNDA SESSAO ---------------------------*
           SEC-PROC  SECTION.
      *------------- PARAGRAFOS DA SEGUNDA SESSAO ---------------------*
           S002-PROC1.
               IF WS-MOSTRA NOT EQUAL 'S001-PROC2' THEN
                  MOVE 'S002-PROC1'       TO WS-MOSTRA
                  DISPLAY WS-MOSTRA
                  PERFORM S001-PROC2
               END-IF.

           S002-PROC2.
               MOVE 'S002-PROC2'       TO WS-MOSTRA
               DISPLAY WS-MOSTRA
               PERFORM S001-PROC3.

           S002-PROC3.
               MOVE 'S002-PROC3'       TO WS-MOSTRA
               DISPLAY WS-MOSTRA
               PERFORM S001-PROC3.

      *--------------------- SESSAO DE FINALIZACAO --------------------*
           FIM-PROC SECTION.
               MOVE 'FIM-PROC'       TO WS-MOSTRA
               DISPLAY WS-MOSTRA
               STOP RUN.

           END PROGRAM PROGCOBOL0.
