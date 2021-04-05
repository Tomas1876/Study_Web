<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 // 이 페이지가 서버에서 실행된다
 // client에서 action="Ex08_login.jsp" 라고 목적지를 설정했기 때문이다
 
 // 요청주소 : 192.168.0.128:8090/WebClient/Ex08_login.jsp?txtuserid = &txtpwd....
 
 	String id = request.getParameter("txtuserid"); //id값으로 입력한 것읍 집어넣는다
 	String pwd = request.getParameter("txtuserid"); 
 	
 	// 그 다음 DB에 insert하든 select하든 개발자 마음이다
 	// 지금 우리 의도는 client에게 응답하는 것!
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버확인(Client에게 다시 전달) <br>
	<%=id  %>	<!-- %= 은 서버의 내용을 Client에게 전달해 write하겠다는 뜻 --> <br>
	<%=pwd  %>
</body>
</html>