      ******************************************************************
      * Author: Andre Costa'
      * Date: 11/04/2021
      * Purpose: Mostrar Matrizes - busca por chave
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOMM.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-TABELA.
          03 WS-REGISTRO  OCCURS 4 TIMES 
                          ASCENDING KEY IS WS-CHAVE INDEXED BY I.
          05 WS-CHAVE               PIC 99.
          05 WS-NOME                PIC X(06).
                
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE '01MARCOS02CARLOS03MARINA04ANA   ' TO WS-TABELA
            DISPLAY WS-TABELA
            
            SEARCH ALL WS-REGISTRO
               AT END 
                  DISPLAY 'DADO NAO ENCONTRATO'
               WHEN WS-CHAVE(I)=03
               DISPLAY 'DADO ENCONTRADO: '
                       WS-CHAVE(I) ' - '
                       WS-NOME(I)
                       ' - POSICAO: ' I
            END-SEARCH
            
      *      PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
      *           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5
      *               DISPLAY CELULA(I,J) ' ' I ':' J
      *           END-PERFORM
      *      END-PERFORM
            
            STOP RUN.

       END PROGRAM PROGCOMM.
