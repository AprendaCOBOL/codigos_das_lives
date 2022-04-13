      ******************************************************************
      * Author: ARTHUR HENRIQUE
      * Date:20/10/2021
      * Purpose: MANU PARA CADASTRO DE CONTATOS
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENUCNTT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-COM-AREA.
          03 WS-MENSAGEM                  PIC X(20).
       77 WS-OPCAO                        PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE SPACES                   TO WS-OPCAO
            DISPLAY 'DIGITE 2 PARA CADASTRAR OU 1 PARA CONSULTAR'
            DISPLAY 'Informe uma opcao: '
            ACCEPT WS-OPCAO

            EVALUATE WS-OPCAO
                   WHEN '1'
                  CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\TESTE4'
                           USING WS-COM-AREA

                   WHEN '2'
                  CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\TESTE5'
                           USING WS-COM-AREA

                   WHEN '3'
                      CALL 'C:\Curso\COBOL\CONSCNT'
                           USING WS-COM-AREA

                   WHEN '4'
                      CALL 'C:\Curso\COBOL\ALTCNT'
                           USING WS-COM-AREA

                   WHEN '5'
                      CALL 'C:\Curso\COBOL\DELCNT'
                           USING WS-COM-AREA
                   WHEN OTHER
                      DISPLAY 'OPCAO INVALIDA!'
            END-EVALUATE
            .
            STOP RUN.
       END PROGRAM MENUCNTT.
