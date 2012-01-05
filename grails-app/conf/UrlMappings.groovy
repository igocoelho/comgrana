class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(controller:"site", action:"index")
      "/login"(controller:"acesso", action:"login")
      "/logon"(controller:"acesso", action:"logon")
      "/logoff"(controller:"acesso", action:"logoff")
	  "500"(view:'/error')
	}
}
