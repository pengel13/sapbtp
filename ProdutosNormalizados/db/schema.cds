namespace pn;

entity Categoria{
    key codigoCategoria : Integer;
    DescricaoCategoria : String
}

entity Filial{
    key Filial : Integer;
    nomeFilial : String;
    CNPJ : Integer;
}

entity Items_Transacao{
    key sequencia : Integer ;
    Transacao : Association to Transacao;
    Produto : Association to Produto;
    ValorTotal : Decimal;
    Quantidade : Integer;
}

entity Transacao{
    key codigoTransacao : Integer;
    key fk_codigo : Association to Filial;
    dataTransacao: String;
}

entity Produto{
    key codigoProduto : Integer;
    nomeProduto : String;
    fk_codigoCategoria : Integer;
    ean : String(13);
}
