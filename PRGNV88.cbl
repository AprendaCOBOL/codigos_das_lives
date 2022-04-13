      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 13/05/2021
      * Purpose: APRESENTAR USABILIDADE DO NIVEL 88
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGNV88.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-REGISTRO.
           03 WS-NOME            PIC X(36).
           03 WS-SEXO            PIC A.
              88 WS-SEXO-OK      VALUE "M" "F".
           03 WS-CEP             PIC 9(05).
              88 WS-CEP-OK       VALUE 30000 THRU 39999.
           03 WS-ESTRANGEIRO     PIC X.
              88 WS-ESTR-OK     VALUE 'S' FALSE 'N'.
           03 WS-ESTADO-CIVIL    PIC 9.
              88 WS-EST-CIV-OK   VALUE 1 THRU 4.
           03 WS-FONE            PIC 9(08).
              88 WS-FONE-F       VALUE 30000000 THRU 49999999.
              88 WS-FONE-C       VALUE 80000000 THRU 99999999.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      ********************* BLOCO CAPTURA DE DADOS ********************
            DISPLAY ' ****** CADASTRO DE FUNCIONARIOS ******'

            DISPLAY 'INFORME UM NOME: '
            ACCEPT  WS-NOME

            DISPLAY 'INFORME O SEXO: '
            ACCEPT WS-SEXO

            DISPLAY 'INFORME UM CEP: '
            ACCEPT WS-CEP

            DISPLAY 'EH ESTRANGEIRO? '
            ACCEPT WS-ESTRANGEIRO

            DISPLAY 'INFORME ESTADO CIVIL: '
            ACCEPT WS-ESTADO-CIVIL

            DISPLAY 'INFORME O TELEFONE: '
            ACCEPT WS-FONE

     ********************* BLOCO DE CRITICA DADOS ********************

            IF WS-SEXO-OK
                DISPLAY 'SEXO VALIDO!'
            ELSE
                DISPLAY 'SEXO INVALIDO!'
            END-IF

            DISPLAY 'CEP: ' WS-CEP
            IF WS-CEP-OK
                DISPLAY 'CEP VALIDO'
            ELSE
                DISPLAY 'CEP INVALIDO!'
            END-IF

            IF WS-ESTR-OK
                DISPLAY 'ESTRANGEIRO'
            ELSE
                DISPLAY 'CIDADAO BRASILEIRO!'
            END-IF

            IF WS-EST-CIV-OK
                DISPLAY 'ESTADO CIVIL VALIDO'
            ELSE
                DISPLAY 'ESTADO VICIL INVALIDO!'
            END-IF

            IF WS-FONE-F
                DISPLAY 'TELEFONE FIXO'
            ELSE
                IF WS-FONE-C
                    DISPLAY 'TELEFONE CELULAR'
                ELSE
                    DISPLAY 'TELEFONE INVALIDO!'
                END-IF
            END-IF

            STOP RUN.
       END PROGRAM PRGNV88.
