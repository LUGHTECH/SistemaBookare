<?php
if(!$con = mysqli_connect('localhost','root','','testegenero')){
    echo "Erro ao se conectar com a base de dados";
}
mysqli_query($con,"SET NAMES utf8");


if(!$con2 = mysqli_connect('localhost','root','','bd_bookare')){
    echo "Erro ao se conectar com a base de dados";
}
mysqli_query($con2,"SET NAMES utf8");