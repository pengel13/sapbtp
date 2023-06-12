namespace pedroproject;

using {cuid} from '@sap/cds/common';

entity produto{
    @Common.Label: 'UUID'
    key ID : UUID;
    Nome : String;
    Grupo_de_Mercadorias: Integer;
    Categoria : Integer;
}


 
 