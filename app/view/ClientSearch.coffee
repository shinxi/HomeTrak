Ext.define 'HomeTrak.view.ClientSearch',
  extend: 'Ext.panel.Panel'
  xtype: 'clientSearch'
  layout: 'fit'
  initComponent: ->
    l10n = HomeTrak.util.Localization
    Ext.define 'Post',
      extend: 'Ext.data.Model'
      proxy:
        type: 'ajax'
        url: 'data/clients.json'
        reader:
          type: 'json'
      fields: [
        {
          name: 'client_id'
          mapping: 'client_id'
        }
        {
          name: 'status'
          mapping: 'status'
        }
        {
          name: 'first_name'
          mapping: 'first_name'
        }
        {
          name: 'last_name'
          mapping: 'last_name'
        }
        {
          name: 'phone'
          mapping: 'phone'
        }
        {
          name: 'district'
          mapping: 'district'
        }
        {
          name: 'state'
          mapping: 'state'
        }
        {
          name: 'city'
          mapping: 'city'
        }
        {
          name: 'zip'
          mapping: 'zip'
        }
      ]
    ds = Ext.create('Ext.data.Store',
      pageSize: 10
      autoLoad: true
      model: 'Post'
      listeners:
        load: ( store, records, eOpts) ->
          newRecords = Ext.Array.filter records, (record) ->
            fn = record.get 'first_name'
            ln = record.get 'last_name'
            sv = Ext.ComponentQuery.query("searchfield")[0].getValue()
            regexp = new RegExp sv
            if regexp.test (ln + fn)
              return true
            return false
          if newRecords.length is 0
            newRecords = records
          store.loadRecords newRecords
          return
    )
    resultTpl = Ext.create('Ext.XTemplate',
        '<tpl for=".">',
        '<div class="search-item">',
            '<div style="padding-top:8px;padding-bottom:8px;border-bottom:1px dotted black"><span>{last_name}{first_name}, </span> {client_id}</div>',
        '</div></tpl>')
    @dockedItems = [
        dock: 'top'
        xtype: 'toolbar'
        items:
          width: 200
          fieldLabel: l10n.get 'clientSearch.client_search_name'
          labelWidth: 50
          value: '王'
          emptyText: l10n.get 'clientSearch.pls_input_user_name'
          xtype: 'searchfield'
          store: ds
    ]
    @items = [
        overflowY: 'auto'
        xtype: 'dataview'
        tpl: resultTpl
        store: ds
        itemSelector: 'div.search-item'
        emptyText: '<div class="x-grid-empty">No Matching Threads</div>'
    ]
    @callParent arguments
    return