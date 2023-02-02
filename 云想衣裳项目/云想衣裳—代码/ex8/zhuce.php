<?php
if(!isset($_POST['reg'])){  
    exit('非法访问!');  
}
 $name= $_POST['username']; 
 $psw= $_POST['password'];
 $email= $_POST['email'];
 $mobile= $_POST['mobile'];
 $usersex= $_POST['usersex'];


	$db_name="zsmdb";   //改成自己的mysql数据库名
	$user="root";       //改成自己的mysql数据库用户名
	$password="";       //改成自己的mysql数据库密码
	$host="localhost";  //改成自己的mysql数据库服务器
	$dsn="mysql:host=$host;dbname=$db_name";
    try{
         $con = new PDO($dsn, $user, $password);
	}catch(Exception $e){   }
	$con -> query("set names utf8");
    $sql ="insert into users(name, psw, email, mobile, usersex) 
           values('$name','$psw','$email','$mobile','$usersex')"; 
    $con -> query($sql);

 	header("Location: index.html?regtrue=true");  //跳转执行index.html登录模块 
?>
