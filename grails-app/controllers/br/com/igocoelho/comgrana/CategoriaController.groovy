package br.com.igocoelho.comgrana

class CategoriaController {
    
    def index = { redirect(action: list, params: params) }

    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ categoriaInstanceList: Categoria.list( params ), categoriaInstanceTotal: Categoria.count() ]
    }

    def delete = {
		Categoria.withTransaction {
	        def categoriaInstance = Categoria.get( params.id )
	        if(categoriaInstance) {
	            try {
	                categoriaInstance.delete(flush:true)
	                flash.message = "Categoria deletada com sucesso."
	                redirect(action:list)
	            }
	            catch(org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "Categoria não pode ser deletada."
	                redirect(action:list)
	            }
	        }
	        else {
	            flash.message = "Categoria não localizada."
	            redirect(action:list)
	        }			
		}
    }

    def edit = {
        def categoriaInstance = Categoria.get( params.id )

        if(!categoriaInstance) {
            flash.message = "Categoria não localizada."
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
	            categoriaInstance.properties = params
	            if(!categoriaInstance.hasErrors() && categoriaInstance.save()) {
	                flash.message = "Categoria atualizada com sucesso."
	                redirect(action:list)
	            }
	            else {
	                render(view:'edit',model:[categoriaInstance:categoriaInstance])
	            }
	        }
	        else {
	            flash.message = "Categoria não localizada."
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
	            flash.message = "Categoria criada com sucesso."
	            redirect(action:create)
	        }
	        else {
	            render(view:'create',model:[categoriaInstance:categoriaInstance])
	        }
		}
    }
}
