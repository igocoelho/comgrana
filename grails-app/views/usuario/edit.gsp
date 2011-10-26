<%@ page import="br.com.igocoelho.comgrana.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Usuario</title>
    </head>
    <body>
        <g:render template="form" bean="${[usuarioInstance: usuarioInstance]}"/>
    </body>
</html>
