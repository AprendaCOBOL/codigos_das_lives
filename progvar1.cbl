      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 07/04/2022
      * Purpose: APRESENTAR O FUNCINAMENTO DE VARIAVEIS
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGVAR1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DADOS.
          03 WS-NM-ALUNO      PIC X(15).
          03 WS-NOTAS.
             05 WS-NOTA-1     PIC 9(02)V99.
             05 WS-NOTA-2     PIC 9(02)V99.
             05 WS-NOTA-3     PIC 9(02)V99.
             05 WS-NOTA-4     PIC 9(02)V99.
          03 WS-RESULTADO     PIC 9(02)V99.
       77 WS-MEDIA            PIC 9(02)V99 VALUE 7.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY "INFORME O NOME DO ALUNO: "
            ACCEPT WS-NM-ALUNO

            DISPLAY "INFORME A NOTA 1: "
            ACCEPT WS-NOTA-1

            DISPLAY "INFORME A NOTA 2: "
            ACCEPT WS-NOTA-2

            DISPLAY "INFORME A NOTA 3: "
            ACCEPT WS-NOTA-3

            DISPLAY "INFORME A NOTA 4: "
            ACCEPT WS-NOTA-4

            COMPUTE WS-RESULTADO = (WS-NOTA-1 + WS-NOTA-2 +
                                    WS-NOTA-3 + WS-NOTA-4) / 4

            IF WS-RESULTADO >= WS-MEDIA THEN
               DISPLAY "O ALUNO " WS-NM-ALUNO
                       " FOI APROVADO COM MEDIA "
                       WS-RESULTADO
            ELSE
               DISPLAY "O ALUNO " WS-NM-ALUNO
                       " FOI REPROVADO COM MEDIA "
                       WS-RESULTADO
            END-IF

            STOP RUN.

       END PROGRAM PROGVAR1.
