      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 11/02/2021
      * Purpose: DEMONSTRAR LEITURA DE ARQUIVO
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGERACSV.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT ARQCSV ASSIGN TO
       'C:\CursoCOBOL\COBOL\01 - Basico\bin\ARQ1.CSV'
      * ORGANIZATION IS SEQUENTIAL.
        ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD ARQCSV.
       01 REG-CSV           PIC X(50).

       WORKING-STORAGE SECTION.

       77 WS-EOF             PIC A      VALUE SPACE.

       01 WS-CSV.
          03 CSV-NOME       PIC X(10).
          03 FILLER         PIC X VALUE ';'.
          03 CSV-ENDERECO   PIC X(15).
          03 FILLER         PIC X VALUE ';'.
          03 CSV-CIDADE     PIC X(10).
          03 FILLER         PIC X VALUE ';'.
          03 CSV-UF         PIC X(02).
          03 FILLER         PIC X VALUE ';'.
          03 CSV-FONE       PIC X(08).
          03 FILLER         PIC X VALUE ';'.

       PROCEDURE DIVISION.

           MAIN-PROCEDURE.

            MOVE 'I'         TO WS-EOF

            OPEN OUTPUT ARQCSV

            PERFORM UNTIL WS-EOF = 'F'

                DISPLAY 'INFORME O PRIMEIRO NOME: '
                ACCEPT  CSV-NOME

                DISPLAY 'INFORME O ENDERECO: '
                ACCEPT  CSV-ENDERECO

                DISPLAY 'INFORME A CIDADE: '
                ACCEPT  CSV-CIDADE

                DISPLAY 'INFORME A UF: '
                ACCEPT  CSV-UF

                DISPLAY 'INFORME O TELEFONE: '
                ACCEPT  CSV-FONE

                MOVE WS-CSV  TO REG-CSV

                WRITE REG-CSV

                DISPLAY 'TECLE <F> PARA FINALIZAR OU QUALQUER CONTINUA'
                ACCEPT WS-EOF

            END-PERFORM

            CLOSE ARQCSV.

            STOP RUN.

       END PROGRAM PGERACSV.
