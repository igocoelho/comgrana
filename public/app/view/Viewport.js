Ext.define('Comgrana.view.Viewport', {
    extend: 'Ext.container.Viewport',
    layout: 'border',
 
    requires: [
        'Comgrana.view.transactions.Grid'
    ],

    items: [{
        region: 'north',
        html: '<h1 class="x-panel-header">Page Title</h1>',
        border: false,
        margins: '0 0 5 0'
    }, {
        region: 'west',
        title: 'Navigation',
        width: 150,
        split: true
    }, {
        region: 'center',
        xtype: 'tabpanel',
        activeTab: 0,
        items: {
            xtype: 'transactionsGrid',
            store: 'Transactions'
        }
    }]
});