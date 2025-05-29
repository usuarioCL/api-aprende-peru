/* --- LIMPIEZA DE DATOS PREVIOS DE ASIGNACIONES, INTENTOS Y RESPUESTAS --- */

DELETE FROM Respuesta_est;
ALTER TABLE Respuesta_est AUTO_INCREMENT = 1;

DELETE FROM Intentos_eva;
ALTER TABLE Intentos_eva AUTO_INCREMENT = 1;

DELETE FROM Asignaciones_eva;
ALTER TABLE Asignaciones_eva AUTO_INCREMENT = 1;


/* --- 1. NUEVAS ASIGNACIONES DE EVALUACIONES --- */

/* Grupo 1: 4 alumnos, 3 exámenes cada uno */
/* Estudiante 1 (Ana) */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(1, 1, 'Completada'), /* ID Asignacion: 1 -> Python */
(1, 2, 'Completada'), /* ID Asignacion: 2 -> DB Design */
(1, 4, 'Completada'); /* ID Asignacion: 3 -> Algoritmos */

/* Estudiante 2 (Luis) */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(2, 1, 'Completada'), /* ID Asignacion: 4 -> Python */
(2, 4, 'Completada'), /* ID Asignacion: 5 -> Algoritmos */
(2, 5, 'Completada'); /* ID Asignacion: 6 -> SQL */

/* Estudiante 3 (Sofía) */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(3, 2, 'Completada'), /* ID Asignacion: 7 -> DB Design */
(3, 4, 'Completada'), /* ID Asignacion: 8 -> Algoritmos */
(3, 5, 'Completada'); /* ID Asignacion: 9 -> SQL */

/* Estudiante 4 (Carlos) - Uno de los que desaprobará */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(4, 1, 'Completada'), /* ID Asignacion: 10 -> Python (Desaprueba) */
(4, 2, 'Completada'), /* ID Asignacion: 11 -> DB Design */
(4, 5, 'Completada'); /* ID Asignacion: 12 -> SQL */

/* Grupo 2: 3 alumnos, 2 exámenes cada uno */
/* Estudiante 5 (Laura) */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(5, 1, 'Completada'), /* ID Asignacion: 13 -> Python */
(5, 4, 'Completada'); /* ID Asignacion: 14 -> Algoritmos */

/* Estudiante 6 (Javier) - Otro que desaprobará */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(6, 2, 'Completada'), /* ID Asignacion: 15 -> DB Design (Desaprueba) */
(6, 5, 'TiempoExpirado'); /* ID Asignacion: 16 -> SQL (No completa todas, desaprueba) */

/* Estudiante 7 (Isabel) */
INSERT INTO Asignaciones_eva (estudiante_id, evaluacion_id, estado) VALUES
(7, 1, 'Completada'), /* ID Asignacion: 17 -> Python */
(7, 5, 'Completada'); /* ID Asignacion: 18 -> SQL */

/* Los estudiantes 8 (Miguel), 9 (Elena), 10 (David) no tienen asignaciones. */

/* --- 2. REGISTRO DE INTENTOS Y RESPUESTAS --- */

/* Estudiante 1 (Ana) - Todas aprobadas */
/* Intento 1 (Asignacion 1 - Eval 1 Python) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(1, '2025-05-20 09:00:00', '2025-05-20 09:55:00', 20.00, 'Completado'); /* ID Intento: 1 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(1, 1, 2), (1, 2, 7), (1, 3, 12), (1, 4, 14), (1, 5, 18); /* Todas correctas */

/* Intento 2 (Asignacion 2 - Eval 2 DB Design) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(2, '2025-05-21 10:00:00', '2025-05-21 11:20:00', 20.00, 'Completado'); /* ID Intento: 2 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(2, 6, 23), (2, 7, 27), (2, 8, 30), (2, 9, 34), (2, 10, 38); /* Todas correctas */

/* Intento 3 (Asignacion 3 - Eval 4 Algoritmos) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(3, '2025-05-22 14:00:00', '2025-05-22 15:25:00', 20.00, 'Completado'); /* ID Intento: 3 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(3, 16, 62), (3, 17, 66), (3, 18, 70), (3, 19, 74), (3, 20, 78); /* Todas correctas */

/* Estudiante 2 (Luis) - Todas aprobadas */
/* Intento 4 (Asignacion 4 - Eval 1 Python) - Puntaje: 16/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(4, '2025-05-20 10:00:00', '2025-05-20 10:50:00', 16.00, 'Completado'); /* ID Intento: 4 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(4, 1, 2), (4, 2, 7), (4, 3, 12), (4, 4, 14), (4, 5, 19); /* 4 correctas, 1 incorrecta (Alt 19 en vez de 18) */

/* Intento 5 (Asignacion 5 - Eval 4 Algoritmos) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(5, '2025-05-21 11:00:00', '2025-05-21 12:28:00', 20.00, 'Completado'); /* ID Intento: 5 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(5, 16, 62), (5, 17, 66), (5, 18, 70), (5, 19, 74), (5, 20, 78); /* Todas correctas */

/* Intento 6 (Asignacion 6 - Eval 5 SQL) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(6, '2025-05-22 09:30:00', '2025-05-22 10:25:00', 20.00, 'Completado'); /* ID Intento: 6 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(6, 21, 82), (6, 22, 87), (6, 23, 91), (6, 24, 94), (6, 25, 99); /* Todas correctas */

