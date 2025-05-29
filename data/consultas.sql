-- CONSULTAS
-- a. ¿Cuántos alumnos desaprobados tenemos en total?
SELECT
    COUNT(DISTINCT ae.estudiante_id) AS total_alumnos_desaprobados
FROM
    Intentos_eva ie
JOIN
    Asignaciones_eva ae ON ie.asignacion_id = ae.id
WHERE
    ie.puntaje_obtenido IS NOT NULL AND ie.puntaje_obtenido < 12.00;
    
-- b. ¿Cuántos alumnos aprobados en un determinado curso tenemos?
SELECT
    COUNT(DISTINCT ae.estudiante_id) AS alumnos_aprobados_en_curso
FROM
    Intentos_eva ie
JOIN
    Asignaciones_eva ae ON ie.asignacion_id = ae.id
WHERE
    ae.evaluacion_id = 1  -- Ejemplo: 1 para 'Fundamentos de Programación en Python'
    AND ie.puntaje_obtenido IS NOT NULL AND ie.puntaje_obtenido >= 12.00;
    
-- c. ¿A cuántos exámenes está inscrito un alumno y cuántos de ellos están resueltos y pendientes?
SELECT
    e.nombres,
    e.apellidos,
    COUNT(ae.id) AS total_examenes_inscrito,
    SUM(CASE WHEN ae.estado IN ('Completada', 'TiempoExpirado') THEN 1 ELSE 0 END) AS examenes_resueltos,
    SUM(CASE WHEN ae.estado IN ('Pendiente', 'Iniciada') THEN 1 ELSE 0 END) AS examenes_pendientes
FROM
    Estudiantes e
JOIN
    Asignaciones_eva ae ON e.id = ae.estudiante_id
WHERE
    e.id = 1 -- Ejemplo: 1 para 'Ana García Pérez'
GROUP BY
    e.id, e.nombres, e.apellidos;
    
-- d. ¿Cuál es la mejor y peor calificación de una determinada evaluación?
SELECT
    ev.nombre AS nombre_evaluacion,
    MAX(ie.puntaje_obtenido) AS mejor_calificacion,
    MIN(ie.puntaje_obtenido) AS peor_calificacion
FROM
    Intentos_eva ie
JOIN
    Asignaciones_eva ae ON ie.asignacion_id = ae.id
JOIN
    Evaluaciones ev ON ae.evaluacion_id = ev.id
WHERE
    ae.evaluacion_id = 1 -- Ejemplo: 1 para 'Fundamentos de Programación en Python'
    AND ie.puntaje_obtenido IS NOT NULL
GROUP BY
    ev.id, ev.nombre;

-- e. ¿Cómo calcularíamos el promedio de calificaciones de un estudiante?
SELECT
    e.nombres,
    e.apellidos,
    AVG(ie.puntaje_obtenido) AS promedio_calificaciones
FROM
    Estudiantes e
JOIN
    Asignaciones_eva ae ON e.id = ae.estudiante_id
JOIN
    Intentos_eva ie ON ae.id = ie.asignacion_id
WHERE
    e.id = 4 -- Ejemplo: 4 para 'Carlos Sanchez Gomez'
    AND ie.puntaje_obtenido IS NOT NULL
    AND ie.estado IN ('Completado', 'TiempoExpirado') -- Aseguramos que el intento fue finalizado
GROUP BY
    e.id, e.nombres, e.apellidos;