      *===============================================================*
       IDENTIFICATION              DIVISION.
      *---------------------------------------------------------------*
      *
       PROGRAM-ID. TR6PO001.
       AUTHOR. ANDRE COSTA.
       DATE-WRITTEN.               26/04/2007.
      *
      *===============================================================*
       ENVIRONMENT                 DIVISION.
      *---------------------------------------------------------------*
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
      *
      *===============================================================*
       DATA                        DIVISION.
      *---------------------------------------------------------------*
       WORKING-STORAGE             SECTION.
      *
       77  TESTE-01                PIC  X(40)  VALUE
              'TR6PO001 - EXECUTA TR6PO002'.
       77  TESTE-02                PIC  X(40)  VALUE
              'TR6PO001 - RETORNO TR6PO002'.
       77  ERRO-01                 PIC  X(40)  VALUE
              'TR6PO001 - ERRO'.
      *
      *===============================================================*
       PROCEDURE                   DIVISION.
      *---------------------------------------------------------------*
      *
           EXEC CICS  HANDLE  CONDITION
                           TRANSIDERR  (999-00-ERRO)
           END-EXEC.

           EXEC CICS  SEND  TEXT
                            FROM (TESTE-01)
           END-EXEC.

           EXEC CICS  XCTL  PROGRAM ('TR6PO002')
           END-EXEC.

           EXEC CICS  SEND  TEXT
                            FROM  (TESTE-02)
           END-EXEC.

           GOBACK.
      *
       999-00-ERRO  SECTION.
           EXEC CICS  SEND  TEXT
                            FROM  (ERRO-01)
           END-EXEC.
       999-99-ERRO.
           EXIT.
      ***-----------------------------------------------------------***
      ***                FIM DO PROGRAMA - EAOP000C                 ***
      ***-----------------------------------------------------------***
