Ext.define('Comgrana.model.Transaction', {
    extend: 'Ext.data.Model',
    fields: [
    	{ name: '_id', type: 'string' },
        { name: 'description', type: 'string' },
        { name: 'date', type: 'date', format: 'Y/m/d' },
        { name: 'value', type: 'float' },
        { name: 'type', type: 'string' }
	]
});