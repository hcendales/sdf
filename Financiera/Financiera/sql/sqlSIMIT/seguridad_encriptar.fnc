CREATE OR REPLACE FUNCTION Seguridad_Encriptar(cadena IN STRING, semilla IN STRING)
RETURN VARCHAR2 IS
LANGUAGE JAVA
NAME 'Seguridad.Encriptar(java.lang.String,java.lang.String) return String';
/

