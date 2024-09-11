<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*, com.hit.beans.NoticeBean,com.hit.utility.DBUtil,com.hit.dao.NoticeDao,com.hit.dao.NoticeDaoImpl,javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="shortcut icon" type="image/png" href="banklogo.jpg">
    <!--link rel="shortcut icon" type="image/ico" href="images/hit_fevicon.ico"-->
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Of London</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/annimate.css">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="css/SpryTabbedPanels.css" type="text/css" rel="stylesheet">
    <!--link rel="stylesheet" href="css/styles.css"-->
    <link href="https://fonts.googleapis.com/css?family=Black+Ops+One" rel="stylesheet">
    <link href="css/bootstrap-dropdownhover.min.css">
    <link rel="stylesheet" href="css/style2.css">
    
  </head>
<body>


	<%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>


	<!-- Including the header of the page  -->
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="adminMenu.jsp"></jsp:include>
	
	<div class="clearfix hidden-sm hidden-xs" style="color:white;background-color: #0087BE; margin-top:-15px; margin-bottom: 12px">
	<marquee>Welcome to Bank Of London</marquee>
 </div> <!--A green color line between header and body part-->
 
     <div class="container-fluid">
     
     	<div class="notice">
        <div class="col-md-3"style="margin-left:2%">
     		<% Connection con = DBUtil.provideConnection(); %>
     		
     		<jsp:include page="notice.jsp"></jsp:include><br>
     		
          <!-- Next marquee starting-->
          <jsp:include page="approved.jsp"></jsp:include><br>
          
        </div>  <!-- End of col-md-3-->
      </div> <!-- End of notice class-->
      
      <!-- Next part of same container-fluid in which galary or other information will be shown-->
      
      <%-- <jsp:include page="login.jsp"></jsp:include> --%>
      
   <div class="col-md-8">
    <!-- <div class="marquee" style="border:2px black hidden; background-color:white">
        <h4 style="background-color:black; margin-top:-1.8px; margin-bottom:1px;padding: 5px; text-align: center;color:red;font-weight:bold">
        &nbsp; <span id="pagetitle">Tender Creation</span></h4>pagetitle id is given here
        <div  class="marquee-content" style="align:center; padding-top:5px;min-height:750px;background-color:cyan">
      --> 

     	<table style="border-radius:10px" >
			<tr >
				<td id="show" style="min-width:632px;min-height:0px;color:blue">Enter Notice Details Below</td>
			</tr>
		</table>
      <%
      	int noticeId = Integer.parseInt(request.getParameter("nid"));
      	NoticeDao dao = new NoticeDaoImpl();
      	NoticeBean notice = dao.getNoticeById(noticeId);
      %>      


	<form action="UpdateNoticeSrv" method="post">
		<table style="background-color:white">
			<th colspan="2">Update Notice No.<%=noticeId %><input type="hidden" name="nid" value="<%= noticeId%>"></th>
			<tr><td style="color:red"> Notice Title : </td><td><input type="text" name="title" required="required" value="<%= notice.getNoticeTitle()%>"></td></tr>
		   <tr><td style="color:red">	Descripton : </td><td> <textarea rows="4" cols="40" style="font-size:15px" name="info" required="required"><%= notice.getNoticeInfo() %></textarea></td></tr>
					
			<tr><td colspan="2" align="center" value="Launch"><input type="submit" style="background-color:#0087BE;color:white;" value="Update This Notice"></td></tr>
			
		</table>
	</form>
	
      <!-- </div>
     </div> -->
     </div>
      
      
    </div> <!-- End of container-fluid-->
	
	
	<!-- <div class="container" style="height:300px">
	ucomment this if you want to add some space in the lower part of page
	</div> -->



<!-- Now from here the footer section starts-->
                      
<!-- Including the footer of the page -->
    
<jsp:include page="footer.jsp"></jsp:include>

</body>
<style>
    input,textarea,select{
    	min-width:450px;
    	font-size:16px;
    	background-color:#f8f8f8;
    }
    input:hover,textarea:hover,select:hover{
    	min-width:450px;
    	background-color:white;
    }
	table, th, td { 
				margin-bottom:10px;
				margin-left:20%;
				font-size:20px;
                border: 2px solid black; 
                text-align:center; 
                background-color:white;
                color:#003399;
            } 
             td { 
                padding: 20px; 
                background-color:none; 
            } 
            th{
            	padding:20px;
            	background-color:#0087BE;
            	color:white;
            	font-weight:bold;
            }

</style>
</html>
