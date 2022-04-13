      ******************************************************************
      * Author: ANDRE COSTA
      * Date: 03/06/2021
      * Purpose: APRESENTAR ARRAYS NO COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGARRAY.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WS-DIAS-DA-SEMANA.
          03 WS-DOM          PIC X(77) VALUE
          '01DOMINGO
      -   '                '.
          03 WS-SEG          PIC X(77) VALUE
          '02SEGUNDA
      -   '                '.
          03 WS-TER          PIC X(77) VALUE
          '03TERCA
      -    '               '.
          03 WS-QUA          PIC X(77) VALUE
          '04QUARTA
      -   '                '.
          03 WS-QUI          PIC X(77) VALUE
          '05QUINTA
      -   '                '.
          03 WS-SEX          PIC X(77) VALUE
          '06SEXTA
      -   '                '.
          03 WS-SAB          PIC X(77) VALUE
          '07SABADO
      -   '                '.

       01 FILLER REDEFINES WS-DIAS-DA-SEMANA.
          03 FILLER OCCURS 7 TIMES.
             05 WS-NUMERO-DIA                PIC 99.
             05 WS-NOME-DIA                  PIC X(07).
             05 WS-EVENTO OCCURS 4 TIMES.
                07 WS-NUM-EVENTO             PIC 99.
                07 WS-DESC-EVENTO            PIC X(15).

       01 WS-CONTRATO.
          03 WS-REG-FIN.
             05 WS-NUM-CONTRATO                 PIC 9(05).
             05 WS-NUM-PRESTACOES               PIC 9(03).
             05 WS-PRESTACOES OCCURS 1 TO 420   TIMES
                              DEPENDING ON
                              WS-NUM-PRESTACOES PIC 9(5)V99.

       77 WS-IND                                PIC 9(03).
       77 WS-ID-EVENTO                          PIC 9(03).
       77 WS-VLR-AUX                            PIC 9(05)V99.
       77 WS-SAIDA                              PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "************ PROGRAMA DE ARRAY **************"

      *      DISPLAY 'INFORME O NUMERO DE PRESTACOES: '
      *      ACCEPT WS-NUM-PRESTACOES
      *
      *      DISPLAY 'INFORME O VALOR DA PRESTACAO: '
      *      ACCEPT WS-VLR-AUX
      *
      ************* ALIMENTADOR DO ARRAY ******************************
      *      IF WS-NUM-PRESTACOES GREATER THAN 420 THEN
      *         DISPLAY ' NUMERO INVALIDO!'
      *      ELSE
      *         MOVE ZEROS                         TO WS-IND
      *         PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND GREATER
      *                                            WS-NUM-PRESTACOES
      *               MOVE WS-VLR-AUX          TO  WS-PRESTACOES(WS-IND)
      *         END-PERFORM
      *      END-IF
      *
      ************* LEITOR DO ARRAY ******************************
      *     MOVE ZEROS                         TO WS-IND
      *     PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND GREATER
      *                                         WS-NUM-PRESTACOES
      *        DISPLAY ' PRESTACAO: ' WS-IND ' VALOR: '
      *                                         WS-PRESTACOES(WS-IND)
      *     END-PERFORM
      *
      *

            MOVE 'N'                  TO WS-SAIDA
            MOVE ZEROS                TO WS-ID-EVENTO
                                         WS-IND
      *************** ALIMENTADOR DE EVENTOS ***********************

            PERFORM UNTIL WS-SAIDA = 'S' OR 's'
               DISPLAY 'INFORME O NUMERO DA SEMANA: '
               ACCEPT WS-IND
               DISPLAY 'INFORME O NUMERO DO EVENTO: '
               ACCEPT WS-ID-EVENTO
               MOVE WS-ID-EVENTO           TO WS-NUM-EVENTO(WS-IND,
                                              WS-ID-EVENTO)
               DISPLAY 'INFORME A DESCRICAO DO EVENTO: '
               ACCEPT WS-DESC-EVENTO(WS-IND, WS-ID-EVENTO)
               DISPLAY 'TECLE <S> PARA SAIR OU <ENTER> PARA CONTINUAR'
               ACCEPT WS-SAIDA
            END-PERFORM
      **************** EXEIBIÇÃO DOS EVENTOS ************************

            MOVE ZEROS                TO WS-IND
                                         WS-ID-EVENTO

            PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL
                                           WS-IND GREATER 7
              PERFORM VARYING WS-ID-EVENTO FROM 1 BY 1 UNTIL
                                           WS-ID-EVENTO GREATER 4
                      IF WS-DESC-EVENTO(WS-IND, WS-ID-EVENTO) NOT
                                                EQUAL SPACES
                         DISPLAY WS-NOME-DIA(WS-IND) ' - '
                         WS-DESC-EVENTO(WS-IND, WS-ID-EVENTO)
                      END-IF
              END-PERFORM
            END-PERFORM

            STOP RUN.

       END PROGRAM PRGARRAY.
