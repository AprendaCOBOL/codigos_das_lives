      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
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
           'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\STUDENT.TXT'
           ORGANIZATION IS SEQUENTIAL
           FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
           FD ESTUDANTE.
              COPY FD_ESTUDANTE.

       WORKING-STORAGE SECTION.
       01 WS-REGISTRO             PIC X(25)  VALUE SPACES.
       01 FILLER REDEFINES WS-REGISTRO.
          03 WS-CD-STUDENT        PIC 9(05).
          03 WS-NM-STUDENT        PIC X(20).
       77 WS-EOF                  PIC A.
          88 EOF-OK               VALUE 'S' FALSE 'N'.
       77 WS-FS                   PIC 9.
          88 FS-OK                VALUE 0 FALSE 1.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            SET EOF-OK           TO FALSE
            SET FS-OK            TO TRUE

            DISPLAY 'ABRINDO ARQUIVO PARA GRAVAR:'
            OPEN EXTEND ESTUDANTE

            IF FS-OK   THEN
                MOVE 7                  TO CD-STUDENT
                MOVE 'MARIA DO CARMO'   TO NM-STUDENT
                WRITE REG-ESTUDANTE
                CLOSE ESTUDANTE
                DISPLAY 'ESTUDANTE GRAVADO COM SUCESSO!'
            ELSE
                DISPLAY 'ERRO AO ABRIR O ARQUIVO DE ESTUDANTE.'
            END-IF

            STOP RUN.
       END PROGRAM PGARQMOD.
