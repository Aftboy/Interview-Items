	//var map={s1:'102',s2:'120',s3:'110',s4:'180',s5:'198'};  //图片编号+价格
	//下列代码替代map数组
	 var map=new Array();
    function myAjax(){
       for(i=0;  i<json.length; i++){
		 map[i] = json[i];
       }  
	}
	var seletedshangyi="null";
    function shiye(type,count)  
	{
 
	  var oImg = document.getElementById(type);  //创建试衣对象
	  var srcsring= "";      //构造图片路径  
	  srcsring+="image/";
	  //srcsring+=count;
       srcsring+=count.sid;
	  srcsring+=".png"
	  oImg.src = srcsring;   //把图片路径赋值给试衣对象，即为模特穿上衣服 
	  var str="您选择的T恤为:"; //仅考虑T恤一种情况
	  str+=document.getElementById(count.sid).title;
	  str+="  ￥:"
	  str+=count.jiage;
	  $('h2').html(str);  //在页面上显示
	  var price=0;
	  price+=parseInt(count.jiage);
	  var pricestr="总计为￥: ";
	  pricestr+=price;
	  $('h5').html(pricestr);  //在页面上显示
	}
	function deleteshiye()
	{
		seletedshangyi="null";
		document.getElementById("shangyi").src="";
		$('h2').html("您没有选择T恤");
		$('h5').html("总计为￥: 0"); 
	}