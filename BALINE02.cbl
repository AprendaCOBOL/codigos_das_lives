      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 21/04/2021
      * Purpose: MOSTRAR BALANCELINE DE UNIÃO
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BALINE02.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
            INPUT-OUTPUT SECTION.
            FILE-CONTROL.
      *****************  ARQUIVO DE LEITURA ORIGINAL ******************
                SELECT CONTATOS ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOS.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS SEQUENTIAL
                RECORD  KEY  IS ID-CONTATO
                FILE STATUS IS WS-FS.
      *****************  ARQUIVO DE LEITURA ATUALIZADO ****************
                SELECT CONTATOB ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOB.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS SEQUENTIAL
                RECORD  KEY  IS ID-CONTATO-B
                FILE STATUS IS WS-FS.
      ****************  ARQUIVO DE RESULTADO DO BALANCELINE ***********
                SELECT CONTATOR ASSIGN TO
                'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOR2.DAT'
                ORGANISATION IS INDEXED
                ACCESS  MODE IS RANDOM
                RECORD  KEY  IS ID-CONTATO-R
                FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.

       FD CONTATOS.
          COPY FD_CONTT.

       FD CONTATOB.
       01 REG-CONTATOS-B.
             03 ID-CONTATO-B               PIC 99.
             03 NM-CONTATO-B               PIC X(20).

       FD CONTATOR.
       01 REG-CONTATOS-R.
             03 ID-CONTATO-R               PIC 99.
             03 NM-CONTATO-R               PIC X(20).

       WORKING-STORAGE SECTION.
       77 WS-FS                            PIC 99.
          88 FS-OK                         VALUE 0.
       77 WS-EOF-1                         PIC X.
          88 EOF-OK-1                      VALUE 'S' FALSE 'N'.
       77 WS-EOF-2                         PIC X.
          88 EOF-OK-2                      VALUE 'S' FALSE 'N'.
       77 WS-EXIT                          PIC X.
          88 EXIT-OK                       VALUE 'F' FALSE 'N'.
       01 WS-CONTADORES.
           03 WS-CONT-1                    PIC 99.
           03 WS-CONT-2                    PIC 99.
           03 WS-CONT-3                    PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM P100-INICIO           THRU  P100-FIM
            PERFORM P300-PROCESSA         THRU  P300-FIM
            PERFORM P900-FINALIZA         THRU  P900-FIM
            .
       P100-INICIO.

            INITIALISE                    WS-CONTADORES

      ************** ABERTURA DO ARQUIVO ORIGINAL PARA LEITURA ********

            OPEN INPUT CONTATOS

            IF WS-FS NOT EQUAL ZEROS
               DISPLAY 'ERRO NA ABERTURA DO ARQUIVO DE CONTATOS ORIG.'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-FINALIZA         THRU  P900-FIM
            END-IF

      ************ ABERTURA DO ARQUIVO ATUALIZADO PARA LEITURA ********

            OPEN INPUT CONTATOB

            IF WS-FS NOT EQUAL ZEROS
               DISPLAY 'ERRO NA ABERTURA DO ARQUIVO DE CONTATOS AT.'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-FINALIZA         THRU  P900-FIM
            END-IF

      ********* ABERTURA DO ARQUIVO DE RESULTADO PARA GRAVAÇÃO ********

            OPEN OUTPUT CONTATOR

            IF WS-FS NOT EQUAL ZEROS
               DISPLAY 'ERRO NA ABERTURA DO ARQUIVO DE RESULTADO'
               DISPLAY 'FILE STATUS: ' WS-FS
               PERFORM P900-FINALIZA         THRU  P900-FIM
            END-IF
            .
       P100-FIM.
       P300-PROCESSA.

            INITIALISE    REG-CONTATOS-R
                          REPLACING ALPHANUMERIC BY SPACES
                                    NUMERIC      BY ZEROES

            PERFORM P301-LER-1               THRU P301-FIM
            PERFORM P302-LER-2               THRU P302-FIM

            SET EOF-OK-1 EOF-OK-2            TO FALSE

            PERFORM UNTIL EOF-OK-1
                    AND   EOF-OK-2
               EVALUATE TRUE
                   WHEN ID-CONTATO LESS THAN ID-CONTATO-B
                        MOVE REG-CONTATOS    TO REG-CONTATOS-R
                        PERFORM P303-GRAVA-3 THRU P303-FIM
                        PERFORM P301-LER-1   THRU P301-FIM
                   WHEN ID-CONTATO EQUAL ID-CONTATO-B
                        MOVE REG-CONTATOS-B  TO REG-CONTATOS-R
                        PERFORM P303-GRAVA-3 THRU P303-FIM
                        PERFORM P301-LER-1   THRU P301-FIM
                        PERFORM P302-LER-2   THRU P302-FIM
                   WHEN ID-CONTATO GREATER   THAN ID-CONTATO-B
                        MOVE REG-CONTATOS-B  TO REG-CONTATOS-R
                        PERFORM P303-GRAVA-3 THRU P303-FIM
                        PERFORM P302-LER-2   THRU P302-FIM
               END-EVALUATE
            END-PERFORM
            .
       P300-FIM.
       P301-LER-1.

            SET FS-OK                        TO TRUE

            READ CONTATOS
               AT END
                  SET EOF-OK-1               TO TRUE
                  MOVE 99                    TO ID-CONTATO
               NOT AT END
                  IF FS-OK
                     ADD 1                   TO WS-CONT-1
                  ELSE
                     DISPLAY 'ERRO AO LER O ARQUIVO ORIGINAL.'
                     DISPLAY 'FILE STATUS: ' WS-FS
                  END-IF
            END-READ
            .
       P301-FIM.
       P302-LER-2.

            SET FS-OK                        TO TRUE

            READ CONTATOB
               AT END
                  SET EOF-OK-2               TO TRUE
                  MOVE 99                    TO ID-CONTATO-B
               NOT AT END
                  IF FS-OK
                     ADD 1                   TO WS-CONT-2
                  ELSE
                     DISPLAY 'ERRO AO LER O ARQUIVO DE ATUALIZACAO.'
                     DISPLAY 'FILE STATUS: ' WS-FS
                  END-IF
            END-READ
            .
       P302-FIM.
       P303-GRAVA-3.

            SET FS-OK                         TO TRUE

            WRITE REG-CONTATOS-R
                  INVALID KEY
                     DISPLAY 'REGISTRO JA EXISTE NO BALANCELINE'
                  NOT INVALID KEY
                     ADD 1                    TO WS-CONT-3
            END-WRITE
            .
       P303-FIM.
       P900-FINALIZA.

            CLOSE CONTATOS
                  CONTATOB
                  CONTATOR

            DISPLAY '************************************************'
            DISPLAY '*      RESULTADO DO BALANCELINE - UNIAO         '
            DISPLAY '************************************************'
            DISPLAY  ' '
            DISPLAY  ' TOTAL DE REGISTROS LIDOS (ORIGINAL): '
                       WS-CONT-1
            DISPLAY  ' TOTAL DE REGISTROS LIDOS (ATUALIZ.): '
                       WS-CONT-2
            DISPLAY  ' TOTAL DE REGISTROS GRAVADOS........: '
                       WS-CONT-3
            DISPLAY  ' '
            DISPLAY '************************************************'

            STOP RUN
            .
       P900-FIM.
       END PROGRAM BALINE02.
