Ext.Loader.setConfig({enabled: true});

Ext.Loader.setPath('Ext.ux', 'ext/ux');

Ext.require([
    'Ext.tip.QuickTipManager',
    'Ext.container.Viewport',
    'Ext.layout.*',
    'Ext.form.Panel',
    'Ext.form.Label',
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.tree.*',
    'Ext.selection.*',
    'Ext.tab.Panel',
    'Ext.ux.layout.Center'  
]);

Ext.onReady(function(){
 
    Ext.tip.QuickTipManager.init();

    var viewport = Ext.create('Ext.Viewport', {
        layout: 'card',
        items: [
            getHomeModule(), getClientModule(), getCaregiverModule()
        ],
        renderTo: Ext.getBody()
    });
});
