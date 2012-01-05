class AcessoFilters {

    def filters = {
        loginCheck(controller: 'site', invert: true) {
            before = {
                if (!session.usuario) 
                    if (!actionName.equals('login') && !actionName.equals('logon') && !actionName.equals('logoff')) {
                        redirect(controller:'acesso', action: 'login')
                        return false
                    }
            }
        }
    }
}
