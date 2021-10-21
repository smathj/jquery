<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
	
	function test() {
		$.ajax({
			url : '/db.jsp',
			type : 'GET',
			dataType : 'html',
			success : function(result) {
				console.log(result);
				$("#my_button").after(result);
			}
		});
	}
	
	
	function add() {
		
		alert('보내자');
		
		$.ajax({
			url : '/insert.jsp',
			type : 'GET',
			dataType : 'html',
			data : {col1 : $('input[name=col1]').val(), col2 : $('input[name=col2]').val()},
			success : function(result) {
				alert('통신성공');
				console.log(result);
				/* $("#my_button").after(result); */
			}
		});
	}

</script>
</head>
<body>
	<form id="frm">
		col1 : <input type="text" name="col1">
		col2 : <input type="text" name="col2">
	</form>
	<button id="add" onclick="add()">추가</button><br>
	<button id="my_button" onclick="test()">버튼</button><br>
	
</body>
</html>