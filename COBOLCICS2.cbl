      *---------------------------------------------------------------*
       IDENTIFICATION              DIVISION.
      *---------------------------------------------------------------*
       PROGRAM-ID.                 CFPKO000.
      *--------------------------------------------------------------*
      * PROGRAMA   : CFPKO000
      * ANALISTA   : ANDRE COSTA
      * PROGRAMADOR: ANDRE COSTA
      * OBJETIVO   : MENU TELA BMS
      *--------------------------------------------------------------*
      *             HISTORICO DE VERSOES
      *--------------------------------------------------------------*
      * VRS  | AUTOR   | DATA       | DESCRICAO
      *--------------------------------------------------------------*
      * 001  | ANDRE  | 21/12/2007 |  IMPLANTACAO
      *

      *---------------------------------------------------------------*
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.              DECIMAL-POINT   IS   COMMA.
      *---------------------------------------------------------------*

      *---------------------------------------------------------------*
       DATA                        DIVISION.
      *---------------------------------------------------------------*

      *---------------------------------------------------------------*
       WORKING-STORAGE             SECTION.
      *---------------------------------------------------------------*
      *
      /**-----------------------------------------------------------***
      ***      AREAS AUXILIARES                                     ***
      ***-----------------------------------------------------------***
      *
       77      WS-ABSTIME          PIC    S9(015) COMP  VALUE +0.
       77      WS-HRS-EDIT         PIC     X(008) VALUE SPACES.
       77      WS-ANO-CICS         PIC    S9(008) COMP  VALUE +0.
       01      WS-TEXTO            PIC     X(50)  VALUE SPACES.
      *
      /**-----------------------------------------------------------***
      ***      AREA DE TRATAMENTO DE DATA                           ***
      ***-----------------------------------------------------------***
      *
       01      WS-DT-EDIT.
         03    WS-DAT-EDIT.
           05  WS-DD-EDIT          PIC     9(002).
           05  FILLER              PIC     X(001).
           05  WS-MM-EDIT          PIC     9(002).
           05  FILLER              PIC     X(001).
           05  WS-AA-EDIT          PIC     X(002).
         03    FILLER              PIC     X(002).
       01      FILLER              REDEFINES      WS-DT-EDIT.
         03    FILLER              PIC     X(006).
         03    WS-SA-EDIT          PIC     9(004).
      *
      /**-----------------------------------------------------------***
      ***      AREA DE TRATAMENTO DE MENSAGENS                      ***
      ***-----------------------------------------------------------***
      *
       01      WS-MENSAGENS.
         03    WS-MSG-01           PIC     X(030) VALUE
              'TK00-01-Opção inválida        '.
         03    WS-MSG-02           PIC     X(030) VALUE
              'TK00-02-Tecla inválida        '.
         03    WS-MSG-03           PIC     X(030) VALUE
              'TK00-03-Informe opção desejada'.
         03    WS-MSG-99           PIC     X(030) VALUE
              'TK00-99-Sistema indisponível'.
      *
      *---------------------------------------------------------------*
      *        AREA DE DEFINICAO DO MAPA - MAPSET (CFPkM00)           *
      *---------------------------------------------------------------*
       COPY    CFPKM00.
      *---------------------------------------------------------------*
      *        AREA DO BOOK DE AREAS DO CICS                          *
      *---------------------------------------------------------------*
      *
       COPY    DFHAID.
      *
      *---------------------------------------------------------------*
      *        AREA DO BOOK DE ATRIBUTOS                              *
      *---------------------------------------------------------------*
      *
       COPY    DFHBMSCA.
      *===============================================================*
       PROCEDURE                   DIVISION.
      *---------------------------------------------------------------*
      *
       000000-PRINCIPAL            SECTION.
      *
           EXEC    CICS    HANDLE  ABEND
                                   LABEL   (999-99-ERROR)
           END-EXEC.

           EXEC    CICS    HANDLE  CONDITION
                                   ERROR   (999-99-ERROR)
           END-EXEC.

           PERFORM 830-00-FORMATTIME.

           PERFORM 100000-INICIALIZA-TELA.

       EXECUCAO.

           PERFORM 820-00-SEND-MAP-DATAONLY
           PERFORM 020-00-RECEIVE-MAP

           IF EIBAID EQUAL DFHPF3
              PERFORM 996-00-TRANS-ENCERRADA
           ELSE
              IF EIBAID EQUAL DFHENTER
                 PERFORM 050-00-TRATA-ENTER
              ELSE
                 PERFORM 060-00-TECLA-INVALIDA
              END-IF
           END-IF.
      *
      /===============================================================*
       100000-INICIALIZA-TELA      SECTION.
      *---------------------------------------------------------------*
      *
           MOVE LOW-VALUES                 TO cfpkM00O

           EXEC    CICS    ASSIGN  USERID  (MK0-USERO) END-EXEC.

      *    MOVE 'cfpkM00'                  TO Mk0-MAPAO
           MOVE -1                         TO Mk0-OPCAOL
           MOVE WS-MSG-03                  TO Mk0-MSGO.

           PERFORM 810-00-SEND-MAP-ERASE.
      *
      *---------------------------------------------------------------*
       010-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       020-00-RECEIVE-MAP          SECTION.
      *---------------------------------------------------------------*
      *
           EXEC    CICS    RECEIVE MAP   ('CFPKM00')
                           MAPSET        ('CFPKM00')
                           INTO          (CFPKM00I)
           END-EXEC.
      *
      *---------------------------------------------------------------*
       020-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       050-00-TRATA-ENTER          SECTION.
      *---------------------------------------------------------------*
      *
           EVALUATE MK0-OPCAOI
              WHEN '1'
                  PERFORM 051-00-TRATA-OPCAO1
              WHEN '2'
                  PERFORM 052-00-TRATA-OPCAO2
              WHEN '3'
                  PERFORM 053-00-TRATA-OPCAO3
              WHEN '4'
                  PERFORM 054-00-TRATA-OPCAO4
              WHEN OTHER
                  PERFORM 055-00-OPCAO-INVALIDA
           END-EVALUATE.
           GO TO EXECUCAO.
      *
      *---------------------------------------------------------------*
       050-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      *
      /===============================================================*
       051-00-TRATA-OPCAO1         SECTION.
      *---------------------------------------------------------------*
      *
           MOVE 'GRAVANDO TS TESTE' TO WS-TEXTO.
           EXEC CICS
               LINK PROGRAM('CFPKO001')
               COMMAREA (WS-TEXTO)
               LENGTH (LENGTH OF WS-TEXTO)
           END-EXEC.
           MOVE WS-MSG-03  TO      Mk0-MSGO.
           MOVE -1         TO      Mk0-OPCAOL.
      *
      *---------------------------------------------------------------*
       051-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       052-00-TRATA-OPCAO2         SECTION.
      *---------------------------------------------------------------*
      *

           EXEC CICS
               XCTL PROGRAM('CFPKO004')
           END-EXEC.
           MOVE WS-MSG-02  TO      Mk0-MSGO.
           MOVE -1         TO      Mk0-OPCAOL.
      *
      *---------------------------------------------------------------*
       052-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      *
      /===============================================================*
       053-00-TRATA-OPCAO3         SECTION.
      *---------------------------------------------------------------*
      *
      /    MOVE 'GRAVANDO LINHA 1' TO WS-TEXTO.
      /    EXEC CICS
      /        LINK PROGRAM('CFPKO001')
      /        COMMAREA (WS-TEXTO)
      /        LENGTH (LENGTH OF WS-TEXTO)
      /    END-EXEC.
           MOVE WS-MSG-02  TO      Mk0-MSGO.
           MOVE -1         TO      Mk0-OPCAOL.
      *
      *---------------------------------------------------------------*
       053-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      *
      /===============================================================*
       054-00-TRATA-OPCAO4         SECTION.
      *---------------------------------------------------------------*
      *
           EXEC CICS
               LINK PROGRAM('CFPKO003')
           END-EXEC.
           MOVE WS-MSG-02  TO      Mk0-MSGO.
           MOVE -1         TO      Mk0-OPCAOL.
      *
      *---------------------------------------------------------------*
       054-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       055-00-OPCAO-INVALIDA       SECTION.
      *---------------------------------------------------------------*
      *
           MOVE    -1              TO      Mk0-OPCAOL.
           MOVE    WS-MSG-02       TO      Mk0-MSGO.
      *
      *---------------------------------------------------------------*
       055-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       060-00-TECLA-INVALIDA       SECTION.
      *---------------------------------------------------------------*
      *
           MOVE    -1              TO      Mk0-OPCAOL.
           MOVE    WS-MSG-02       TO      Mk0-MSGO.
           GO TO EXECUCAO.
      *
      *---------------------------------------------------------------*
       060-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       810-00-SEND-MAP-ERASE       SECTION.
      *---------------------------------------------------------------*
      *
      *    PERFORM 830-00-FORMATTIME.

           EXEC    CICS    SEND    MAP      ('CFPKM00')
                                   MAPSET   ('CFPKM00')
                                   FROM     (cfpkM00O)
                                   ERASE
                                   CURSOR
                                   FREEKB
                                   ALARM
           END-EXEC.

      *    EXEC    CICS    RETURN  TRANSID ('TF00')
      *    END-EXEC.
      *
      *---------------------------------------------------------------*
       810-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       820-00-SEND-MAP-DATAONLY    SECTION.
      *---------------------------------------------------------------*
      *
      *    PERFORM 830-00-FORMATTIME.

           EXEC    CICS    SEND    MAP      ('CFPKM00')
                                   MAPSET   ('CFPKM00')
                                   FROM     (cfpkM00O)
                                   DATAONLY
                                   CURSOR
                                   FREEKB
                                   ALARM

           END-EXEC.

      *
      *---------------------------------------------------------------*
       820-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       830-00-FORMATTIME           SECTION.
      *---------------------------------------------------------------*
      *
           EXEC    CICS    ASKTIME      ABSTIME    (WS-ABSTIME)
           END-EXEC.

           EXEC    CICS    FORMATTIME   ABSTIME    (WS-ABSTIME)
                                        DDMMYY     (WS-DAT-EDIT)
                                        DATESEP    ('/')
                                        YEAR       (WS-ANO-CICS)
                                        TIME       (WS-HRS-EDIT)
                                        TIMESEP    (':')
           END-EXEC.

           MOVE    WS-ANO-CICS     TO      WS-SA-EDIT.

           MOVE    WS-DT-EDIT      TO      Mk0-DATAO.
           MOVE    WS-HRS-EDIT     TO      Mk0-HORAO.
      *
      *---------------------------------------------------------------*
       830-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       996-00-TRANS-ENCERRADA      SECTION.
      *---------------------------------------------------------------*
      *
          EXEC  CICS  SEND  CONTROL  ERASE NOHANDLE
          END-EXEC
          EXEC  CICS  RETURN                 END-EXEC.
      *
      *---------------------------------------------------------------*
       996-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      /===============================================================*
       999-99-ERROR                SECTION.
      *---------------------------------------------------------------*
      *
           MOVE    WS-MSG-99       TO      Mk0-MSGO.
           MOVE    -1              TO      Mk0-OPCAOL.

           PERFORM 810-00-SEND-MAP-ERASE.
      *
      *---------------------------------------------------------------*
       999-99-EXIT.
      *-=-=-=-=-=-*
              EXIT.
      ***-----------------------------------------------------------***
      ***                FIM DO PROGRAMA - EAOP0A1C                 ***
      ***-----------------------------------------------------------***
