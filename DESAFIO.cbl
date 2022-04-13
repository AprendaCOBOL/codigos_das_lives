      ******************************************************************
      * Author: IZABELA MATEUS
      * Date: 20/01/2021
      * Purpose: PEDE AO USUARIO PARA DIGITAR 4 NUMEROS ALEATORIOS E
      * EXIBE O RESULTADO DA SOMA DOS 4 NUMEROS
      * Tectonics: DESAFIO01
      ******************************************************************
      *  IDENTIFICATION DIVISION.
      *  PROGRAM-ID. DESAFIO01.
      *  DATA DIVISION.
      *  FILE SECTION.
      *  WORKING-STORAGE SECTION.
      *  01 WS-NUMERO-01 PIC 9(003) VALUE ZEROS.
      *  01 WS-NUMERO-02 PIC 9(003) VALUE ZEROS.
      *  01 WS-NUMERO-03 PIC 9(003) VALUE ZEROS.
      *  01 WS-NUMERO-04 PIC 9(003) VALUE ZEROS.
      *  01 WS-RESULTADO PIC Z(004) VALUE ZEROS.
      *  PROCEDURE DIVISION.
      *  MAIN-PROCEDURE.
      *  DISPLAY "EXIBE O RESULTADO DA SOMA DE 4 NUMEROS ALEATORIOS"
      *  DISPLAY "DIGITE O PRIMEIRO NUMERO: "
      *  ACCEPT WS-NUMERO-01
      *  DISPLAY "DIGITE O SEGUNDO NUMERO: "
      *  ACCEPT WS-NUMERO-02
      *  DISPLAY "DIGITE O TERCEIRO NUMERO: "
      * ACCEPT WS-NUMERO-03
      *  DISPLAY "DIGITE O QUARTO NUMERO: "
      *  ACCEPT WS-NUMERO-04
      *  COMPUTE WS-RESULTADO = WS-NUMERO-01 + WS-NUMERO-02 +
      *  WS-NUMERO-03 + WS-NUMERO-04
      *  DISPLAY "O RESULTADO E: " WS-RESULTADO
      *  STOP RUN.
      *  END PROGRAM DESAFIO01.
      ******************************************************************
      * Author: LEANDRO - complexo e só rodou no PROMPT
      * Date: 20/01/2021
      * Purpose: PEDE AO USUARIO PARA DIGITAR 4 NUMEROS ALEATORIOS E
      * EXIBE O RESULTADO DA SOMA DOS 4 NUMEROS
      * Tectonics: DESAFIO01
      ******************************************************************
      * IDENTIFICATION DIVISION.
      * PROGRAM-ID. DESAFIO01.
      * DATA DIVISION.
      * FILE SECTION.*
      *
      * WORKING-STORAGE SECTION.
      * 77 SOMA pic 9(4).
      * 77 RESULT PIC 9(4).
      * 77 CONT PIC 9.
      * 77 NUMEROS PIC 9(4).
      * 77 LINHA PIC 99 VALUE 1.
      * 77 TEMP PIC X(4).
      * 77 RESULZ PIC Z(4).
      * PROCEDURE DIVISION.
      * MAIN-PROCEDURE.*
      *
      * MOVE 1 TO CONT
      * PERFORM UNTIL CONT > 4
      * DISPLAY FUNCTION CONCATENATE ("DIGITE O NUMERO ",
      * CONT, ":") LINE LINHA POSITION 01
      * ACCEPT TEMP LINE LINHA POSITION 20
      * MOVE FUNCTION NUMVAL(TEMP) TO NUMEROS
      * ADD NUMEROS TO RESULT
      * ADD 1 TO CONT
      * ADD 1 TO LINHA
      * END-PERFORM.
      * MOVE RESULT TO RESULZ.
      * DISPLAY "============================"LINE LINHA POSITION 1
      * ADD 1 TO LINHA
      * DISPLAY FUNCTION CONCATENATE ("RESULTADO DA SOMA : ",
      * RESULZ) LINE LINHA POSITION 1.
      * ACCEPT OMITTED AT 0701
      * STOP RUN.
      * END PROGRAM DESAFIO01.
      ******************************************************************
      * Author: ANDRE LUIS DE OLIVEIRA
      * Date: 21/01/2021
      * Purpose: APRESENTA O RESULTADO DA SOMA DE QUATRO NUMEROS
      * Tectonics: cobc
      ******************************************************************
      * IDENTIFICATION DIVISION.
      * PROGRAM-ID. PRDSF001.
      * DATA DIVISION.
      * FILE SECTION.
      * WORKING-STORAGE SECTION.
      * 01 WS-NUMERO-1 PIC 9(003) VALUE ZERO.
      * 01 WS-NUMERO-2 PIC 9(003) VALUE ZERO.
      * 01 WS-NUMERO-3 PIC 9(003) VALUE ZERO.
      * 01 WS-NUMERO-4 PIC 9(003) VALUE ZERO.
      * 01 WS-RESULTADO PIC 9(006) VALUE ZERO.
      * PROCEDURE DIVISION.
      * MAIN-PROCEDURE.
      * DISPLAY "Mostra o resultado da soma de 4 numeros"
      * DISPLAY "Digite o primeiro numero:"
      * ACCEPT WS-NUMERO-1
      * DISPLAY "Digite o segundo numero:"
      * ACCEPT WS-NUMERO-2
      * DISPLAY "Digite o terceiro numero:"
      * ACCEPT WS-NUMERO-3
      * DISPLAY "Digite o quarto numero:"
      * ACCEPT WS-NUMERO-4
      * COMPUTE WS-RESULTADO = WS-NUMERO-1 + WS-NUMERO-2
      * COMPUTE WS-RESULTADO = WS-RESULTADO + WS-NUMERO-3
      * COMPUTE WS-RESULTADO = WS-RESULTADO + WS-NUMERO-4
      * DISPLAY "O resultado eh: " WS-RESULTADO
      * STOP RUN.
      * END PROGRAM PRDSF001.
      *************************************************************************
      * AUTHOR: AFONSO
      * DATE-WRITTEN: 22/01/2021
      * PURPOSE: APRESNTA O RESULTADO DA SOMA DE 4 NÚMEROS ALEATORIS
      *************************************************************************
      * IDENTIFICATION DIVISION.
      * PROGRAM-ID. DESAFIO.
      * DATA DIVISION.
      * FILE SECTION.
      * WORKING-STORAGE SECTION.
      * 01 WS-NUM1          PIC 9(003) VALUE ZEROS.
      * 01 WS-NUM2          PIC 9(003) VALUE ZEROS.
      * 01 WS-NUM3          PIC 9(004) VALUE ZEROS.
      * 01 WS-NUM4          PIC 9(004) VALUE ZEROS.
      * 01 WS-RESULTADO     PIC 9(005) VALUE ZEROS.
      * PROCEDURE DIVISION.
      * MAIN-PROCEDURE.
      *      DISPLAY   "MOSTRA A SOMA DOS 4 NUMEROS ALEATORIS"
      *      DISPLAY   "DIGITE O PRIMEIRO NUMERO:"
      *      ACCEPT  WS-NUM1
      *      DISPLAY   "DIGITE O SEGUNDO NUMERO:"
      *      ACCEPT  WS-NUM2
      *      DISPLAY   "DIGITE O TERCEIRO NUMERO:"
      *      ACCEPT  WS-NUM3
      *      DISPLAY   "DIGITE O QUARTO NUMERO:"
      *      ACCEPT  WS-NUM4
      *
      *      COMPUTE WS-RESULTADO = WS-NUM1 + WS-NUM2 + WS-NUM3 + WS-NUM4
      *
      *     DISPLAY "O RESULTADO EH:" WS-RESULTADO
      *      STOP RUN.
      * END PROGRAM DESAFIO.
      ******************************************************************
      * Author: David Arthur
      * Date:22/01/21
      * Purpose: SOMA DE 4 NUMEROS
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DVD-DESAFIO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-NUMERO-1 PIC 9(003) VALUE ZEROS.
       01 WS-NUMERO-2 PIC 9(003) VALUE ZEROS.
       01 WS-NUMERO-3 PIC 9(003) VALUE ZEROS.
       01 WS-NUMERO-4 PIC 9(003) VALUE ZEROS.
       01 WS-RESULTADO PIC Z(004) VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       DISPLAY "MOSTRA O RESULTO DA SOMA DE 4 NUMEROS ALEATORIOS"
       DISPLAY "DIGITE O PRIMEIRO NUMERO: "

       ACCEPT WS-NUMERO-1

       DISPLAY "DIGITE O SEGUNDO NUMERO: "

       ACCEPT WS-NUMERO-2
       DISPLAY "DIGITE O TERCEIRO NUMERO: "
       ACCEPT WS-NUMERO-3
       DISPLAY "DIGITE O QUARTO NUMERO: "
       ACCEPT WS-NUMERO-4

       COMPUTE WS-RESULTADO = WS-NUMERO-1 + WS-NUMERO-2 +
       WS-NUMERO-3 + WS-NUMERO-4

       DISPLAY "O RESULTADO EH: " WS-RESULTADO
       STOP RUN.
       END PROGRAM DVD-DESAFIO.
