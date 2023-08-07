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
    fk_codigoCategoria : Association to Categoria;
    ean : String(13);
}

entity OrdenacaoVendas{
    key fk_codigoProduto: Association to Produto;
    fk_codigoFilial : Association to Filial;
    vendas: Integer;
}

// define view verProdutoscomCategoria as select from Produto
//  inner join Categoria on Categoria.codigoCategoria =fk_codigoCategoria{
//     Produto.codigoProduto,
//     Produto.nomeProduto,
//     Produto.fk_codigoCategoria,
//     Categoria.DescricaoCategoria,
//     Categoria.codigoCategoria
//     };