/* Estudiante 3 (Sofía) - Todas aprobadas */
/* Intento 7 (Asignacion 7 - Eval 2 DB Design) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(7, '2025-05-23 09:00:00', '2025-05-23 10:15:00', 20.00, 'Completado'); /* ID Intento: 7 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(7, 6, 23), (7, 7, 27), (7, 8, 30), (7, 9, 34), (7, 10, 38);

/* Intento 8 (Asignacion 8 - Eval 4 Algoritmos) - Puntaje: 16/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(8, '2025-05-24 10:00:00', '2025-05-24 11:20:00', 16.00, 'Completado'); /* ID Intento: 8 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(8, 16, 62), (8, 17, 67), (8, 18, 70), (8, 19, 74), (8, 20, 78); /* 1 incorrecta */

/* Intento 9 (Asignacion 9 - Eval 5 SQL) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(9, '2025-05-25 11:00:00', '2025-05-25 11:58:00', 20.00, 'Completado'); /* ID Intento: 9 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(9, 21, 82), (9, 22, 87), (9, 23, 91), (9, 24, 94), (9, 25, 99);

/* Estudiante 4 (Carlos) - DESAPRUEBA Eval 1, aprueba las otras */
/* Intento 10 (Asignacion 10 - Eval 1 Python) - Puntaje: 8/20 (DESAPROBADO) */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(10, '2025-05-23 14:00:00', '2025-05-23 14:50:00', 8.00, 'Completado'); /* ID Intento: 10 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(10, 1, 2),  /* Correcta */
(10, 2, 8),  /* Incorrecta (Alt 7 es correcta) */
(10, 3, 12), /* Correcta */
(10, 4, 15), /* Incorrecta (Alt 14 es correcta) */
(10, 5, 19); /* Incorrecta (Alt 18 es correcta) */

/* Intento 11 (Asignacion 11 - Eval 2 DB Design) - Puntaje: 16/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(11, '2025-05-24 15:00:00', '2025-05-24 16:25:00', 16.00, 'Completado'); /* ID Intento: 11 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(11, 6, 23), (11, 7, 27), (11, 8, 31), (11, 9, 34), (11, 10, 38); /* 1 incorrecta */

/* Intento 12 (Asignacion 12 - Eval 5 SQL) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(12, '2025-05-25 16:00:00', '2025-05-25 16:59:00', 20.00, 'Completado'); /* ID Intento: 12 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(12, 21, 82), (12, 22, 87), (12, 23, 91), (12, 24, 94), (12, 25, 99);

/* Estudiante 5 (Laura) - Ambas aprobadas */
/* Intento 13 (Asignacion 13 - Eval 1 Python) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(13, '2025-05-20 11:00:00', '2025-05-20 11:45:00', 20.00, 'Completado'); /* ID Intento: 13 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(13, 1, 2), (13, 2, 7), (13, 3, 12), (13, 4, 14), (13, 5, 18);

/* Intento 14 (Asignacion 14 - Eval 4 Algoritmos) - Puntaje: 16/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(14, '2025-05-21 13:00:00', '2025-05-21 14:20:00', 16.00, 'Completado'); /* ID Intento: 14 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(14, 16, 62), (14, 17, 66), (14, 18, 70), (14, 19, 75), (14, 20, 78); /* 1 incorrecta */

/* Estudiante 6 (Javier) - DESAPRUEBA AMBAS */
/* Intento 15 (Asignacion 15 - Eval 2 DB Design) - Puntaje: 4/20 (DESAPROBADO) */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(15, '2025-05-22 15:00:00', '2025-05-22 16:20:00', 4.00, 'Completado'); /* ID Intento: 15 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(15, 6, 23), /* Correcta */
(15, 7, 28), /* Incorrecta (Alt 27) */
(15, 8, 31), /* Incorrecta (Alt 30) */
(15, 9, 35), /* Incorrecta (Alt 34) */
(15, 10, 39);/* Incorrecta (Alt 38) */

/* Intento 16 (Asignacion 16 - Eval 5 SQL) - Puntaje: 8/20 (DESAPROBADO - TiempoExpirado, solo 3 respuestas) */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(16, '2025-05-23 10:00:00', '2025-05-23 11:00:00', 8.00, 'TiempoExpirado'); /* ID Intento: 16. Duración de eval es 60 min. */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(16, 21, 82), /* Correcta */
(16, 22, 87), /* Correcta */
(16, 23, 92); /* Incorrecta (Alt 91) */
/* No respondió preguntas 24 y 25 */

/* Estudiante 7 (Isabel) - Ambas aprobadas */
/* Intento 17 (Asignacion 17 - Eval 1 Python) - Puntaje: 20/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(17, '2025-05-24 09:00:00', '2025-05-24 09:57:00', 20.00, 'Completado'); /* ID Intento: 17 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(17, 1, 2), (17, 2, 7), (17, 3, 12), (17, 4, 14), (17, 5, 18);

/* Intento 18 (Asignacion 18 - Eval 5 SQL) - Puntaje: 16/20 */
INSERT INTO Intentos_eva (asignacion_id, fecha_inicio, fecha_fin, puntaje_obtenido, estado) VALUES
(18, '2025-05-25 10:00:00', '2025-05-25 10:45:00', 16.00, 'Completado'); /* ID Intento: 18 */
INSERT INTO Respuesta_est (intento_id, pregunta_id, alternativa_id) VALUES
(18, 21, 82), (18, 22, 87), (18, 23, 91), (18, 24, 95), (18, 25, 99); /* 1 incorrecta */