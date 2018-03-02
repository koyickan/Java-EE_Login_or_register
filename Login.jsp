
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.*"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.StringTokenizer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>

<%

File newfile = new File("C:/Users/jomin/Desktop/Semester 4/Java EE/newfile.txt");

String Uname = request.getParameter("uname");
String Pass = request.getParameter("pass");

boolean found=false;

try {
	Scanner scanner = new Scanner(newfile);
	
	int lineNum=0;
	for(;scanner.hasNextLine();)
	{
	
		String line = scanner.nextLine();
		
		StringTokenizer st = new StringTokenizer(line,",");
		String t_uname = st.nextToken();
		String t_pass = st.nextToken();
		
		
		lineNum++;
		//out.println("Uname : "+Uname +"   t_uname : "+t_uname+"<br>");
		if(Uname.equals(t_uname)&& t_pass.equals(Pass))
			
		{
			//out.println("Uname : "+Uname +"   t_uname : "+t_uname+"<br>");
			//out.println("Welcome Registered User!!");
			found=true;
			break;
			
			
		}
		/*else
		{
			//out.println("Uname : "+Uname +"   t_uname : "+t_uname+"<br>");
			out.println("You need to be Registered !!");
			//break;
			
		}*/

	}
	scanner.close();
	
	//out.println("No data Found");

	
}catch (FileNotFoundException e) {}
//out.println("You need to be Registered !!");

if(found)
	{
	out.println("Welcome Registered User!!");
	}
else{
	out.println("You need to be Registered or wrong password !!");
	}
%>
</body>
</html>