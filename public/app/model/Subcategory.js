Ext.define('Comgrana.model.Subcategory', {
    extend: 'Ext.data.Model',
    fields: [
    	{ name: '_id', type: 'string' },
        { name: 'name', type: 'string' },
        { name: 'category_id', type: 'string' }
	]
});