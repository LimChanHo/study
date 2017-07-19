/**
 * 
 */
function getHttpXmlObj(){
    //해당브라우져가 익스플로러 7.0 이상이거나 파이어폭스, 크롭 등일경우
	if(window.XMLHttpRequest){
  		return new XMLHttpRequest();
 	}else if(window.ActiveXObject){
  		//해당 브라우져가 익스플로러 6.0 이하일경우
  		return new ActiveXObject("Microsoft.XMLHTTP");
 	}
	//해당 브라우져가 듣보잡일경우.. 어떤 브라우져 인진 나도 모름.
	alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
}

var str = "name,id,pwd,r,1,a,b,c";
{"name","id","pwd"}
var strs = str.split(",");
var param = "";
var strs = new Array();
strs[strs.length] = "name";
strs[strs.length] = "id";
strs[strs.length] = "pwd";
for(var i=0;i<strs.length;i++){
	var value = document.getElementById(strs[i]).value;
	param += "&" + strs[i] + "=" + value;
}
var au = new AjaxUtil("/login.action","name,id,pwd");
var AjaxUtil = function(url, arrParams, method,  aSync){
	this.fAction = url;
   	this.fMethod = method ? method : "get";
   	var params = "?action=LOGIN&id=" + encodeURIComponent(userid);
   	this.fASync = aSync ? aSync : true;
   	xmlHttpObj.onreadystatechange=function(){
   		if (xmlHttpObj.readyState==4 && xmlHttpObj.status==200){
   			var result = decodeURIComponent(xmlHttpObj.responseText);
   			if(result == "success"){
       			location.href = "../user/welcome.jsp"
       		}else{
       			alert(result);
       		}
        }
    }
   	xmlHttpObj.open(method, url+params, sync);
   	if(method=="post"){
   		xmlHttpObj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   	}
   	xmlHttpObj.send(params);
}