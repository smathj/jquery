<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반적인 json받기</title>
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
			url : '/data.json',
			type : 'GET',
			dataType : 'json',
			success : function(result) {
				
				var html = '';
				$.each(result,function(index,value) {
					//console.log(index);
					//console.log(value);
					html += '<span class="blue">'+ index + ' : ' + value +'</span><br>';
				});
				$("#di").html(html);
			}
		});
	}
	
	
</script>
</head>
<body>
<button onclick="getJson()">Json 데이터 받기</button>
<div id="di">
</div>
</body>
</html>