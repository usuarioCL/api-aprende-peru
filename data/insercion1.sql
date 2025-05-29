-- INSERCIONES
/* 1. Administradores */
INSERT INTO Administradores (nombre, email, contrasena) VALUES
('Admin Principal', 'admin@aprende.pe', 'contrasena_segura_admin'); /* ID: 1 */

/* 2. Areas de Evaluación (Enfocadas en Ing. de Software) */
INSERT INTO Areas_eva (nombre, descripcion) VALUES
('Programación y Algoritmos', 'Evaluaciones sobre lógica de programación, estructuras de datos y algoritmos.'), /* ID: 1 */
('Bases de Datos y SQL', 'Evaluaciones sobre diseño de bases de datos, SQL y gestión de datos.'), /* ID: 2 */
('Desarrollo Web Full-Stack', 'Evaluaciones sobre tecnologías front-end, back-end y desarrollo web integral.'); /* ID: 3 */

/* 3. Estudiantes */
INSERT INTO Estudiantes (nombres, apellidos, email) VALUES
('Ana', 'García Pérez', 'ana.garcia@email.com'), /* ID: 1 */
('Luis', 'Martinez Rodriguez', 'luis.martinez@email.com'), /* ID: 2 */
('Sofía', 'Lopez Hernandez', 'sofia.lopez@email.com'), /* ID: 3 */
('Carlos', 'Sanchez Gomez', 'carlos.sanchez@email.com'), /* ID: 4 */
('Laura', 'Ramirez Diaz', 'laura.ramirez@email.com'), /* ID: 5 */
('Javier', 'Torres Vargas', 'javier.torres@email.com'), /* ID: 6 */
('Isabel', 'Ruiz Castillo', 'isabel.ruiz@email.com'), /* ID: 7 */
('Miguel', 'Jimenez Ortega', 'miguel.jimenez@email.com'), /* ID: 8 */
('Elena', 'Moreno Suarez', 'elena.moreno@email.com'), /* ID: 9 */
('David', 'Alvarez Navarro', 'david.alvarez@email.com'); /* ID: 10 */

/* 4. Evaluaciones*/
/* Admin ID es 1 para todas */
/* Area IDs: 1 (Prog), 2 (BD), 3 (Web) */
INSERT INTO Evaluaciones (nombre, area_id, admin_id, fecha_inicio, fecha_fin, duracion, Publicada) VALUES
('Fundamentos de Programación en Python', 1, 1, '2025-06-10 08:00:00', '2025-06-10 09:00:00', 60, 1), /* ID: 1 */
('Diseño de Bases de Datos Relacionales', 2, 1, '2025-06-12 10:00:00', '2025-06-12 11:30:00', 90, 1), /* ID: 2 */
('Introducción a HTML, CSS y JavaScript', 3, 1, '2025-06-15 14:00:00', '2025-06-15 15:00:00', 60, 0), /* ID: 3 (Borrador) */
('Algoritmos y Estructuras de Datos Básicas', 1, 1, '2025-06-18 09:00:00', '2025-06-18 10:30:00', 90, 1), /* ID: 4 */
('Consultas SQL Esenciales', 2, 1, '2025-06-22 11:00:00', '2025-06-22 12:00:00', 60, 1); /* ID: 5 */

/* 5. Preguntas y Alternativas (Enfocadas en Ing. de Software) */

