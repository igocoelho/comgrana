<%@ page import="br.com.igocoelho.comgrana.Movimentacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Movimentacao</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Movimentacao List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Movimentacao</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${movimentacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${movimentacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categoria">Categoria:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:movimentacaoInstance,field:'categoria','errors')}">
                                    <g:select name="categoria.id" from="${br.com.igocoelho.comgrana.Categoria.list()}" optionKey="id" value="${movimentacaoInstance?.categoria?.id}"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data">Data:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:movimentacaoInstance,field:'data','errors')}">
                                    <g:datePicker name="data" precision="day" value="${movimentacaoInstance?.data}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario">Usuario:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:movimentacaoInstance,field:'usuario','errors')}">
                                    <g:select name="usuario.id" from="${br.com.igocoelho.comgrana.Usuario.list()}" optionKey="id" value="${movimentacaoInstance?.usuario?.id}"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor">Valor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:movimentacaoInstance,field:'valor','errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: movimentacaoInstance, field: 'valor')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
