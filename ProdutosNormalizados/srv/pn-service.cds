using pn from '../db/schema';

service pnservice {
    @odata.draft.enabled: true
    entity Produto         as projection on pn.Produto {
        key codigoProduto,
            fk_codigoCategoria,
            ean : Integer,
            nomeProduto,
    };

    entity Categoria as projection on pn.Categoria ;

    entity Items_Transacao as projection on pn.Items_Transacao;

    define view ItemsTransacaoQuantidadeGrande as
        select from Items_Transacao {
            key sequencia                  as ID,
                Produto                    as codigoProduto,
                Transacao                  as codigoTransacao,
                Quantidade                 as qtd,
                ValorTotal,
                Produto.nomeProduto        as NomeProduto,
                Produto.fk_codigoCategoria as CategoriaProduto,
                ValorTotal / Quantidade    as PrecoUnitario : Decimal
        }
        where
            Quantidade > 100;

    define view verProdutosCaros as
        select from pn.Items_Transacao {
            key sequencia                  as ID,
                Produto.nomeProduto        as nomeProduto,
                Produto.fk_codigoCategoria as CategoriaProduto,
                ValorTotal,
                Quantidade,
                ValorTotal / Quantidade    as PrecoUnitario : Decimal
        }
        where
            $projection.PrecoUnitario > 100;

    entity Transacao       as projection on pn.Transacao ;
    @readonly
    entity Filiais         as projection on pn.Filial;

    view verProdutoscomCategoria as select from Produto;

}
