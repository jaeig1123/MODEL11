<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
System.out.println("����� listProduct.jsp");
%>

<html>
<head>
<meta charset="euc-kr">
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetProductList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();		
}

 $(function(){
 
	$("td.ct_btn01:contains('�˻�')").on("click",function(){
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetProductList(1);
	});
	
	$(".ct_list_pop td:nth-child(3)").on("click", function() {
		
		var prodNo = $(this).children('input:hidden').val();
		
		if(($(this).children('input:hidden').attr('id')) == "prodSearch") {
			
			//self.location = "/product/getProduct?prodNo="+$(this).children('input:hidden').val();
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug
							//alert(status);
							//Debug
							//alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h3>"
														+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
														+"��ǰ�� : "+JSONData.prodName+"<br/>"
														+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
														+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
														+"�������� : "+JSONData.manuDate+"<br/>"
														+"���� : "+JSONData.price+"<br/>"
														+"������� : "+JSONData.regDateString+"<br/>"
														+"</h3>";
							//Debug									
							//alert(displayValue);
							$("h3").remove();
							$( "#"+prodNo+"" ).html(displayValue);
						}
				});
		}else{ 
			
			
			self.location = "/product/updateProduct?prodNo="+$(this).children('input:hidden').val();
			
			
		}
	});
	
 });

/*	
	$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
	if("menu".equals("manage")){
		self.location = "/product/updateProduct?prodNo="+${list[0].prodNo};
	}else{
		self.location = "/product/getProduct?prodNo="+${list[0].prodNo};
	}
	});
*/
/*	$(function(){
		<c:forEach var="a" begin="0" end = "${list.size()}" step="1">
		
		if(id="prodManage"){
			$("#prodManage").bind("click",function(){
			self.location = "/product/updateProduct?prodNo=${list[a].prodNo}";
		})
		}else{
			$("#prodSearch").bind("click",function(){
			
		  })
	 	}//else
	 	</c:forEach>

	});
*/

	/* $.each(${list}, function(index, value){
	
		if(id="prodManage"){
			$("#prodManage").bind("click",function(){
			self.location = "/product/updateProduct?prodNo=${list[value].prodNo}";
		})	
			}else{
				$("#prodSearch").bind("click",function(){
				self.location = "/product/getProduct?prodNo=${list[value].prodNo}";
	 			})
 			}//else
	
	}); */
 
 
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
							
							
					 	<c:choose>
							<c:when test="${menu == 'manage'}">
							��ǰ ����
							</c:when>
							<c:otherwise>
							��ǰ �����ȸ
							</c:otherwise>
							</c:choose>
							
					
					 
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
			</select>
			<input type="text" name="searchKeyword" 
			value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
			class="ct_input_g" style="width:200px; height:19px" />
		</td>
	
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						
						
												�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		��ü  ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>		
	</tr>
	
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left" id="prodName">
			 
			<c:choose>
			<c:when test="${menu == 'manage'}">
			<input type="hidden" id="prodManage" name="manage" value="${product.prodNo}"/>
			</c:when>
			<c:otherwise>
			<input type="hidden" id="prodSearch" name="search" value="${product.prodNo}"/>
			</c:otherwise>
			</c:choose>
			${product.prodName}
			
			<!--
			<a href="
			<c:choose>
			<c:when test="${menu == 'manage'}">
			/product/updateProduct
			</c:when>
			<c:otherwise>
			/product/getProduct
			</c:otherwise>
			</c:choose>
			/product/updateProduct?prodNo=${product.prodNo}">
			${product.prodName}</a>
			 -->
			<!-- 
			<input type="hidden" id="
			<c:choose>
			<c:when test="${menu == 'manage'}">
			prodManage
			</c:when>
			<c:otherwise>
			prodSearch
			</c:otherwise>
			</c:choose>"> -->
			
			</td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left">null</td>		
		</tr>
		<tr>
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   	
		   	<jsp:include page="../common/ProductNavi.jsp"/>
		   	
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->


</form>

</div>
</body>
</html>
