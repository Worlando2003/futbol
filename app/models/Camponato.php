<?php
class Campeonato {
    // Propiedades
    public $id;
    public $fechaInicio;
    public $fechaFin;
    public $estado;

    // Constructor
    public function __construct($id, $fechaInicio, $fechaFin, $estado) {
        $this->id = $id;
        $this->fechaInicio = $fechaInicio;
        $this->fechaFin = $fechaFin;
        $this->estado = $estado;
    }

    // Métodos getters
    public function getId() {
        return $this->id;
    }

    public function getFechaInicio() {
        return $this->fechaInicio;
    }

    public function getFechaFin() {
        return $this->fechaFin;
    }

    public function getEstado() {
        return $this->estado;
    }
}
?>
