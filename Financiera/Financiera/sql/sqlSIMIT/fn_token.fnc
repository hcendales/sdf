CREATE OR REPLACE FUNCTION "FN_TOKEN" (c varchar2, x in out int) return varchar2 is
  Result varchar2(32767);
  y int;
begin
  y:= Instr(c, ',', x, 1);

  if ( y = 0    ) then
    y:= Instr(c, ';', x, 1);
  end if;

  Result := Substr(c, x, y-x);
  x:=y+1;
  return(Result);

end fn_token;
/

