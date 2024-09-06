<%@ page import="com.chinmaya.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Members</title>
    <%@ include file="allCss.jsp"%>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #e0ffff;
            background-size: 100% 100%;
        }
        
    </style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    
    <%
		String msg = request.getParameter("msg");
		if ("deleted".equals(msg)) {
	%>
	<script>
		alert("Deleted Successfully..");
		window.location.assign("viewMember.jsp");
	</script>
	<%
		}
	%>
	
    <div class="container mt-5">
        <h4 class="text-center" style="color: #1e90ff;">View Members</h4>
        <br>
        <table class="table table-bordered" id="example">
            <thead class="bg-light">
                <tr>
                    <th style="width: 5%;">S.No</th>
					<th style="width: 10%;">Name</th>
					<th style="width: 10%;">Contact Number</th>
					<th style="width: 10%;">Email ID</th>
					<th style="width: 10%;">Gender</th>
					<th style="width: 15%;">Plan</th>
					<th style="width: 10%;">Joining Date</th>
					<th style="width: 20%;">Initial Amount (Rs.)</th>
					<th style="width: 10%;">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from member");
                        int i = 0;
                        while (rs.next()) {
                            i++;
                %>
                            <tr>
                                <td><%=i%></td>
				                <td><%=rs.getString("name")%></td>
				                <td><%=rs.getString("mobileNumber")%></td>
				                <td><%=rs.getString("email")%></td>
				                <td><%=rs.getString("gender")%></td>
				                <td><%=rs.getString("mplan")%></td>
				                <td><%=rs.getString("joindate")%></td>
				                <td><%=rs.getString("initamount")%></td>
                                <td>
                                    <a href="editMember.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a>
                                    <form action="DeleteMemberServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </tbody>
        </table>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
