<%-- 
    Document   : customer
    Created on : Nov 4, 2018, 8:09:48 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
        <s:head/>
    </head>
    <body>
        <s:set name="role" value="#session.ROLE"/>
        <s:if test="#role.equals('CUSTOMER')">
            <h1>Customer</h1>
            <font color="green">Welcome <s:property value="#session.USERID" /></font><br/>
            <a href="logout">Logout</a>
            <s:form action="customerSearchAction" method="get">
                <s:textfield name="minPrice" label="Min Price"/>
                <s:textfield name="maxPrice" label="Max Price"/>
                <s:submit value="Search"/>
            </s:form>
            <s:url action="viewCart" id="viewCartLink">
                <s:param name="lastMinPrice" value="minPrice"/>
                <s:param name="lastMaxPrice" value="maxPrice"/>
            </s:url>
            <s:a href="%{viewCartLink}">View Cart</s:a>
            <s:if test="!mobileList.isEmpty()">
                <s:set name="soldOutList" value="#session.SOLD_OUT"/>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Name</th>
                            <th>Year</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="mobileList" status="counter">
                            <tr>
                                <td><s:property value="#counter.count" /></td>
                                <td><s:property value="description" /></td>
                                <td><s:property value="price" /></td>
                                <td><s:property value="mobileName" /></td>
                                <td><s:property value="yearOfProduction" /></td>
                                <td>
                                    <s:if test="notSale == true">
                                        <p style="color: red">Not sale</p>
                                    </s:if>
                                    <s:elseif test="quantity == 0 || #soldOutList.contains(mobileId)">
                                        <p style="color: green">Sold out</p>
                                    </s:elseif>
                                    <s:else>
                                        <s:url action="addToCart" id="addLink">
                                            <s:param name="mobileId" value="%{mobileId}"/>
                                            <s:param name="lastMinPrice" value="%{minPrice}"/>
                                            <s:param name="lastMaxPrice" value="%{maxPrice}"/>
                                        </s:url>
                                        <s:a href="%{addLink}">Add to cart</s:a>
                                    </s:else>

                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </s:if>
            <s:if test="mobileList.isEmpty()">
                <p style="color: red">No mobile is matched</p>
            </s:if>
        </s:if>
        <s:if test="#role.equals('STAFF')">
            <p style="color: red">Back to your job.</p>
            <a href="staffSearchPage">Home</a>
        </s:if>
        <s:if test="#role == null">
            <p style="color: red">You must log in to access this page</p>
            <a href="try">Login</a>
        </s:if>
    </body>
</html>
