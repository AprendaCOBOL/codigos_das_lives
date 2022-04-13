      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 27/05/2021
      * Purpose: APRESENTAR OPERAÇÕES MATEMÁTICAS NO COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGMATEM.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-NUMEROS.
          03 WS-SOMA                         PIC S9(05)V99.
          03 WS-MULTI                        PIC S9(05)V99.
          03 WS-DIVIDO                       PIC S9(05)V99.
          03 WS-SUBTR                        PIC S9(05)V99.
          03 WS-CALC                         PIC S9(05)V99.
          03 WS-N-1                          PIC S9(03)V99.
          03 WS-N-2                          PIC S9(03)V99.
          03 WS-MOSTRA-NUM                   PIC -ZZ.ZZ9,99.

       PROCEDURE DIVISION.
       P001-PRINCIPAL.
            DISPLAY "********** PROGRAMA DE CALCULO *************"

            INITIALIZE WS-NUMEROS
      ******************************************************************
      *           CAPTURA DADOS DE TELA - DOIS NUMEROS
      ******************************************************************
            DISPLAY 'INFORME O PRIMEIRO NUMERO: '
            ACCEPT  WS-N-1

            DISPLAY 'INFORME O SEGUNDO NUMERO: '
            ACCEPT  WS-N-2
      ******************************************************************
      *           CALCULA A SOMA DOS NUMEROS
      ******************************************************************

            MOVE ZEROS                       TO WS-SOMA
            COMPUTE WS-SOMA = WS-N-1 + WS-N-2
            MOVE WS-SOMA                     TO WS-MOSTRA-NUM
            DISPLAY 'O RESULTADO DA SOMA EH: ' WS-MOSTRA-NUM

      ******************************************************************
      *           CALCULA A SUBTRAÇÃO DOS NUMEROS
      ******************************************************************

            MOVE ZEROS                       TO WS-SUBTR
            COMPUTE WS-SUBTR = WS-N-1 - WS-N-2
            MOVE WS-SUBTR                    TO WS-MOSTRA-NUM
            DISPLAY 'O RESULTADO DA SUBTRACAO EH: ' WS-MOSTRA-NUM

      ******************************************************************
      *           CALCULA A MULTIPLIÇÃO DOS NUMEROS
      ******************************************************************

            MOVE ZEROS                       TO WS-MULTI
            COMPUTE WS-MULTI = WS-N-1 * WS-N-2
            MOVE WS-MULTI                    TO WS-MOSTRA-NUM
            DISPLAY 'O RESULTADO DA MULTIPLICACAO EH: ' WS-MOSTRA-NUM

      ******************************************************************
      *           CALCULA A DIVISÃO DOS NUMEROS
      ******************************************************************

            MOVE ZEROS                       TO WS-DIVIDO
            COMPUTE WS-DIVIDO = WS-N-1 / WS-N-2
            MOVE WS-DIVIDO                   TO WS-MOSTRA-NUM
            DISPLAY 'O RESULTADO DA DIVISAO EH: ' WS-MOSTRA-NUM

      ******************************************************************
      *           CALCULA A POTENCIA DE UM NUMERO
      ******************************************************************

            MOVE ZEROS                       TO WS-MULTI
            COMPUTE WS-MULTI = WS-N-1 **4
            MOVE WS-MULTI                   TO WS-MOSTRA-NUM
            DISPLAY 'A POTENCIA DO WS-N-1 ' WS-N-1 ' EH: ' WS-MOSTRA-NUM

      ******************************************************************
      *           INCREMENTA (ADICIONA) UM VALOR A OUTRO
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC
            MOVE WS-DIVIDO                  TO WS-CALC
            ADD WS-N-1                      TO WS-CALC
            MOVE WS-CALC                    TO WS-MOSTRA-NUM
            DISPLAY 'ADICINAR ' WS-N-1 ' A ' WS-DIVIDO ' FICA '
                                            WS-MOSTRA-NUM
      ******************************************************************
      *           DECREMENTA (RETIR) UM VALOR DE OUTRO
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC
            MOVE WS-DIVIDO                  TO WS-CALC
            SUBTRACT WS-N-1                 FROM WS-MULTI
                                            GIVING WS-CALC
            MOVE WS-CALC                    TO WS-MOSTRA-NUM
            DISPLAY 'RETIRAR ' WS-N-1 ' DE ' WS-MULTI ' FICA '
                                            WS-MOSTRA-NUM
      ******************************************************************
      *           DECREMENTA OUTRA FORMA
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC
            MOVE WS-DIVIDO                  TO WS-CALC
            COMPUTE WS-N-1 = WS-N-1 * -1
            ADD WS-N-1                      TO WS-CALC
            MOVE WS-CALC                    TO WS-MOSTRA-NUM
            DISPLAY 'ADICINAR ' WS-N-1 ' A ' WS-DIVIDO ' FICA '
                                            WS-MOSTRA-NUM
      ******************************************************************
      *           MULTIPLICAÇÃO COM O MULTIPLY
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC
            MULTIPLY WS-N-1                 BY WS-N-2 GIVING WS-CALC
            MOVE WS-CALC                    TO WS-MOSTRA-NUM
            DISPLAY 'MULTIPLICANDO ' WS-N-1 ' POR ' WS-N-2 ' FICA '
                                            WS-MOSTRA-NUM

      ******************************************************************
      *           DIVISÃO COM O DIVIDE
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC
            DIVIDE WS-N-2                 BY WS-N-1 GIVING WS-CALC
            MOVE WS-CALC                    TO WS-MOSTRA-NUM
            DISPLAY 'DIVIDINDO ' WS-N-2 ' POR ' WS-N-1 ' FICA '
                                            WS-MOSTRA-NUM
      ******************************************************************
      *            EXPRESSAO NUMERICA
      ******************************************************************

            MOVE ZEROS                      TO WS-MOSTRA-NUM
                                               WS-CALC

            COMPUTE WS-CALC = WS-N-2 + WS-MULTI / ((WS-DIVIDO - WS-N-1)
                                                    * WS-SUBTR)
            MOVE WS-CALC                    TO WS-MOSTRA-NUM

            DISPLAY 'RESULTADO: ' WS-MOSTRA-NUM

            STOP RUN.
       END PROGRAM PRGMATEM.
