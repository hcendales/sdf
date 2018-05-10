CREATE OR REPLACE FUNCTION Shell_Run(Command IN STRING)
RETURN VARCHAR2 IS
LANGUAGE JAVA
NAME 'Shell.Run(java.lang.String) return String';
/

