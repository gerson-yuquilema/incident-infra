---

### README para `incident-infra` (Orquestación)

Este es el archivo más importante para el evaluador, ya que es el punto de entrada.

```markdown
# 🏗️ Incident Management Infrastructure

Repositorio central para la orquestación del stack completo de servicios mediante Docker.

## 📦 Servicios Incluidos
1. **SQL Server 2022:** Base de datos relacional core.
2. **MongoDB:** Almacén de eventos y auditoría.
3. **Mock Service (Wiremock):** Simulación de API externa de catálogo de servicios.
4. **Incident API:** Backend en .NET 8.
5. **Incident Web:** Frontend en Next.js.

## 🚀 Ejecución del Proyecto (Checklist de Aceptación)
Para levantar todo el sistema con un solo comando, ejecute desde la raíz de este repositorio:

```bash
docker compose up --build

Requisito de Layout: Se asume que los repositorios incident-api e incident-web se encuentran en carpetas hermanas a este repositorio.

🛠️ Configuración de Infraestructura
Healthchecks: La API espera automáticamente a que SQL Server esté saludable antes de iniciar.

Inicialización: SQL Server ejecuta el script init.sql automáticamente al primer arranque.

Acceso: - Web: http://localhost:3000

API (Swagger): http://localhost:5000