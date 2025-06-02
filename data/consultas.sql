-- a. ¿Cuántos alumnos desaprobados tenemos en total?
SELECT COUNT(DISTINCT ae.estudiante_id) as total_alumnos_desaprobados
FROM Asignaciones_eva ae
INNER JOIN Intentos_eva ie ON ae.id = ie.asignacion_id
WHERE ie.puntaje_obtenido < 11.00 AND ie.estado = 'Completado';

-- b. ¿Cuántos alumnos aprobados en un determinado curso tenemos?
-- Ejemplo: Fundamentos de Programación (evaluacion_id = 1)
SELECT COUNT(DISTINCT ae.estudiante_id) as alumnos_aprobados
FROM Asignaciones_eva ae
INNER JOIN Intentos_eva ie ON ae.id = ie.asignacion_id
WHERE ae.evaluacion_id = 1 
AND ie.puntaje_obtenido >= 11.00 
AND ie.estado = 'Completado';

-- c. ¿A cuántos exámenes está inscrito un alumno y cuántos están resueltos y pendientes?
-- Ejemplo: Juan Pablo García (estudiante_id = 1)
SELECT 
    COUNT(*) as total_inscritos,
    SUM(CASE WHEN estado = 'Completada' THEN 1 ELSE 0 END) as resueltos,
    SUM(CASE WHEN estado = 'Pendiente' THEN 1 ELSE 0 END) as pendientes
FROM Asignaciones_eva 
WHERE estudiante_id = 1;

-- d. ¿Cuál es la mejor y peor calificación de una determinada evaluación?
-- Ejemplo: Fundamentos de Programación (evaluacion_id = 1)
SELECT 
    MAX(ie.puntaje_obtenido) as mejor_calificacion,
    MIN(ie.puntaje_obtenido) as peor_calificacion
FROM Asignaciones_eva ae
INNER JOIN Intentos_eva ie ON ae.id = ie.asignacion_id
WHERE ae.evaluacion_id = 1 AND ie.estado = 'Completado';

-- e. ¿Cómo calcularíamos el promedio de calificaciones de un estudiante?
-- Ejemplo: Juan Pablo García (estudiante_id = 1)
SELECT AVG(ie.puntaje_obtenido) as promedio_estudiante
FROM Asignaciones_eva ae
INNER JOIN Intentos_eva ie ON ae.id = ie.asignacion_id
WHERE ae.estudiante_id = 1 AND ie.estado = 'Completado';