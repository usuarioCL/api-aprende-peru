<?php
require_once __DIR__ . '/../config/Database.php';

class Alternativa
{
    private $conn;
    private $table_name = "Alternativas";

    // Propiedades de la tabla
    public $id;
    public $pregunta_id;
    public $texto_alternativa;
    public $es_correcta;

    public function __construct()
    {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Crear nueva alternativa
    public function create()
    {
        $query = "INSERT INTO " . $this->table_name . " 
                  (pregunta_id, texto_alternativa, es_correcta) 
                  VALUES 
                  (:pregunta_id, :texto_alternativa, :es_correcta)";

        $stmt = $this->conn->prepare($query);

        // Limpiar datos
        $this->pregunta_id = htmlspecialchars(strip_tags($this->pregunta_id));
        $this->texto_alternativa = htmlspecialchars(strip_tags($this->texto_alternativa));
        $this->es_correcta = htmlspecialchars(strip_tags($this->es_correcta));

        // Vincular parámetros
        $stmt->bindParam(":pregunta_id", $this->pregunta_id);
        $stmt->bindParam(":texto_alternativa", $this->texto_alternativa);
        $stmt->bindParam(":es_correcta", $this->es_correcta);

        if ($stmt->execute()) {
            return $this->conn->lastInsertId();
        }

        return false;
    }

    // Obtener todas las alternativas
    public function getAll()
    {
        $query = "SELECT 
                    a.id,
                    a.pregunta_id,
                    p.texto_pregunta,
                    a.texto_alternativa,
                    a.es_correcta
                  FROM " . $this->table_name . " a
                  LEFT JOIN Preguntas p ON a.pregunta_id = p.id
                  ORDER BY a.pregunta_id, a.id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
