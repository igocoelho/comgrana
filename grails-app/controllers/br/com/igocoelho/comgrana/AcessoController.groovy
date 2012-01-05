package br.com.igocoelho.comgrana

import br.com.igocoelho.comgrana.Usuario

class AcessoController {

    def login = { }

    def logon = { 
        System.out.println('Passou no logon!')
        session['usuario'] = new Usuario();
        redirect(controller:'site', action: 'index')
    }

    def logoff = { }
}
