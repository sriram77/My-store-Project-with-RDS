<%--
  Created by IntelliJ IDEA.
  User: SRIRAM
  Date: 9/7/2016
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<div class="container-wrapper">

    <div class="container">
        <div class="page-header">
            <div><h1>Product Inventory Page</h1></div>

            <p class="lead">This is the product inventory page</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Photo Thumb</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Condition</th>
                <th>Price</th>
                <th></th>

            </tr>

            </thead>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><img src="<spring:url value="/resources/images/${product.productId}.png"/> "
                             style="width:100%" alt="image"/></td>
                    <td>${product.productName}</td>
                    <td>${product.productCategory}</td>
                    <td>${product.productCondition}</td>
                    <td>${product.productPrice} USD</td>
                    <td>
                        <a href="<spring:url value="/productList/viewProduct/${product.productId}"/>">
                        <span class="glyphicon glyphicon-info-sign"></span></a>
                    <a href="<spring:url value="/admin/productInventory/deleteProduct/${product.productId}"/>">
                        <span class="glyphicon glyphicon-remove"></span></a>
                        <a href="<spring:url value="/admin/productInventory/editProduct/${product.productId}"/>">
                            <span class="glyphicon glyphicon-pencil"></span></a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <a class="btn btn-primary" href="<spring:url value="/admin/productInventory/addProduct"/> ">Add Product</a>

        <%@include file="/WEB-INF/views/template/footer.jsp"%>
