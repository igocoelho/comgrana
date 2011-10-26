<%@ page import="br.com.igocoelho.comgrana.Movimentacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Movimentacao List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Movimentacao</g:link></span>
        </div>
        <div class="body">
            <h1>Movimentacao List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Categoria</th>
                   	    
                   	        <g:sortableColumn property="data" title="Data" />
                        
                   	        <th>Usuario</th>
                   	    
                   	        <g:sortableColumn property="valor" title="Valor" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${movimentacaoInstanceList}" status="i" var="movimentacaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${movimentacaoInstance.id}">${fieldValue(bean:movimentacaoInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:movimentacaoInstance, field:'categoria')}</td>
                        
                            <td>${fieldValue(bean:movimentacaoInstance, field:'data')}</td>
                        
                            <td>${fieldValue(bean:movimentacaoInstance, field:'usuario')}</td>
                        
                            <td>${fieldValue(bean:movimentacaoInstance, field:'valor')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${movimentacaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
