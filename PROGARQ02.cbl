      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 01/03/2021
      * Purpose: MOSTRAR LEITURA DE ARQUIVOS NO COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGARQ02.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT ASSIGN TO
           'C:\CURSOCOBOL\COBOL\01 - BASICO\BIN\STUDENT.TXT'
           ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
       FD STUDENT.
       01 STUDENT-FILE.
          03 CD-STUDENT           PIC 9(05).
          03 NM-STUDENT           PIC X(20).

       WORKING-STORAGE SECTION.

       01 WS-DADOS                PIC X(25)  VALUE SPACES.
       01 FILLER REDEFINES WS-DADOS.
          03 WS-CD-STUDENT        PIC 9(05).
          03 WS-NM-STUDENT        PIC X(20).
       77 WS-EOF                  PIC A      VALUE SPACE.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            OPEN INPUT STUDENT.

            PERFORM UNTIL WS-EOF = 'F'
                READ STUDENT INTO WS-DADOS
                     AT END MOVE 'F' TO WS-EOF
                        NOT AT END
                            DISPLAY WS-CD-STUDENT ' - ' WS-NM-STUDENT
                END-READ
            END-PERFORM.

            CLOSE STUDENT.

            STOP RUN.
       END PROGRAM PROGARQ02.
