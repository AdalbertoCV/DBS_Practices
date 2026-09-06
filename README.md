# Prácticas de Bases de Datos — Oracle SQL

Colección de prácticas, ejercicios y exámenes del curso de **Bases de Datos** de la Licenciatura en Ingeniería de Software (Universidad Autónoma de Zacatecas). El repositorio recorre, capítulo por capítulo, desde consultas básicas de `SELECT` hasta transacciones, vistas y funciones analíticas sobre **Oracle Database**.

> Todo el código está escrito en dialecto **Oracle SQL / PL-SQL** (`VARCHAR2`, `NUMBER`, `DUAL`, `SYSDATE`) y fue ejecutado en Oracle SQL Developer.

---

## Esquemas de trabajo

El material se organiza alrededor de cuatro esquemas de datos distintos:

| Esquema | Descripción |
|---|---|
| **HR** | Esquema de ejemplo de Oracle (Human Resources). Base para los ejercicios guiados del cuadernillo del curso. |
| **HOTEL** | Modelo propio de gestión hotelera: habitaciones, tipos de habitación, reservaciones, empleados y agencias. Diseñado e implementado desde cero. |
| **RH** | Modelo propio de recursos humanos, usado para los capítulos avanzados (subconsultas, funciones analíticas, transacciones). |
| **SALES / PIZZA_DELYVERY** | Esquemas auxiliares para ejercicios puntuales de modelado y consulta. |

---

## Temario cubierto

- **Cap. 1–2** — Recuperación de datos: `SELECT`, alias, operadores de comparación, `BETWEEN`, `IN`, `LIKE`, `IS NULL`.
- **Cap. 3** — Funciones de una sola fila: carácter, numéricas, fecha y conversión.
- **Cap. 4** — Funciones de grupo y agregación: `GROUP BY`, `HAVING`, funciones anidadas.
- **Cap. 5** — Consultas multitabla: `JOIN` (inner, outer, self) y producto cartesiano.
- **Cap. 6–7** — Subconsultas simples y correlacionadas, operadores de conjuntos.
- **Cap. 9** — DML y DDL: `INSERT`, `UPDATE`, `DELETE`, `CREATE TABLE`, restricciones de integridad.
- **Cap. 11** — Funciones analíticas y de ventana.
- **Vistas** — Vistas simples y complejas, vistas actualizables, `WITH CHECK OPTION`.
- **Transacciones** — `COMMIT`, `ROLLBACK`, `SAVEPOINT` y escenarios de concurrencia.

---

## Estructura del repositorio

```
.
├── HR_*.sql                    # Ejercicios sobre el esquema HR de Oracle
│   ├── HR_CAP1_ACV.sql         #   consultas básicas
│   ├── HR_CAP4.sql             #   funciones de grupo
│   ├── HR_cap5.sql … cap7.sql  #   joins y subconsultas
│   ├── HR_vistas.sql           #   definición de vistas
│   └── HR_cuadernillo.sql      #   cuadernillo completo del curso
├── HOTEL_ACV*.sql              # Modelo propio de gestión hotelera
│   ├── Hotel_CAP1.sql          #   creación del esquema
│   ├── HOTEL_ACV_CAP2…cap7.sql #   ejercicios por capítulo
│   ├── HOTEL_ACV_vistas.sql    #   vistas del modelo
│   └── HOTEL_ACV_Transacciones.sql
├── RH_ACV*.sql                 # Modelo propio de recursos humanos
│   ├── RH_ACV_CREACION.sql     #   DDL del esquema
│   ├── RH_ACV_C9.sql / C11.sql #   DML y funciones analíticas
│   └── RH_ACV_Transacciones.sql
├── SALES.sql                   # Esquema auxiliar de ventas
├── PIZZA_DELYVERY.sql          # Ejercicio de modelado
└── lab_06_01.sql, lab-7-05.sql # Laboratorios guiados
```

---

## Cómo ejecutarlo

1. Contar con una instancia de **Oracle Database** (XE 18c/21c es suficiente) y **SQL Developer** o `sqlplus`.
2. Para los ejercicios de **HR**, instalar el esquema de ejemplo que Oracle distribuye con la base de datos.
3. Para los modelos propios, ejecutar primero el script de creación y después los ejercicios:

```sql
-- Ejemplo: esquema HOTEL
@Hotel_CAP1.sql              -- crea tablas y carga datos
@HOTEL_ACV_CAP2.sql          -- ejercicios del capítulo 2
@HOTEL_ACV_vistas.sql        -- vistas
@HOTEL_ACV_Transacciones.sql -- escenarios transaccionales
```

```sql
-- Ejemplo: esquema RH
@RH_ACV_CREACION.sql
@RH_ACV_C9.sql
@RH_ACV_C11.sql
```

> Los scripts de ejercicios son mayormente consultas de lectura; los de `_Transacciones` sí modifican datos, por lo que conviene ejecutarlos sobre un esquema desechable.

---

## Autor

**Adalberto Cerrillo Vázquez** — Ingeniería de Software, Universidad Autónoma de Zacatecas.
