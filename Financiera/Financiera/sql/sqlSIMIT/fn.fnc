CREATE OR REPLACE FUNCTION "FN" (p number) return varchar2 is
  Result varchar2(32000);
  i      number := 1;
begin

  while i <= p loop
    Result := Result || to_char(i) || ',' || to_char(i+1) || ',';
    i := i + 4;
  end loop;
  Result := Result || '/';
  i:= 3;
  while i <= p loop
    Result := Result || to_char(i) || ',' || to_char(i+1);
    i := i + 4;
  end loop;
  return(Result);


end fn;
/

