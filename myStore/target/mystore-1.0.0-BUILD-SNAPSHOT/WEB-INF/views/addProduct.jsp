<%--
  Created by IntelliJ IDEA.
  User: SRIRAM
  Date: 9/7/2016
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<div class="container-wrapper">
<div class="container">
    <div class="page-header">
        <div><h1>Add Product </h1></div>

        <p class="lead">Here you can add the product</p>
    </div>

    <form:form action="${pageContext.request.contextPath}/admin/productInventory/addProduct"
               method="post" commandName="product" enctype="multipart/form-data">
    <div class="form-group">
        <label for="name">Name</label><form:errors path="productName" cssStyle="color: #ff0000"/>
        <form:input path="productName" id="name" class="form-control" />
    </div>

    <div class="form-group">
        <label for="category">Category</label>
        <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="Instrument"/>Instrument </label>
        <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="Record"/>Record </label>
        <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="Accessory"/>Accessory </label>
    </div>

    <div class="form-group">
        <label for="description">Description</label>
        <form:textarea path="productDescription" id="description" class="form-control" />
    </div>
    <div class="form-group">
        <label for="price">Price</label><form:errors path="productPrice" cssStyle="color: #ff0000"/>
        <form:input path="productPrice" id="price" class="form-control" />
    </div>

    <div class="form-group">
        <label for="condition">Condition</label>
        <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="New"/>New </label>
        <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="Used"/>Used </label>
    </div>

    <div class="form-group">
        <label for="status">Status</label>
        <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="Active"/>Active </label>
        <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="Inactive"/>Inactive </label>
    </div>

    <div class="form-group">
        <label for="unitinstock">Unit In Stock</label><form:errors path="unitInStock" cssStyle="color: #ff0000"/>
        <form:input path="unitInStock" id="unitinstock" class="form-control" />
    </div>

    <div class="form-group">
        <label for="manufacturer">Manufacturer</label>
        <form:input path="productManufacturer" id="manufacturer" class="form-control" />
    </div>
    <div class="form-group">
        <label class="control-label" for="productImage">Upload Image</label>
        <form:input id="productImage" path="productImage" type="file" class="form:input-large"/>

    </div>

    <br><br>

    <input type="submit" value="Submit" class="btn btn-default">
    <a href="<c:url value="/admin/productInventory"/> " class="btn-default btn">Cancel</a>
    </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp"%>
