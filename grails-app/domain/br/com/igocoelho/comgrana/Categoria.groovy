package br.com.igocoelho.comgrana

import javax.persistence.*;
// import com.google.appengine.api.datastore.Key;

@Entity
class Categoria implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id

    @Basic
    String nome

    @Basic
    String codigo

    @Enumerated(EnumType.STRING)
    TipoCategoria tipo

    static constraints = {
    	id visible:false
	}
}
