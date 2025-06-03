<?php
require_once __DIR__ . '/../config/Database.php';

class Pregunta
{
    private $conn;
    private $table_name = "Preguntas";

    // Propiedades de la tabla
    public $id;
    public $evaluacion_id;
    public $texto_pregunta;
    public $puntaje;
    public $orden;

    public function __construct()
    {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Crear nueva pregunta
    public function create()
    {
        $query = "INSERT INTO " . $this->table_name . " 
                  (evaluacion_id, texto_pregunta, puntaje, orden) 
                  VALUES 
                  (:evaluacion_id, :texto_pregunta, :puntaje, :orden)";

        $stmt = $this->conn->prepare($query);

        // Limpiar datos
        $this->evaluacion_id = htmlspecialchars(strip_tags($this->evaluacion_id));
        $this->texto_pregunta = htmlspecialchars(strip_tags($this->texto_pregunta));
        $this->puntaje = htmlspecialchars(strip_tags($this->puntaje));
        $this->orden = htmlspecialchars(strip_tags($this->orden));

        // Vincular parámetros
        $stmt->bindParam(":evaluacion_id", $this->evaluacion_id);
        $stmt->bindParam(":texto_pregunta", $this->texto_pregunta);
        $stmt->bindParam(":puntaje", $this->puntaje);
        $stmt->bindParam(":orden", $this->orden);

        if ($stmt->execute()) {
            return $this->conn->lastInsertId();
        }

        return false;
    }

    // Obtener todas las preguntas
    public function getAll()
    {
        $query = "SELECT 
                    p.id,
                    p.evaluacion_id,
                    e.nombre as evaluacion_nombre,
                    p.texto_pregunta,
                    p.puntaje,
                    p.orden
                  FROM " . $this->table_name . " p
                  LEFT JOIN Evaluaciones e ON p.evaluacion_id = e.id
                  ORDER BY p.evaluacion_id, p.orden ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Obtener pregunta por ID
    public function getById($id)
    {
        $query = "SELECT 
                    p.id,
                    p.evaluacion_id,
                    e.nombre as evaluacion_nombre,
                    p.texto_pregunta,
                    p.puntaje,
                    p.orden
                  FROM " . $this->table_name . " p
                  LEFT JOIN Evaluaciones e ON p.evaluacion_id = e.id
                  WHERE p.id = :id";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":id", $id);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Obtener preguntas por evaluación
    public function getByEvaluacion($evaluacion_id)
    {
        $query = "SELECT 
                    p.id,
                    p.evaluacion_id,
                    e.nombre as evaluacion_nombre,
                    p.texto_pregunta,
                    p.puntaje,
                    p.orden
                  FROM " . $this->table_name . " p
                  LEFT JOIN Evaluaciones e ON p.evaluacion_id = e.id
                  WHERE p.evaluacion_id = :evaluacion_id
                  ORDER BY p.orden ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":evaluacion_id", $evaluacion_id);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Obtener preguntas con sus alternativas
    public function getWithAlternativas($evaluacion_id)
    {
        $query = "SELECT 
                    p.id,
                    p.evaluacion_id,
                    p.texto_pregunta,
                    p.puntaje,
                    p.orden,
                    a.id as alternativa_id,
                    a.texto_alternativa,
                    a.es_correcta
                  FROM " . $this->table_name . " p
                  LEFT JOIN Alternativas a ON p.id = a.pregunta_id
                  WHERE p.evaluacion_id = :evaluacion_id
                  ORDER BY p.orden ASC, a.id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":evaluacion_id", $evaluacion_id);
        $stmt->execute();

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Agrupar alternativas por pregunta
        $preguntas = [];
        foreach ($results as $row) {
            $pregunta_id = $row['id'];

            if (!isset($preguntas[$pregunta_id])) {
                $preguntas[$pregunta_id] = [
                    'id' => $row['id'],
                    'evaluacion_id' => $row['evaluacion_id'],
                    'texto_pregunta' => $row['texto_pregunta'],
                    'puntaje' => $row['puntaje'],
                    'orden' => $row['orden'],
                    'alternativas' => []
                ];
            }

            if ($row['alternativa_id']) {
                $preguntas[$pregunta_id]['alternativas'][] = [
                    'id' => $row['alternativa_id'],
                    'texto_alternativa' => $row['texto_alternativa'],
                    'es_correcta' => $row['es_correcta']
                ];
            }
        }

        return array_values($preguntas);
    }
}
