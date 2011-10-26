package br.com.igocoelho.comgrana

import javax.persistence.*;
import java.util.Date;
import com.google.appengine.api.datastore.Key;

@Entity
class Movimentacao implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Key id

    @ManyToOne(fetch = FetchType.LAZY)
    Usuario usuario

    @ManyToOne(fetch = FetchType.LAZY)
    Categoria categoria

    @Basic
    Double valor

    @Temporal(TemporalType.DATE)
    Date data

    static constraints = {
    	id visible:false
	}

    static mapping = {
        version false
    }
}
