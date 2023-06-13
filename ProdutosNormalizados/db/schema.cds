namespace pn;

entity Categoria{
    key codigoCategoria : Integer;
    Categoria : String
}

entity Filial{
    key codigoFilial : Integer;
    nomeFilial : String;
    CNPJ : Integer;
}

entity Items_Transacao{
    @Common.Label : 'UUID'
    key sequencia : UUID;
    fk_codigoTransacao : Association to Transacao;
    fk_codigoProduto : Association to Produto;
    quantidade : Integer;
    valorTotal : Decimal;
}

entity Transacao{
    key codigoTransacao : Integer;
    key fk_codigoFilial : Association to Filial;
    dataTransacao: String;
}

entity Produto{
    key codigoProduto : Integer;
    fk_codigoCategoria : Integer;
    nomeProduto : String;
    ean : String(13);
}
