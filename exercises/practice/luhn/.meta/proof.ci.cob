       IDENTIFICATION DIVISION.
       PROGRAM-ID. luhn.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. 
        FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CARD-NUMBER PIC X(32).
       01 WS-CARD-DIGITS PIC 9(32).
       01 WS-CHECKSUM PIC 9(4).
       01 WS-CADENCE PIC S9(2).
       01 WS-DIGIT PIC 9(2).
       01 WS-INDEX PIC 9(2).
       01 WS-VALID PIC X(5).
       
       PROCEDURE DIVISION.
       LUHN.
       
       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > LENGTH(TRIM(WS-CARD-NUMBER))

           IF WS-CARD-NUMBER (WS-INDEX:1) EQUAL SPACE
               EXIT PERFORM CYCLE
           ELSE IF WS-CARD-NUMBER (WS-INDEX:1) IS NOT NUMERIC
               MOVE 0 TO WS-CARD-NUMBER
               EXIT PERFORM
           ELSE
               MOVE CONCATENATE(WS-CARD-DIGITS, 
                  WS-CARD-NUMBER(WS-INDEX:1)) 
               TO WS-CARD-DIGITS
           END-IF
       END-PERFORM.
       
       MOVE 1 TO WS-CHECKSUM.
       
       IF LENGTH(TRIM(WS-CARD-NUMBER)) > 1
           MOVE 0 TO WS-CHECKSUM
           MOVE MOD(LENGTH(TRIM(WS-CARD-DIGITS)), 2)
           TO WS-CADENCE

           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > LENGTH(TRIM(WS-CARD-DIGITS))
              MOVE WS-CARD-DIGITS (WS-INDEX:1) TO WS-DIGIT

              IF MOD(WS-INDEX - 1, 2) EQUAL WS-CADENCE
                 COMPUTE WS-DIGIT = WS-DIGIT * 2
                 
                 IF WS-DIGIT > 9
                    COMPUTE WS-DIGIT = WS-DIGIT - 9
                 END-IF
              END-IF
              ADD WS-DIGIT TO WS-CHECKSUM
           END-PERFORM
       END-IF.
       
       IF MOD(WS-CHECKSUM, 10) = 0
           MOVE "VALID" TO WS-VALID
       ELSE
           MOVE "FALSE" TO WS-VALID
       END-IF.

      *DISPLAY WS-VALID.
