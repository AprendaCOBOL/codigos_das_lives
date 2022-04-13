      ******************************************************************
      * Author: Andre Costa'
      * Date: 11/04/2021
      * Purpose: Mostrar Matrizes - Matriz Bidimensional Indexada
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOMM.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 MATRIZ-1.
          03 LINHAS             OCCURS 3 TIMES INDEXED BY I.
             05 LINHA           PIC X(06)  VALUE ' LINHA'.
             05 COLUNAS         OCCURS 5 TIMES INDEXED BY J.
                07 CELULA       PIC X(07)  VALUE ' CELULA'.
                
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'MATRIZ BIDIMENSIONAL INDEXADA: ' MATRIZ-1
            
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
                 PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5
                     DISPLAY CELULA(I,J) ' ' I ':' J
                 END-PERFORM
            END-PERFORM
            
            STOP RUN.

       END PROGRAM PROGCOMM.