/* --- Evaluación 1: Fundamentos de Programación en Python (ID: 1) --- */
/* Pregunta 1.1 (ID: 1) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(1, '¿Qué palabra clave se usa para definir una función en Python?', 4.00, 1);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(1, 'function', 0), (1, 'def', 1), (1, 'fun', 0), (1, 'define', 0);

/* Pregunta 1.2 (ID: 2) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(1, '¿Cuál es el operador para la exponenciación en Python?', 4.00, 2);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(2, '^', 0), (2, 'exp()', 0), (2, '**', 1), (2, 'pow()', 0);

/* Pregunta 1.3 (ID: 3) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(1, '¿Qué tipo de dato es `True` en Python?', 4.00, 3);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(3, 'String', 0), (3, 'Integer', 0), (3, 'Float', 0), (3, 'Boolean', 1);

/* Pregunta 1.4 (ID: 4) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(1, '¿Cómo se inicia un comentario de una sola línea en Python?', 4.00, 4);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(4, '//', 0), (4, '#', 1), (4, '/*', 0), (4, '--', 0);

/* Pregunta 1.5 (ID: 5) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(1, '¿Qué función se usa para imprimir salida en la consola en Python?', 4.00, 5);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(5, 'display()', 0), (5, 'print()', 1), (5, 'log()', 0), (5, 'output()', 0);


/* --- Evaluación 2: Diseño de Bases de Datos Relacionales (ID: 2) --- */
/* Pregunta 2.1 (ID: 6) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(2, '¿Qué es una Clave Primaria (Primary Key) en una base de datos relacional?', 4.00, 1);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(6, 'Una clave que puede tener valores duplicados.', 0), (6, 'Una clave que enlaza dos tablas.', 0), (6, 'Un identificador único para cada fila en una tabla.', 1), (6, 'Una clave que se usa para ordenar los datos.', 0);

/* Pregunta 2.2 (ID: 7) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(2, '¿Cuál es el propósito de la normalización en bases de datos?', 4.00, 2);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(7, 'Aumentar la redundancia de datos.', 0), (7, 'Mejorar la velocidad de todas las consultas.', 0), (7, 'Reducir la redundancia de datos y mejorar la integridad.', 1), (7, 'Hacer la base de datos más grande.', 0);

/* Pregunta 2.3 (ID: 8) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(2, 'Una relación "Muchos a Muchos" entre dos tablas se implementa generalmente usando:', 4.00, 3);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(8, 'Una clave foránea en ambas tablas.', 0), (8, 'Una nueva tabla con claves foráneas a ambas tablas originales (tabla de unión).', 1), (8, 'Duplicando columnas en una de las tablas.', 0), (8, 'No es posible implementar relaciones Muchos a Muchos.', 0);

/* Pregunta 2.4 (ID: 9) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(2, '¿Qué forma normal asegura que no hay dependencias parciales en atributos no clave?', 4.00, 4);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(9, 'Primera Forma Normal (1FN)', 0), (9, 'Segunda Forma Normal (2FN)', 1), (9, 'Tercera Forma Normal (3FN)', 0), (9, 'Forma Normal de Boyce-Codd (FNBC)', 0);

/* Pregunta 2.5 (ID: 10) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(2, '¿Qué es una Clave Foránea (Foreign Key)?', 4.00, 5);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(10, 'La clave principal de cualquier tabla.', 0), (10, 'Una clave que referencia la clave primaria de otra tabla, estableciendo un enlace.', 1), (10, 'Un índice para búsquedas rápidas.', 0), (10, 'Una restricción que asegura que un campo no sea nulo.', 0);


/* --- Evaluación 3: Introducción a HTML, CSS y JavaScript (ID: 3) --- */
/* Pregunta 3.1 (ID: 11) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(3, '¿Qué significa HTML?', 4.00, 1);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(11, 'Hyper Text Markup Language', 1), (11, 'High Tech Modern Language', 0), (11, 'Hyperlink and Text Markup Language', 0), (11, 'Home Tool Markup Language', 0);

/* Pregunta 3.2 (ID: 12) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(3, '¿Cuál es el propósito de CSS?', 4.00, 2);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(12, 'Definir la estructura de una página web.', 0), (12, 'Añadir interactividad a una página web.', 0), (12, 'Definir el estilo y la presentación visual de una página web.', 1), (12, 'Gestionar bases de datos del lado del servidor.', 0);

/* Pregunta 3.3 (ID: 13) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(3, '¿Qué etiqueta HTML se usa para crear un hipervínculo?', 4.00, 3);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(13, '<link>', 0), (13, '<a>', 1), (13, '<href>', 0), (13, '<p>', 0);

/* Pregunta 3.4 (ID: 14) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(3, '¿Dónde se debe enlazar un archivo CSS externo en un documento HTML?', 4.00, 4);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(14, 'Dentro de la etiqueta <body>', 0), (14, 'Al final del documento HTML', 0), (14, 'Dentro de la etiqueta <head>', 1), (14, 'Dentro de una etiqueta <script>', 0);

/* Pregunta 3.5 (ID: 15) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(3, '¿Qué hace la sentencia `document.getElementById("id_elemento")` en JavaScript?', 4.00, 5);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(15, 'Crea un nuevo elemento HTML.', 0), (15, 'Selecciona un elemento HTML por su atributo id.', 1), (15, 'Elimina un elemento HTML.', 0), (15, 'Modifica el CSS de un elemento.', 0);


/* --- Evaluación 4: Algoritmos y Estructuras de Datos Básicas (ID: 4) --- */
/* Pregunta 4.1 (ID: 16) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(4, '¿Qué es un algoritmo?', 4.00, 1);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(16, 'Un lenguaje de programación.', 0), (16, 'Un conjunto de instrucciones paso a paso para resolver un problema.', 1), (16, 'Una estructura de datos.', 0), (16, 'Un error en un programa.', 0);

/* Pregunta 4.2 (ID: 17) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(4, '¿Cuál de las siguientes es una estructura de datos lineal?', 4.00, 2);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(17, 'Árbol', 0), (17, 'Grafo', 0), (17, 'Array (Arreglo)', 1), (17, 'Tabla Hash', 0);

/* Pregunta 4.3 (ID: 18) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(4, '¿Qué significa FIFO en el contexto de estructuras de datos?', 4.00, 3);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(18, 'Fast In, Fast Out', 0), (18, 'First In, First Out (Primero en Entrar, Primero en Salir)', 1), (18, 'Few Inputs, Few Outputs', 0), (18, 'First In, Last Out', 0);

/* Pregunta 4.4 (ID: 19) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(4, 'Un algoritmo de búsqueda que divide repetidamente el conjunto de búsqueda a la mitad es:', 4.00, 4);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(19, 'Búsqueda Lineal', 0), (19, 'Búsqueda Binaria', 1), (19, 'Búsqueda por Profundidad (DFS)', 0), (19, 'Búsqueda por Anchura (BFS)', 0);

/* Pregunta 4.5 (ID: 20) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(4, '¿Qué estructura de datos es ideal para implementar una política LIFO (Last In, First Out)?', 4.00, 5);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(20, 'Cola (Queue)', 0), (20, 'Pila (Stack)', 1), (20, 'Lista Enlazada', 0), (20, 'Árbol Binario', 0);


/* --- Evaluación 5: Consultas SQL Esenciales (ID: 5) --- */
/* Pregunta 5.1 (ID: 21) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(5, '¿Qué cláusula SQL se usa para seleccionar datos de una base de datos?', 4.00, 1);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(21, 'GET', 0), (21, 'SELECT', 1), (21, 'RETRIEVE', 0), (21, 'FETCH', 0);

/* Pregunta 5.2 (ID: 22) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(5, 'Para filtrar resultados en una consulta SQL, se usa la cláusula:', 4.00, 2);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(22, 'FILTER BY', 0), (22, 'CONDITION', 0), (22, 'WHERE', 1), (22, 'HAVING', 0);

/* Pregunta 5.3 (ID: 23) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(5, '¿Qué comando SQL se utiliza para añadir nuevas filas a una tabla?', 4.00, 3);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(23, 'ADD ROW', 0), (23, 'CREATE ROW', 0), (23, 'INSERT INTO', 1), (23, 'NEW ROW', 0);

/* Pregunta 5.4 (ID: 24) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(5, 'La cláusula `JOIN` en SQL se utiliza para:', 4.00, 4);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(24, 'Ordenar los resultados.', 0), (24, 'Combinar filas de dos o más tablas basadas en una columna relacionada.', 1), (24, 'Eliminar filas duplicadas.', 0), (24, 'Agrupar filas con valores idénticos.', 0);

/* Pregunta 5.5 (ID: 25) */
INSERT INTO Preguntas (evaluacion_id, texto_pregunta, puntaje, orden) VALUES
(5, '¿Qué función de agregación SQL se usa para contar el número de filas?', 4.00, 5);
INSERT INTO Alternativas (pregunta_id, texto_alternativa, es_correcta) VALUES
(25, 'SUM()', 0), (25, 'AVG()', 0), (25, 'COUNT()', 1), (25, 'MAX()', 0);

/* Nota: Los IDs de las preguntas se auto-incrementan secuencialmente desde 1.
   Los IDs de las alternativas también se auto-incrementan.
   Este script asume que las tablas están vacías antes de la inserción
   y que los AUTO_INCREMENT para los IDs comienzan en 1.
*/