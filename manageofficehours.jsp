<%-- 
    Document   : manageofficehours
    Created on : Jan 15, 2021, 5:00:56 PM
    Author     : Taha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <title>Staff System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
            .select-container{
                margin: 50px 0 0 0;
                text-align: center;
            }
            .selectbox{
                border: 2px solid #d9d9d9;
                border-radius: 50px;
                height: 3rem;
                line-height: 3rem;
                width: 50%;
                font-family: Poppins-Regular;
                font-size: 18px;
                margin: 0 0 20px 0;
                padding-left: 20px;
                background-color: transparent;
            }
            .selectdatebox{
                height: 3rem;
                line-height: 3rem;
                font-family: Poppins-Regular;
                font-size: 18px;
                background-color: transparent;
                display: inline;
                margin-right: 20px;
            }
        </style>
    </head>
    </head>
    <body>
    <%
         Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/staffsystem";
                    String user = "root";
                    String database_password = "0000";
                    Connection Con = null;
                    Con = DriverManager.getConnection(url, user, database_password);
                    int staff_id = Integer.valueOf(session.getAttribute("session_ID").toString());
                    String q = "select * from staff inner join officehour on staff.staffid = officehour.staffid where staff.staffid = " + staff_id; 
                    Statement Stmt = Con.createStatement();
                    ResultSet rs = Stmt.executeQuery(q);
                   
                %>   
    <div class="search-container" style="margin: 0 350px; text-align: center;">        
            <table class="tablecss">
                <tr>
                    <th>Name</th> 
                    <th>Day</th>
                    <th>Start</th> 
                    <th>End</th> 
                    <th>State</th> 
                    <th>Location</th> 
                </tr>
                <%
                        while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("Type")+" "+rs.getString("StaffFirstname")+" "+rs.getString("StaffLastname")%></td>
                    <td><%=rs.getString("Day")%></td>
                    <td><%=rs.getString("Start")%></td>
                    <td><%=rs.getString("End")%></td>
                    <td><%=rs.getString("State")%></td>
                    <td><%=rs.getString("Location")%></td>
                    <td>
                        <form action="manageofficehours" >

                            <%
                                out.print("<input type='hidden' name='officehourID' value=");
                                out.print("<input type='hidden' name='officehourID' value=");
                                out.print("<input type='hidden' name='officehourID' value=");

                                out.print("<input class='option-btn' type='submit' value='Add'>");

                            %>
                        </form>
                    </td>
                    <td>
                        <form action="manageofficehours" >

                            <%
                                out.print("<input type='hidden' name='officehourID' value=2>");
                                out.print("<input class='option-btn' type='submit' value='Delete'>");

                            %>
                        </form>
                    </td>
                    <td>
                        <form action="manageofficehours" >

                            <%
                                out.print("<input type='hidden' name='officehourID' value=3>");
                                out.print("<input class='option-btn' type='submit' value='Update'>");

                            %>
                        </form>
                    </td>

                </tr>
                <%}%>
            </table>
        </div>  
    </body>
    
   
</html>
