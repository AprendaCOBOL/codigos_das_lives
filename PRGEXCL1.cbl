      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 20/04/2021
      * Purpose: EXCLUIR ESTUDANTE POR CODIGO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGARQMOD.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
            SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.

            INPUT-OUTPUT SECTION.
            FILE-CONTROL.
            SELECT ESTUDANTE ASSIGN TO
           'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\STUDENT.DAT'
                ORGANIZATION IS INDEXED
      ********  MODO DE ACESSO RANDOMICO É PARA PEQUISA PONTUAL
      ********  MODO DE ACESSO SEQUENCIAL É PARA LEITURA RECURSIVA
                ACCESS MODE  IS RANDOM
                RECORD KEY   IS CD-STUDENT
                FILE STATUS  IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD ESTUDANTE.
          COPY FD_ESTUDANTE.

       WORKING-STORAGE SECTION.
       01 WS-REGISTRO             PIC X(25)  VALUE SPACES.
       01 FILLER REDEFINES WS-REGISTRO.
          03 WS-CD-STUDENT        PIC 9(05).
          03 WS-NM-STUDENT        PIC X(20).
       77 WS-EOF                  PIC 9.
          88 EOF-OK                          VALUE 0 FALSE 1.
       77 WS-FS                   PIC 99.
          88 FS-OK                           VALUE 0.
       77 WS-CONT-REG             PIC 99.
       77 WS-EXIT                 PIC A      VALUE ' '.
       77 WS-CONFIRMA             PIC A      VALUE ' '.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY '*** EXCLUIR ESTUDANTE INDIVIDUAL POR CODIGO ***'
           PERFORM P300-ATUALIZA    THRU P300-FIM UNTIL WS-EXIT = 'F'
           PERFORM P900-FIM
           .
       P300-ATUALIZA.

            SET EOF-OK           TO FALSE
            SET FS-OK            TO TRUE
            SET WS-CONT-REG      TO 0.

            OPEN I-O ESTUDANTE

            IF FS-OK   THEN

                DISPLAY 'Informe o codigo do estudante e tecle <ENTER>:'
                ACCEPT CD-STUDENT

                READ ESTUDANTE INTO WS-REGISTRO
                     KEY IS CD-STUDENT
                     INVALID KEY
                        DISPLAY 'O ESTUDANTE NAO EXISTE.'
                     NOT INVALID KEY
                        DISPLAY 'O estudante: ' WS-NM-STUDENT
                        DISPLAY 'sera excluido. Tecle <S> para '
                                'confirmar, ou <QUALQUER> tecla para '
                                'cancelar.'
                        ACCEPT WS-CONFIRMA

                        IF WS-CONFIRMA EQUAL 'S' THEN
                           DELETE ESTUDANTE RECORD
                           INVALID KEY
                               DISPLAY 'Estudante nao existe.'
                           NOT INVALID KEY
                               DISPLAY 'Estudante excluido com sucesso!'
                        ELSE
                            DISPLAY 'Exclusao nao confirmada.'
                        END-IF
                END-READ
            ELSE
                    DISPLAY 'ERRO AO ABRIR O ARQUIVO DE ESTUDANTE.'
                    DISPLAY 'FILE STATUS: ' WS-FS
            END-IF

            CLOSE ESTUDANTE

            DISPLAY
            'TECLE: '
            '<QUALQUER TECLA> Para continuar, ou <F> para finalizar'
            ACCEPT WS-EXIT
            .
       P300-FIM.
       P900-FIM.
            STOP RUN.

       END PROGRAM PGARQMOD.
