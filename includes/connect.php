<?php
if(!$con = mysqli_connect('localhost','root','','testeGenero')){
    echo "Erro ao se conectar com a base de dados";
}
mysqli_query($con,"SET NAMES utf8");


if(!$con2 = mysqli_connect('localhost','root','','bookare_db')){
    echo "Erro ao se conectar com a base de dados";
}
mysqli_query($con,"SET NAMES utf8");