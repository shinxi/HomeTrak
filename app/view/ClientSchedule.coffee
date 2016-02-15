Ext.define 'HomeTrak.view.ClientSchedule',
  extend: 'Ext.panel.Panel'
  xtype: 'clientSchedule'
  layout:
    type: 'vbox'
    align: 'stretch'
  initComponent: ->
    @dockedItems = [
      dock: 'top'
      xtype: 'toolbar'
      items: [
        text: 'Today'
        pressed: true
        enableToggle: true
        handler: ->
          if not this.pressed
            this.toggle()
            return
          myClients = this.next().next()
          myClients.toggle()
          return
      , '-'
      , 
        text: 'My clients'
        enableToggle: true
        handler: ->
          if not this.pressed
            this.toggle()
            return
          td = this.prev().prev()
          td.toggle()
          return
      , '-'
      ]
    ]

    Ext.create 'Ext.data.Store',
      storeId: 'reservationStore'
      fields: [
        'name'
        'phone'
        'time'
      ]
      data: 'items': [
        {
          'name': 'John Eriggs'
          'phone': '1854643144'
          'time': '10:00'
          'id': '509006'
        }
        {
          'name': 'Angela Hriggs'
          'phone': '1504643144'
          'time': '13:00'
          'id': '839006'
        }
        {
          'name': 'Mike Jriggs'
          'phone': '1524643144'
          'time': '15:00'
          'id': '509006'
        }
        {
          'name': 'Lida Eriggs'
          'phone': '1404643144'
          'time': '16:00'
          'id': '949006'
        }
      ]
      proxy:
        type: 'memory'
        reader:
          type: 'json'
          root: 'items'

    Ext.create 'Ext.data.Store',
      storeId: 'historyStore'
      fields: [
        'date'
        'status'
        'time'
      ]
      data: 'items': [
        {
          'status': 'Edit'
          'date': '1/1/2016'
          'time': '10:00'
        }
        {
          'status': 'DELETED'
          'date': '1/2/2016'
          'time': '13:00'
        }
        {
          'status': 'UNDELETED'
          'date': '2/2/2016'
          'time': '15:00'
        }
        {
          'status': 'Edit'
          'date': '1/5/2016'
          'time': '16:00'
        }
      ]
      proxy:
        type: 'memory'
        reader:
          type: 'json'
          root: 'items'

    summaryInfo = Ext.create 'Ext.container.Container', 
      id: 'clientSchedule-summaryInfo'
      hidden: true
      flex: 1
      layout: 
        type: 'vbox'
        align: 'stretch'
      items: [
        {
          xtype: 'panel'
          title: 'Client'
          layout: 'column'
          defaults: 
            labelWidth: 70
            labelAlign: 'right'
          items: [
            {
              columnWidth: 0.45
              fieldLabel: 'Client ID'
              id: 'client-id'
              xtype: 'displayfield'
              value: '509006'
            }
            {
              columnWidth: 0.5
              fieldLabel: 'Phone'
              id: 'client-phone'
              xtype: 'displayfield'
              value: '1854643144'
            }
            {
              columnWidth: 0.45
              fieldLabel: 'First Name'
              id: 'client-first-name'
              xtype: 'displayfield'
              value: 'John'
            }
            {
              columnWidth: 0.5
              fieldLabel: 'Last Name'
              id: 'client-last-name'
              xtype: 'displayfield'
              value: 'Eriggs'
            }
          ]
        }
        {
          xtype: 'panel'
          title: 'Dr.'
          layout: 'column'
          defaults: 
            labelWidth: 70
            labelAlign: 'right'
          items: [
            {
              columnWidth: 0.8
              fieldLabel: 'Dr. Name'
              xtype: 'displayfield'
              value: 'Dr. Barnard'
            }
            {
              columnWidth: 0.8
              fieldLabel: 'Dr. ID'
              xtype: 'displayfield'
              value: '2224'
            }
            {
              columnWidth: 0.8
              fieldLabel: 'Phone'
              xtype: 'displayfield'
              value: '11122222211'
            }
          ]
        }
        {
          xtype: 'gridpanel'
          title: 'History'
          flex: 1
          store: Ext.data.StoreManager.lookup('historyStore')
          columns: [
            {
              text: 'Date'
              dataIndex: 'date'
              width: 75
            }
            {
              text: 'Time'
              dataIndex: 'time'
              width: 75
            }
            {
              text: 'Status'
              dataIndex: 'status'
              flex: 1
            }
          ]
        }
      ]
    @items = [
      xtype: 'gridpanel'
      title: 'Reservations'
      height: 250
      store: Ext.data.StoreManager.lookup('reservationStore')
      columns: [
        {
          text: 'Name'
          dataIndex: 'name'
          width: 100
        }
        {
          text: 'Phone'
          dataIndex: 'phone'
          width: 100
        }
        {
          text: 'Time'
          dataIndex: 'time'
          flex: 1
        }
      ]
      ,
        summaryInfo
    ]

    @callParent arguments
    return