      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRINCIPAL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-OPCAO                   PIC X.
       01 WS-AREA-COMUNIC.
           03 WS-CD-ESTUDANTE        PIC 9(05).
           03 WS-NM-ESTUDANTE        PIC X(20).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE SPACES              TO WS-OPCAO
            PERFORM P300-PROCESSA    THRU P300-FIM UNTIL WS-OPCAO = 'S'
            PERFORM P900-FIM
            .
       P300-PROCESSA.
            DISPLAY '*** CADASTRO DE ESTUDANTE ***'
            DISPLAY 'O que deseja fazer?'
            DISPLAY ' '
            DISPLAY ' Escolha uma das opcoes para: '
            DISPLAY '*------------------------------*'
            DISPLAY '*  1 = Cadastrar novo          *'
            DISPLAY '*  2 = Listar todos            *'
            DISPLAY '*  3 = Consultar um estudante  *'
            DISPLAY '*  4 = Excluir um estudante    *'
            DISPLAY '*------------------------------*'
            DISPLAY ' '
            DISPLAY 'A Qualquer momento tecle <S> para sair'
            ACCEPT  WS-OPCAO

            EVALUATE WS-OPCAO
                 WHEN '1'
                    CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\PRGCADS1'
                                                  USING WS-AREA-COMUNIC
                 WHEN '2'
                    CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\PRGLIST1'
                                                  USING WS-AREA-COMUNIC
                 WHEN '3'
                    CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\PRGALT1'
                                                  USING WS-AREA-COMUNIC
                 WHEN '4'
                    CALL 'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\PRGDEL1'
                                                  USING WS-AREA-COMUNIC
                 WHEN 'S'
                    DISPLAY 'Obrigado, volte sempre!'
                 WHEN OTHER
                    DISPLAY 'OPCAO INVALIDA.'
            END-EVALUATE
            .
       P300-FIM.
       P900-FIM.
            STOP RUN.

       END PROGRAM PRINCIPAL.
