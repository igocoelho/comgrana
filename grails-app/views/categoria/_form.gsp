        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Categoria List</g:link></span>
        </div>
        <div class="body">
            <g:if test="${categoriaInstance.id}">
            <h1>Atualizar Categoria</h1>
            </g:if>      
            <g:else>
            <h1>Nova Categoria</h1>
            </g:else>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${categoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoriaInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="save" method="post" >
                <g:if test="${categoriaInstance.id}">
                    <g:hiddenField name="id" value="${categoriaInstance?.id}" />
                </g:if>

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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario">Usuario:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoriaInstance,field:'usuarioId','errors')}">
                                    <g:select name="usuarioId" from="${br.com.igocoelho.comgrana.Usuario.list()}" optionKey="id" value="${categoriaInstance?.usuarioId}"  />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button">
                    <g:if test="${categoriaInstance.id}">
                    <g:actionSubmit action="update" value="Salvar" />
                    </g:if>
                    <g:else>
                    <g:actionSubmit action="save" value="Salvar" />
                    </g:else>
                    </span>
                </div>
            </g:form>
        </div>
