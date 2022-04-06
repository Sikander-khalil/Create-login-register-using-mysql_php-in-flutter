<?php
function dbconnection(){
	$conn = mysqli_connect('localhost','root','','userdata');
	if (!$conn) {
		
		die("connection failed".mysqli_connect_error());
	
	}
	return $conn;


}

    ?>