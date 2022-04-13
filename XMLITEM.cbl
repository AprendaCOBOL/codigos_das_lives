       Identification division.
       Program-id. XMLITEM.

       Data division.
       Working-storage section.
       01  prettyPrint.
           05 pose                 pic 9(003).
           05 posd                 pic 9(003).
           05 depth                pic 9(002).
           05 inx                  pic 9(003).
           05 elementName          pic x(030).
           05 indent               pic x(040).
           05 buffer               pic x(998).
           05 lastitem             pic 9(001).
              88 unknown           value 0.
              88 xml-declaration   value 1.
              88 element           value 2.
              88 attribute         value 3.
              88 charcontent       value 4.

       Linkage section.
       01  doc.
           02                      pic x(001) occurs 16384 times
                                   depending on len.
       01  len comp-5              pic 9(009).

       Procedure division using doc value len.

        m.
           Move space to prettyPrint
           Move 0 to depth
           Move 1 to posd pose
           Xml parse doc processing procedure p
           Goback
           .
       p.
           Evaluate xml-event
               When 'VERSION-INFORMATION'
                    String '<?xml version="' xml-text '"' delimited by size
                           into buffer with pointer posd
                    Set xml-declaration to true
               When 'ENCODING-DECLARATION'
                    String ' encoding="' xml-text '"' delimited by size
                           into buffer with pointer posd
               When 'STANDALONE-DECLARATION'
                    String ' standalone="' xml-text '"' delimited by size
                    into buffer with pointer posd
               When 'START-OF-ELEMENT'
                    Evaluate true
                        When xml-declaration
                             String '?>' delimited by size into buffer
                             with pointer posd
                             Set unknown to true
                             Perform printline
                             Move 1 to posd
                        When element
                             String '>' delimited by size into buffer
                             with pointer posd
                        When attribute
                             String '">' delimited by size into buffer
                             with pointer posd
                        End-evaluate
                    If elementName not = space
                       Perform printline
                    End-if
                    Move xml-text to elementName
                    Add 1 to depth
                    Move 1 to pose
                    Set element to true
                    If xml-namespace-prefix = space
                       String '<' xml-text delimited by size
                       into buffer with pointer pose
                    Else
                       String '<' xml-namespace-prefix ':' xml-text
                       delimited by size into buffer with pointer pose
                    End-if
                    Move pose to posd
               When 'ATTRIBUTE-NAME'
                    If element
                       String ' ' delimited by size into buffer
                       with pointer posd
                    Else
                       String '" ' delimited by size into buffer
                       with pointer posd
                    End-if
                    If xml-namespace-prefix = space
                       String xml-text '="' delimited by size into buffer
                       with pointer posd
                    Else
                       String xml-namespace-prefix ':' xml-text '="'
                       delimited by size into buffer with pointer posd
                    End-if
                    Set attribute to true
               When 'NAMESPACE-DECLARATION'
                    If element
                       String ' ' delimited by size into buffer
                       with pointer posd
                    Else
                       String '" ' delimited by size into buffer
                       with pointer posd
                    End-if
                    If xml-namespace-prefix = space
                       String 'xmlns="' xml-namespace delimited by size
                       into buffer with pointer posd
                    Else
                       String 'xmlns:' xml-namespace-prefix '="' xml-namespace
                       delimited by size into buffer with pointer posd
                    End-if
                    Set attribute to true
               When 'ATTRIBUTE-CHARACTERS'
                    String xml-text delimited by size into buffer
                    with pointer posd
               When 'ATTRIBUTE-CHARACTER'
                    String xml-text delimited by size into buffer
                    with pointer posd
               When 'CONTENT-CHARACTERS'
                    Evaluate true
                        When element
                             String '>' delimited by size into buffer
                             with pointer posd
                   When attribute
                        String '">' delimited by size into buffer
                        with pointer posd
                   End-evaluate
                   String xml-text delimited by size into buffer
                   with pointer posd
                   Set charcontent to true
               When 'CONTENT-CHARACTER'
                   Evaluate true
                       When element
                            String '>' delimited by size into buffer
                            with pointer posd
                       When attribute
                            String '">' delimited by size into buffer
                            with pointer posd
                       End-evaluate
                   String xml-text delimited by size into buffer
                   with pointer posd
                   Set charcontent to true
               When 'END-OF-ELEMENT'
                   Move space to elementName
                   Evaluate true
                       When element
                            String '/>' delimited by size into buffer
                            with pointer posd
                       When attribute
                            String '"/>' delimited by size into buffer
                            with pointer posd
                       When other
                            If xml-namespace-prefix = space
                               String '</' xml-text '>' delimited by size
                               into buffer with pointer posd
                            Else
                               String '</' xml-namespace-prefix ':' xml-text '>'
                               delimited by size into buffer with pointer posd
                            End-if
                   End-evaluate
                   Set unknown to true
                   Perform printline
                   Subtract 1 from depth
                   Move 1 to posd
               When other
                    Continue
           End-evaluate
           .

       printline.
           Compute inx = function max(0 2 * depth - 2) + posd - 1
           If inx > 120
              compute inx = 117 - function max(0 2 * depth - 2)
              If depth > 1
                 Display indent(1:2 * depth - 2) buffer(1:inx) '...'
              Else
                 Display buffer(1:inx) '...'
              End-if
           Else
              If depth > 1
                 Display indent(1:2 * depth - 2) buffer(1:posd - 1)
              Else
                 Display buffer(1:posd - 1)
              End-if
           End-if
          .
          End program XMLITEM.
