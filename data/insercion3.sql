-- Insertar Administradores
INSERT INTO Administradores (nombre, email, contrasena) VALUES 
('Prof. Ana Martínez', 'ana.martinez@universidad.edu', 'admin123'),
('Prof. Carlos Rodríguez', 'carlos.rodriguez@universidad.edu', 'prof456');

-- Insertar Áreas de Evaluación (enfocadas en Ingeniería de Software)
INSERT INTO Areas_eva (nombre, descripcion) VALUES 
('Programación', 'Evaluaciones de lógica de programación y algoritmos básicos'),
('Base de Datos', 'Evaluaciones de conceptos básicos de bases de datos'),
('Desarrollo Web', 'Evaluaciones de tecnologías web básicas'),
('Metodologías Ágiles', 'Evaluaciones de conceptos de metodologías de desarrollo');

-- Insertar 10 Estudiantes de Ingeniería de Software
INSERT INTO Estudiantes (nombres, apellidos, email) VALUES 
('Juan Pablo', 'García Mendoza', 'juan.garcia@estudiantes.edu'),
('María Fernanda', 'López Vargas', 'maria.lopez@estudiantes.edu'),
('Carlos Eduardo', 'Pérez Silva', 'carlos.perez@estudiantes.edu'),
('Ana Lucía', 'Torres Ruiz', 'ana.torres@estudiantes.edu'),
('Diego Alejandro', 'Morales Castro', 'diego.morales@estudiantes.edu'),
('Sofía Isabella', 'Hernández Vega', 'sofia.hernandez@estudiantes.edu'),
('Miguel Ángel', 'Jiménez Paredes', 'miguel.jimenez@estudiantes.edu'),
('Valentina', 'Delgado Flores', 'valentina.delgado@estudiantes.edu'),
('Andrés Felipe', 'Salazar Ortega', 'andres.salazar@estudiantes.edu'),
('Camila Andrea', 'Ramírez Soto', 'camila.ramirez@estudiantes.edu');

-- Insertar 5 Evaluaciones de Ingeniería de Software
INSERT INTO Evaluaciones (nombre, area_id, admin_id, fecha_inicio, fecha_fin, duracion, puntaje, Publicada) VALUES 
('Fundamentos de Programación', 1, 1, '2025-06-05 09:00:00', '2025-06-05 11:00:00', 90, 20.00, 1),
('Introducción a Bases de Datos', 2, 1, '2025-06-06 14:00:00', '2025-06-06 16:00:00', 90, 20.00, 1),
('Desarrollo Web Básico', 3, 2, '2025-06-07 10:00:00', '2025-06-07 12:00:00', 90, 20.00, 1),
('Algoritmos y Estructuras de Datos', 1, 2, '2025-06-08 08:00:00', '2025-06-08 10:00:00', 90, 20.00, 1),
('Metodologías Ágiles', 4, 1, '2025-06-09 15:00:00', '2025-06-09 17:00:00', 90, 20.00, 1);

-- Insertar Preguntas (2 preguntas por evaluación para simplicidad)
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES 
-- Evaluación 1 (Fundamentos de Programación)
(1, '¿Qué es una variable en programación?', 10.00, 1),
(1, '¿Cuál es la diferencia entre un bucle "for" y un bucle "while"?', 10.00, 2),
-- Evaluación 2 (Bases de Datos)
(2, '¿Qué significa SQL?', 10.00, 1),
(2, '¿Cuál es la función de una clave primaria en una tabla?', 10.00, 2),
-- Evaluación 3 (Desarrollo Web)
(3, '¿Qué significa HTML?', 10.00, 1),
(3, '¿Cuál es la diferencia entre CSS y JavaScript?', 10.00, 2),
-- Evaluación 4 (Algoritmos)
(4, '¿Qué es la complejidad temporal de un algoritmo?', 10.00, 1),
(4, '¿Cuál es la estructura de datos más adecuada para implementar una pila (stack)?', 10.00, 2),
-- Evaluación 5 (Metodologías Ágiles)
(5, '¿Qué es Scrum?', 10.00, 1),
(5, '¿Cuál es la duración típica de un Sprint en Scrum?', 10.00, 2);

