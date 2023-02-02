	var map={s1:'102',s2:'120',s3:'110',s4:'180',s5:'198'};  //图片编号+价格
	var seletedshangyi="null";
    function shiye(type,count)  
	{
	  var oImg = document.getElementById(type);  //创建试衣对象
	  var srcsring= "";      //构造图片路径  
	  srcsring+="image/";
	  srcsring+=count;
	  srcsring+=".png"
	  oImg.src = srcsring;   //把图片路径赋值给试衣对象，即为模特穿上衣服 
	  var str="您选择的T恤为:"; //仅考虑T恤一种情况
	  str+=document.getElementById(count).title;
	  str+="  ￥:"
	  str+=map[count];
	  $('h2').html(str);
	  seletedshangyi=count;
	  var price=0;
	  price+=parseInt(map[seletedshangyi]);
	  var pricestr="总计为￥: ";
	  pricestr+=price;
	  $('h5').html(pricestr);
	}
	function deleteshiye()
	{
		seletedshangyi="null";
		document.getElementById("shangyi").src="";
		$('h2').html("您没有选择T恤");
		$('h5').html("总计为￥: 0"); 
	}