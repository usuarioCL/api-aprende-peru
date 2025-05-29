CREATE DATABASE IF NOT EXISTS aprende_peru;
USE aprende_peru;

CREATE TABLE Administradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Areas_eva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1: Activo, 0: Inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Evaluaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    area_id INT NOT NULL,
    admin_id INT NOT NULL COMMENT 'ID del administrador que creó la evaluación',
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    duracion INT NOT NULL COMMENT 'Duración máxima en minutos para completar la evaluación',
    puntaje DECIMAL(5,2) NOT NULL DEFAULT 20.00 COMMENT 'Puntaje base de la evaluación (vigesimal)',
    Publicada TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0: Borrador, 1: Publicada', 
    FOREIGN KEY (area_id) REFERENCES Areas_eva(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (admin_id) REFERENCES Administradores(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Preguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evaluacion_id INT NOT NULL,
    texto_pregunta TEXT NOT NULL,
    puntaje DECIMAL(5,2) NOT NULL COMMENT 'Puntos que otorga esta pregunta',
    orden INT COMMENT 'Para definir un orden de aparición',
    FOREIGN KEY (evaluacion_id) REFERENCES Evaluaciones(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Alternativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta_id INT NOT NULL,
    texto_alternativa TEXT NOT NULL,
    es_correcta TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1: Correcta, 0: Incorrecta',
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Asignaciones_eva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    evaluacion_id INT NOT NULL,
    fecha_asignacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Iniciada', 'Completada', 'Vencida') NOT NULL DEFAULT 'Pendiente' COMMENT 'Estado de la asignación de evaluación',
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (evaluacion_id) REFERENCES Evaluaciones(id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY UQ_Estudiante_Evaluacion (estudiante_id, evaluacion_id) COMMENT 'Una asignación por estudiante para una evaluación específica'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Intentos_eva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asignacion_id INT NOT NULL UNIQUE COMMENT 'Un intento por asignación', 
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME,
    puntaje_obtenido DECIMAL(5,2),
    estado ENUM('EnProgreso', 'Completado', 'TiempoExpirado', 'AnuladoPorAdmin') NOT NULL,
    FOREIGN KEY (asignacion_id) REFERENCES Asignaciones_eva(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Respuesta_est (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    intento_id INT NOT NULL, 
    pregunta_id INT NOT NULL, 
    alternativa_id INT NOT NULL, 
    FOREIGN KEY (intento_id) REFERENCES Intentos_eva(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (alternativa_id) REFERENCES Alternativas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE KEY UQ_Intento_Pregunta (intento_id, pregunta_id) COMMENT 'Una respuesta por pregunta en un intento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;