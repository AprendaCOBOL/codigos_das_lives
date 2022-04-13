      ******************************************************************
      * Author: RAFAEL CARVALHO
      * Date: 02/05/2021
      * Purpose: Calcular um boletim escolar
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. CFPP99D.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 WS-CABEC-1.
           05 FILLER      PIC X(12)     VALUE '------------'.
           05 FILLER      PIC X(16)     VALUE 'CALCULAR BOLETIM'.
           05 FILLER      PIC X(12)     VALUE '------------'.
       01 WS-MENSAG-NOME.
           05 FILLER      PIC X(23)     VALUE 'DIGITAR SEU NOME:'.
       01 WS-MENSAG-MAT.
           05 FILLER      PIC X(23)     VALUE 'DIGITAR MATERIA:'.
       01 WS-MENSAG-NOTA.
           05 FILLER      PIC X(13)     VALUE 'DIGITAR NOTA '.
           05 WS-CONTADOR PIC 9         VALUE 1.
           05 FILLER      PIC X         VALUE ':'.
       01 WS-RESULTADO.
           05 FILLER                    PIC X(04)        VALUE '*** '.
           05 FILLER                    PIC X(26)        VALUE
                                         'RESULTADO DO PROCESSAMENTO'.
           05 FILLER                    PIC X(04)        VALUE ' ***'.
       77 WS-NOTA-TOT          PIC 9(04)V99  VALUE ZEROS.
       77 WS-MEDIA                PIC 99V99       VALUE ZEROS.
       77 WS-MEDIA-EDIT       PIC Z9,99        VALUE ZEROS.
       77 WS-ACCEPT-NOME  PIC X(15)         VALUE SPACES.
       77 WS-ACCEPT-MAT      PIC X(16)        VALUE SPACES.
       77 WS-ACCEPT-NOTA    PIC S9(02)V99 VALUE ZEROS.
       77 WS-APROVACAO      PIC X(10)         VALUE SPACES.
       77 WS-ACAO                   PIC X               VALUE SPACES.
      ***********************************
       PROCEDURE DIVISION.
       000-PRINCIPAL SECTION.
       001-PRINCIPAL.
            PERFORM 101-INICIAR.
            PERFORM 201-PROCESSAR UNTIL WS-CONTADOR = 5.
            PERFORM 901-FINALIZAR.
            STOP RUN.
      ***********************************
       100-INICIAR SECTION.
       101-INICIAR.
          DISPLAY    WS-CABEC-1
          DISPLAY    WS-MENSAG-NOME
          ACCEPT     WS-ACCEPT-NOME
              IF WS-ACCEPT-NOME = SPACES THEN
                  PERFORM 701-EXIBIR-MSG-ERRO2
                  DISPLAY    WS-MENSAG-NOME
                  ACCEPT     WS-ACCEPT-NOME
              END-IF.
          DISPLAY    WS-MENSAG-MAT.
          ACCEPT     WS-ACCEPT-MAT.
              IF WS-ACCEPT-MAT = SPACES THEN
                  PERFORM 701-EXIBIR-MSG-ERRO2
                  DISPLAY    WS-MENSAG-MAT
                  ACCEPT     WS-ACCEPT-MAT
              END-IF.
      **********************************
       200-PROCESSAR SECTION.
       201-PROCESSAR.
           INITIALIZE WS-ACCEPT-NOTA
                      WS-ACAO
           DISPLAY WS-MENSAG-NOTA
           ACCEPT  WS-ACCEPT-NOTA
               IF WS-ACCEPT-NOTA IS NUMERIC THEN
                    EVALUATE TRUE
                       WHEN WS-ACCEPT-NOTA < 0
                           PERFORM 301-EXIBIR-MSG-ERRO
                           GO TO 201-PROCESSAR
                       WHEN WS-ACCEPT-NOTA > 10
                           PERFORM 301-EXIBIR-MSG-ERRO
                           GO TO 201-PROCESSAR
                       WHEN OTHER
                            ADD 1                  TO WS-CONTADOR
                            ADD WS-ACCEPT-NOTA     TO WS-NOTA-TOT
                             ON SIZE ERROR PERFORM 601-ERRO-CALCULO
                    END-EVALUATE
               ELSE
                    PERFORM 301-EXIBIR-MSG-ERRO
                    GO TO 201-PROCESSAR
               END-IF.
      **********************************
       300-EXIBIR-MSG-ERRO SECTION.
       301-EXIBIR-MSG-ERRO.
           DISPLAY '***********************************************'
           DISPLAY '*    NOTA INVALIDA - TENTE NOVAMENTE          *'
           DISPLAY '***********************************************'.
      **********************************
       400-CALCULAR-APROVACAO SECTION.
       401-CALCULAR-APROVACAO.
           COMPUTE WS-MEDIA = (WS-NOTA-TOT / 4)
             ON SIZE ERROR PERFORM 601-ERRO-CALCULO.
           EVALUATE TRUE
             WHEN WS-MEDIA >= 7
                 MOVE 'APROVADO'  TO WS-APROVACAO
             WHEN WS-MEDIA <= 7
                 MOVE 'REPROVADO' TO WS-APROVACAO
           END-EVALUATE.
      **********************************
       500-EXIBIR-MSG-ERRO1 SECTION.
       501-EXIBIR-MSG-ERRO1.
           DISPLAY '***********************************************'
           DISPLAY '*    OPCAO INVALIDA - TENTE NOVAMENTE         *'
           DISPLAY '***********************************************'.
      **********************************
       600-ERRO-CALCULO SECTION.
       601-ERRO-CALCULO.
           DISPLAY 'ERRO NO CALCULO'
           PERFORM 201-PROCESSAR.
      **********************************
       700-EXIBIR-MSG-ERRO2 SECTION.
       701-EXIBIR-MSG-ERRO2.
           DISPLAY '***********************************************'
           DISPLAY '*    CAMPO VAZIO - TENTE NOVAMENTE            *'
           DISPLAY '***********************************************'.
      **********************************
       900-FINALIZAR SECTION.
       901-FINALIZAR.
           PERFORM 401-CALCULAR-APROVACAO
           DISPLAY WS-RESULTADO.
           DISPLAY ' '.
           DISPLAY 'Nome Aluno    : ' WS-ACCEPT-NOME.
           DISPLAY 'Materia       : ' WS-ACCEPT-MAT.
           MOVE WS-MEDIA         TO WS-MEDIA-EDIT.
           DISPLAY 'Media         : ' WS-MEDIA-EDIT.
           DISPLAY 'Status        : ' WS-APROVACAO.
           DISPLAY ' '.
           DISPLAY '**********************************'.
           DISPLAY 'DIGITE S-CONTINUAR E N-SAIR.'
           INITIALIZE WS-ACAO
           ACCEPT WS-ACAO
           EVALUATE WS-ACAO
               WHEN 'S'
                   MOVE 1 TO WS-CONTADOR
                   MOVE 0 TO WS-MEDIA
                   MOVE 0 TO WS-NOTA-TOT
                   PERFORM 001-PRINCIPAL
               WHEN 'N'
                   DISPLAY '*******************************************'
                   DISPLAY '*       OBRIGADO - VOLTE SEMPRE           *'
                   DISPLAY '*******************************************'
                   STOP RUN
               WHEN OTHER
                   PERFORM 501-EXIBIR-MSG-ERRO1
           END-EVALUATE.
