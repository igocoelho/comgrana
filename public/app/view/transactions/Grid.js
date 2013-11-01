Ext.define('Comgrana.view.transactions.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.transactionsGrid',
 
    title: 'Transactions',

    columns: [{
        text: 'Description',
        dataIndex: 'description'
    }, {
        text: 'Date',
        dataIndex: 'date'
    }, {
        text: 'Value',
        dataIndex: 'value'
    }],
 
    initComponent: function() {
        this.callParent(arguments);
    }
});