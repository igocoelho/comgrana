<%@ page import="br.com.igocoelho.comgrana.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Categoria List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Categoria</g:link></span>
        </div>
        <div class="body">
            <h1>Categoria List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="codigo" title="Codigo" />
                        
                   	        <g:sortableColumn property="nome" title="Nome" />
                        
                   	        <g:sortableColumn property="tipo" title="Tipo" />
                        
                   	        <th>Usuario</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean:categoriaInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:categoriaInstance, field:'codigo')}</td>
                        
                            <td>${fieldValue(bean:categoriaInstance, field:'nome')}</td>
                        
                            <td>${fieldValue(bean:categoriaInstance, field:'tipo')}</td>
                        
                            <td>${fieldValue(bean:categoriaInstance, field:'usuarioId')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${categoriaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
