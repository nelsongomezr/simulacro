<?php
 require("class/class.php");

    if (isset($_POST["valida"])) 
    {
        if (isset($_POST["valida"])=="validado") 
        {
            $v1=$_POST["nit"];
            $v2=$_POST["nombre"];
            $v3=$_POST["dire"];
            $v4=$_POST["tel"];

            $tra=new simulacro();
            $tra1=$tra->Crea_eps($v1,$v2,$v3,$v4);

            echo $tra1;
        
        
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creacion eps</title>
</head>
<body>
    <form action="" method="post">
        <center>
            <table border="1">    
                <tr>
                    <td>
                        <H4>Digite el nombre de la eps</H4>
                    </td>
                    <td>
                        <input type="text" name="nombre" placeholder="nombres">
                    </td>
                </tr>
                <tr>
                    <td>
                        <H4>Digite el nit de la eps</H4>
                    </td>
                    <td>
                        <input type="text" name="nit" placeholder="nombres">
                    </td>
                </tr>
                <tr>
                    <td>
                        <H4>Digite la direccion de la central de la eps</H4>
                    </td>
                    <td>
                        <input type="text" name="dire" placeholder="nombres">
                    </td>
                </tr>
                <tr>
                    <td>
                        <H4>Digite el numero de contacto de la eps</H4>
                    </td>
                    <td>
                        <input type="text" name="tel" placeholder="nombres">
                    </td>
                </tr>
            </table>
            <hr>
                <input type="hidden" name="valida"  value="validado">
                <input type="submit" name="envia" value="enviar">  
        </center>
    </form>
</body>
</html>