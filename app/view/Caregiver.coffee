Ext.define 'HomeTrak.view.Caregiver',
  extend: 'Ext.panel.Panel'
  xtype: 'caregiver'
  layout: 
    type: 'hbox'
    align: 'stretch'
  title: '张三'
  # TODO split more modular.
  initComponent: ->
    # maybe it is good to have a global
    l10n = HomeTrak.util.Localization
    @items = [
      {
        # why border ?
        layout: 'border',
        width: 500
        items: [{
            title: l10n.get 'clientSearch.client_search'
            region:'west'
            xtype: "clientSearch"
            margins: '2 0 0 2'
            width: 220
            collapsible: true
        },{
            region: 'center'
            xtype: 'clientSchedule'
            margins: '2 1 0 0'
        }]
      }
      {
        xtype: 'splitter'
        width: 3
        # style: 
        #   backgroundColor: '#dfe8f6'
      }
      {
        flex: 1
        xtype: 'client'
      }
    ]
    @callParent arguments
    return