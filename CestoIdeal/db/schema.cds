namespace CI;

entity Categoria{
    key codigoCategoria : Integer;
    DescricaoCategoria : String
}

entity Filial{
    key codigoFilial : Integer;
    nomeFilial: String;
    CNPJ: Integer;
}

entity Transacao{
    key codigoTransacao : Integer;
    key fk_codigo_filial : Association to Filial{codigoFilial};
    dataTransacao: String;
    semana: String;
}

entity Items_Transacao{
    key sequencia : Integer ;
    Transacao : Association to Transacao{codigoTransacao, fk_codigo_filial};
    Produto : Association to Produto{codigoProduto};
    ValorTotal : Decimal;
    Quantidade : Integer;
    fk_semana : Association to Transacao { semana};
}

entity Produto{
    key codigoProduto : Integer;
    nomeProduto : String;
    fk_codigoCategoria : Association to Categoria {codigoCategoria};
    ean : String(13);
}

entity OrdenacaoVendas{
    key fk_codigoProduto : Association to Produto{codigoProduto};
    fk_codigoFilial : Association to Filial{codigoFilial};
    vendas          : Integer;
}

entity Associacao{
    key codAssc : Integer; // Adicionado
    fk_codigoProduto: Association to Produto{codigoProduto};
    fk_codigoProdutoAssc: Association to Produto{codigoProduto};
    fk_codigofilial: Association to Filial{codigoFilial};
    suporte : Decimal(1,5);
    confianca : Decimal(1,5);
    lift : Decimal(1,5);
    leverage : Decimal(1,5);
    conviccao : Decimal(8,5);
    semana : Association to Transacao{semana}; 
}

entity Correlacao{
    key codCorr : Integer; // Adicionado
    fk_codigooProduto : Association to Produto{codigoProduto};
    fk_codigoProdutoCorr : Association to Produto{codigoProduto};
    fk_codigoFilial : Association to Filial{codigoFilial};
    valor : Decimal(8,5);
    coeficiente : Decimal(1,5);
    pValor: Decimal(1,5);
    semana : Association to Transacao{semana};
}

entity Predicao{
    key fk_codigoProduto: Association to Produto{codigoProduto};
    fk_codigoFilial: Association to Filial{codigoFilial};
    data : String;
    tempo : Integer;
    tipo : Integer;
    quantidade: Integer;
    valorTotal: Integer;
    dt_geracao: String;
}