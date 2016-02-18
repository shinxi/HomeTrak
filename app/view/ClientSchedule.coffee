Ext.define 'HomeTrak.view.ClientSchedule',
  extend: 'Ext.panel.Panel'
  xtype: 'clientSchedule'
  layout:
    type: 'vbox'
    align: 'stretch'
  initComponent: ->
    l10n = HomeTrak.util.Localization
    @dockedItems = [
      dock: 'top'
      xtype: 'toolbar'
      items: [
        text: l10n.get 'schedule.today'
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
        text: l10n.get 'schedule.my_clients'
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
          title: l10n.get 'client.name'
          layout: 'column'
          defaults: 
            labelWidth: 70
            labelAlign: 'right'
          items: [
            {
              columnWidth: 0.45
              fieldLabel: l10n.get 'client.id'
              id: 'client-id'
              xtype: 'displayfield'
              value: '509006'
            }
            {
              columnWidth: 0.5
              fieldLabel: l10n.get 'client.phone'
              id: 'client-phone'
              xtype: 'displayfield'
              value: '1854643144'
            }
            {
              columnWidth: 0.45
              fieldLabel: l10n.get 'client.first_name'
              id: 'client-first-name'
              xtype: 'displayfield'
              value: 'John'
            }
            {
              columnWidth: 0.5
              fieldLabel: l10n.get 'client.last_name'
              id: 'client-last-name'
              xtype: 'displayfield'
              value: 'Eriggs'
            }
          ]
        }
        {
          xtype: 'panel'
          title: l10n.get 'schedule.doctor'
          layout: 'column'
          defaults: 
            labelWidth: 70
            labelAlign: 'right'
          items: [
            {
              columnWidth: 0.8
              fieldLabel: l10n.get 'schedule.doctor_name'
              xtype: 'displayfield'
              value: 'Dr. Barnard'
            }
            {
              columnWidth: 0.8
              fieldLabel: l10n.get 'schedule.doctor_id'
              xtype: 'displayfield'
              value: '2224'
            }
            {
              columnWidth: 0.8
              fieldLabel: l10n.get 'schedule.doctor_phone'
              xtype: 'displayfield'
              value: '11122222211'
            }
          ]
        }
        {
          xtype: 'gridpanel'
          title: l10n.get 'client.history'
          flex: 1
          store: Ext.data.StoreManager.lookup('historyStore')
          columns: [
            {
              text: l10n.get 'client.history_date'
              dataIndex: 'date'
              width: 75
            }
            {
              text: l10n.get 'client.history_time'
              dataIndex: 'time'
              width: 75
            }
            {
              text: l10n.get 'client.history_status'
              dataIndex: 'status'
              flex: 1
            }
          ]
        }
      ]
    @items = [
      title: 'Reservations'
      xtype: 'gridpanel'
      height: 250
      store: Ext.data.StoreManager.lookup('reservationStore')
      columns: [
        {
          text: l10n.get 'schedule.reservation_name'
          dataIndex: 'name'
          width: 100
        }
        {
          text: l10n.get 'schedule.reservation_phone'
          dataIndex: 'phone'
          width: 100
        }
        {
          text: l10n.get 'schedule.reservation_time'
          dataIndex: 'time'
          flex: 1
        }
      ]
      ,
        summaryInfo
    ]

    @callParent arguments
    return