-- Insertar Alternativas
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES 
-- Pregunta 1 (¿Qué es una variable?)
(1, 'Un espacio en memoria para almacenar datos', 1),
(1, 'Un tipo de función', 0),
(1, 'Un lenguaje de programación', 0),
(1, 'Un compilador', 0),
-- Pregunta 2 (Diferencia for y while)
(2, 'For se usa cuando conoces el número de iteraciones, while cuando no', 1),
(2, 'No hay diferencia', 0),
(2, 'For es más rápido que while', 0),
(2, 'While solo funciona con números', 0),
-- Pregunta 3 (¿Qué significa SQL?)
(3, 'Structured Query Language', 1),
(3, 'Simple Query Language', 0),
(3, 'Standard Quality Language', 0),
(3, 'System Query Language', 0),
-- Pregunta 4 (Clave primaria)
(4, 'Identifica de forma única cada registro en una tabla', 1),
(4, 'Es la primera columna de una tabla', 0),
(4, 'Es la columna más importante', 0),
(4, 'Solo puede ser un número', 0),
-- Pregunta 5 (¿Qué significa HTML?)
(5, 'HyperText Markup Language', 1),
(5, 'High Tech Modern Language', 0),
(5, 'Home Tool Markup Language', 0),
(5, 'Hyper Transfer Markup Language', 0),
-- Pregunta 6 (CSS vs JavaScript)
(6, 'CSS es para estilos, JavaScript para funcionalidad', 1),
(6, 'Son lo mismo', 0),
(6, 'CSS es para bases de datos', 0),
(6, 'JavaScript solo funciona en servidores', 0),
-- Pregunta 7 (Complejidad temporal)
(7, 'Mide cuánto tiempo tarda un algoritmo en ejecutarse', 1),
(7, 'Es el tamaño del código', 0),
(7, 'Es la cantidad de memoria que usa', 0),
(7, 'Es el número de líneas de código', 0),
-- Pregunta 8 (Estructura para pila)
(8, 'Array o Lista con acceso LIFO', 1),
(8, 'Árbol binario', 0),
(8, 'Tabla hash', 0),
(8, 'Grafo', 0),
-- Pregunta 9 (¿Qué es Scrum?)
(9, 'Un framework ágil para gestión de proyectos', 1),
(9, 'Un lenguaje de programación', 0),
(9, 'Un tipo de base de datos', 0),
(9, 'Un editor de código', 0),
-- Pregunta 10 (Duración Sprint)
(10, '1-4 semanas, típicamente 2 semanas', 1),
(10, '1 día', 0),
(10, '6 meses', 0),
(10, '1 año', 0);

-- ASIGNACIONES SEGÚN EL CONTEXTO SOLICITADO:
-- 4 estudiantes asignados a 3 exámenes cada uno (estudiantes 1-4)
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES 
-- Estudiante 1: Juan Pablo (3 evaluaciones)
(1, 1, 'Completada'), (1, 2, 'Completada'), (1, 3, 'Completada'),
-- Estudiante 2: María Fernanda (3 evaluaciones)
(2, 1, 'Completada'), (2, 4, 'Completada'), (2, 5, 'Completada'),
-- Estudiante 3: Carlos Eduardo (3 evaluaciones)
(3, 2, 'Completada'), (3, 3, 'Pendiente'), (3, 4, 'Completada'),
-- Estudiante 4: Ana Lucía (3 evaluaciones)
(4, 1, 'Completada'), (4, 3, 'Completada'), (4, 5, 'Pendiente'),

-- 3 estudiantes asignados a 2 exámenes cada uno (estudiantes 5-7)
-- Estudiante 5: Diego Alejandro (2 evaluaciones)
(5, 2, 'Completada'), (5, 5, 'Completada'),
-- Estudiante 6: Sofía Isabella (2 evaluaciones)
(6, 1, 'Completada'), (6, 4, 'Completada'),
-- Estudiante 7: Miguel Ángel (2 evaluaciones)
(7, 3, 'Completada'), (7, 4, 'Completada');

-- Los estudiantes 8, 9, 10 (Valentina, Andrés, Camila) no tienen asignaciones

