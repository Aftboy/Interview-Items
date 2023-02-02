<?php
 session_start();
 if(!isset($_POST['login'])){  
    exit('非法访问!');  
}

 $name= $_POST['username']; 
 $psw= $_POST['password'];



	$db_name="zsmdb";   //改成自己的mysql数据库名
	$user="root";       //改成自己的mysql数据库用户名
	$password="";       //改成自己的mysql数据库密码
	$host="localhost";  //改成自己的mysql数据库服务器
	$dsn="mysql:host=$host;dbname=$db_name";
    try{
         $con = new PDO($dsn, $user, $password);
	}catch(Exception $e){   }
	$con -> query("set names utf8");


	 
	$sql ="select * from users"; //SQL语句
	$result = $con -> query($sql);	//执行查询操作 
    foreach($result as $row)
    {
	if($row['name']==$name)
	{
		if($row['psw']==$psw)
		{
			header("Location: select.html?name=".$name); 
			exit;
		}
		else
		{
			header("Location: denglu.html?pswtrue=false"); 
			exit;
		}
	}
}
	// header("Location: denglu.html?accounttrue=false"); 

?>