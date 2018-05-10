declare

    v_fechaCorte date;
    v_usuario number;
    v_cod_error number;
    v_msg_error varchar2(1000);

    v_idbancoorigen   varchar2(2);
    v_cuentaorigen    varchar2(16);
    v_fechatrf        date;
    v_fechaenviobanco date;
    v_idbancodest     varchar2(2);
    v_tipoCtaDes      varchar2(3);
    v_cuentadest      varchar2(4000);
    v_nitdestino      varchar2(16);
    v_autoridad       varchar2(5);
    v_valor           number;
    v_fechadevol      date;
    v_codigodevol     varchar2(7);
    v_motivodevol     varchar2(500);

    v_idConcesionarioLiq char(2);
    v_orden number;
    v_tipoCuentaOrigen varchar2(3);
    v_nitOrigen varchar2(10);
    v_indTipo varchar2(5);
    v_idConcesionarioPro char(2);
    v_idMunicipio char(8);


cursor nov is
select n.referenciatrf  from novreenviodetalle n;

begin

    FOR reg IN nov LOOP

    select 
           idConcesionarioLiq,
           orden,
           tipoCuentaOrigen,
           nitOrigen,
           idConcesionarioPro,
           idMunicipio


      into 
           v_idConcesionarioLiq,
           v_orden,
           v_tipoCuentaOrigen,
           v_nitOrigen,
           v_idConcesionarioPro,
           v_idMunicipio

      from vw_devolucionesach v
     where v.referenciatrf = reg.referenciatrf;
     
    update novreenviodetalle n
    set ID_CONCESIONARIO_LIQ = v_idConcesionarioLiq,
       orden = v_orden,
       tipoCuentaOrigen = v_tipoCuentaOrigen,
       ORI_NIT = v_nitOrigen ,
       ID_CONCESIONARIO_PRO = v_idConcesionarioPro,
       idMunicipio = v_idMunicipio
    where n.referenciatrf =  reg.referenciatrf;
    


    END LOOP;

    commit;


DBMS_OUTPUT.PUT_LINE('Termino OK');

end;
