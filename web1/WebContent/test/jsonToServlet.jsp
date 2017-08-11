<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<script>
var testParam1 = {};
testParam1["giNum"] = "1";
testParam1["giName"] = "상품명";
testParam1["giDesc"] = "상품설명";
testParam1["viNum"] = "1";
testParam1["viName"] = "회사명";
testParam1["viList"] = [{str1 :"1"},{str2:"2"}];
var testParam2 = {};
testParam2["giNum"] = "2";
testParam2["giName"] = "상품명";
testParam2["giDesc"] = "상품설명";
testParam2["viNum"] = "2";
testParam2["viName"] = "회사명";
testParam2["viList"] = [{str1 :"1"},{str2:"2"}];
function callback(results) { 
	for(var i=0,max = results.length;i<max;i++){
		var result = results[i];
		for(var i=0,max = result.viList.length;i<max;i++){
		alert(result.viList[1].str1);
	}
}
}
movePageWithAjax([testParam1,testParam2],"/testasdf.goods", callback);
</script>
</body>
</html>