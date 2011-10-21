package br.com.igocoelho.comgrana



import javax.persistence.*;
// import com.google.appengine.api.datastore.Key;

@Entity
class Usuario implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id

    static constraints = {
    	id visible:false
	}
}
