       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIEVE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-LIMIT PIC 9999.
       01 WS-RESULT PIC 999 OCCURS 1000 TIMES. 
       01 WS-COUNT PIC 9999.
       PROCEDURE DIVISION.
       SIEVE.
       