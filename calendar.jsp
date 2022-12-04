<!-- 컴퓨터학과 20210816 채민서 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
<style type="text/css">
h4{text-align: right;}
table {
border-collapse : collapse; 
width: 600px; 
height: 300px;
}
td {
	border: solid 1px black;
	text-align : center;
}
th{
	border: none;
	height: 20px;
}
</style>
</head>
<body>
<div align = center>
<table>
	<%
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int date = today.get(Calendar.DATE);
		
		String sYear = request.getParameter("YEAR");
		if (sYear != null)
			year = Integer.parseInt(sYear);
		
		String sMonth = request.getParameter("MONTH");
		if (sMonth != null)
			month = Integer.parseInt(sMonth);
		if (month > 12)
			month = month - 1;

		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, 1);
		int day = cal.get(Calendar.DAY_OF_WEEK);
		int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		out.print("<a href=\'calendar.jsp?YEAR="+(year-1));
		out.println("&MONTH=" + month + "\'>" + " ◀ </a>" );
		out.println(year + "년");
		out.print("<a href=\'calendar.jsp?YEAR="+(year+1));
		out.println("&MONTH=" + month + "\'>" + " ▶ </a>" );
		
		out.print("<a href=\'calendar.jsp?YEAR="+year);
		out.println("&MONTH=" + (month-1) + "\'>" + " ◀ </a>" );
		out.println(month + "월");
		out.print("<a href=\'calendar.jsp?YEAR="+ year);
		out.println("&MONTH=" + (month+1) + "\'>" + " ▶ </a>" );

		out.print("<h4>" + year + "- " + month + "- " + date + "</h4>");
	
		String[] s = {"월", "화", "수", "목", "금"};
		int i, j;
		
		out.print("<tr>");
		out.print("<td><font color='red'> 일 </font></td>");
		for(i = 0; i < 5; i++){
			out.print("<td>" + s[i] + "</td>");
		}
		out.print("<td><font color = 'blue'> 토 </font></td>");
		out.print("</tr>");
		
		for (i = 1; i <= end;){
				out.print("<tr>");
			for (j = 0; j < 7; j++, i++){
			
			if (i == 1)
				for (; j < day - 1; j++) { out.print("<td>&nbsp;</td>"); }
			
			if (i > end)
				out.print("<td>&nbsp;</td>");
			else if (j == 0)
				out.print("<td><font color = red>" + i + "</font></td>");
			else if (j == 6)
				out.print("<td><font color = blue>" + i + "</font></td>");
			else
				out.print("<td>" + i + "</td>");
		
			}	
			out.print("</tr>"); 
		}
	%>
</table>
</div>
</body>
</html>