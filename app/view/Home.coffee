Ext.define 'HomeTrak.view.Home',
  extend: 'Ext.panel.Panel'
  xtype: 'home'
  layout: 'border'
  initComponent: ->
    contentPanel_toolbar =
      xtype: 'toolbar'
      dock: 'bottom'
      defaults:
        width: 200
        height: 50
      items: [
        { text: 'Company Information' }
        {
          xtype: 'tbseparator'
          width: 0
        }
        { text: 'Payer Information' }
        {
          xtype: 'tbseparator'
          width: 0
        }
        { text: 'User Security' }
        {
          xtype: 'tbseparator'
          width: 0
        }
        { text: 'User Defaults' }
        {
          xtype: 'tbseparator'
          width: 0
        }
        '->'
        { text: 'Customer Support' }
      ]
    # This is the main content center region that will contain each example layout panel.
    # It will be implemented as a CardLayout since it will contain multiple panels with
    # only one being visible at any given time.
    contentPanel =
      id: 'content-panel'
      region: 'center'
      layout: 'card'
      margins: '2 5 5 0'
      activeItem: 0
      border: false
      dockedItems: [ contentPanel_toolbar ]
      items: [ {
        layout: 'absolute'
        items: [
          {
            x: 100
            y: 50
            xtype: 'button'
            text: 'Client Module'
            height: 100
            width: 100
            handler: ->
              vp = @up('viewport')
              vp.layout.setActiveItem vp.items.items[1]
              return

          }
          {
            x: 100
            y: 200
            xtype: 'button'
            text: 'Caregiver'
            height: 100
            width: 100
            handler: ->
              vp = @up('viewport')
              vp.layout.setActiveItem vp.items.items[2]
              return

          }
        ]
      } ]
    store = Ext.create('Ext.data.TreeStore',
      root: expanded: true
      proxy:
        type: 'ajax'
        url: 'data/daily-information.json')
    # Go ahead and create the TreePanel now so that we can use it below
    treePanel =
      xtype: 'treepanel'
      id: 'tree-panel'
      title: 'Daily Information'
      region: 'north'
      split: true
      height: 360
      minSize: 150
      rootVisible: false
      autoScroll: true
      store: store
    # This is the Details panel that contains the description for each example layout.
    detailsPanel =
      id: 'details-panel'
      title: 'External Programs'
      region: 'center'
      bodyStyle: 'padding-bottom:15px;background:#eee;'
      autoScroll: true
      html: 'From 485'
    @items = [
        {
          xtype: 'component'
          id: 'header'
          region: 'north'
          html: '<h1 style="background-color:#d3e1f1;background-image:-webkit-linear-gradient(top,#dfe9f5,#d3e1f1);color:red;text-align:center">Live System</h1>'
          height: 30
        }
        {
          layout: 'border'
          id: 'layout-browser'
          region: 'west'
          border: false
          split: true
          margins: '2 0 5 5'
          width: 290
          minSize: 100
          maxSize: 500
          items: [
            treePanel
            detailsPanel
          ]
        }
        contentPanel
      ]
    @callParent arguments
    return
