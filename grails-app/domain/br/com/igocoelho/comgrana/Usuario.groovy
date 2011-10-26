package br.com.igocoelho.comgrana

import javax.persistence.*;
import com.google.appengine.api.datastore.Key;

@Entity
class Usuario implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Key id

    @Basic
    String nome

    @Basic
    String email

    @Basic
    String senha

    @Enumerated(EnumType.STRING)
    TipoUsuario tipo

    static constraints = {
    	id visible: false
	}

    static mapping = {
        version false
    }

    String toString(){
        nome
    }
}
