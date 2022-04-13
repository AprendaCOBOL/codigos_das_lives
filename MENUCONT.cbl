      ******************************************************************
      * Author: LUCIANA BECCARO
      * Date: 26 DE JULHO DE 2021
      * Purpose: MENU PARA CADASTRO DE CONTATO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENUCONTT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-COM-AREA.
          03 WS-MENSAGEM PIC X(40).
       77 WS-OPCAO PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM P300-PROCESSA THRU P300-FIM UNTIL WS-OPCAO= 'F'
            PERFORM P900-FIM
       .

       P300-PROCESSA.

           MOVE SPACES TO WS-OPCAO
           DISPLAY '***************************************************'
           DISPLAY '* SISTEMA DE CONTATOS *'
           DISPLAY '***************************************************'
           DISPLAY '| |'
           DISPLAY '| Escola uma opcao: |'
           DISPLAY '| |'
           DISPLAY '| 1 - Incluir Contato |'
           DISPLAY '| 2 - Listar Contatos |'
           DISPLAY '| 3 - Consultar Contato |'
           DISPLAY '| 4 - Alterar Contato |'
           DISPLAY '| 5 - Excluir Contato |'
           DISPLAY '| |'
           DISPLAY '| (ou tecle <S> para sair) |'
           DISPLAY '***************************************************'
           ACCEPT WS-OPCAO

           EVALUATE WS-OPCAO
               WHEN '1'
           MOVE '*** LISTAGEM DE CONTATOS ***' TO WS-MENSAGEM
           CALL         'C:\Users\lucia\Documents\ARQUIVO OPENCOBOL\bin\
      -      'CADCONT1' USING WS-COM-AREA

               WHEN '2'
           MOVE '*** LISTAGEM DE CONTATOS ***' TO WS-MENSAGEM
           CALL
            'C:\Users\lucia\Documents\ARQUIVO OPENCOBOL\bin\CADCONT2'
            USING WS-COM-AREA

               WHEN '3'
           MOVE '*** CONSULTA DE CONTATOS ***' TO WS-MENSAGEM
           CALL 'C:\Users\lucia\Documents\ARQUIVO OPENCOBOL\bin\
      -    'CADCONT3' USING WS-COM-AREA

               WHEN '4'
           MOVE '*** ALTERACAO DE CONTATOS ***' TO WS-MENSAGEM
           CALL 'C:\Users\lucia\Documents\ARQUIVO OPENCOBOL\bin\
      -    'CADCONT4' USING WS-COM-AREA

               WHEN '5'
           MOVE '*** EXCLUSAO DE CONTATOS ***' TO WS-MENSAGEM
           CALL 'C:\Users\lucia\Documents\ARQUIVO OPENCOBOL\bin\
      -    'CADCONT5' USING WS-COM-AREA
           WHEN 'S'
           DISPLAY 'Obrigada! Volte sempre!'
           MOVE 'F' TO WS-OPCAO
           WHEN 's'
           DISPLAY 'Obrigada! Volte sempre!'
           MOVE 'f' TO WS-OPCAO
           WHEN OTHER
           DISPLAY 'OPCAO INVALIDA!'

               END-EVALUATE
           .
       P300-FIM.
       P900-FIM.

           STOP RUN.
       END PROGRAM MENUCONTT.
