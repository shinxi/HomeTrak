Ext.define 'HomeTrak.view.AssessmentChoicePanel',
  extend: 'Ext.tree.Panel'
  xtype: 'assessmentChoicePanel'
  rootVisible: false
  useArrows: true
  height: 300
  initComponent: ->
    @store = Ext.create('Ext.data.TreeStore', 
      proxy:
        type: 'ajax'
        url: 'data/assessmentChoices.json'
    )

    @bbar = [
      '-'
    ,
      xtype: 'button'
      text: 'Save'
    ,
      '-'
    ,
      xtype: 'button'
      text: 'Cancel/Exit'
    ,
      '-'
    ,
      xtype: 'button'
      text: 'Previous'
    ,
      '-'
    ,
      xtype: 'button'
      text: 'Next'
    ,
      '-'
    ,
      xtype: 'button'
      text: 'Save Exit'
    ]
    @callParent arguments
    return