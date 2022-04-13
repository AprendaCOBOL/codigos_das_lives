      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 21/01/2021
      * Purpose: DECIDIR SE UM ALUNO FOI APROVADO
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGEXE002.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-NOTA-1        PIC 9(02)V99 VALUE ZEROS.
       01 WS-NOTA-2        PIC 9(02)V99 VALUE ZEROS.
       01 WS-NOTA-3        PIC 9(02)V99 VALUE ZEROS.
       01 WS-NOTA-4        PIC 9(02)V99 VALUE ZEROS.
       01 WS-MEDIA         PIC 9(02)V99 VALUE ZEROS.
       01 WS-NOME-ALUNO    PIC X(30)    VALUE SPACES.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "ESTE PROGRAMA VERIFICA APROVACAO DE UM ALUNO"
           DISPLAY "INFORME O NOME DO ALUNO: "
           ACCEPT WS-NOME-ALUNO
           DISPLAY "INFORME A NOTA 1: "
           ACCEPT WS-NOTA-1
           DISPLAY "INFORME A NOTA 2: "
           ACCEPT WS-NOTA-2
           DISPLAY "INFORME A NOTA 3: "
           ACCEPT WS-NOTA-3
           DISPLAY "INFORME A NOTA 4: "
           ACCEPT WS-NOTA-4

           COMPUTE WS-MEDIA = (WS-NOTA-1 + WS-NOTA-2 +
                               WS-NOTA-3 + WS-NOTA-4)/4

           IF WS-MEDIA >= 7 THEN
              DISPLAY "O ALUNO " WS-NOME-ALUNO
                      " FOI APROVADO COM MEDIA " WS-MEDIA
           ELSE
              DISPLAY "O ALUNO " WS-NOME-ALUNO
                      " FOI REPROVADO COM MEDIA " WS-MEDIA
           END-IF

           STOP RUN.
       END PROGRAM PGEXE002.
