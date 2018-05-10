CREATE OR REPLACE FUNCTION Seguridad_DesEncriptar(cadena IN STRING, semilla IN STRING)
RETURN VARCHAR2 IS
LANGUAGE JAVA
NAME 'Seguridad.DesEncriptar(java.lang.String,java.lang.String) return String';
/

