create or replace function desencriptar(cadena varchar2) return varchar2 is
  Result varchar2(250);
begin

  Result := seguridad_desencriptar(cadena, pk_auten.darsemilla );

  return(Result);
end desencriptar;
/

