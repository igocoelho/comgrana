

package br.com.igocoelho.comgrana

class MovimentacaoController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ movimentacaoInstanceList: Movimentacao.list( params ), movimentacaoInstanceTotal: Movimentacao.count() ]
    }

    def show = {
        def movimentacaoInstance = Movimentacao.get( params.id )

        if(!movimentacaoInstance) {
            flash.message = "Movimentacao not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ movimentacaoInstance : movimentacaoInstance ] }
    }

    def delete = {
		Movimentacao.withTransaction {
	        def movimentacaoInstance = Movimentacao.get( params.id )
	        if(movimentacaoInstance) {
	            try {
	                movimentacaoInstance.delete(flush:true)
	                flash.message = "Movimentacao ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Movimentacao ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Movimentacao not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def movimentacaoInstance = Movimentacao.get( params.id )

        if(!movimentacaoInstance) {
            flash.message = "Movimentacao not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ movimentacaoInstance : movimentacaoInstance ]
        }
    }

    def update = {
		Movimentacao.withTransaction {
	        def movimentacaoInstance = Movimentacao.get( params.id )
	        if(movimentacaoInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(movimentacaoInstance.version > version) {
	                    
	                    movimentacaoInstance.errors.rejectValue("version", "movimentacao.optimistic.locking.failure", "Another user has updated this Movimentacao while you were editing.")
	                    render(view:'edit',model:[movimentacaoInstance:movimentacaoInstance])
	                    return
	                }
	            }
	            movimentacaoInstance.properties = params
	            if(!movimentacaoInstance.hasErrors() && movimentacaoInstance.save()) {
	                flash.message = "Movimentacao ${params.id} updated"
	                redirect(action:show,id:movimentacaoInstance.id)
	            }
	            else {
	                render(view:'edit',model:[movimentacaoInstance:movimentacaoInstance])
	            }
	        }
	        else {
	            flash.message = "Movimentacao not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def movimentacaoInstance = new Movimentacao()
        movimentacaoInstance.properties = params
        return ['movimentacaoInstance':movimentacaoInstance]
    }

    def save = {
        def movimentacaoInstance = new Movimentacao(params)
		Movimentacao.withTransaction {
	        if(movimentacaoInstance.save(flush:true)) {
	            flash.message = "Movimentacao ${movimentacaoInstance.id} created"
	            redirect(action:show,id:movimentacaoInstance.id)
	        }
	        else {
	            render(view:'create',model:[movimentacaoInstance:movimentacaoInstance])
	        }
		}
    }
}
