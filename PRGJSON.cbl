      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGJSON.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

      ***** EXEMPLO DE JSON  *****
       01  WS-REGISTRO.
          03 WS-REG-1            PIC X(100) OCCURS 1000 TIMES.
       01  JTEXT        NATIONAL PIC N(2000).
       01  I                     PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            JSON GENERATE JTEXT FROM DADOS COUNT I
                 ON EXCEPTION
                    DISPLAY 'ERRO NA CONVERSAO JSON' JSON-CODE
                 NOT ON EXCEPTION
                    DISPLAY 'JSON CRIADO'
                    DISPLAY JTEXT(1:I)
                    DISPLAY FUNCTION DISPLAY-OF(JTEXT(1:I))
                    DISPLAY 'VALOR DO COUNTER' I
            END-JSON.

            STOP RUN.
       END PROGRAM PRGJSON.
