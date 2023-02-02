<?php
/* $mysql_server_name='localhost'; //改成自己的mysql数据库服务器
 $mysql_username='root'; //改成自己的mysql数据库用户名
 $mysql_password=''; //改成自己的mysql数据库密码
 $mysql_database='zsmdb'; //改成自己的mysql数据库名
 $conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password);

 mysql_query("set names 'utf8'"); //数据库输出编码,与数据库编码保持一致 
 mysql_select_db($mysql_database); //打开数据库
 $sql ="select * from clothes"; //SQL语句。字段 sid、jiage、type
 $result = mysql_query($sql,$conn); //查询
*/
	$db_name="zsmdb";   //改成自己的mysql数据库名
	$user="root";       //改成自己的mysql数据库用户名
	$password="";       //改成自己的mysql数据库密码
	$host="localhost";  //改成自己的mysql数据库服务器
	$dsn="mysql:host=$host;dbname=$db_name";
    try{
         $con = new PDO($dsn, $user, $password);
	}catch(Exception $e){   }
	$con -> query("set names utf8");

    $sql ="select * from clothes"; 
    $result = $con -> query($sql);

 echo "var json = [";
 $i = 0;	 
// while($row = mysql_fetch_array($result))
 foreach($result as $row)
 {
	
	if($i != 0)		// 如果是第一条数据，则在数据前不现实逗号分隔符
	{
	  echo ",";
	}else
	{
	  $i = 1;
	}
		echo '{ "';
			echo 'sid":';
			echo '"';
			echo $row['sid'];
			echo '",';
			echo '"';
			echo 'jiage":';
			echo '"';
			echo $row['jiage'];
			echo '"}';
  }
  echo "];";
?>
