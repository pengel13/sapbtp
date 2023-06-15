using pn from '../db/schema';

service pnservice {
    @odata.draft.enabled: true
    entity Categoria as projection on pn.Categoria;
    entity Produto as projection on pn.Produto;
    entity ItemsTransacao as projection on pn.Items_Transacao {
        key sequencia,
        Quantidade,
        ValorTotal,
        Transacao,
        Produto
    };
    entity Transacao as projection on pn.Transacao;
    entity Filiais as projection on pn.Filial;
}

