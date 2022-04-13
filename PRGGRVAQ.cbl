      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 22/04/2021
      * Purpose: GRAVAR UM ARQUIVO SEQUENCIAL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGGRAVAQ.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTE ASSIGN TO
           'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\CLIENTE.TXT'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTE.
       01 REG-CLIENTE.
           03 CD-CLIENTE           PIC 9(03).
           03 NM-CLIENTE           PIC X(20).
           03 TL-CLIENTE           PIC X(09).

       WORKING-STORAGE SECTION.
       77 WS-FS                    PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY '-----  CADASTRO DE CLIENTE -----'
            SET WS-FS              TO 0.

            OPEN EXTEND CLIENTE

            IF WS-FS EQUAL 35 THEN
               OPEN OUTPUT CLIENTE
            END-IF

            IF WS-FS EQUAL ZEROS
               DISPLAY 'INFORME O CODIGO DO CLIENTE: '
               ACCEPT CD-CLIENTE
               DISPLAY 'INFORME O NOME DO CLIENTE: '
               ACCEPT NM-CLIENTE
               DISPLAY 'INFORME O TELEFONE DO CLIENTE: '
               ACCEPT TL-CLIENTE
               WRITE  REG-CLIENTE
               IF WS-FS NOT EQUAL ZEROS
                  DISPLAY 'NAO FOI POSSIVEL GRAVAR O REGISTRO.'
                  DISPLAY 'FILE STATUS: ' WS-FS
               ELSE
                  DISPLAY 'REGISTRO GRAVADO COM SUCESSO!'
               END-IF
            ELSE
               DISPLAY 'ERRO AO CRIAR O ARQUIVO!'
               DISPLAY 'FILE STATUS: ' WS-FS
            END-IF

            CLOSE CLIENTE

            STOP RUN.
       END PROGRAM PRGGRAVAQ.
