<%@ page import="br.com.igocoelho.comgrana.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Categoria</title>         
    </head>
    <body>
        <g:render template="form" bean="${[categoriaInstance: categoriaInstance]}"/>
    </body>
</html>
