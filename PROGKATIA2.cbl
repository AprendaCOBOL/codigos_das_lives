      ******************************************************************
      * Author: LUCIANA BECCARO
      * Date: 20 DE JULHO DE 2021
      * Purpose: DESAFIO MODULO 2 - COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIO_MODULO_2_V1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WS-VARIAVEIS.
          03 WS-NOME-ALUNO                 PIC X(20).
          03 WS-MATERIA                    PIC X(20).
          03 WS-NOTA-1                     PIC 9(02) VALUE ZEROS.
          03 WS-NOTA-2                     PIC 9(02) VALUE ZEROS.
          03 WS-NOTA-3                     PIC 9(02) VALUE ZEROS.
          03 WS-NOTA-4                     PIC 9(02) VALUE ZEROS.
          03 WS-RESULT                     PIC 9(02) VALUE ZEROS.
       77 WS-STATUS                        PIC X.

       PROCEDURE DIVISION.
       P001-INICIO.

           PERFORM P100-CALC
           PERFORM P999-FIM
           .
       P100-CALC.

           INITIALIZE WS-VARIAVEIS

           DISPLAY 'DIGITE O NOME DO ALUNO: '
           ACCEPT WS-NOME-ALUNO

           DISPLAY 'DIGITE MATERIA: '
           ACCEPT WS-MATERIA

           DISPLAY 'DIGITE NOTA 1: '
           ACCEPT WS-NOTA-1

           DISPLAY 'DIGITE NOTA 2: '
           ACCEPT WS-NOTA-2

           DISPLAY 'DIGITE NOTA 3: '
           ACCEPT WS-NOTA-3

           DISPLAY 'DIGITE NOTA 4: '
           ACCEPT WS-NOTA-4

           COMPUTE WS-RESULT = (WS-NOTA-1 + WS-NOTA-2 + WS-NOTA-3
           + WS-NOTA-4)/4
           ON SIZE ERROR PERFORM P800-ERRO
           END-COMPUTE

           DISPLAY 'A MEDIA DAS NOTAS EH: ' WS-RESULT
           .

       P800-ERRO.

       P999-FIM.

           IF WS-RESULT >= 7
              DISPLAY 'APROVADO'
           ELSE
              DISPLAY 'REPROVADO'
           END-IF

           DISPLAY
           'TECLE <C> PARA CONTINUAR OU QUALQUER TECLA PARA SAIR: '
           ACCEPT WS-STATUS

           IF WS-STATUS EQUAL 'S' OR 's' THEN
              DISPLAY 'TENHA UM BOM DIA!'
           ELSE
              PERFORM P100-CALC
           END-IF

           STOP RUN.

           END PROGRAM DESAFIO_MODULO_2_V1.
