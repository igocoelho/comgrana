package br.com.igocoelho.comgrana

class UsuarioController {
    
    def index = { redirect(action: list, params: params) }

    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count() ]
    }

    def delete = {
		Usuario.withTransaction {
	        def usuarioInstance = Usuario.get(params.id)
	        if(usuarioInstance) {
	            try {
	                flash.message = "Usuário ${usuarioInstance.nome} deletado."
	                usuarioInstance.delete(flush: true)
	                redirect(action: list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Usuário não pode ser deletado."
	                redirect(action: list)
	            }
	        }
	        else {
	            flash.message = "Usuário não localizado."
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def usuarioInstance = Usuario.get(params.id)

        if(!usuarioInstance) {
            flash.message = "Usuário não localizado."
            redirect(action:list)
        }
 
        [usuarioInstance: usuarioInstance]
     }

    def update = {
		Usuario.withTransaction {
	        def usuarioInstance = Usuario.get(params.id)
	        if(usuarioInstance) {
	            usuarioInstance.properties = params
	            if(!usuarioInstance.hasErrors() && usuarioInstance.save()) {
	                flash.message = "Usuário atualizado com sucesso."
	                redirect(action: list)
	            }
	            else {
	                render(view: 'edit', model: [usuarioInstance:usuarioInstance])
	            }
	        }
	        else {
	            flash.message = "Usuário não localizado."
	            redirect(action: list)
	        }			
		}
    }

    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        [usuarioInstance: usuarioInstance]
    }

    def save = {
        def usuarioInstance = new Usuario(params)
		Usuario.withTransaction {
	        if(usuarioInstance.save(flush:true)) {
	            flash.message = "Usuário criado com sucesso."
	            redirect(action: create)
	        }
	        else {
	            render(view: 'create', model: [usuarioInstance: usuarioInstance])
	        }
		}
    }
}
