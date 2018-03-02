<%@page import="JavaEE.Employee" %>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.*"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
String fname= request.getParameter("Fname");
String lname= request.getParameter("Lname");
String eid= request.getParameter("EId");
String uname= request.getParameter("Uname");
String pass= request.getParameter("Pword");
String sal= request.getParameter("Sal");
String did= request.getParameter("DId");

Employee s1=new Employee();
s1.setFirstName(fname);
s1.setLastName(lname);
s1.setUsername(uname);
s1.setPassword(pass);
s1.setSalary(sal);
s1.setEmployeeID(eid);
s1.setDepartmentId(did);
s1.setUsername(uname);
s1.setPassword(pass);

File newfile = new File("C:/Users/jomin/Desktop/Semester 4/Java EE/newfile.txt");

boolean valid=true;

try {
	Scanner scanner = new Scanner(newfile);
	
	//int lineNum=0;
	while(scanner.hasNextLine())
	{
		String line = scanner.nextLine();
		//out.println(line);
		//out.println("<br>");
		
	
		StringTokenizer st = new StringTokenizer(line,",");
		//out.println("uname="+uname+"<br>");
		String t_uname = st.nextToken();
		//String t_pass = st.nextToken();
		//out.println("uname="+uname+" t_uname="+t_uname+"<br>");
		if(t_uname.equals(uname))
		{
			//out.println("uname="+uname+" t_uname="+t_uname+"<br>"); 
			out.println("Username already Exists!!");
			 valid=false;
			 break;
		}
	
		
	}
	scanner.close();
	//out.println("No data Found");
		
}
catch (FileNotFoundException e) {
	
}


if(valid)
{
				 String str = uname+(",")
						 +pass+(",")
		    			 +fname+(",")
		    			 +lname+(",")		    			 
		    			 +eid+(",")
		    			 +sal+(",")
		    			 +did+".....";
		    BufferedWriter writer = new BufferedWriter(new FileWriter(newfile, true));
		    //writer.append("\n");
		    //writer.newLine();
		    writer.append(str);
		    writer.newLine();
		    writer.close();
		    

out.println("Registration succesfully completed....!!");
			   
}
			
%>


</body>
</html>