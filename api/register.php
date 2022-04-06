<?php

include('dbconnection.php');
$con = dbconnection();

if(isset($_GET['username']))
{
    $uname=$_GET['username'];
}
else
{
    return;
}
if(isset($_GET['password']))
{
    $pass=$_GET['password'];
}
else
{
    return;
}
if(isset($_GET['fullname']))
{
    $name=$_GET['fullname'];
}
else
{
    return;
}


if(isset($_GET['phoneno']))
{
    $phoneno=$_GET['phoneno'];
}
else
{
    return;
}




$val=[];

$query = "INSERT INTO `login`(`username`, `fullname`, `phoneno`, `password`)
VALUES ('$uname','$name','$phoneno','$pass')";


$exe=mysqli_query($con,$query);

if($exe)
{
    $val["success"]=true;
  
}
else
{
   $val["success"]=false;
   
}

print(json_encode($val));
   
?>