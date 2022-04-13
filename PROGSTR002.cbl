      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 01/04/2021
      * Purpose: APRESENTAR O COMANDO UNSTRING
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGSTR001.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-POINTER              PIC 9(02) VALUE ZEROS.
       77 WS-CONTADOR-1           PIC 9(02) VALUE ZEROS.
       77 WS-CONTADOR-2           PIC 9(02) VALUE ZEROS.
       77 WS-CONTADOR-3           PIC 9(02) VALUE ZEROS.
       77 WS-TOT-CAMPOS           PIC 9(02) VALUE ZEROS.
       77 WS-NOME-COMPLETO        PIC X(60) VALUE SPACES.
       77 WS-PRIMEIRO-NOME        PIC X(20) VALUE SPACES.
       77 WS-NOME-MEIO            PIC X(20) VALUE SPACES.
       77 WS-ULTIMO-NOME          PIC X(20) VALUE SPACES.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      *----------------------------------------------------------------*
      *        EXEMPLO 1 DO COMANDO UNSTRING
      *----------------------------------------------------------------*
            DISPLAY 'EXEMPLO 1:'
            INITIALISE            ws-pointer
                                  WS-CONTADOR-1
                                  WS-CONTADOR-2
                                  WS-CONTADOR-3
                                  WS-PRIMEIRO-NOME
                                  WS-NOME-MEIO
                                  WS-ULTIMO-NOME

            MOVE ' ANA MARIA BRAGA '    TO WS-NOME-COMPLETO
            move 1 to ws-pointer

            UNSTRING WS-NOME-COMPLETO
                     DELIMITED BY all " "
                     INTO WS-PRIMEIRO-NOME
                          WS-NOME-MEIO
                          WS-ULTIMO-NOME
                     WITH POINTER WS-POINTER
                     TALLYING IN  WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY 'WS-PRIMEIRO-NOME: ' WS-PRIMEIRO-NOME
            DISPLAY 'WS-NOME-MEIO....: ' WS-NOME-MEIO
            DISPLAY 'WS-ULTIMO-NOME..: ' WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER......: ' WS-POINTER
            DISPLAY 'WS-TOT-CAMPOS...: ' WS-TOT-CAMPOS


            DISPLAY ' '

            stop run
            .
      *----------------------------------------------------------------*
      *        EXEMPLO 2 DO COMANDO UNSTRING
      *----------------------------------------------------------------*
            DISPLAY 'EXEMPLO 2:'
            INITIALISE
                                  WS-CONTADOR-1
                                  WS-CONTADOR-2
                                  WS-CONTADOR-3
                                  WS-TOT-CAMPOS
                                  WS-PRIMEIRO-NOME
                                  WS-NOME-MEIO
                                  WS-ULTIMO-NOME

            MOVE ' ANA MARIA BRAGA '    TO WS-NOME-COMPLETO
            MOVE 1                    TO WS-POINTER

            UNSTRING WS-NOME-COMPLETO
                     DELIMITED BY SPACES
                     INTO WS-PRIMEIRO-NOME
                          WS-NOME-MEIO
                          WS-ULTIMO-NOME
                     WITH POINTER WS-POINTER
                     TALLYING IN  WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY 'WS-PRIMEIRO-NOME: ' WS-PRIMEIRO-NOME
            DISPLAY 'WS-NOME-MEIO....: ' WS-NOME-MEIO
            DISPLAY 'WS-ULTIMO-NOME..: ' WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER......: ' WS-POINTER
            DISPLAY 'WS-TOT-CAMPOS...: ' WS-TOT-CAMPOS
            .
      *----------------------------------------------------------------*
      *        EXEMPLO 3 DO COMANDO UNSTRING
      *----------------------------------------------------------------*
            DISPLAY 'EXEMPLO 3:'
            INITIALISE            WS-POINTER
                                  WS-CONTADOR-1
                                  WS-CONTADOR-2
                                  WS-CONTADOR-3
                                  WS-TOT-CAMPOS
                                  WS-PRIMEIRO-NOME
                                  WS-NOME-MEIO
                                  WS-ULTIMO-NOME

            MOVE 'ANA*MARIA;BRAGA*'    TO WS-NOME-COMPLETO
            MOVE 1                      TO WS-POINTER

            UNSTRING WS-NOME-COMPLETO
                     DELIMITED BY '*' OR ';'
                     INTO WS-PRIMEIRO-NOME
                          WS-NOME-MEIO
                          WS-ULTIMO-NOME
                     WITH POINTER WS-POINTER
                     TALLYING IN  WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY 'WS-PRIMEIRO-NOME: ' WS-PRIMEIRO-NOME
            DISPLAY 'WS-NOME-MEIO....: ' WS-NOME-MEIO
            DISPLAY 'WS-ULTIMO-NOME..: ' WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER......: ' WS-POINTER
            DISPLAY 'WS-TOT-CAMPOS...: ' WS-TOT-CAMPOS
            .
      *----------------------------------------------------------------*
      *        EXEMPLO 4 DO COMANDO UNSTRING
      *----------------------------------------------------------------*
            DISPLAY 'EXEMPLO 4:'
            INITIALISE            WS-POINTER
                                  WS-CONTADOR-1
                                  WS-CONTADOR-2
                                  WS-CONTADOR-3
                                  WS-TOT-CAMPOS
                                  WS-PRIMEIRO-NOME
                                  WS-NOME-MEIO
                                  WS-ULTIMO-NOME

            MOVE 'ANA*MARIA;BRAGA*'    TO WS-NOME-COMPLETO
            MOVE 1                      TO WS-POINTER

            UNSTRING WS-NOME-COMPLETO
                     DELIMITED BY '*' OR ';'
                     INTO WS-PRIMEIRO-NOME  COUNT IN WS-CONTADOR-1
                          WS-NOME-MEIO      COUNT IN WS-CONTADOR-2
                          WS-ULTIMO-NOME    COUNT IN WS-CONTADOR-3
                     WITH POINTER WS-POINTER
                     TALLYING IN  WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY 'WS-PRIMEIRO-NOME: ' WS-PRIMEIRO-NOME
            DISPLAY 'WS-NOME-MEIO....: ' WS-NOME-MEIO
            DISPLAY 'WS-ULTIMO-NOME..: ' WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER......: ' WS-POINTER
            DISPLAY 'WS-TOT-CAMPOS...: ' WS-TOT-CAMPOS
            DISPLAY 'WS-CONTADOR-1...: ' WS-CONTADOR-1
            DISPLAY 'WS-CONTADOR-2...: ' WS-CONTADOR-2
            DISPLAY 'WS-CONTADOR-3...: ' WS-CONTADOR-3
            .
      *----------------------------------------------------------------*
      *        EXEMPLO 5 DO COMANDO UNSTRING
      *----------------------------------------------------------------*
            DISPLAY 'EXEMPLO 5:'
            INITIALISE            WS-POINTER
                                  WS-CONTADOR-1
                                  WS-CONTADOR-2
                                  WS-CONTADOR-3
                                  WS-TOT-CAMPOS
                                  WS-PRIMEIRO-NOME
                                  WS-NOME-MEIO
                                  WS-ULTIMO-NOME

            MOVE 'ANA*MARIA;;;;BRAGA*'    TO WS-NOME-COMPLETO
            MOVE 1                        TO WS-POINTER

            UNSTRING WS-NOME-COMPLETO
                     DELIMITED BY '*' OR ALL ';'
                     INTO WS-PRIMEIRO-NOME  COUNT IN WS-CONTADOR-1
                          WS-NOME-MEIO      COUNT IN WS-CONTADOR-2
                          WS-ULTIMO-NOME    COUNT IN WS-CONTADOR-3
                     WITH POINTER WS-POINTER
                     TALLYING IN  WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY 'WS-PRIMEIRO-NOME: ' WS-PRIMEIRO-NOME
            DISPLAY 'WS-NOME-MEIO....: ' WS-NOME-MEIO
            DISPLAY 'WS-ULTIMO-NOME..: ' WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER......: ' WS-POINTER
            DISPLAY 'WS-TOT-CAMPOS...: ' WS-TOT-CAMPOS
            DISPLAY 'WS-CONTADOR-1...: ' WS-CONTADOR-1
            DISPLAY 'WS-CONTADOR-2...: ' WS-CONTADOR-2
            DISPLAY 'WS-CONTADOR-3...: ' WS-CONTADOR-3
            .

            STOP RUN.
       END PROGRAM PROGSTR001.
