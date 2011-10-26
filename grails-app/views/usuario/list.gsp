<%@ page import="br.com.igocoelho.comgrana.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Usuario List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Usuario</g:link></span>
        </div>
        <div class="body">
            <h1>Usuario List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="ID" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                   	        <g:sortableColumn property="nome" title="Nome" />
                        
                   	        <g:sortableColumn property="tipo" title="Tipo" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean:usuarioInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:usuarioInstance, field:'email')}</td>
                        
                            <td>${fieldValue(bean:usuarioInstance, field:'nome')}</td>
                        
                            <td>${fieldValue(bean:usuarioInstance, field:'tipo')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
