using pn as pn from '../db/schema';

service pnservice{
    @odata.draft.enabled: true
    entity categroia as projection on pn.Categoria;
}