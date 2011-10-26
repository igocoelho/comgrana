        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Usuários</g:link></span>
        </div>
        <div class="body">
            <g:if test="${usuarioInstance.id}">
            <h1>Atualizar Usuário</h1>
            </g:if>      
            <g:else>
            <h1>Novo Usuário</h1>
            </g:else>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="save" method="post" >

                <g:if test="${usuarioInstance.id}">
                    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'email','errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome">Nome:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'nome','errors')}">
                                    <g:textField name="nome" value="${usuarioInstance?.nome}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="senha">Senha:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'senha','errors')}">
                                    <g:passwordField name="senha" value="${usuarioInstance?.senha}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo">Tipo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'tipo','errors')}">
                                    <g:select name="tipo" from="${br.com.igocoelho.comgrana.TipoUsuario?.values()}" optionKey="key" value="${usuarioInstance?.tipo}"  />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button">
                    <g:if test="${usuarioInstance.id}">
                    <g:actionSubmit action="update" value="Salvar" />
                    </g:if>
                    <g:else>
                    <g:actionSubmit action="save" value="Salvar" />
                    </g:else>
                    </span>
                </div>
            </g:form>
        </div>
