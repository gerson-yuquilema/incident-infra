CREATE DATABASE IncidentDB;
GO
USE IncidentDB;
GO

-- Creación de la tabla Incidents
CREATE TABLE Incidents (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Severity NVARCHAR(50) NOT NULL, -- Ej: LOW, MEDIUM, HIGH
    Status NVARCHAR(50) NOT NULL,   -- Ej: OPEN, IN_PROGRESS, RESOLVED
    ServiceId NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETUTCDATE(),
    UpdatedAt DATETIME2 DEFAULT GETUTCDATE()
);
GO

-- Se nos pide al menos 1 índice orientado al listado (filtros + orden)
CREATE NONCLUSTERED INDEX IX_Incidents_ListFilters
ON Incidents(Status, Severity, CreatedAt DESC);
GO

-- Seeds (Datos de prueba para facilitar la revisión del jurado)
INSERT INTO Incidents (Title, Description, Severity, Status, ServiceId)
VALUES 
('Pago falla al confirmar', 'Error 500 intermitente', 'HIGH', 'OPEN', 'payments-api'),
('Lentitud en login', 'Tiempos de respuesta altos', 'MEDIUM', 'IN_PROGRESS', 'auth-api'),
('Error de tipografía en home', 'Texto mal escrito', 'LOW', 'RESOLVED', 'web-frontend');
GO