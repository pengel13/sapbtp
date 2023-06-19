using pn from '../db/schema';

service pnservice {
    @odata.draft.enabled: true
    entity Produto as projection on pn.Produto{
        key codigoProduto, 
        fk_codigoCategoria, 
        ean : Integer,
        nomeProduto
    };
    entity Categoria as projection on pn.Categoria;    

    define view ItemsTransacaoWithPrecoUnitario as select from pn.Items_Transacao
    inner join Produto on Items_Transacao.Produto.codigoProduto = Produto.codigoProduto{
        key sequencia as ID, 
        Quantidade as qtd,
        ValorTotal, 
        Produto as IDProduto, 
        nomeProduto as nomeProduto,
        Transacao as IDTransacao,
        ValorTotal/Quantidade as PrecoUnitario : Decimal
    };

    entity Transacao as projection on pn.Transacao;
    entity Filiais as projection on pn.Filial;
}


