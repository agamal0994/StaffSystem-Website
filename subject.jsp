<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
    <body>
        <div id="nav-placeholder"></div>
        <script>
            $(function () {
                $("#nav-placeholder").load("nav.html");
            });

        </script>
        <%
            String lol = "";
            //String StudentID = session.getAttribute("session_ID").toString();
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/staffsystem";
            String user = "root";
            String database_password = "0000";
            Connection Con = null;
            Con = DriverManager.getConnection(url, user, database_password);
            
            Statement Stmt = Con.createStatement();
            Statement Stmt2 = Con.createStatement();
            ResultSet rs = Stmt.executeQuery("SELECT DISTINCT SubjectName FROM subject");
            //ResultSet rs2 = Stmt2.executeQuery("SELECT AppointmentID, AppointmentDateStart, AppointmentDateEnd, MemberID FROM appointment where StudentID ='" + StudentID + "'");
        %>
        <div class="select-container">
                            <form action="subject.jsp">
                                 <select class="selectbox"  name="types" id="types">
                                    <% while (rs.next()) {
                                    lol = rs.getString("SubjectName");
                            %>
                            <option><%=lol%></option> 
                           
                           
                            <%}%>
                            
                        </select>
                                <button type="submit">search</button>
                            </form>             
        </div>
           <%
                 String value=request.getParameter("types");   
                ResultSet rs2 = Stmt2.executeQuery("SELECT StaffFirstname,StaffLastname,StaffContact,StaffEmail,Type FROM staff INNER JOIN subject ON subject.StaffID = staff.StaffID where subject.SubjectName ='"+value+"';");
                %>
            <div class="search-container" style="margin: 0 350px; text-align: center;">        
            <table class="tablecss">

                <tr>
                    <th>Name</th> 
                    <th>Contact</th> 
                    <th>E-mail</th> 
                </tr>
                <%
                        while (rs2.next()) {%>
                <tr>
                    <td><%=rs2.getString(5)+" "+rs2.getString(1)+" "+rs2.getString(2)%></td>
                    <td><%=rs2.getString(3)%></td>
                    <td><%=rs2.getString(4)%></td>
                </tr>
                <%}%>
            </table>
        </div>  
        
    </body>
</html>