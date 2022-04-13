      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 25/03/2021
      * Purpose: APRESENTAR O COMANDO STRING
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGSTR001.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-STRING            PIC X(105) VALUE SPACES.
       77 WS-DISPLAY           PIC X(120) VALUE SPACES.
       77 WS-POINTER           PIC 9(002) VALUE ZEROS.
       77 WS-CONTADOR-1        PIC 9(002) VALUE ZEROS.
       77 WS-CONTADOR-2        PIC 9(002) VALUE ZEROS.
       77 WS-CONTADOR-3        PIC 9(002) VALUE ZEROS.
       77 WS-TOT-CAMPOS        PIC 9(002) VALUE ZEROS.
       01 WS-ENDERECO.
          03 WS-RUA            PIC X(030) VALUE SPACES.
          03 WS-NUMERO         PIC 9(004) VALUE ZEROS.
          03 WS-BAIRRO         PIC X(030) VALUE SPACES.
          03 WS-CIDADE         PIC X(020) VALUE SPACES.
          03 WS-UF             PIC X(002) VALUE SPACES.
          03 WS-CEP            PIC X(009) VALUE SPACES.

       77 WS-NOME-COMPLETO     PIC X(060) VALUE SPACES.
       77 WS-PRIMEIRO-NOME     PIC X(020) VALUE SPACES.
       77 WS-NOME-MEIO         PIC X(020) VALUE SPACES.
       77 WS-ULTIMO-NOME       PIC X(020) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 'RUA 310'     TO WS-RUA
            MOVE 301           TO WS-NUMERO
            MOVE 'SANTA CLARA' TO WS-BAIRRO
            MOVE 'SAO PAULO'   TO WS-CIDADE
            MOVE 'SP'          TO WS-UF
            MOVE '01500-005'   TO WS-CEP


            INITIALISE         WS-POINTER
                               WS-CONTADOR-1
                               WS-CONTADOR-2
                               WS-CONTADOR-3
                               WS-PRIMEIRO-NOME
                               WS-ULTIMO-NOME

            MOVE '***/MARCOS**ROBERTO***SILVA/' TO WS-NOME-COMPLETO
            MOVE 1             TO WS-POINTER

            UNSTRING WS-NOME-COMPLETO
                DELIMITED BY '/' OR ALL'*'
                INTO WS-PRIMEIRO-NOME COUNT IN WS-CONTADOR-1
                     WS-NOME-MEIO     COUNT IN WS-CONTADOR-2
                     WS-ULTIMO-NOME   COUNT IN WS-CONTADOR-3
                WITH POINTER WS-POINTER
                TALLYING IN WS-TOT-CAMPOS
            END-UNSTRING.

            DISPLAY WS-PRIMEIRO-NOME
            DISPLAY WS-NOME-MEIO
            DISPLAY WS-ULTIMO-NOME
            DISPLAY 'WS-POINTER...: ' WS-POINTER
            DISPLAY 'WS-CONTADOR-1: ' WS-CONTADOR-1
            DISPLAY 'WS-CONTADOR-2: ' WS-CONTADOR-2
            DISPLAY 'WS-CONTADOR-2: ' WS-CONTADOR-3
            DISPLAY 'WS-TOT-CAMPOS: ' WS-TOT-CAMPOS

            STOP RUN.


      *     APRESENTANDO SAIDA STRING 1
            INITIALISE WS-DISPLAY
            STRING WS-ENDERECO
                   DELIMITED BY SIZE INTO WS-DISPLAY
            END-STRING.

            DISPLAY 'STRING 1: ' WS-DISPLAY.

      *     APRESENTANDO SAIDA STRING 2
            INITIALISE WS-DISPLAY
            STRING WS-ENDERECO(01:30)
                   WS-ENDERECO(35:30)
                   DELIMITED BY SIZE INTO WS-DISPLAY
            END-STRING.

            DISPLAY 'STRING 2: ' WS-DISPLAY.

      *     APRESENTANDO SAIDA STRING 3
            INITIALISE WS-DISPLAY
            STRING WS-RUA
                   WS-BAIRRO
                   DELIMITED BY SIZE INTO WS-DISPLAY
            END-STRING.

            DISPLAY 'STRING 3: ' WS-DISPLAY.

      *     APRESENTANDO SAIDA STRING 4
            INITIALISE WS-DISPLAY
            STRING WS-RUA(1:7)
                   ' - '
                   WS-BAIRRO(1:11)
                   DELIMITED BY SIZE INTO WS-DISPLAY
            END-STRING.

            DISPLAY 'STRING 4: ' WS-DISPLAY.

      *     APRESENTANDO SAIDA STRING 5
            MOVE 'MARIA;JOSE;JOAO;ANDRIANA;CARLOS' TO WS-STRING
            INITIALISE WS-DISPLAY
            STRING WS-STRING
                   DELIMITED BY ';' INTO WS-DISPLAY
            END-STRING.

            DISPLAY 'STRING 5: ' WS-DISPLAY.

      *     APRESENTANDO SAIDA STRING 6

            INITIALISE WS-DISPLAY
            MOVE 'ANDRE COSTA - '  TO WS-DISPLAY
            MOVE 15                TO WS-POINTER
            STRING
                   WS-ENDERECO
                   DELIMITED BY SIZE INTO WS-DISPLAY
                   WITH POINTER WS-POINTER
            END-STRING.

            DISPLAY 'STRING 6: ' WS-DISPLAY.


            STOP RUN.


       END PROGRAM PROGSTR001.
