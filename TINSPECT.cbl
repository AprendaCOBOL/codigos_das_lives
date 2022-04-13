      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 06/05/2021
      * Purpose: APRESENTAR VARIAÇÕES DE USO DA INSTRUÇÃO "INSPECT"
      * ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TINSPECT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-STRING                       PIC X(50)
          VALUE 'TODAS AS COMPRAS FEITAS EM 01/07 NAO TEM PREMIACAO'.
       01 WS-CONTADORES.
          03 WS-CONT-1                    PIC 99.
          03 WS-CONT-2                    PIC 99.
          03 WS-CONT-3                    PIC 99.
          03 WS-CONT-4                    PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY 'REGUA DE CARACT: '
            '12345678901234567890123456789012345678901234567890'

            DISPLAY 'STRING ORIGINAL: ' WS-STRING

      **************** FORMATO 1: CONTAGEM DE CARACTERS ***************
            INITIALISE WS-CONTADORES

            INSPECT WS-STRING TALLYING WS-CONT-1 FOR ALL ZEROS
            DISPLAY 'QUANTIDADE DE ZEROS NA STRING: ' WS-CONT-1

            INSPECT WS-STRING TALLYING WS-CONT-2 FOR ALL SPACES
            DISPLAY 'QUANTIDADE DE ESPACOS NA STRING: ' WS-CONT-2

            INSPECT WS-STRING TALLYING WS-CONT-3 FOR ALL 'A'
            DISPLAY 'QUANTIDADE DE LETRAS [A] NA STRING: ' WS-CONT-3

            INSPECT WS-STRING TALLYING WS-CONT-4 FOR CHARACTERS
                    BEFORE INITIAL ZEROS
            DISPLAY 'QUANTIDADE DE CARACTERS ANTES DO ZERO: ' WS-CONT-4

            MOVE ZEROS    TO WS-CONT-4
            INSPECT WS-STRING TALLYING WS-CONT-4 FOR CHARACTERS
                    AFTER INITIAL ZEROS
            DISPLAY 'QUANTIDADE DE CARACTERS DEPOIS DO ZERO: ' WS-CONT-4

      **************** FORMATO 2: SUBSTITUIÇÃO DE CARACTERS ***********

            INITIALISE WS-CONTADORES

            DISPLAY 'TROCANDO [A] POR [X]: '
            INSPECT WS-STRING REPLACING ALL 'A' BY 'X'
            DISPLAY 'NOVA STRING: ' WS-STRING

            DISPLAY 'TROCANDO TUDO ANTES DO PRIMEIRO [X] POR [Y]: '
            INSPECT WS-STRING REPLACING CHARACTERS BY 'Y'
                    BEFORE INITIAL 'X'
            DISPLAY 'NOVA STRING: ' WS-STRING

            DISPLAY 'TROCANDO O PRIMEIRO [X] POR [W]: '
            INSPECT WS-STRING REPLACING FIRST 'X' BY 'W'
            DISPLAY 'NOVA STRING: ' WS-STRING

      **************** FORMATO 3: SUBSTITUIÇÃO INTELIGENTE ***********

            INITIALISE WS-CONTADORES

            DISPLAY 'TROCANDO [A] POR [X]: '
            INSPECT WS-STRING REPLACING ALL 'A' BY 'X'
            DISPLAY 'NOVA STRING: ' WS-STRING

            DISPLAY 'CONTANDO ALTERACAO DE [XS] NUMA CONDICAO...'
            INSPECT WS-STRING TALLYING WS-CONT-1 FOR ALL 'XS'
                    AFTER  ' C' BEFORE 'T'
            DISPLAY 'TAMANHO DO CORTE: ' WS-CONT-1
            DISPLAY 'NOVA STRING: ' WS-STRING

            DISPLAY 'FAZENDO A ALTERACAO DE [XS] NUMA CONDICAO...'
            INSPECT WS-STRING REPLACING ALL 'XS' BY '11'
                    AFTER  ' CO' BEFORE 'T'
            DISPLAY 'NOVA STRING: ' WS-STRING

      **************** FORMATO 4: CONVERSÃO INTELIGENTE ***********

            INITIALISE WS-CONTADORES

            DISPLAY 'CONVERTE UMA COLECAO DE 11 POR CARACTERES DE '
                    'IGUAIS QUANTIDADES: '
            INSPECT WS-STRING CONVERTING 'XO' TO ALL '??'
            DISPLAY 'NOVA STRING: ' WS-STRING

            .
            STOP RUN.
       END PROGRAM TINSPECT.
