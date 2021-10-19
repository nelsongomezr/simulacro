<?php
require("conexion.php");
class trabajo extends conexion
{

    private $informacion=array();

    public function queryusu($id,$esp)
    {
        $sql="SELECT * FROM `usuario` 
        INNER JOIN eps
        ON usuario.Eps_idEps=eps.idEps
        INNER JOIN cent_med_has_eps
        ON eps.idEps=cent_med_has_eps.Eps_idEps
        INNER JOIN cent_med
        ON cent_med_has_eps.Cent_Med_idCent_Med=cent_med.idCent_Med
        INNER JOIN  especialidad_has_cent_med
        ON cent_med.idCent_Med=especialidad_has_cent_med.Cent_Med_idCent_Med
        INNER JOIN especialidad
        ON especialidad_has_cent_med.Especialidad_idEspecialidad=especialidad.idEspecialidad
        WHERE usuario.idUsuario=$id AND especialidad.idEspecialidad=$esp";
        $res=$this->conex->query($sql);
        while($reg1=mysqli_fetch_assoc($res))
		    {
			    $this->informacion[]=$reg1;
			}
			return $this->informacion;
    }
    class espcialidades extends conexion
    {
        private $inf=array();

        public function queryesp()
        {
            $sql="select * FROM especialidad WHERE especialidad.idEspecialidad=1";
            $res=$this->conex->query($sql);
        while($reg1=mysqli_fetch_assoc($res))
		    {
			    $this->inf[]=$reg1;
			}
			return $this->inf;
        }
    }

}
?>