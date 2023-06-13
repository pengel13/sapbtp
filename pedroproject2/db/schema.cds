namespace CI;

using {temporal} from '@sap/cds/common';

entity Filial{
    @Common.Label : 'UUID'
    key ID : Integer;
    nomeFilial : String;
    cnpj : Integer
}

entity Transacao{
    @Common.Label : 'UUID'
    key ID : String;
    key fk_filial : Association to Filial;
    data_transacao : String;
    
}

entity Items_transacao{
    @Common.Label : 'UUID'
    key sequencia : UUID;
    quantidade : Integer;
    valor_total : Decimal;
    fk_transacao : Association to Transacao;
    fk_produto : Association to Produto;
}

entity Produto{
    @Common.Label : 'UUID'
    key ID : String;
    nome_produto : String;
    ean : String;
    fk_codigo_categoria : Association to Categoria;
}

entity Categoria{
    @Common.Label : 'UUID'
    key ID : String;
    descricao_categoria: String;
}


 
 