      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 24/06/2021
      * Purpose: TRABALHANDO COM CONSTANTES E BOOLEANS
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGNV882.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.


       01 WS-REGISTRO.
          03 FILLER               PIC X(10) VALUE 'ANDRE     '.
          03 FILLER               PIC X     VALUE 'S'.
          03 FILLER               PIC 9     VALUE 2.

       01 WS-REG.
          03 WS-NOME            PIC X(10).
          03 WS-BRASILEIRA      PIC X.
             88 WS-BRASIL-OK    VALUE 'S' FALSE 'N'.
          03 WS-CAMBIO          PIC 9.
             88 WS-TP-CAMBIO    VALUE 1 THRU 3.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'INFORME O NOME DO OPERADOR: '
            ACCEPT  WS-NOME
            DISPLAY 'CIDADAO BRASILEIRO? <S> OU <N>'
            ACCEPT  WS-BRASILEIRA
            DISPLAY 'INFORME A MOEDA DE OPERACAO: '
            DISPLAY '1 - REAL BRASILEIRO'
            DISPLAY '2 - DOLAR AMERICANO'
            DISPLAY '3 - EURO'
            ACCEPT  WS-CAMBIO

            MOVE 'JOHN      N2'   TO WS-REGISTRO
            MOVE WS-REGISTRO      TO WS-REG

            DISPLAY 'RESULTADOS: '
            DISPLAY 'OPERADOR: ' WS-NOME

            IF WS-BRASIL-OK THEN
               DISPLAY 'CIDADAO BRASILEIRO'
            ELSE
               DISPLAY 'CIDADAO NAO BRASILEIRO'
            END-IF

            EVALUATE WS-CAMBIO
               WHEN 1
                  DISPLAY 'MOEDA = REAL BRASILEIRO'
               WHEN 2
                  DISPLAY 'MOEDA = DOLAR AMERICANO'
               WHEN 3
                  DISPLAY 'MOEDA = EURO'
               WHEN OTHER
                  DISPLAY 'MOEDA INVALIDA'
            END-EVALUATE

            STOP RUN.
       END PROGRAM PRGNV882.
