

package br.com.igocoelho.comgrana

class CategoriaController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ categoriaInstanceList: Categoria.list( params ), categoriaInstanceTotal: Categoria.count() ]
    }

    def show = {
        def categoriaInstance = Categoria.get( params.id )

        if(!categoriaInstance) {
            flash.message = "Categoria not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ categoriaInstance : categoriaInstance ] }
    }

    def delete = {
		Categoria.withTransaction {
	        def categoriaInstance = Categoria.get( params.id )
	        if(categoriaInstance) {
	            try {
	                categoriaInstance.delete(flush:true)
	                flash.message = "Categoria ${params.id} deleted"
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Categoria ${params.id} could not be deleted"
	                redirect(action:show,id:params.id)
	            }
	        }
	        else {
	            flash.message = "Categoria not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def categoriaInstance = Categoria.get( params.id )

        if(!categoriaInstance) {
            flash.message = "Categoria not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ categoriaInstance : categoriaInstance ]
        }
    }

    def update = {
		Categoria.withTransaction {
	        def categoriaInstance = Categoria.get( params.id )
	        if(categoriaInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(categoriaInstance.version > version) {
	                    
	                    categoriaInstance.errors.rejectValue("version", "categoria.optimistic.locking.failure", "Another user has updated this Categoria while you were editing.")
	                    render(view:'edit',model:[categoriaInstance:categoriaInstance])
	                    return
	                }
	            }
	            categoriaInstance.properties = params
	            if(!categoriaInstance.hasErrors() && categoriaInstance.save()) {
	                flash.message = "Categoria ${params.id} updated"
	                redirect(action:show,id:categoriaInstance.id)
	            }
	            else {
	                render(view:'edit',model:[categoriaInstance:categoriaInstance])
	            }
	        }
	        else {
	            flash.message = "Categoria not found with id ${params.id}"
	            redirect(action:list)
	        }			
		}
    }

    def create = {
        def categoriaInstance = new Categoria()
        categoriaInstance.properties = params
        return ['categoriaInstance':categoriaInstance]
    }

    def save = {
        def categoriaInstance = new Categoria(params)
		Categoria.withTransaction {
	        if(categoriaInstance.save(flush:true)) {
	            flash.message = "Categoria ${categoriaInstance.id} created"
	            redirect(action:show,id:categoriaInstance.id)
	        }
	        else {
	            render(view:'create',model:[categoriaInstance:categoriaInstance])
	        }
		}
    }
}
