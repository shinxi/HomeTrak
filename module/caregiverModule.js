function getCaregiverModule() {
    var caregiverModule = Ext.create('Ext.panel.Panel', {
        layout: 'border',
        items: [
            {
                xtype: 'panel',
                region: 'west',
                width: 200
            },
            {
                xtype: 'panel',
                region: 'center'
            },
            {
                xtype: 'toolbar',
                height: 100,
                region: 'south'
            },
            {
                xtype: 'toolbar',
                region: 'north',
                items: [
                '-',
                {
                    xtype: 'button',
                    text: 'Go back',
                    handler: function() {
                        var vp = this.up("viewport");
                        vp.layout.setActiveItem(vp.items.items[0]);
                    }
                }, '-'
                ]
            }
        ]
    })
    return caregiverModule;
}