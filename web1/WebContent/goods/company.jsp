<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="ginum" class="text-center">상품번호</th>
				<th data-field="giname" class="text-center">상품이름</th>
				<th data-field="gidesc" class="text-center">상품설명</th>
				<th data-field="vinum" class="text-center">생산자번호</th>
				<th data-field="viname" class="text-center">생산자이름</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
</div>
<div class="jb=center" style ="text-align: center">
     <ul class="pagination" id="page">
     <li>
     </ul>
     </div>
<select id="s_vendor">
<option value="">회사선택</option>
</select> 
<!-- 연산자 : -->
<!-- <input type="text" id="op" /> -->
<input type="button" id="getCal" value="회사호출" />
<div id="result_div" class="container"></div>
<script>

$(document).ready(function(){
	var params = {};
	params["nowPage"]="15";
	params = JSON.stringify(params);
	var a = { 
    		type     : "POST"
	    ,   url      : "/goods/vendor_select.jsp"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : params
	    ,   success : function(results){
	    	var vendorList = results.vendorList;
	    	var goodsList = results.goodsList;
	    	var pageInfo = results.pageInfo;
	    	
	    	var pageStr = "<li><a>◀◀</a></li>";
	    	pageStr += "<li><a>◀</a></li>";
	    	var blockCnt = new Number(pageInfo.blockCnt);
	    	var nowPage = new Number (pageInfo.nowPage);
	    	var startBlock = Math.floor((nowPage-1)/blockCnt)*10+1;
	    	var endBlock = startBlock+blockCnt-1;
	    	var totalPageCnt = new Number (pageInfo.totalPageCnt);
	    	for(var i=startBlock, max=endBlock;i<=max;i++){
	    		if(i==pageInfo.nowPage){
	    			pageStr +="<li class='active'><a>"+i+"</a></li>";
	    		}else{
	    			pageStr +="<li><a>"+i+"</a></li>";
	    		}
	    		
	    	}
	    	pageStr += "<li><a>▶</a></li>";
	    	pageStr += "<li><a>▶▶</a></li>";
	    	
	    	$("#page").html(pageStr);

	    	for(var i=0, max=vendorList.length;i<max;i++){
	    		$("#s_vendor").append("<option value='" + vendorList[i].vinum + "'>"+vendorList[i].viname +"</option>")
	    	}
	        $('#table').bootstrapTable({
	            data: goodsList
	        });
	    }
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete  : function() {
		}
	};
$.ajax(a);
});

$("#getCal").click(function(){
	alert($("#s_vendor").val());
	return;
	var op = $("#op").val();
	var param = {};
	param["op"] = op;
	param = JSON.stringify(param);
	var a = { 
	        		type     : "POST"
	    	    ,   url      : "/goods/cal_select.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : param
	    	    ,   success : function(result){
		    	        $('#table').bootstrapTable({
		    	            data: result
		    	        });
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		complete  : function() {
	    			alert("실패던지 성공이던지 나랑 무슨상관이냐~ 난 실행할란다~");
	    		}
	    	};
	$.ajax(a);
}); 

$("input[id*='cal']").click(function(){
	var id = this.id;
	var idx = id.substring(id.length-1);
	var num1 = $("#num"+ idx + "_1").val();
	var num2 = $("#num"+ idx + "_2").val();

	var param = {};
	param["num1"] = num1;
	param["num2"] = num2;
	param["op"] = ops[idx];
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/goods/cal_ok.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : param
	    	    ,   success : function(result){ 
	    	    	alert(result.insert);
	    	    	$("#result" + idx).val(result.num);  
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		done : function(e) {
	    		}
	    		};
	$.ajax(a);
});
</script>
</body>
</html>