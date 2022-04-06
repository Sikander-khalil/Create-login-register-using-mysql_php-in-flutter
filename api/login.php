<?php 
	
	include('dbconnection.php');
	$con=dbconnection();
	header("Access-Control-Allow-Origin: *");
	if(isset($_GET["username"]))
{
$username=$_GET["username"];
}
else
{
    return;
}
if(isset($_GET["password"]))
{
$password=$_GET["password"];
}
else
{
    return;
}
$sql = "SELECT `id`, `username`, `password` FROM `login` where username='$username' and password='$password'";

	$result = mysqli_query($con,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Success");
	}else{
		echo json_encode("Error");
	}

?>