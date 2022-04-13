       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGCOBOL1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-TRIMESTRE-1      PIC X(15).
           88 WS-MES-1         VALUE 'JANEIRO'.
           88 WS-MES-2         VALUE 'FEVEIRO'.
           88 WS-MES-3         VALUE 'MARCO'.
       77  WS-INFORME          PIC X(15).
       01  WS-NOME.
           03 WS-PRIM-NOME     PIC X(15) VALUE "ANDRE".
           03 WS-SOBRENOME     PIC X(15).

       PROCEDURE DIVISION.
           DISPLAY "INFORME UM NOME: "
           ACCEPT WS-INFORME

           IF WS-INFORME EQUAL WS-PRIM-NOME THEN
              DISPLAY "O NOME INFORMADO " WS-INFORME
                      " EH IGUAL AO NOME ESPERADO"
           ELSE
              DISPLAY "O NOME INFORMADO " WS-INFORME
                      " EH DIFERENTE DE " WS-PRIM-NOME
           END-IF

           STOP RUN.
