      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 29/04/2021
      * Purpose: AULA DEMONSTRATIVA DE ESTRUTURAS DE DECISAO COMBINADAS
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMANDOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MES          PIC 99 VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'INFORME UM NUMERO DE MES: '
            ACCEPT WS-MES

            IF WS-MES NOT IS NUMERIC THEN
               DISPLAY 'ERRO - INFORME UM NUMERO.'
               PERFORM P900-FIM
            ELSE
               EVALUATE TRUE
                    WHEN WS-MES = 01
                        DISPLAY 'JANEIRO'
                    WHEN WS-MES = 02
                        DISPLAY 'FEVEREIRO'
                    WHEN WS-MES = 03
                        DISPLAY 'MARCO'
                    WHEN WS-MES = 04
                        DISPLAY 'ABRIL'
                    WHEN OTHER
                        IF WS-MES > 12 OR WS-MES <= 0 THEN
                           DISPLAY 'ESSE NUMERO DE MES NAO EXISTE!'
                        ELSE
                           DISPLAY 'MES FORA DO RANGE.'
                        END-IF
               END-EVALUATE
            END-IF
            .
       P900-FIM.
            STOP RUN.
       END PROGRAM COMANDOS.
