      *************************************************************************
      * AUTHOR: AFONSO
      * DATE-WRITTEN: 22/01/2021
      * PURPOSE: APRESNTA O RESULTADO DA SOMA DE 4 NÚMEROS ALEATORIS
      *************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1          PIC 9(003) VALUE ZEROS.
       01 WS-NUM2          PIC 9(003) VALUE ZEROS.
       01 WS-NUM3          PIC 9(004) VALUE ZEROS.
       01 WS-NUM4          PIC 9(004) VALUE ZEROS.
       01 WS-RESULTADO     PIC 9(005) VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY   "MOSTRA A SOMA DOS 4 NUMEROS ALEATORIS"
            DISPLAY   "DIGITE O PRIMEIRO NUMERO:"
            ACCEPT  WS-NUM1
            DISPLAY   "DIGITE O SEGUNDO NUMERO:"
            ACCEPT  WS-NUM2
            DISPLAY   "DIGITE O TERCEIRO NUMERO:"
            ACCEPT  WS-NUM3
            DISPLAY   "DIGITE O QUARTO NUMERO:"
            ACCEPT  WS-NUM4

            COMPUTE WS-RESULTADO = WS-NUM1 + WS-NUM2 + WS-NUM3 + WS-NUM4

           DISPLAY "O RESULTADO EH:" WS-RESULTADO
            STOP RUN.
       END PROGRAM DESAFIO.
