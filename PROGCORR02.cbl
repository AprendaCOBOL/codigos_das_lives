      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 20/05/2021
      * Purpose: APRESENTAR A INSTRUÇÃO CORRESPONDING
      * Version: 1.0
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCORR2.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WS-REG-1.
          03 WS-NOME             PIC X(10).
          03 WS-TEL              PIC 9(09).
          03 WS-SALARIO          PIC 9(04)V99.
          03 WS-UF               PIC X(02).

       01 WS-REG-2.
          03 WS-NOME             PIC X(10).
          03 WS-UF               PIC X(02).
          03 WS-TEL              PIC 9(09).
          03 WS-SALARIO          PIC 9(04)V99.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 'MARCOS'        TO WS-NOME    OF WS-REG-1
            MOVE 99999999        TO WS-TEL     OF WS-REG-1
            MOVE 2300.50         TO WS-SALARIO OF WS-REG-1
            MOVE 'CE'            TO WS-UF      OF WS-REG-1

            DISPLAY '*** REG 1 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-1
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-1
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-1
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-1

            MOVE WS-REG-1                      TO WS-REG-2

            DISPLAY WS-REG-1
            DISPLAY WS-REG-2

            INITIALISE WS-REG-2

            MOVE CORR WS-REG-1                 TO WS-REG-2

            DISPLAY WS-REG-1
            DISPLAY WS-REG-2

            DISPLAY '*** REG 2 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-2
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-2
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-2
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-2

            ADD 200                            TO WS-SALARIO OF WS-REG-1

            MOVE CORR WS-REG-1                 TO WS-REG-2
            DISPLAY 'USO DO COMANDO ADD'
            DISPLAY '*** REG 1 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-1
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-1
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-1
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-1
            DISPLAY '*** REG 2 ****'
            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-2
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-2
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-2
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-2

            SUBTRACT 50                      FROM WS-SALARIO OF WS-REG-1

            MOVE CORR WS-REG-1                 TO WS-REG-2
            DISPLAY 'USO DO COMANDO SUBTRACT'
            DISPLAY '*** REG 1 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-1
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-1
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-1
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-1
            DISPLAY '*** REG 2 ****'
            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-2
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-2
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-2
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-2

            ADD CORR WS-REG-1                  TO WS-REG-2

            DISPLAY 'USO DO COMANDO ADD CORR'
            DISPLAY '*** REG 1 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-1
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-1
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-1
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-1
            DISPLAY '*** REG 2 ****'
            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-2
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-2
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-2
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-2

            ADD 300                            TO WS-SALARIO OF WS-REG-1
            SUBTRACT 50000                   FROM WS-TEL     OF WS-REG-1

            SUBTRACT CORR WS-REG-1           FROM WS-REG-2

            DISPLAY 'USO DO COMANDO SUBTRACT'
            DISPLAY '*** REG 1 ****'

            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-1
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-1
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-1
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-1

            DISPLAY '*** REG 2 ****'
            DISPLAY 'NOME....: ' WS-NOME       OF WS-REG-2
            DISPLAY 'TELEFONE: ' WS-TEL        OF WS-REG-2
            DISPLAY 'SALARIO.: ' WS-SALARIO    OF WS-REG-2
            DISPLAY 'UF......: ' WS-UF         OF WS-REG-2


            STOP RUN.
       END PROGRAM PROGCORR2.
