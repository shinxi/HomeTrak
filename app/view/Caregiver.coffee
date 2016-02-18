Ext.define 'HomeTrak.view.Caregiver',
  extend: 'Ext.panel.Panel'
  xtype: 'caregiver'
  layout: 'fit'
  initComponent: ->
    searchTreeStore = Ext.create('Ext.data.TreeStore', root:
      expanded: true
      children: [
        {
          text: 'A'
          leaf: false
          children: [
            {
              text: 'Albright, Mary(Z)'
              leaf: true
            }
            {
              text: 'Albright, Atty(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'B'
          leaf: false
          children: [
            {
              text: 'Bellaire, Marcy(A)'
              leaf: true
            }
            {
              text: 'Briggs, John(A)'
              leaf: true
            }
            {
              text: 'Broderick, Betty(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'C'
          leaf: false
          children: [
            {
              text: 'Clothier, Bert(A)'
              leaf: true
            }
            {
              text: 'Colhoun, Jessica(A)'
              leaf: true
            }
            {
              text: 'Colhoun, Jessica(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'D'
          leaf: true
        }
        {
          text: 'E'
          leaf: true
        }
        {
          text: 'F'
          leaf: true
        }
        {
          text: 'G'
          leaf: true
        }
        {
          text: 'H'
          leaf: true
        }
        {
          text: 'I'
          leaf: true
        }
      ])
    searchTree =
      xtype: 'treepanel'
      flex: 1
      store: searchTreeStore
      frame: false
      rowLines: true
      rootVisible: false

    l10n = HomeTrak.util.Localization

    @items = [
      xtype: 'panel'
      title: (l10n.get 'caregiver_name') + ': John'
      layout: 
        type: 'hbox'
        align: 'stretch'
      items: [
        {
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
          style: 
            backgroundColor: '#dfe8f6'
        }
        {
          region: 'center'
          flex: 1
          xtype: 'client'
        }
      ]
    ]
    @callParent arguments
    return