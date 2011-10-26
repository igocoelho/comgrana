<%@ page import="br.com.igocoelho.comgrana.Movimentacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Movimentacao</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Movimentacao List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Movimentacao</g:link></span>
        </div>
        <div class="body">
            <h1>Show Movimentacao</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:movimentacaoInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Categoria:</td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${movimentacaoInstance?.categoria?.id}">${movimentacaoInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Data:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:movimentacaoInstance, field:'data')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Usuario:</td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${movimentacaoInstance?.usuario?.id}">${movimentacaoInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Valor:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:movimentacaoInstance, field:'valor')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${movimentacaoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
