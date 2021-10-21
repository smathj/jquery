<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp를 json으로 받기</title>
<style>
	.blue {
		color : blue;
		border : 1px solid black;
	}
</style>
<script src="jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
		
	})
	
	function getJson() {
		$.ajax({
			url : '/json_data.jsp',
			type : 'GET',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				
				var html = '<span class="blue">'+ result.data +'</span><br>';
				
				$("#di").append(html);
			}
		});
	}
	
	
</script>
</head>
<body>
<button onclick="getJson()">Json Jsp에서 데이터 가져오기</button>
<div id="di">

</div>

</body>
</html>