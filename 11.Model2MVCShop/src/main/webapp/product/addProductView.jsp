<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
</style>

<script type="text/javascript">

function fncAddProduct(){
	
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	$("form").attr("method","POST").attr("action","/product/addProduct").submit();
}

function resetData(){
	document.detailForm.reset();
}

	
	$(function(){
		$("#add").on("click",function(){
			
			fncAddProduct();
		});
	
	});
	
	$(function(){
		$("#cancle").on("click",function(){
			
			$(self.location).attr("href","../index.jsp;");
		});
	
	});
	
	
	$( function() {
    $( "#newCalendar" ).datepicker({
    	altField : "#newCalendar",
    	altFormat : "yymmdd",
      showOtherMonths: true,
      selectOtherMonths: true
    	});
 	 });
	
</script>
</head>

<body>

<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	
  <div class="container">
	
		<h1 class="bg-info text-center">��ǰ ���</h1>
		
		<form class="form-horizontal">
		
			<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="prodName">
		    </div>
		  </div>
	
		
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="prodDetail">
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="manuDate" id="newCalendar" readonly="readonly" placeholder="click here!">
		    </div>
		  </div>
	
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="price">
		      <div class="input-group-addon">��</div>
		    </div>
		  </div>
	
		<div class="form-group">
		    <label for="InputFile" class="col-sm-offset-1 col-sm-3 control-label">��ǰ �̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="fileName">
		    </div>
		  </div>
	

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success" id="add" > ��� </button>
			  <button type="button" class="btn btn-danger" id="cancle"> ��� </button>
		    </div>
		  </div>
		</form>
	</div>
</body>
</html>