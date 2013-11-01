Ext.define('Comgrana.store.Category', {
    extend: 'Ext.data.Store',
 
    model: 'Comgrana.model.Category',
    autoLoad: true,
 
    proxy: {
        type: 'rest',
 
        api: {
            read: 'app/categories'
        },
 
        reader: {
            type: 'json',
            root: 'data',
            successProperty: 'success',
            totalProperty: 'total'
        },
 
        writer: {
            type: 'json',
            root: 'data',
        },
 
        listeners: {
            exception: function(proxy, response, operation) {
                var message = Ext.JSON.decode(response.responseText).message;
                Ext.Msg.alert('Ocorreu um erro', message);
            }
        }
    },
});