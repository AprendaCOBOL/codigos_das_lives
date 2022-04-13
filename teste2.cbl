      ******************************************************************
      * Author: MAURO VIEIRA
      * Date:15/02/2022
      * Purpose: GRAVA ARQUIVO DE APROVADOS
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTE2.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT CFPK0001 ASSIGN TO
       "C:\Users\Mauro Vieira\bin\CFPK0001.DAT"
       ORGANIZATION IS INDEXED
       ACCESS       IS RANDOM
       RECORD KEY   IS ID-ALUNO
       FILE STATUS  IS WS-FS1.

       SELECT CFPK0002 ASSIGN TO
       "C:\Users\Mauro Vieira\bin\CFPK0002.DAT"
       ORGANIZATION IS INDEXED
       ACCESS       IS RANDOM
       RECORD KEY   IS ID-MATERIA
       FILE STATUS  IS WS-FS2.

       SELECT APROVADO ASSIGN TO
       "C:\Users\Mauro Vieira\bin\APROVADO.TXT"
       ORGANIZATION IS SEQUENTIAL
      * ACCESS       IS SEQUENTIAL
       FILE STATUS  IS WS-FS3.

       SELECT REPROVADOS ASSIGN TO
       "C:\USERS\Mauro Vieira\BIN\REPROVADOS.TXT"
       ORGANIZATION IS SEQUENTIAL
      * ACCESS MODE  IS SEQUENTIAL
       FILE STATUS  IS WS-FS4.

       DATA DIVISION.
       FILE SECTION.

       FD CFPK0001.
       01 CFPK0001-ALUNO.
          03 ID-ALUNO                PIC 9(03).
          03 NM-ALUNO                PIC X(20).
          03 TL-ALUNO                PIC 9(11).

       FD CFPK0002.
       01 CFPK0002-MATERIA.
          03 ID-MATERIA              PIC 9(03).
          03 NM-MATERIA              PIC X(20).
          03 NT-APROVACAO            PIC 9(02)V99.

       FD APROVADO.
       01 REG-APROVADO.
          03 ID-ALUNO-APR            PIC 9(03).
          03 NM-ALUNO-APR            PIC X(20).
          03 TL-ALUNO-APR            PIC 9(11).
          03 ID-MATERIA-APR          PIC 9(03).
          03 NM-MATERIA-APR          PIC X(20).
          03 NT-APROVACAO-APR        PIC 9(02)V99.
          03 MD-ALUNO-APR            PIC 9(02)V99.
          03 ST-APROVACAO-APR        PIC X(09).

       FD REPROVADOS.
       01 REG-REPROVADOS.
          03 ID-ALUNO-REP            PIC 9(03).
          03 NM-ALUNO-REP            PIC X(20).
          03 TL-ALUNO-REP            PIC 9(11).
          03 ID-MATERIA-REP          PIC 9(03).
          03 NM-MATERIA-REP          PIC X(20).
          03 NT-APROVACAO-REP        PIC 9(02)V99.
          03 MD-ALUNO-REP            PIC 9(02)V99.
          03 ST-APROVACAO-REP        PIC X(09).

       WORKING-STORAGE SECTION.

       01 WS-DADOS-CFPK0001             PIC X(34) VALUE SPACES.
       01 FILLER REDEFINES WS-DADOS-CFPK0001.
          03 WS-ID-ALUNO                PIC 9(03).
          03 WS-NM-ALUNO                PIC X(20).
          03 WS-TL-ALUNO                PIC 9(11).

       01 WS-DADOS-CFPK0002             PIC X(27) VALUE SPACES.
       01 FILLER REDEFINES WS-DADOS-CFPK0002.
          03 WS-ID-MATERIA              PIC 9(03).
          03 WS-NM-MATERIA              PIC X(20).
          03 WS-NT-APROVACAO            PIC 9(02)V99.

       01 WS-REGISTRO                   PIC X(74)  VALUE SPACES.
       01 FILLER REDEFINES WS-REGISTRO.
           03 RG-ID-ALUNO               PIC 9(03).
           03 RG-NM-ALUNO               PIC X(20).
           03 RG-TL-ALUNO               PIC 9(11).
           03 RG-ID-MATERIA             PIC 9(03).
           03 RG-NM-MATERIA             PIC X(20).
           03 RG-NT-APROVACAO           PIC 9(02)V99.
           03 RG-MD-ALUNO               PIC 9(02)V99.
           03 RG-ST-APROVACAO           PIC X(09).

       01 WS-MASCARAS                   PIC 9(11)  VALUE 0.
       01 FILLER REDEFINES WS-MASCARAS.
          03 WS-DDD                     PIC 9(02).
          03 WS-TEL                     PIC 9(09).

       77 WS-EOF                        PIC A  VALUE SPACES.
       77 WS-FS1                        PIC 99.
       77 WS-FS2                        PIC 99.
       77 WS-FS3                        PIC 99.
       77 WS-FS4                        PIC 99.
       77 WS-NOTA1                   PIC 9(02)V99.
       77 WS-NOTA2                   PIC 9(02)V99.
       77 WS-NOTA3                   PIC 9(02)V99.
       77 WS-NOTA4                   PIC 9(02)V99.
       77 WS-NOTAS                   PIC 9(02)V99.
       77 WS-EXIT                    PIC X.
          88 EXIT-OK                 VALUE "F" FALSE "N".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           SET EXIT-OK  TO FALSE.

           OPEN INPUT  CFPK0001
                       CFPK0002.

           DISPLAY "*************************************************"
           DISPLAY "|           SISTEMA DE BOLETIM ESCOLAR          |"
           DISPLAY "|               CALCULO DE NOTAS                |"
           DISPLAY "*************************************************"
           DISPLAY " "

           PERFORM P-INICIO THRU P-INICIO-FIM UNTIL EXIT-OK.
           PERFORM P800-FIM.

       P-INICIO.
           DISPLAY "Informe Codigo do Aluno: " ACCEPT ID-ALUNO
           READ CFPK0001 INTO WS-DADOS-CFPK0001
           DISPLAY "ALUNO......." WS-NM-ALUNO
           IF WS-FS1 NOT EQUAL 10
              MOVE WS-ID-ALUNO     TO RG-ID-ALUNO
              MOVE WS-NM-ALUNO     TO RG-NM-ALUNO
              MOVE WS-TL-ALUNO     TO RG-TL-ALUNO
           ELSE
               DISPLAY " ERRO AO ABRIR  O ARQUIVO DE ALUNOS <CFPK0001>"
               DISPLAY " FILE STATUS: " WS-FS1
               GO TO P800-FIM
           END-IF

           DISPLAY "Informe Codigo da Disciplina: " ACCEPT ID-MATERIA
           READ CFPK0002 INTO WS-DADOS-CFPK0002
           IF WS-FS2 NOT EQUAL "10"
              MOVE WS-ID-MATERIA   TO RG-ID-MATERIA
              MOVE WS-NM-MATERIA   TO RG-NM-MATERIA
              MOVE WS-NT-APROVACAO TO RG-NT-APROVACAO
           ELSE
               DISPLAY " ERRO AO ABRIR  O ARQUIVO DE ALUNOS <CFPK0001>"
               DISPLAY " FILE STATUS: " WS-FS2
               GO TO P800-FIM
           END-IF

           DISPLAY "Informe as 4 Notas do Aluno na Disciplina:"
           DISPLAY "Nota 1..........: " ACCEPT WS-NOTA1
           DISPLAY "Nota 2..........: " ACCEPT WS-NOTA2
           DISPLAY "Nota 3..........: " ACCEPT WS-NOTA3
           DISPLAY "Nota 4..........: " ACCEPT WS-NOTA4

           COMPUTE
           WS-NOTAS = (WS-NOTA1 + WS-NOTA2 + WS-NOTA3 + WS-NOTA4) / 4
           MOVE WS-NOTAS  TO  RG-MD-ALUNO

           DISPLAY "Codigo/Nome do Aluno.......: " RG-ID-ALUNO " - "
                                                   RG-NM-ALUNO
           MOVE WS-TL-ALUNO TO WS-MASCARAS
           DISPLAY "Telefone do Aluno..........: " "(" WS-DDD ")"
                                                    WS-TEL
           DISPLAY "Codigo Nome da Disciplina..: " RG-ID-MATERIA " - "
                                                   RG-NM-MATERIA
           DISPLAY "NOTA DE APROVACAO..........: " RG-NT-APROVACAO
           DISPLAY "NOTA MEDIA.................: " RG-MD-ALUNO

           IF WS-NOTAS > OR = 7
              MOVE "APROVADO" TO RG-ST-APROVACAO
              OPEN OUTPUT APROVADO
              WRITE REG-APROVADO FROM WS-REGISTRO
              DISPLAY "STATUS....................: " RG-ST-APROVACAO
              DISPLAY "REGISTRO GRAVADO COM SUCESSO! <APROVADO>"
              CLOSE APROVADO
           ELSE
              MOVE "REPROVADO" TO RG-ST-APROVACAO
              OPEN OUTPUT REPROVADOS
              WRITE REG-REPROVADOS FROM WS-REGISTRO
              DISPLAY "STATUS.................... :" RG-ST-APROVACAO
              DISPLAY "REGISTRO GRAVADO COM SUCESSO! <REPROVADOS>"
              CLOSE REPROVADOS
           END-IF

           DISPLAY
             "Tecle : "
             "<QUALQUER TECLA> para continuar, ou <F> para finalizar"
           ACCEPT WS-EXIT.

       P-INICIO-FIM.
           EXIT.

       P800-FIM.
           CLOSE CFPK0001
                 CFPK0002.

            DISPLAY "*** FIM DE PROCESSAMENTO ***"
            STOP RUN.
       END PROGRAM TESTE2.
