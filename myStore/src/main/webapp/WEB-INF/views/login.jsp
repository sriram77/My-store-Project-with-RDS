<%--
  Created by IntelliJ IDEA.
  User: SRIRAM
  Date: 9/12/2016
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <div id="login-box">
            <h2>Login with Username and Password</h2>
            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>


            <form name="loginForm" action="<c:url value='/j_spring_security_check' />" method="post">
                <c:if test="${not empty error}">
                    <div class="error" style="color:#ff0000;">${error}</div>
                </c:if>
                <div class="form-control">
                    <label for="username">User :   </label>
                    <input type="text" id="username" name="username"  value=''/>
                </div>
                <div class="form-control">
                    <label for="password">Password :</label>
                    <input type="password" id="password" name="password" value=''/>
                </div>
                <input type="submit" value="Submit" class="btn btn-default">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp"%>
