Ext.define 'HomeTrak.view.AssessmentChoicePanel',
  extend: 'Ext.tree.Panel'
  xtype: 'assessmentChoicePanel'
  rootVisible: false
  useArrows: true
  height: 300
  initComponent: ->
    l10n = HomeTrak.util.Localization
    @store = Ext.create('Ext.data.TreeStore', 
      proxy:
        type: 'ajax'
        url: 'data/assessmentChoices.json'
    )

    @bbar = [
      '-'
    ,
      xtype: 'button'
      text: l10n.get "client.save"
    ,
      '-'
    ,
      xtype: 'button'
      text: l10n.get "client.canel_exit"
    ,
      '-'
    ,
      xtype: 'button'
      text: l10n.get "client.previous"
    ,
      '-'
    ,
      xtype: 'button'
      text: l10n.get "client.next"
    ,
      '-'
    ,
      xtype: 'button'
      text: l10n.get "client.save_exit"
    ]
    @callParent arguments
    return