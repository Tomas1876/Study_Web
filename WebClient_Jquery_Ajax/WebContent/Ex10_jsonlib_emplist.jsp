<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
			  //CORS policy: No 'Access-Control-Allow-Origin'
			  //서버가 나는 모든 요청을 허락하겠다는 뜻 
			  	response.addHeader("Access-Control-Allow-Origin", "*");
			Class.forName("oracle.jdbc.OracleDriver");  //jdk1.6 이상 자동 로딩 ...참조
			Connection conn = null; //Connection 인터페이스 ...
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.8:1521:xe","bituser","1004");
		   
		    //명령(CRUD)
		    Statement  stmt = conn.createStatement(); //명령 객체 얻어오기
		    
		    //명령
		    String sql = "select empno, ename, sal, job, comm from emp";
		    
		    //실행
		    ResultSet rs = stmt.executeQuery(sql); //DB서버에서 실행되고 결과를 생성
		    
		    //POINT
		    //DTO객체에 데이터를 담아야 변환할 수 있따
		    //데이터 여러 건을 ArrayList에 add하면 된다
		    List<Emp> list = new ArrayList<>();
		    
		    while(rs.next()){
		    	Emp emp = new Emp();
		    	
		    	emp.setEmpno(rs.getInt("empno"));
		    	emp.setEname(rs.getString("ename"));
		    	emp.setSal(rs.getInt("sal"));
		    	emp.setJob(rs.getString("job"));
		    	emp.setComm(rs.getInt("comm"));
		    	
		    	list.add(emp);		    	
		    }
		    
		    /* 이걸 JSON 객체로 바꿔 볼것!
		    for(Emp e : list){
		    	System.out.println(e.toString());
		    }
		    */
		    
		    // 즉 객체 배열이다
		    // 그런데 그럼 select하기 너무 힘들다 JSONArray 활용
		    // 이건 json 데이터가 한 건일 때
		    JSONArray jsonlist = JSONArray.fromObject(list);
		    // 이렇게 하면 Arraylist였던 list가 json 데이터가 된다
		    // 데이터의 순서는 보장할 수 없지만 겨우 할 줄로 바로 변환이 가능하다!
		    
		    stmt.close();
		    rs.close();
		    conn.close();
		    
		    %>
		    
		    <%=jsonlist%>
