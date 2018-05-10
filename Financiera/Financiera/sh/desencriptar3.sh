Tareas banca seguros

Crear sitio aplicaciones\seguros
Crear programa para validar
  envia
  tipo y numeor de identificacion
  identificacion de quien realiza la operacion
  
  valida
- exista en crm
- validar edad
- no posea tarjeta activa, cuenta protegida, nomina protegida
- posea al menos una cuenta valida

  retorna 
  - los datos del cliente: nombres , apellidos, fecha nacimiento, sexo, ciiu, ciudad, nom Ciudad, cod dpto, nom Dpto, direccion, telfono
  - cuentas validas para asociacion y su tipo (nomina o cuenta)
  
Crear programa que retorne planes a ofrecer
   envia 
   -Tipo seguro
   
   retorna un arreglo con
   - numero plan
   - tipo de prima
   - prima sin 
   - prima con iva
   
Crear programa para registrar solicitud
    envia
	- tipo y numero identificacion
	- cuenta a asociar
	- tipo de seguro
	- numero de plan
	
	consulta datos de cliente
	consume servicio cardif
	registra en tabla de seguros y en tabla propia
	
	retorna
    numero transaccion
	numero de poliza
    oficina donde labora el funcionario
	nombre oficina
    los datos del cliente: nombres , apellidos, fecha nacimiento, sexo, ciiu, ciudad, nom Ciudad, cod dpto, nom Dpto, direccion, telfono
	
 
Parametros
- Detalle tipo seguro Cuenta protegida, o Nomina protegida 
- Detalle de los planes de cada tipo de seguro
  

