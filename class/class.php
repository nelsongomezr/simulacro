<?php 
session_start($Usuario);
require("conexion.php");

class simulacro extends Conexion
{
    protected $v1;
    protected $v2;
    protected $v3;
    protected $v4;
    protected $v5;
    protected $v6;
    protected $v7;
    protected $v8;




    public function Crea_eps($v1,$v2,$v3,$v4)
    {
        $sql="INSERT INTO Eps values '$v1','$v2','$v3','$v4',";
        $res=$this->conex->query($sql);

        echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../Nueva carpeta/simulacro/--/*nombre del archivo del formulario*/--.php';
			</script>";
            return("$v1,$v2,$v3,$v4");
    }

    public function Crea_cmedi()
    {
        $sql="INSERT INTO Cent_Med values /*valores en orden de la tabla */";
        $res=$this->conex->query($sql);

        echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../Nueva carpeta/simulacro/--/*nombre del archivo del formulario*/--.php';
			</script>";

    }

    public function Valida_ci()
    {
        $sql="SELECT * FROM usuario Where idUsuario='$Usuario'";
        $res=$this->conex->query($sql);


    }



}











?>