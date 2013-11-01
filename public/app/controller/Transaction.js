Ext.define('Comgrana.controller.Transaction', {
    extend: 'Ext.app.Controller',
 
    models: ['Transaction'],
    stores: ['Transactions'],
    views : ['transactions.Grid'],
 
    init: function() {

    }
});