       IDENTIFICATION DIVISION.
       PROGRAM-ID. PSCRNEX2.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 WS-DATA.
           02 WS-ID    PIC X(03) VALUE SPACES.
           02 WS-NAME  PIC A(15) VALUE SPACES.
           02 WS-PHONE PIC X(09) VALUE SPACES.
       SCREEN SECTION.
       01 CLEAR-SCREEN.
           02 BLANK SCREEN.
       PROCEDURE DIVISION.
       01-MENU.
           DISPLAY "ID........:" WS-ID.
           DISPLAY "NAME......:" WS-NAME.
           DISPLAY "PHONE.....:" WS-PHONE.
           DISPLAY "-----------".

           DISPLAY "ID:".
           ACCEPT WS-ID FROM CONSOLE.

           DISPLAY CLEAR-SCREEN.
           DISPLAY "ID........:" WS-ID.
           DISPLAY "NAME......:" WS-NAME.
           DISPLAY "PHONE.....:" WS-PHONE.
           DISPLAY "-----------".

           DISPLAY "NAME:".
           ACCEPT WS-NAME FROM CONSOLE.

           DISPLAY CLEAR-SCREEN.
           DISPLAY "ID........:" WS-ID.
           DISPLAY "NAME......:" WS-NAME.
           DISPLAY "PHONE.....:" WS-PHONE.
           DISPLAY "-----------".

           DISPLAY "PHONE:".
           ACCEPT WS-PHONE FROM CONSOLE.

           DISPLAY CLEAR-SCREEN.
           DISPLAY "ID........:" WS-ID.
           DISPLAY "NAME......:" WS-NAME.
           DISPLAY "PHONE.....:" WS-PHONE.
           DISPLAY "-----------".

           STOP RUN.
       END-PROGRAM. PSCRNEX2.
