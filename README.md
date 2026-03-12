# 🏗️ Incident Management Infrastructure

Repositorio central para la orquestación del stack completo de servicios mediante Docker. Este repositorio conecta la base de datos relacional, la base de datos NoSQL, los servicios mockeados, el backend y el frontend en un solo entorno de ejecución.

## 📦 Servicios Incluidos
1. **SQL Server 2022:** Base de datos relacional core para transacciones.
2. **MongoDB:** Almacén de eventos y auditoría.
3. **Mock Service (Wiremock):** Simulación de API externa de catálogo de servicios.
4. **Incident API:** Backend en .NET 8.
5. **Incident Web:** Frontend web.

## 🚀 Ejecución del Proyecto (Pasos Exactos)

Para cumplir con el checklist de aceptación, ejecute el sistema con un solo comando.

### 1. Layout de Carpetas Requerido
Se asume este layout al clonar los 3 repositorios:
```text
/workspace
  ├── /incident-api
  ├── /incident-web
  └── /incident-infra  <-- Ejecutar Docker Compose desde aquí
```
### 2. Levantar los Servicios
Abra una terminal en la raíz de este repositorio (incident-infra) y ejecute:

```bash
docker compose up --build
```

### 3. Accesos
Web Frontend: 
```bash
http://localhost:3000
```

API (Swagger): 
``` bash
http://localhost:5000/swagger
```

Healthcheck API: 
``` bash
http://localhost:5000/health
```

🏗️ Decisiones de Arquitectura y Tradeoffs
Docker Compose como Orquestador: Se eligió para centralizar la configuración de la infraestructura y garantizar que el entorno de desarrollo local sea idéntico al entorno de despliegue.

Manejo de Dependencias (Healthchecks): La API (incident-api) está configurada para esperar automáticamente a que SQL Server esté saludable antes de iniciar. Esto evita errores de conexión en el arranque.

Mocking con Wiremock: Se utilizó Wiremock para desacoplar el desarrollo de la dependencia de un catálogo de servicios real, permitiendo simular respuestas 200 OK y 404 Not Found de forma predecible.

⚙️ Inicialización de Datos y Configuración

Migraciones SQL: La inicialización de SQL (init.sql) se ejecuta automáticamente al primer arranque del contenedor de SQL Server, creando las tablas y los índices necesarios.

Variables de Entorno: Las configuraciones críticas (cadenas de conexión, puertos, URLs base) están centralizadas en el archivo docker-compose.yml para inyectarse directamente a los contenedores de la API y la Web.

📝 Pendientes (Roadmap)
Monitoreo: Integración de herramientas como Prometheus y/o Grafana para visualizar la salud de los contenedores.

Caché Distribuida: Añadir un contenedor de Redis para cachear el Service Catalog y reducir la latencia.
