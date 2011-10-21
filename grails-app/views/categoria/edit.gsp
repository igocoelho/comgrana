<%@ page import="br.com.igocoelho.comgrana.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Categoria</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Categoria List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Categoria</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Categoria</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${categoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoriaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${categoriaInstance?.id}" />
                <input type="hidden" name="version" value="${categoriaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo">Codigo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoriaInstance,field:'codigo','errors')}">
                                    <g:textField name="codigo" value="${categoriaInstance?.codigo}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoriaInstance,field:'nome','errors')}">
                                    <g:textField name="nome" value="${categoriaInstance?.nome}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo">Tipo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoriaInstance,field:'tipo','errors')}">
                                    <g:select name="tipo" from="${br.com.igocoelho.comgrana.TipoCategoria?.values()}" optionKey="key" value="${categoriaInstance?.tipo}"  />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
