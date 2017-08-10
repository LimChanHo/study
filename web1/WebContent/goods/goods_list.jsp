<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<thead>
			<tr>
				<th data-field="giNum" class="text-center">상품번호</th>
				<th data-field="giName" class="text-center">상품이름</th>
				<th data-field="giDesc" class="text-center">상품설명</th>
				<th data-field="viNum" class="text-center">생산자번호</th>
				<th data-field="viName" class="text-center">생산자이름</th>
			</tr>
		</thead>
		<tbody id="result_tbody">
		</tbody>
	</table>
</div>
<div class="jb-center" style="text-align: center">
	<ul class="pagination" id="page">
	</ul>
</div>
<!-- <select id="s_vendor"> -->
<!-- <option value="">회사선택</option> -->
<!-- </select>  -->
<!-- 연산자 : -->
<!-- <input type="text" id="op" /> -->
<!-- <input type="button" id="getCal" value="계산리스트호출" /> -->
<div id="result_div" class="container"></div>
<script>
var thisBlockCnt = 0;
var thisNowPage = 0;
var thisTotalPage = 0;
function callback(results){
	var goodsList = results.list;
	var pageInfo = results.page;
	
	var blockCnt = new Number(pageInfo.blockCnt);
	thisBlockCnt = blockCnt;
	var nowPage= new Number(pageInfo.nowPage);
	thisNowPage = nowPage;
	var startBlock = Math.floor((nowPage-1)/blockCnt) * 10+1;
	var endBlock = startBlock+blockCnt-1;
	var totalPageCnt = new Number(pageInfo.totalPageCnt);
	thisTotalPage = totalPageCnt;
	if(endBlock>totalPageCnt){
		endBlock = totalPageCnt;
	}
	setPagination(startBlock, endBlock, nowPage, totalPageCnt, "page");
	
 	setEvent(pageInfo);
    $('#table').bootstrapTable('destroy');
    $('#table').bootstrapTable({
        data: goodsList
    });
}
$(document).ready(function(){
	var page = {};
	page["nowPage"] = "1";
	var params = {};
	params["page"] = page;
	params["command"] = "list";
	
	goPage(params, "/list.goods", callback);
});
function setEvent(pageInfo){
	$("ul[class='pagination']>li:not([class='disabled'])>a").click(function(){
		var thisNowPage = pageInfo.nowPage;
		var goPageNum = new Number(this.innerHTML);
		if(isNaN(goPageNum)){
			if(this.innerHTML=="◀"){
				thisNowPage -= pageInfo.blockCnt;
			}else if(this.innerHTML=="◀◀"){
				thisNowPage = 1;
			}else if(this.innerHTML=="▶"){
				thisNowPage += pageInfo.blockCnt;
			}else if(this.innerHTML=="▶▶"){
				thisNowPage = pageInfo.totalPageCnt;
			}
			if(thisNowPage<=0){
				thisNowPage = 1;
			}else if(thisNowPage>pageInfo.totalPageCnt){
				thisNowPage = pageInfo.totalPageCnt;
			}
			goPageNum = thisNowPage;
		}

		var page = {};
		page["nowPage"] = "" + goPageNum;
		var params = {};
		params["page"] = page;
		params["command"] = "list";
		goPage(params, "/list.goods", callback);
	})
}
</script>
</body>
</html>