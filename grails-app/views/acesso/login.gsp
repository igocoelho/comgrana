<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Comgrana - Organize suas finanças</title>
    <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
  </head>

  <body>

    <div class="topbar">
      <div class="fill">
        <div class="container">

          <a class="brand" href="#">Comgrana</a>

          <ul class="nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>

          <g:form controller="acesso" action="logon" class="pull-right" method="post" >
            <input class="input-small" type="text" placeholder="Usuário">
            <input class="input-small" type="password" placeholder="Senha">
            <button class="btn" type="submit">Acessar</button>
          </g:form>

        </div>
      </div>
    </div>

  </body>
</html>
