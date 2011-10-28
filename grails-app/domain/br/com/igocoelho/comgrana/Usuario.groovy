package br.com.igocoelho.comgrana

import javax.persistence.*;

@Entity
class Usuario implements Serializable {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id

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
