<%-- 
    Document   : viewCart
    Created on : Nov 10, 2018, 10:16:52 AM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>

        <s:set name="role" value="#session.ROLE"/>
        <s:if test="#role.equals('CUSTOMER')">
            <h1>Cart</h1>
            <s:if test="lastMinPrice != null && lastMaxPrice != null">
                <s:url action="customerSearchAction" id="backToShopping">
                    <s:param name="minPrice" value="lastMinPrice"/>
                    <s:param name="maxPrice" value="lastMaxPrice"/>
                </s:url>
                <s:a href="%{backToShopping}">Back to shopping</s:a>
            </s:if>
            <s:else>
                <s:a href="customerSearchPage">Back to shopping</s:a>
            </s:else>

            <s:if test="!list.isEmpty()">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Description</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:set name="cart" value="#session.CART"/>
                        <s:set name="total" value="%{0}"/>
                        <s:form action="removeFromCart" theme="simple">
                            <s:iterator value="list" status="counter">
                                <tr>
                                    <td><s:property value="#counter.count"/></td>
                                    <td><s:property value="description"/></td>
                                    <td><s:property value="mobileName"/></td>
                                    <td><s:property value="price"/></td>
                                    <s:set name="quantity" value="#cart.getQuantityOfItem(mobileId)"/>
                                    <td><s:property value="#quantity"/></td>
                                    <td><s:property value="%{#quantity*price}"/></td>
                                    <s:set name="total" value="%{#total + #quantity*price}"/>
                                    <td>
                                        <input type="checkbox" name="mobileIds" value="${mobileId}">
                                    </td>
                                </tr>
                            </s:iterator>

                            <tr>
                                <td colspan="5">Total</td>
                                <td><s:property value="#total"/></td>
                                <s:hidden name="lastMinPrice"/>
                                <s:hidden name="lastMaxPrice"/>
                                <td><s:submit value="Remove"/></td>
                            </tr>
                        </s:form>
                    </tbody>
                </table>
                <a href="checkOut">Checkout</a>
            </s:if>
            <s:else>
                <p style="color: red">Your cart is empty</p>
            </s:else>
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
