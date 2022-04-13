      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 12/08/2021
      * Purpose: APRESENTAR VARIAVEIS E FILLER
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGFILLERV.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-CAPTURA                     PIC X(100).
       01 FILLER REDEFINES WS-CAPTURA.
           03 WS-NOME                    PIC X(30).
           03 WS-TELEFONE                PIC 9(10).
           03 WS-EMAIL                   PIC X(30).
           03 WS-SITE                    PIC X(30).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            STRING
            'ANDRE                         '
            '9999999999'
            '                              '
            '                              '
            DELIMITED BY SIZE INTO   WS-CAPTURA

            DISPLAY WS-NOME
            DISPLAY WS-TELEFONE
            DISPLAY WS-EMAIL
            DISPLAY WS-SITE

            STRING
            'JOAO                          '
            '9999998888'
            '                              '
            '                              '
            DELIMITED BY SIZE INTO   WS-CAPTURA

            DISPLAY WS-NOME
            DISPLAY WS-TELEFONE
            DISPLAY WS-EMAIL
            DISPLAY WS-SITE

            STOP RUN.
       END PROGRAM PRGFILLERV.
