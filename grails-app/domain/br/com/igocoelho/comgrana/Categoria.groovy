package br.com.igocoelho.comgrana

import javax.persistence.*;
import com.google.appengine.api.datastore.Key;

@Entity
class Categoria implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Key id

    @Basic
    String nome

    @Basic
    String codigo

    @Enumerated(EnumType.STRING)
    TipoCategoria tipo

    @Basic
    Long usuarioId

    static constraints = {
    	id visible:false
	}

    static mapping = {
        version false
    }

    String toString(){
        nome
    }
}
