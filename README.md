# 🚗⚖️ Vehicle Sales Management System — Prolog

<p align="center">
  <img src="https://www.swi-prolog.org/icons/swipl.png" alt="Prolog Logo" width="120"/>
</p>

**Curso:** Ingeniería de Sistemas / Lenguajes y Paradigmas de Programación
**Tema:** Programación Lógica con Prolog
**Autor:** Samuel Salazar Ospina

---

## 🧾 Descripción del proyecto

Este proyecto implementa un **sistema de gestión de venta de vehículos** en **Prolog**.

Permite:

* 📋 Mantener un catálogo de vehículos con atributos clave.
* 🔍 Realizar consultas por marca, tipo, año y presupuesto.
* 📊 Generar reportes aplicando restricciones de presupuesto.
* 🧩 Mantener un diseño modular, claro y extensible.

---

## 🎯 Objetivos de la práctica

1. Implementar un sistema en Prolog para gestionar un catálogo de vehículos filtrando por atributos clave.
2. Generar reportes estructurados utilizando predicados como `findall/3` y `bagof/3`.
3. Aplicar restricciones para asegurar la consistencia en los resultados (por ejemplo, presupuesto máximo).

---

## 📂 Estructura del proyecto

```
practica2/
├─ README.md
├─ src/
│  ├─ vehicle.pl          # Catálogo de vehículos (hechos)
│  ├─ queries.pl          # Predicados de consulta
│  ├─ report_manager.pl   # Lógica de generación de reportes
│  └─ utils.pl            # Funciones auxiliares
├─ tests/
│  └─ test_cases.pl       # Casos de prueba automatizados (PLUnit)
└─ img/
   ├─ caso1.png
   ├─ caso2.png
   └─ caso3.png
```

---

## 🔎 Módulos principales

| Módulo                | Propósito                                                                             |
| --------------------- | ------------------------------------------------------------------------------------- |
| `vehicle.pl`          | Definición de hechos `vehicle/5` con atributos (Marca, Referencia, Tipo, Precio, Año) |
| `queries.pl`          | Predicados de consulta (ej. `meet_budget/2`, `vehicles_by_brand/2`)                   |
| `report_manager.pl`   | Implementa `generate_report/4` para aplicar filtros y restricción de presupuesto      |
| `utils.pl`            | Funciones auxiliares (ordenar por precio, tomar N elementos, etc.)                    |
| `tests/test_cases.pl` | Casos de prueba con `plunit`                                                          |

---

## ✅ Requisitos

* **SWI-Prolog** (versión recomendada > 8.0).
* Que el comando `swipl` esté disponible desde la terminal.
* Editor recomendado: **Visual Studio Code** con extensión de Prolog.

---

## 🛠 Instalación y ejecución

1. Clonar o descargar este repositorio.
2. Abrir el proyecto en el editor.
3. En la terminal, ejecutar:

```prolog
?- [src/vehicle].
?- [src/queries].
?- [src/report_manager].
```

---

### ▶️ Ejecutar pruebas automáticas

```bash
swipl 
tests/test_cases.pl  
run_tests 
```

En consola debe aparecer:

```
% All tests passed
true.
```

---

## 🔍 Consultas de ejemplo

### 📌 Caso 1: Listar todas las referencias Toyota SUV con precio < 30,000

```prolog
?- findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), Result).
Result = [rav4].
```

---

### 📌 Caso 2: Mostrar los vehículos Ford agrupados por tipo y año con `bagof/3`

```prolog
?- bagof((Type,Year,Ref), Brand^Price^vehicle(ford, Ref, Type, Price, Year), Result).
Result = [(sedan,2018,fiesta),
          (pickup,2021,ranger),
          (sport,2023,mustang)].
```

---

### 📌 Caso 3: Calcular el valor total de sedanes sin superar $500,000

```prolog
?- findall((Brand,Ref,Type,Price,Year), vehicle(_, Ref, sedan, Price, Year), Sedans),
   sum_prices(Sedans, Total).
Sedans = [(toyota,corolla,sedan,22000,2020),
          (ford,fiesta,sedan,18000,2018),
          (bmw,serie3,sedan,35000,2020)],
Total = 75000.
```




