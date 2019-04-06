<%-- 
    Document   : staff
    Created on : Nov 4, 2018, 8:09:57 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff</title>
    </head>
    <body>
        <s:set var="role" value="#session.ROLE"/>
        <s:if test="#role.equals('STAFF')">
            <h1>Staff</h1>
            <font color="green">Welcome <s:property value="#session.USERID" /></font><br/>
            <a href="logout">Logout</a>
            <s:form action="staffSearchAction" method="get">
                <s:textfield name="searchValue" label="Search"/>
                <s:submit value="Search"/>
            </s:form>
            <a href="addNewMobilePage">Add new mobile</a>
            <s:if test="searchValue.length() > 0">
                <s:if test="!mobileList.isEmpty()">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Name</th>
                                <th>Year</th>
                                <th>Quantity</th>
                                <th>Not sale</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="mobileList" status="counter">
                                <tr>
                                    <s:form action="updateMobile" theme="simple">
                                        <td><s:property value="#counter.count"/></td>
                                        <td>
                                            <s:hidden name="mobileId"/>
                                            <s:property value="mobileId"/>
                                        </td>
                                        <td><s:textfield name="description" pattern="^.{5,250}$" required="required" title="Length of description is 5-250"/></td>
                                        <td><s:textfield name="price" pattern="^([0-9]*[.])?[0-9]+$" title="Price must be a float" required="required"/></td>
                                        <td><s:property value="mobileName"/></td>
                                        <td><s:property value="yearOfProduction"/></td>
                                        <td><s:textfield name="quantity" pattern="^\d+$" title="Quantity is a integer" required="required"/></td>
                                        <td><s:checkbox name="notSale"/></td>
                                        <td>
                                            <s:hidden name="lastSearchValue" value="%{searchValue}"/>
                                            <s:submit value="Update"/>
                                        </td>
                                        <td>
                                            <s:url id="delLink" action="deleteMobile">
                                                <s:param name="mobileId" value="mobileId"/>
                                                <s:param name="lastSearchValue" value="searchValue"/>
                                            </s:url>
                                            <s:a href="%{delLink}">Delete</s:a>
                                            </td>

                                    </s:form>
                                </tr>
                            </s:iterator>

                        </tbody>
                    </table>

                </s:if>
                <s:if test="mobileList.isEmpty()">
                    <p style="color: red">No mobile is matched</p>
                </s:if>
            </s:if>

        </s:if>

        <s:if test='#role.equals("CUSTOMER")'>
            <s:property value="role" />
            <b>You don't have permission to access that page</b>
            <a href="customerSearchPage">Home</a>
            <a href="logout">Logout</a>
        </s:if>
        <s:if test="#role == null">
            <s:property value="role" />
            <b>You must log in to access that page</b>
            <a href="try">Login</a>
        </s:if>

    </body>
</html>
