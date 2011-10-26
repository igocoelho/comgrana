<%@ page import="br.com.igocoelho.comgrana.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Usuario</title>         
    </head>
    <body>
        <g:render template="form" bean="${[usuarioInstance: usuarioInstance]}"/>
    </body>
</html>
