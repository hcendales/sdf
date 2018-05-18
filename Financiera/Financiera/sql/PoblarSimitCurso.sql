prompt PL/SQL Developer import file
prompt Created on viernes, 11 de mayo de 2018 by SoporteRemoto
set feedback off
set define off
prompt Disabling triggers for DIVIPOFECHACORTE...
alter table DIVIPOFECHACORTE disable all triggers;
prompt Loading DIVIPOFECHACORTE...
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('76895000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('52838000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('63001000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('20060000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25151000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25175000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25183000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('47189000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('63190000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25214000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25260000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('68307000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('73349000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('73001000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('27361000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25377000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('17380000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('20621000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25473000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25612000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('05861000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25875000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('85001000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25899000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('63190001', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('19455000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25740001', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('52835000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25126001', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25386001', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('76318000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('76001000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('76275000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('76622000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('68229000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('23417000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('13836000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('08001000', 'D');
insert into DIVIPOFECHACORTE (divipo, tipofechacorte)
values ('25000000', 'D');
commit;
prompt 39 records loaded
prompt Enabling triggers for DIVIPOFECHACORTE...
alter table DIVIPOFECHACORTE enable all triggers;
set feedback on
set define on
prompt Done.
