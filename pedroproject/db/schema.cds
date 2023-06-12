namespace pedroproject;

using {cuid} from '@sap/cds/common';

entity filial{
    @Common.Label : 'UUID'
    codigo_filial : UUID;
    nomeFilial : String;
    cnpj : Integer
}

entity transacao{
    @Common.Label : 'UUID'
    codigo_transacao : String;
    fk_codigo_filial : Association to filial;
    data_transacao : String;
}

entity items_transacao{
    @Common.Label : 'UUID'
    sequencia : Integer;
    quantidade : Integer;
    valor_total : Decimal;
    fk_codigo_filial : Association to filial;
    fk_codigo_transacao : Association to transacao;
    fk_codigo_produto : Association to produto;
}

entity produto{
    @Common.Label : 'UUID'
    codigo_produto : String;
    nome_produto : String;
    ean : String;
    fk_codigo_categoria : Association to categoria;
}

entity categoria{
    @Common.Label : 'UUID'
    codigo_categoria : String;
    descricao_categoria: String;
}


 
 