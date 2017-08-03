<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/header.jsp"%>

<table border="2">
<tr>
<td>jtnum: <input type ="text" id = "num"></td>
</tr>
<tr>
<td>jttext: <input type = "text" id = "text"></td>
</tr>
<tr>
<td align="center"><input type ="button" id="jtinsert" value="insert"/></td>
</tr>
<tr>

</tr>
</table>
<br/>
<br/>
<br/>

<div class="container">
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="num"  class="text-center">번호</th>
					<th data-field="text"  class="text-center">내용</th>
				</tr>
			</thead>
			<tbody id="result_tbody">
			</tbody>
		</table>
	</div>
	번호 : <input type="text" id="num1"/><td align="center"><input type ="button" id="jtselect" value="select"/></td>
<div id="result_div" class="container"></div>



<script>
$("input[id*=insert]").click(function(){
	var num = $("#num").val();
	var text = $("#text").val();
	var param = {};
	param["num"] = num;
	param["text"] = text;
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST" //url에 값이 찍히느냐 안찍히느냐의 차이
	    	    ,   url      : "/test/json_cal_ok.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : param
	    	    ,   success : function(result){
		    	        alert(result.result);
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		done : function(e) {
	    		}
	    		};
	$.ajax(a);
});


$("#jtselect").click(function(){
	var num1 = $("#num1").val();
	var param = {};
	param["num1"] = num1;
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/test/json_cal_select.jsp"
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
// 	    	    	for(var i=0, max=result.length;i<max;i++){
// 	    	    		var results = result[i]; 
// 		    	    	$("#result_div").append(results.num + "," + results.text +"<br/>");
// 	    	    	}
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