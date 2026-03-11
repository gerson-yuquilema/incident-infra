# 🏗️ Incident Management Infrastructure
Este repositorio orquestra todo el stack tecnológico mediante Docker.

### Cómo Correr (Pasos Exactos)
1. Clonar los repositorios `incident-api` e `incident-web` en la misma carpeta raíz que este.
2. Ejecutar: `docker compose up --build`
3. Acceder a la Web en: `http://localhost:3000`

### Decisiones de Arquitectura
- **Persistencia Políglota:** SQL Server para transacciones (ACID) y MongoDB para auditoría (Escalabilidad/Flexibilidad).
- **Resiliencia:** Uso de `healthcheck` en Docker para asegurar que la API no inicie antes que la base de datos.

Análisis de Performance:

Query: SELECT * FROM Incidents WHERE Status = @p0 ORDER BY CreatedAt DESC OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY

Evidencia: Se recomienda el uso de un Índice Non-Clustered en la columna Status y CreatedAt.

Plan de Ejecución: El costo principal es un Index Seek (eficiente) en lugar de un Table Scan, lo que garantiza respuesta en milisegundos incluso con miles de registros.