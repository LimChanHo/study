<%@ include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.common.DBConn" %>
<%@ page import="com.test.dto.UserInfo" %>
<link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/>
<body>
<jsp:include page="/common/top.jsp" flush="false">
	<jsp:param name="login" value="<%=login%>"></jsp:param>
</jsp:include>
    <div class="container">
      <form class="form-signin"  action="<%=rootPath%>/user/login_ok.jsp">
        <h2 class="form-signin-heading">

        Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password"  name="pwd" id="pwd" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
</body>
</html>