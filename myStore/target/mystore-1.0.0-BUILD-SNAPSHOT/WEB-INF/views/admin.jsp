<%--
  Created by IntelliJ IDEA.
  User: SRIRAM
  Date: 9/7/2016
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/WEB-INF/views/template/header.jsp"%>
<div class="container-wrapper">

    <div class="container">
        <div class="page-header">
            <div><h1>Adminstrator Page</h1></div>

            <p class="lead">This is the administrator page.</p>
        </div>

    <h3><a href="<c:url value="/admin/productInventory"/>">Product Inventory</a> </h3>
        <p>Here you can view, check and modify the product</p>

        <%@include file="/WEB-INF/views/template/footer.jsp"%>
