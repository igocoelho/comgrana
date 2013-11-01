Ext.Loader.setConfig({enabled:true});

Ext.application({
    name: 'Comgrana',
	appFolder: 'app',
    controllers: [
        'Transaction'
    ],

    autoCreateViewport: true
});