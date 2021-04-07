<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		//jQuery.get( url [, data ] [, success ] [, dataType ] )
		// 전송방식 get - open("get")
	
		$(function(){
			$("#btn").click(function(){
				//비동기 함수 $.get
				$.get("Ex03_Company.xml",function(data){
					//응답이 왔고 정상이라면
					console.log(data);
					
					//여기서부터는 비동기가 인라 그냥 jquery다
					$("#display").empty(); // 자식요소 제거해서 비우기
					console.log($(data).find("Company")); //find 함수를 이용해 Company만 찾아온다
					//Company가 복수이므로 배열을 리턴한다
					
					//$().each(function(index, element){})
					$(data).find("Company").each(function(){
						//학습이니까 this를 사용하기
						//console.log(this);
						let entry = $(this);
						// 결국 지금 entry는 
						/*
								<Company CompanyType="private">
									<CompanyName>Bit</CompanyName>
									<CompanyNumber>2019</CompanyNumber>
									<CompanyAddress>서울시 서초구</CompanyAddress>
									<Name></Name>
								</Company>
						*/
						// 한 덩어리다
						
						let html = "<div>" + entry.attr("CompanyType") + "</div>";
						html += "<div>" + entry.find("CompanyName").text() + "</div>";
						html += "<div>" + entry.find("CompanyNumber").text() + "</div>";
						html += "<div>" + entry.find("CompanyAddress").text() + "</div>";
						
						$("#display").append(html);
						
					});
					
				});
			});
		});
	</script>
</head>
<body>
	<input type="button" id="btn" value="회사소개">
	<div id="display" style="background-color:gray">DATA</div>
</body>
</html>