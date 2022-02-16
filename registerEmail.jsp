<%@ page contentType="text/html; charset=UTF-8" import="java.net.URLDecoder" import="java.net.URLEncoder"%>
<%
String mail = (String)session.getAttribute("email");  //暗黙オブジェクトsessionのgetAttributeでリクエストした値（今回はthmlのnameで名付けた値）を取得する

if (mail == null) {
   mail = "";         //変数mailがnullだったら空白処理
	} else { 
		request.setCharacterEncoding("UTF-8");  //ここがうまくいっていない？
		String setmail = URLEncoder.encode(request.getParameter("email"), "UTF-8");
		session.setAttribute("email", setmail);
		session.setMaxInactiveInterval(180);
		mail = URLDecoder.decode(mail); 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerEmail</title> 
</head>
<body>

<form method="POST" action=<%= response.encodeURL("registerEmail.jsp") %>></form>  <%-- formで内容を上書きする(post) actionで処理方法の指定 --%>
Eメール:<input type="text" name="email" value="<%= mail %>">
<input type="submit" value="登録" >
</form><br>
<a href=<%session.invalidate();%>>ログアウト</a> <%-- セッションを全廃棄 --%>
</body>
</html>