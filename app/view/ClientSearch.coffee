Ext.define 'HomeTrak.view.ClientSearch',
  extend: 'Ext.panel.Panel'
  xtype: 'clientSearch'
  title: 'Clients'
  layout: 'fit'
  initComponent: ->
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
      model: 'Post')
    resultTpl = Ext.create('Ext.XTemplate',
        '<tpl for=".">',
        '<div class="search-item">',
            '<div style="padding-top:8px;padding-bottom:8px;border-bottom:1px dotted black"><span>{first_name} {last_name},</span> {client_id}</div>',
        '</div></tpl>')
    @dockedItems = [
        dock: 'top'
        xtype: 'toolbar'
        items:
          width: 200
          fieldLabel: 'Name'
          labelWidth: 50
          value: 's'
          emptyText: "Pls input user name"
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