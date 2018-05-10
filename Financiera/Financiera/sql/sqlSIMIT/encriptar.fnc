create or replace function encriptar(cadena varchar2) return varchar2 is
  Result varchar2(250);
begin

  Result := seguridad_encriptar(cadena, pk_auten.darsemilla );

  return(Result);
end encriptar;
/

