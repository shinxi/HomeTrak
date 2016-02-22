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

    rs = Ext.create 'Ext.data.Store',
      storeId: 'reservationStore'
      fields: [
        'name'
        'phone'
        'time'
      ]
      autoLoad: true
      proxy:
        type: 'ajax'
        url: 'data/reservations.json'
        reader:
          type: 'json'
    rs.loadPage(0)

    Ext.create 'Ext.data.Store',
      storeId: 'historyStore'
      fields: [
        'date'
        'status'
        'time'
      ]
      autoLoad: true
      proxy:
        type: 'ajax'
        url: 'data/history.json'
        reader:
          type: 'json'

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
              fieldLabel: l10n.get 'client.last_name'
              id: 'client-first-name'
              xtype: 'displayfield'
              value: ''
            }
            {
              columnWidth: 0.5
              fieldLabel: l10n.get 'client.first_name'
              id: 'client-last-name'
              xtype: 'displayfield'
              value: ''
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
              value: '陈医生'
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
      title: l10n.get "schedule.reservations"
      xtype: 'gridpanel'
      height: 250
      gridtype: 'reservation'
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