<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="container">
<select id="s_vendor">
<option value="0">회사선택</option>
</select> 
<input type="button" id="gselect" value="제품정보검색"/>
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th data-field="vinum"  class="text-center">vinum</th>
					<th data-field="viname"  class="text-center">viname</th>
					<th data-field="videsc"  class="text-center">videsc</th>
					<th data-field="viaddress"  class="text-center">viaddress</th>
					<th data-field="viphone"  class="text-center">viphone</th>
					<th data-field="giname"  class="text-center">giname</th>
					<th data-field="gidesc"  class="text-center">gidesc</th>
					<th data-field="gicredat"  class="text-center">gicredat</th>
					<th data-field="gicretim"  class="text-center">gicretim</th>
				</tr>
			</thead>
			<tbody id="result_tbody">
			</tbody>
		</table>
	</div>
	



<script>
$(document).ready(function(){
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/goods/company_select1.jsp"
	    	    ,   dataType : "json" 
	    	    ,   beforeSend: function(xhr) {
	    	        xhr.setRequestHeader("Accept", "application/json");
	    	        xhr.setRequestHeader("Content-Type", "application/json");
	    	    }
	    	    ,   data     : null
	    	    ,   success : function(result){
	    	    	for(var i=0, max=result.length;i<max;i++){
	    	    		results = result[i];
	    	    		
	    	    			$("#s_vendor").append("<option value='"+results.vinum+"'>"+results.viname+"</option>");
	    	    	}
	    
	    	    }
	    	    ,   error : function(xhr, status, e) {
	    		    	alert("에러 : "+e);
	    		},
	    		done : function(e) {
	    		}
	    		};
	$.ajax(a);
});

$("input[id*='select']").click(function(){
	var vinum = $("#s_vendor").val();
	var param = {};
	param["vinum"] = vinum;
	param = JSON.stringify(param);
	var a = { 
	        type     : "POST"
	    	    ,   url      : "/goods/company_select.jsp"
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
	    		done : function(e) {
	    		}
	    		};
	$.ajax(a);
});
</script>
</body>
