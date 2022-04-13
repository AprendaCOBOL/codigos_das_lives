       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGXML.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 REQUEST.
          06 ROUTE.
            11 NAME1                                 PIC       X(030).
            11 VERSION                               PIC       9(004).
          06 QUESTION.
            11 IDENT                                 PIC       9(009).
            11 XMLFILENAME                           PIC       X(006).
            11 XMLFILEINH                            PIC       X(5000).


       01 XML-DOC                                    PIC X(5000).
       01 XML-IDX                                    PIC S9(9) BINARY.
       01 XML-CHAR-CNT                               PIC S9(9) BINARY.

       PROCEDURE DIVISION.
       MAINLINE SECTION.
           MOVE 'serviceRequest' TO NAME1
           MOVE 1                              TO VERSION
           MOVE 111111111                      TO IDENT
           MOVE 'FILE-1'                       TO XMLFILENAME
           STRING
              '<?xml version="1.0" encoding="UTF-8"?><SOAP-ENV:Envelop'
                        'e.....<SOAP-ENV:Envelope>'
           DELIMITED BY SIZE INTO XMLFILEINH

           INITIALIZE XML-DOC
           XML GENERATE XML-DOC FROM REQUEST COUNT IN XML-CHAR-CNT
           PERFORM VARYING XML-IDX FROM 1 BY 80
                UNTIL XML-IDX > XML-CHAR-CNT
                      DISPLAY XML-DOC (XML-IDX : 80)
           END-PERFORM

           XML PARSE XML-DOC PROCESSING PROCEDURE XML-HANDLER
               ON EXCEPTION
                  DISPLAY 'XML Error: ' XML-CODE
                  GOBACK
               NOT ON EXCEPTION
                  DISPLAY 'ALL DONE.'
            END-XML
            GOBACK
            .
           XML-HANDLER.
               DISPLAY XML-EVENT (1:22) ':' XML-TEXT
               .
