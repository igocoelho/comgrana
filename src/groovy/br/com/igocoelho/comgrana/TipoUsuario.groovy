package br.com.igocoelho.comgrana

public enum TipoUsuario {
    ADM('Administrador'),
    BASICO('Básico'),
    PRO('Profissional')

    final String value

    TipoUsuario(String value) {
        this.value = value
    }

    String toString() {
        value
    }

    String getKey() {
        name()
    }
}
