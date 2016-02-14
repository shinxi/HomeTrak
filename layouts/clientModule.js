function getClientModule() {
    var otherInfo_toolbar = Ext.create('Ext.toolbar.Toolbar', {
        dock: 'bottom',
        defaults: {
            height: 50
        },
        items: [
            {
                // xtype: 'button', // default for Toolbars
                text: 'Required',
                pressed: true,
                width: 200
            },
            '-',
            {
                text : 'Bill Options',
                width: 200
            },'-',
            {
                text : 'Directions',
                width: 200
            },'-',
            {
                text : 'Notes',
                width: 200
            },'-',
            {
                text : 'Referral',
                width: 200
            },'-',
            {
                text : 'General',
                width: 200
            },'-',
            {
                text : 'History',
                width: 200
            }
        ]
    });
    var requiredInformation = {
        xtype: 'tabpanel',
        title: "Required Information",
        items: [ {
            xtype: 'form',
            title: 'Important Information',
            defaults: {
                margin: '2px 1px 2px 1px',
                labelAlign: 'right',
                labelWidth: 150,
                height: 26
            },
            items: [
                {
                    fieldLabel: 'Holiday Coverage',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Group',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Ordered Discipline',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Providers Gender',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Priority Code',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Manager',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Field Supervisor',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Diet',
                    xtype: 'textfield'
                }
            ]
        }, {
            xtype: 'form',
            title: 'Emergency Contact Information',
            defaults: {
                margin: '2px 1px 2px 1px',
                labelAlign: 'right',
                labelWidth: 150,
                height: 26
            },
            items: [
                {
                    fieldLabel: 'Holiday Coverage',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Group',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Ordered Discipline',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Providers Gender',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Priority Code',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Manager',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Field Supervisor',
                    xtype: 'textfield'
                },
                {
                    fieldLabel: 'Diet',
                    xtype: 'textfield'
                }
            ]
        }]
    };
    var clientModule_toolbar = Ext.create('Ext.toolbar.Toolbar', {
        defaults: {
            height: 60,    
        },        
        region: 'south',
        items: [
            {
                // xtype: 'button', // default for Toolbars
                text: 'Client Information',
                pressed: true,
                width: 200
            },
            '-',
            {
                text : 'Bill Rates',
                width: 200
            },'-',
            {
                text : 'Current Auths',
                width: 200
            },'-',
            {
                text : 'Document Events',
                width: 200
            },'-',
            {
                text : 'Caregivers not to Visit',
                width: 200
            },'-',
            {
                text : 'Extra Phone',
                width: 200
            },'-',
            {
                text : 'Plan of Care',
                width: 200
            }
        ]
    });
    var searchTreeStore = Ext.create('Ext.data.TreeStore', {
        root: {
            expanded: true,
            children: [
                { text: "A", leaf: false, children: [
                    { text: "Albright, Mary(Z)", leaf: true },
                    { text: "Albright, Atty(A)", leaf: true}
                ] },
                { text: "B", leaf: false, children: [
                    { text: "Bellaire, Marcy(A)", leaf: true },
                    { text: "Briggs, John(A)", leaf: true},
                    { text: "Broderick, Betty(A)", leaf: true}
                ] },
                { text: "C", leaf: false, children: [
                    { text: "Clothier, Bert(A)", leaf: true },
                    { text: "Colhoun, Jessica(A)", leaf: true},
                    { text: "Colhoun, Jessica(A)", leaf: true}
                ] },
                { text: "D", leaf: true},
                { text: "E", leaf: true},
                { text: "F", leaf: true},
                { text: "G", leaf: true},
                { text: "H", leaf: true},
                { text: "I", leaf: true}
            ]
        }
    });
    var searchTree = Ext.create('Ext.tree.Panel', {
        flex: 1,
        store: searchTreeStore,
        frame: false,
        rowLines: true,
        rootVisible: false
    });

    var clientModule = Ext.create('Ext.panel.Panel', {
        layout: 'border',
        items: [
            {
                xtype: 'panel',
                region: 'west',
                layout: {
                    xtype: 'vbox',
                    align: 'stretch'
                },
                width: 200,
                items: [{
                    xtype: 'form',
                    items: [{
                        xtype: 'label',
                        text: 'Quick Find'
                    }, {
                        xtype: 'textfield'
                    }]
                },
                {
                    xtype: 'form',
                    items: [
                    {
                        xtype: 'label',
                        text: 'Limit Client by:'
                    },
                    {
                        xtype: 'textfield'
                    },
                    {
                        xtype: 'textfield'
                    },
                    {
                        xtype: 'textfield'
                    }]
                },
                searchTree
                ]
            },
            {
                region: 'center',
                layout: {
                    xtype: 'vbox',
                    align: 'stretch'
                },
                items: [
                    {
                        xtype: 'form',
                        layout: 'column',
                        title: 'Client Summary',
                        defaults: {
                            columnWidth: 1/9,
                            margin: '2px 1px 2px 1px',
                            labelAlign: 'right',
                            height: 26
                        },
                        items: [
                            {
                                columnWidth: 3/9,
                                fieldLabel: 'Client ID',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 1/9,
                                fieldLabel: 'Status',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 5/9,
                                xtype: 'component',
                                html: '&nbsp;'
                            },

                            {
                                columnWidth: 4/9,
                                fieldLabel: 'First Name',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 2/9,
                                fieldLabel: 'Phone',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 3/9,
                                fieldLabel: 'District',
                                xtype: 'textfield'
                            },

                            {
                                columnWidth: 4/9,
                                fieldLabel: 'Last Name',
                                xtype: 'textfield'
                            },
                            {
                                xtype: 'component',
                                columnWidth: 2/9
                            },
                            {
                                columnWidth: 3/9,
                                fieldLabel: 'Language',
                                xtype: 'textfield'
                            },

                            {
                                columnWidth: 3/9,
                                fieldLabel: 'Address',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 1/9,
                                fieldLabel: 'APT',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 2/9,
                                fieldLabel: 'S.S.N',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 3/9,
                                fieldLabel: 'Gender',
                                xtype: 'textfield'
                            },

                            {
                                columnWidth: 3/9,
                                fieldLabel: 'Address2',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 1/9,
                                fieldLabel: 'State',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 2/9,
                                fieldLabel: 'Birthday',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 3/9,
                                xtype: 'component'
                            },

                            {
                                columnWidth: 3/9,
                                fieldLabel: 'City',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 1/9,
                                fieldLabel: 'Zip',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 2/9,
                                fieldLabel: 'Email',
                                xtype: 'textfield'
                            },
                            {
                                columnWidth: 3/9,
                                xtype: 'component'
                            },
                        ]
                    },
                    requiredInformation,
                    otherInfo_toolbar
                ]
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
            },
            clientModule_toolbar
        ]
    })
    return clientModule;

}