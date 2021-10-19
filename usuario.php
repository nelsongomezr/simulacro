<?php
    $id=79222897;
    require("class/class.php");
    $con=new trabajo();
    $cons=queryusu($id,$_POST['esp']);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario consulta</title>
</head>
<body>
<center>    
    <h1>Consulte su centro medico por especialidad</h1>
    <form method="POST">
    <select name="esp"> 
        <option>Seleccione la especialidad</option>
        <?php 
        
        ?>

        <?php 
        ?>
    </select><br><br>
    <input type="submit" value="consultar" > 
    </form>
<center>
</body>
</html>
