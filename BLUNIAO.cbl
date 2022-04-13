      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 21/04/2021
      * Purpose: BALANCE LINE DE UNIAO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BLUNIAO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
            INPUT-OUTPUT SECTION.
            FILE-CONTROL.

      ****************** ARQUIVO DE CONTATOS ORIGINAL *****************
                SELECT CONTATOS ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOS.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS SEQUENTIAL
                RECORD  KEY  IS ID-CONTATO
                FILE STATUS IS WS-FS.
      ****************** ARQUIVO DE CONTATOS - 2 FONTE ****************
                SELECT CONTATOS2 ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOS2.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS SEQUENTIAL
                RECORD  KEY  IS ID-CONTATO-2
                FILE STATUS IS WS-FS.
      ***************** ARQUIVO DE CONTATOS FINAL *********************
                SELECT CONTATOS3 ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOS4.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS RANDOM
                RECORD  KEY  IS ID-CONTATO-3
                FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD CONTATOS.
          COPY FD_CONTT.

       FD CONTATOS2.
           01 REG-CONTATOS-2.
             03 ID-CONTATO-2                 PIC 99.
             03 NM-CONTATO-2                 PIC X(20).

       FD CONTATOS3.
           01 REG-CONTATOS-3.
             03 ID-CONTATO-3                 PIC 99.
             03 NM-CONTATO-3                 PIC X(20).

       WORKING-STORAGE SECTION.
       01 WS-REGISTRO                      PIC X(22) VALUE SPACES.
       01 FILLER REDEFINES WS-REGISTRO.
          03 WS-ID-CONTATO                 PIC 9(02).
          03 WS-NM-CONTATO                 PIC X(20).
       77 WS-FS                            PIC 99.
          88 FS-OK                         VALUE 0.
       77 WS-EOF-1                         PIC X.
          88 EOF-OK-1                      VALUE 'S' FALSE 'N'.
       77 WS-EOF-2                         PIC X.
          88 EOF-OK-2                      VALUE 'S' FALSE 'N'.
       77 WS-CONTATOS-LIDOS                PIC 99.
       77 WS-CONTATOS-2-LIDOS              PIC 99.
       77 WS-CONTATOS-3-GRAVADOS           PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM P100-INICIO      THRU  P100-FIM
            PERFORM P300-PROCESSA    THRU  P300-FIM
            PERFORM P900-TERMINA     THRU  P900-FIM
            .
       P100-INICIO.

            MOVE ZEROS               TO  WS-CONTATOS-LIDOS
                                         WS-CONTATOS-2-LIDOS
                                         WS-CONTATOS-3-GRAVADOS

      *************  ABERTURA DO ARQUIVO DE CONTATOS PARA LEITURA *****
            OPEN INPUT CONTATOS

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY 'ERRO DE ABERTURA DO ARQUIVO CONTATOS'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-TERMINA  THRU P900-FIM
            END-IF

      ************  ABERTURA DO ARQUIVO DE CONTATOS2 PARA LEITURA *****
            OPEN INPUT CONTATOS2

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY 'ERRO DE ABERTURA DO ARQUIVO CONTATOS2'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-TERMINA  THRU P900-FIM
            END-IF

      ***********  ABERTURA DO ARQUIVO DE CONTATOS3 PARA GRAVAÇÃO *****
            OPEN OUTPUT CONTATOS3

            IF WS-FS NOT EQUAL ZEROS THEN
               DISPLAY 'ERRO DE ABERTURA DO ARQUIVO CONTATOS3'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-TERMINA  THRU P900-FIM
            END-IF
            .
       P100-FIM.
       P300-PROCESSA.

        INITIALIZE   WS-REGISTRO
                     REG-CONTATOS-3
                     REPLACING ALPHANUMERIC BY SPACES
                               NUMERIC      BY ZEROS

            PERFORM P301-LER-1                THRU P301-FIM
            PERFORM P302-LER-2                THRU P302-FIM

            SET EOF-OK-1 EOF-OK-2             TO FALSE

            PERFORM UNTIL EOF-OK-1
                    AND   EOF-OK-2
                EVALUATE TRUE
                    WHEN ID-CONTATO LESS THAN ID-CONTATO-2
                         MOVE REG-CONTATOS     TO  REG-CONTATOS-3
                         PERFORM P303-GRAVA-3  THRU P303-FIM
                         PERFORM P301-LER-1    THRU P301-FIM
                    WHEN ID-CONTATO EQUAL ID-CONTATO-2
                         MOVE REG-CONTATOS-2   TO  REG-CONTATOS-3
                         PERFORM P303-GRAVA-3  THRU P303-FIM
                         PERFORM P301-LER-1    THRU P301-FIM
                         PERFORM P302-LER-2    THRU P302-FIM
                    WHEN ID-CONTATO GREATER THAN ID-CONTATO-2
                         MOVE REG-CONTATOS-2   TO  REG-CONTATOS-3
                         PERFORM P303-GRAVA-3  THRU P303-FIM
                         PERFORM P302-LER-2    THRU P302-FIM
                END-EVALUATE
            END-PERFORM
            .
       P300-FIM.
       P301-LER-1.

            SET FS-OK                         TO TRUE

             READ CONTATOS
                 AT END
                    SET EOF-OK-1 TO TRUE
                    MOVE 99      TO ID-CONTATO
                 NOT AT END
                    IF FS-OK
                        ADD 1    TO WS-CONTATOS-LIDOS
                    ELSE
                        DISPLAY 'ERRO AO LER O ARQUIVO DE CONTATOS'
                        DISPLAY 'FILE STATUS: ' WS-FS
                    END-IF
            END-READ
            .
       P301-FIM.
       P302-LER-2.

            SET FS-OK                          TO TRUE

             READ CONTATOS2
                 AT END
                    SET EOF-OK-2 TO TRUE
                    MOVE 99      TO ID-CONTATO-2
                 NOT AT END
                    IF FS-OK
                        ADD 1    TO WS-CONTATOS-2-LIDOS
                    ELSE
                        DISPLAY 'ERRO AO LER O ARQUIVO DE CONTATOS 2'
                        DISPLAY 'FILE STATUS: ' WS-FS
                    END-IF
            END-READ
            .
       P302-FIM.
       P303-GRAVA-3.

            SET FS-OK                          TO TRUE

            WRITE REG-CONTATOS-3
                    INVALID KEY
                        DISPLAY
                        'CONTATO JA CADASTRADO NO BALANCE LINE!'
                    NOT INVALID KEY
                        ADD 1    TO WS-CONTATOS-3-GRAVADOS
            END-WRITE

            IF NOT FS-OK
               DISPLAY 'ERRO AO GRAVAR O ARQUIVO DE CONTATOS 3'
               DISPLAY 'FILE STATUS: ' WS-FS
            END-IF
       .
       P303-FIM.
       P900-TERMINA.

            CLOSE CONTATOS
            CLOSE CONTATOS2
            CLOSE CONTATOS3

            DISPLAY '*********************************************'
            DISPLAY '    RESUMO DO PROCESSAMENTO BALANCE LINE'
            DISPLAY ' '
            DISPLAY ' TOTAL CONTATOS ORIGINAL LIDOS....: '
                    WS-CONTATOS-LIDOS
            DISPLAY ' TOTAL CONTATOS SECUNDARIOS LIDOS.: '
                    WS-CONTATOS-2-LIDOS
            DISPLAY ' CONTATOS GRAVADOS NO BALANCE LINE: '
                    WS-CONTATOS-3-GRAVADOS
            DISPLAY '*********************************************'

            STOP RUN
            .
       P900-FIM.
       END PROGRAM BLUNIAO.