-- INTENTOS PARA LOS 7 ESTUDIANTES QUE COMPLETARON SUS EVALUACIONES
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES 
-- Juan Pablo (aprobado en las 3)
(1, '2025-06-05 09:00:00', '2025-06-05 10:15:00', 18.00, 'Completado'),
(2, '2025-06-06 14:00:00', '2025-06-06 15:30:00', 16.00, 'Completado'),
(3, '2025-06-07 10:00:00', '2025-06-07 11:20:00', 17.00, 'Completado'),
-- María Fernanda (aprobado en 2, desaprobado en 1)
(4, '2025-06-05 09:00:00', '2025-06-05 10:25:00', 15.00, 'Completado'),
(5, '2025-06-08 08:00:00', '2025-06-08 09:40:00', 8.00, 'Completado'), -- DESAPROBADO
(6, '2025-06-09 15:00:00', '2025-06-09 16:20:00', 19.00, 'Completado'),
-- Carlos Eduardo (aprobado en 1, desaprobado en 1)
(7, '2025-06-06 14:00:00', '2025-06-06 15:35:00', 12.00, 'Completado'),
(9, '2025-06-08 08:00:00', '2025-06-08 09:30:00', 7.00, 'Completado'), -- DESAPROBADO
-- Ana Lucía (aprobado en las 2 completadas)
(10, '2025-06-05 09:00:00', '2025-06-05 10:20:00', 20.00, 'Completado'),
(11, '2025-06-07 10:00:00', '2025-06-07 11:15:00', 14.00, 'Completado'),
-- Diego Alejandro (aprobado en las 2)
(13, '2025-06-06 14:00:00', '2025-06-06 15:25:00', 16.00, 'Completado'),
(14, '2025-06-09 15:00:00', '2025-06-09 16:30:00', 15.00, 'Completado'),
-- Sofía Isabella (aprobado en las 2)
(15, '2025-06-05 09:00:00', '2025-06-05 10:30:00', 18.00, 'Completado'),
(16, '2025-06-08 08:00:00', '2025-06-08 09:25:00', 17.00, 'Completado'),
-- Miguel Ángel (aprobado en las 2)
(17, '2025-06-07 10:00:00', '2025-06-07 11:25:00', 19.00, 'Completado'),
(18, '2025-06-08 08:00:00', '2025-06-08 09:20:00', 16.00, 'Completado');

-- Respuestas de los estudiantes 
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES 
-- Juan Pablo - Evaluaciones (18, 16, 17 puntos)
(1, 1, 1), (1, 2, 5), -- Programación: correcta, correcta
(2, 3, 7), (2, 4, 11), -- BD: correcta, correcta  
(3, 5, 13), (3, 6, 17), -- Web: correcta, correcta
-- María Fernanda - Evaluaciones (15, 8, 19 puntos)
(4, 1, 1), (4, 2, 6), -- Programación: correcta, incorrecta
(5, 7, 22), (5, 8, 26), -- Algoritmos: incorrecta, incorrecta (DESAPROBADO)
(6, 9, 25), (6, 10, 29), -- Ágiles: correcta, correcta
-- Carlos Eduardo - Evaluaciones (12, 7 puntos)
(7, 3, 7), (7, 4, 10), -- BD: correcta, incorrecta
(8, 7, 22), (8, 8, 26), -- Algoritmos: incorrecta, incorrecta (DESAPROBADO)
-- Ana Lucía - Evaluaciones (20, 14 puntos)
(9, 1, 1), (9, 2, 5), -- Programación: correcta, correcta
(10, 5, 13), (10, 6, 16), -- Web: correcta, incorrecta
-- Diego Alejandro - Evaluaciones (16, 15 puntos)
(11, 3, 7), (11, 4, 11), -- BD: correcta, correcta
(12, 9, 25), (12, 10, 28), -- Ágiles: correcta, incorrecta
-- Sofía Isabella - Evaluaciones (18, 17 puntos)
(13, 1, 1), (13, 2, 5), -- Programación: correcta, correcta
(14, 7, 19), (14, 8, 21), -- Algoritmos: correcta, correcta
-- Miguel Ángel - Evaluaciones (19, 16 puntos)
(15, 5, 13), (15, 6, 17), -- Web: correcta, correcta
(16, 7, 19), (16, 8, 22); -- Algoritmos: correcta, incorrecta