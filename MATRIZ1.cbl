      ******************************************************************
      * Author: Andre Costa'
      * Date: 11/04/2021
      * Purpose: Mostrar Matrizes - Matriz Bidimensional nao indexada
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOMM.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 MATRIZ-1.
          03 LINHAS             OCCURS 3 TIMES.
             05 LINHA           PIC X(06)  VALUE ' LINHA'.
             05 COLUNAS         OCCURS 5 TIMES.
                07 CELULA       PIC X(07)  VALUE ' CELULA'.
                
       77 IND-LIN               PIC 99.
       77 IND-COL               PIC 99.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'MATRIZ SIMPLES (BIDIMENSIONAL): ' MATRIZ-1
            
            PERFORM VARYING IND-LIN FROM 1 BY 1 UNTIL IND-LIN > 3
                 PERFORM VARYING IND-COL FROM 1 BY 1 UNTIL IND-COL > 5
                     DISPLAY CELULA(IND-LIN,IND-COL) ' ' 
                     IND-LIN ':'  IND-COL
                 END-PERFORM
            END-PERFORM
            
            STOP RUN.

       END PROGRAM PROGCOMM.
