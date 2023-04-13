# MICROSOFT DYNAMICS 📊📈


## EJERCICIOS REPORTS 💻

###   Opción A:
      1. Informe de factura de venta en RDL Layout.
      2. Informe de factura de compra en Word Layout.
      3. Herramienta/módulo para realizar ajustes negativos de inventario.

---


### 1. Informe de factura de venta en RDL Layout.

Queremos imprimir una nueva factura de venta con los siguientes requisitos:

-> Cabecera:

  ● Los datos básicos del logo, Nº Doc, fecha registro, Datos del cliente, etc.
  ● Si es un envío directo debe aparecer la etiqueta “Envío directo a” delante del cliente.
  ● El campo del IBAN deberá aparecer cuatro asteriscos y los 4 últimos dígitos de la cuenta (Ejemplo **** 1236).
  
 -> Cuerpo:
 
  ● Las líneas tendrán, cód. producto, descripción, cantidad, precio, Dto, importe línea. No queremos subtotales y totales aquí.
  
  ● No deben aparecer líneas a cantidad 0.
  
  ● En cada línea, desglosamos los números de serie o número de lote, de tal manera, que sea cual sea el origen de la factura(del pedido, factura directa, o factura con albaranes (acción en la factura de traer líneas de albaranes).
  
  ● En el cuerpo de la factura queremos una tabla que desglosa los tipos de
  IVA con el siguiente formato:
  
  ● Debajo de las líneas tendremos la forma de pago, vencimientos.
  
-> Pie:

LOGO

1.2. Además de imprimirlo por el botón estándar, queremos que se imprima por un nuevo botón “Factura detallada” que aparezca tanto en la ficha como en la
lista de facturas. Este botón de impresión será visible a partir de un parámetro de configuración en la página de conf. ventas y cobros.


---


###  2. Informe de factura de Venta Word Layout.

Queremos imprimir una nueva factura de venta con los siguientes requisitos:

-> Cabecera: Igual que la anterior.

-> Cuerpo:

● Las líneas tendrán, cód. producto, descripción, cantidad, precio, Dto,
importe línea. No queremos subtotales y totales aquí.

● No deben aparecer líneas a cantidad 0.

● En cada línea, desglosamos los números de serie o número de lote, de tal manera, que sea cual sea el origen de la factura(del pedido, factura directa, o factura con albaranes (acción en la factura de traer líneas de albaranes).

-> Pie: Mismo logo.

---

### 3. Herramienta/módulo para realizar ajustes negativos de inventario.

Como jefe de almacén quiero realizar ajustes negativos de inventario. Para ello, necesito una página personalizada donde hacerlo de manera rápida.

Para ello se creará una tabla con la estructura que se define a continuación:
- Entry No. -> Integer autonumérico
- Document No. -> Code 20
- Posting Date -> Date
- Item No. -> Code 20 relacionado con la tabla de Producto
- Variant Code -> Code 10 relacionado con la tabla de Variantes
- Description -> Text 50. Se rellenará la descripción al validar Producto /
Variante y será editable para su modificación
- Location -> Code 10 relacionado con la tabla de Almacén
- Bin -> Code 20 relacionado con la tabla de Ubicación
- Quantity -> Decimal
- User ID -> Code 50 que se informará automáticamente al introducir el
ajuste
- Lot No. -> Code 20
- Posted -> Boolean

A continuación, se crearán dos páginas,

- Página 1 (Tipo List): Se usará para la introducción de ajustes dónde sólo
se visualizaran los ajustes introducidos no registrados “No Posted”.
Además, en esta página debe realizarse un filtro de segundo nivel
(FilterGroup) por el usuario de creación
- Página 2 (Tipo List): Visualización de los ajustes registrados “Posted”.
Se creará una función para realizar el registro de ajustes de inventario introducidos generando los movimientos de producto, y si conoces el área de almacén,
también creando movimientos de almacén. Esta función de registro incluirá todos los ajustes pendientes, es decir, todos los ajustes no “Posted” del
usuario de creación

3.1. En caso de conocer la funcionalidad de “Lot No.” se puede añadir el uso de esta funcionalidad en el ejercicio, pero si no se conoce no será necesario.


