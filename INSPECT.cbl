      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  REGISTRO.
           03  NOME                PIC A(36).
           03  SEXO                PIC A(01).
               88  SEXO-VALIDO     VALUE "M" "F".
      *    Campo do nível 88 está associado ao ÚLTIMO campo declarado:

           03  CEP                 PIC 9(8).
               88  CEP-VALIDO      VALUE 70000 THRU 79999.

           03  CONCEITO            PIC A(01).
               88  CONC            VALUE "A" "B" "C" "D" "E".
               88  CONC-2          VALUE "A" THRU "E".

           03  ESTADO              PIC A(02).
               88  EST-VALIDO      VALUE "AC" "AL" "AM" "AP" "BA" "CE"    
                                          "DF" "ES" "GO" "MA" "MG" "MS"
                                           "MT" "PA" "PB" "PE" "PI" "PR"   
                                           "RJ" "RO" "RN" "RR" "RS" "SC" 
                                           "SE" "SP" "TO".   

           03  NIVEL-RISCO         PIC A(01).
               88  N-RISCO-VALIDO  VALUE "A" THRU "H".

           03  FONE                PIC X(08).
               88  FONE-CELULAR    VALUE "80000000" THRU "99999999".
               88  FONE-FIXO       VALUE "20000000" THRU "79999999".

           03  ESCOLARIDADE        PIC 9(02).
               88  ESCOL-VALIDO    VALUE 01 THRU 12.

           03  ESTADO-CIVIL        PIC 9(02).
               88  E-CIVIL-VALIDO  VALUE 01 THRU 08.
               
           PROCEDURE DIVISION.
           
       MAIN-PROCEDURE.
             
             display 'informe o sexo: '
             accept SEXO
             
             if SEXO-VALIDO 
                 display 'sexo Ok'
             ELSE
                 display 'sexo nao ok!'
             end-if.
                 
            DISPLAY 'INFORME UM CEP: '
            ACCEPT CEP
            
            IF CEP-VALIDO  
                DISPLAY 'CEP OK'
            ELSE
                DISPLAY 'CEP NAO OK' 
            END-IF,
            
            display 'INFORME O CONCEITO: '
            ACCEPT CONCEITO
            
            IF CONC 
                DISPLAY 'CONCEITO OK' 
            ELSE 
                DISPLAY 'CONCEITO NAO OK'
            END-IF 
             
            display 'INFORME O CONCEITO 2: '
            ACCEPT CONCEITO
            
            IF CONC-2 
                DISPLAY 'CONCEITO 2 OK' 
            ELSE 
                DISPLAY 'CONCEITO 2 NAO OK'
            END-IF 

            display 'INFORME O CONCEITO 2: '
            ACCEPT ESTADO
            
            IF EST-VALIDO
                DISPLAY 'ESTADO OK' 
            ELSE 
                DISPLAY 'ESTADO NAO OK'
            END-IF 
            
            display 'FONE: '
            ACCEPT FONE
            
            IF FONE-CELULAR
                DISPLAY 'FONE CELULAR' 
            ELSE 
                IF FONE-FIXO
                   DISPLAY 'FONE FIXO '
                ELSE
                   DISPLAY 'FONE INVALIDO'
                END-IF
            END-IF 
            
           display 'INFORME A EWSCOLARIDADE: '
            ACCEPT ESCOLARIDADE
            
            IF ESCOL-VALIDO
                DISPLAY 'ECOLARIDADE VALIDA ' 
            ELSE 
                DISPLAY 'ECOLARIDADE INVALIDA'
            END-IF 
                     
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.

