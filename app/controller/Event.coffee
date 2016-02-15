Ext.define 'HomeTrak.controller.Event',
    extend: 'Ext.app.Controller'
    init: ->
        @control 
            'gridpanel[title=Reservations]': 
                itemclick: @onItemClick
                viewready: @onViewReady
        return
    onItemClick: (grid, record, item, index) ->
        summaryInfo = Ext.getCmp 'clientSchedule-summaryInfo'
        summaryInfo.setVisible true
        clientId = Ext.getCmp "client-id"
        phone = Ext.getCmp "client-phone"
        firstName = Ext.getCmp "client-first-name"
        lastName = Ext.getCmp "client-last-name"
        clientId.setValue record.get 'id'
        phone.setValue record.get 'phone'
        name = record.get 'name'
        firstName.setValue name.split(" ")[0]
        lastName.setValue name.split(" ")[1]
        return
    onViewReady: (grid) ->
        grid.view.focusRow 0
        @onItemClick '', grid.view.getRecord 0
        return