# BUSINESS CENTRAL 📊📈

## EJERCICIOS BOLETÍN 4 💻

###   Opción A - VENTAS:

1. Como encargado del departamento de compras/ventas deseo tener la posibilidad de modificar el campo “Descripción del trabajo” en factura registrada, sin necesidad de revertir ni abonar la factura. Esta funcionalidad debe estar parametrizada a través de un campo en la conf de ventas/compras como ya se ha hecho anteriormente.

     En detalle:
     Actualmente, la factura registrada no puede ser modificada, ni líneas ni cabecera.
     En bastantes ocasiones el cliente introduce datos en el campo “Descripción del trabajo” en la cabecera de la factura, y ese campo lo mostramos en el informe
     de factura. Como es un campo que no conlleva nada a nivel de registro de movimientos, en muchas ocasiones se quiere cambiar dicho campo y no se puede.
     Se propone poder cambiar este campo a través de una acción nueva en la ficha de la factura de venta registrada.
     De tal manera, que en la página de la factura de venta registrada, pondremos una acción nueva “Modif. Desc. Trabajo”, la cual, nos abrirá una ventana nueva
     donde mostraremos dos campos.

     - Descripción de trabajo actual (no editable)
     - Descripción de trabajo nueva

     Una vez le demos al botón de aceptar a esa ventana, a través de una CodeUnit (con permisos de modificación de cabecera de factura registrada), tendremos el
     proceso de modificación.

2. Como encargado del departamento de compras/ventas deseo ver en las líneas de facturas en color rojo cuando los productos no sean habituales para
mi Cliente/Proveedor, es decir, el código del producto resaltado en color rojo.
Para ello vamos a crear una tabla y página “Proveedores Habituales” / “Clientes Habituales” con Cod Proveedor / Cod Cliente, Fecha Desde y Fecha Hasta.
Será accesible a través de los botones de la página de productos. De manera que en esta página vamos a configurar todos los proveedores/clientes que
puede tener un producto como habituales. En caso de no tener informadas las fechas será siempre habitual y también tendremos la restricción de que no
pueda informar solo una de las dos fechas, es decir, si introduce Desde que le obligue a introducir Hasta (o la borre) y viceversa.
En las líneas de facturas queremos tener un nuevo campo (auxiliar) que sea “Es Cliente Habitual” / “Es Proveedor Habitual” que se pondrá a True cuando
detectemos que una línea no lleva un producto habitual. Este campo ponedlo visible para la Demostración.
Cada vez que se introduzca o cambie el cliente/proveedor, las líneas deben actualizarse y se verán en rojo si no es un producto habitual para la fecha en
que estamos actualmente y la validez que se introdujo.
     


