<?php
 session_start();
 if(!isset($_POST['login'])){  
    exit('�Ƿ�����!');  
}

 $name= $_POST['username']; 
 $psw= $_POST['password'];



	$db_name="zsmdb";   //�ĳ��Լ���mysql���ݿ���
	$user="root";       //�ĳ��Լ���mysql���ݿ��û���
	$password="";       //�ĳ��Լ���mysql���ݿ�����
	$host="localhost";  //�ĳ��Լ���mysql���ݿ������
	$dsn="mysql:host=$host;dbname=$db_name";
    try{
         $con = new PDO($dsn, $user, $password);
	}catch(Exception $e){   }
	$con -> query("set names utf8");


	 
	$sql ="select * from users"; //SQL���
	$result = $con -> query($sql);	//ִ�в�ѯ���� 
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