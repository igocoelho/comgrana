package br.com.igocoelho.comgrana

public enum TipoCategoria {
    ENTRADA('Entrada'),
    SAIDA('Saída')

    final String value

    TipoCategoria(String value) {
        this.value = value
    }

    String toString() {
        value
    }

    String getKey() {
        name()
    }
}
