<%-- 
    Document   : addNewMobile
    Created on : Nov 5, 2018, 9:11:53 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Mobile</title>
        <s:head/>
    </head>
    <body>
        <h1>Add New Mobile</h1>
        <a href="staffSearchPage">Search Page</a>
        <s:form action="addNewMobile">
            <s:if test="exception.getMessage().contains('duplicate')">
                <p style="color: red">MobileId has been used</p>
            </s:if>
            <s:textfield name="mobileId" label="Mobile Id"/>
            <s:textfield name="description" label="Description"/>
            <s:textfield name="price" label="Price"/>
            <s:textfield name="mobileName" label="Mobile Name"/>
            <s:textfield name="yearOfProduction" label="Year"/>
            <s:textfield name="quantity" label="Quantity"/>
            <s:checkbox name="notSale" label="notSale"/>
            <s:submit value="Submit"/>
            <s:reset value="Reset"/>
        </s:form>
    </body>
</html>
