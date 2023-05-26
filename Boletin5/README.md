# BUSINESS CENTRAL 📊📈

## EJERCICIOS BOLETÍN 5 💻

###   Opción B - COMPRAS:

En MyCompany solo tenemos una licencia capaz de crear usuarios clientes/proveedores, el resto no pueden crear registros en tablas del estándar. Sin embargo, queremos algún mecanismo que permita al resto de empleados crear
clientes/proveedores.

Para ello vamos a crear una tabla y páginas nuevas “Cliente/proveedor TeamMember”.
Esta tabla será muy parecida a la Customer/Vendor y accesible desde un botón en la lista de clientes/proveedores.

La PK será un Integer autoincremental que también se guarde en la tabla Customer/Vendor con un campo nuevo. Tener en cuenta que hará falta un campo boolean que nos indique si este teammember se ha procesado ya en cliente/proveedor para que el procesa decida si debe crearlo.
Se valorará que la página debe ser lo más fiel posible a la estándar, incluyendo sus validaciones.
Una vez creado varios registros de clientes teammember, debemos tener una Codeunit recurrente que ejecutemos desde la página Movs Cola Proyectos (se arranca desde el botón de ejecutar una vez, esto simula que se ejecuta periódicamente. En entornos de sandbox solo se puede probar así.)
Cuando la ejecutemos, veremos que itera los teammember y crea los correspondientes clientes/proveedores. Este CU la ejecutaría en producción un usuario con permisos pero en nuestro caso podemos todos.
Después registraremos alguna factura con este cliente/proveedor que se haya creado nuevo a partir del proceso.

——————————————————————————————————————
                  BONUS
——————————————————————————————————————
Ejercicio extra 1. Un cliente/proveedor puede tener varios contactos asociados, debemos crearle el contacto asociado en el mismo proceso como si fuera el estándar, que siempre los crea. Importante: Imitar el estándar a la hora de crear cliente/proveedor.

Ejercicio extra 2. La codeunit se crea automáticamente con un botón en la misma página de clientes/proveedores. Debe facilitarnos la instalación de este proceso.

Ejercicio extra 3. Crear campos de fecha de sincronización por si la CU se ejecutase mientras estamos creando el teammember y hubiese creado el cliente/proveedor.
De modo que esta fecha servirá para saber si el cliente/proveedor debe actualizarse.