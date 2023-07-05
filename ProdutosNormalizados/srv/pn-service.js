const cds = require('@sap/cds')
module.exports = cds.service.impl(function () {
    const {Produto} = this.entities()
    
    this.after('each', Produto, row =>{
        console.log(`Read Product: ${row.codigoProduto}`)
    })
    
    this.after(['CREATE', 'UPDATE', 'DELETE'], [Produto], async (Produto, req) => {
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting: Produto trocado ${Product.ID}`)
            this.emit('prod_Change', header)
        })
    this.on()
    })
})