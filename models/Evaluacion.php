<?php
require_once __DIR__ . '/../config/Database.php';

class Evaluacion
{
    private $conn;
    private $table_name = "Evaluaciones";

    // Propiedades de la tabla
    public $id;
    public $nombre;
    public $area_id;
    public $admin_id;
    public $fecha_creacion;
    public $fecha_inicio;
    public $fecha_fin;
    public $duracion;
    public $puntaje;
    public $publicada;

    public function __construct()
    {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Crear nueva evaluación
    public function create()
    {
        $query = "INSERT INTO " . $this->table_name . " 
                  (nombre, area_id, admin_id, fecha_inicio, fecha_fin, duracion, puntaje, publicada) 
                  VALUES 
                  (:nombre, :area_id, :admin_id, :fecha_inicio, :fecha_fin, :duracion, :puntaje, :publicada)";

        $stmt = $this->conn->prepare($query);

        // Limpiar datos
        $this->nombre = htmlspecialchars(strip_tags($this->nombre));
        $this->area_id = htmlspecialchars(strip_tags($this->area_id));
        $this->admin_id = htmlspecialchars(strip_tags($this->admin_id));
        $this->fecha_inicio = htmlspecialchars(strip_tags($this->fecha_inicio));
        $this->fecha_fin = htmlspecialchars(strip_tags($this->fecha_fin));
        $this->duracion = htmlspecialchars(strip_tags($this->duracion));
        $this->puntaje = htmlspecialchars(strip_tags($this->puntaje));
        $this->publicada = htmlspecialchars(strip_tags($this->publicada));

        // Vincular parámetros
        $stmt->bindParam(":nombre", $this->nombre);
        $stmt->bindParam(":area_id", $this->area_id);
        $stmt->bindParam(":admin_id", $this->admin_id);
        $stmt->bindParam(":fecha_inicio", $this->fecha_inicio);
        $stmt->bindParam(":fecha_fin", $this->fecha_fin);
        $stmt->bindParam(":duracion", $this->duracion);
        $stmt->bindParam(":puntaje", $this->puntaje);
        $stmt->bindParam(":publicada", $this->publicada);

        if ($stmt->execute()) {
            return $this->conn->lastInsertId();
        }

        return false;
    }

    // Obtener todas las evaluaciones
    public function getAll()
    {
        $query = "SELECT 
                    e.id,
                    e.nombre,
                    e.area_id,
                    a.nombre as area_nombre,
                    e.admin_id,
                    ad.nombre as admin_nombre,
                    e.fecha_creacion,
                    e.fecha_inicio,
                    e.fecha_fin,
                    e.duracion,
                    e.puntaje,
                    e.publicada
                  FROM " . $this->table_name . " e
                  LEFT JOIN Areas_eva a ON e.area_id = a.id
                  LEFT JOIN Administradores ad ON e.admin_id = ad.id
                  ORDER BY e.fecha_creacion DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
