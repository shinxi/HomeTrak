Ext.define 'HomeTrak.controller.Event',
    extend: 'Ext.app.Controller'
    init: ->
        @control 
            'gridpanel[gridtype=reservation]': 
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
        firstName.setValue name.substring 0, 1
        lastName.setValue name.substring 1
        return
    onViewReady: (grid) ->
        l10n = HomeTrak.util.Localization
        grid.view.focusRow 0
        @onItemClick '', grid.view.getRecord 0
        Ext.create 'Ext.tip.ToolTip',
            target: grid.view.el
            delegate: grid.view.itemSelector
            html: l10n.get 'schedule.dbc_for_more_detail'

        return