Ext.Loader.setConfig enabled: true
Ext.Loader.setPath 'Ext.ux', 'ext/ux'

Ext.application
  views: [ 'Home', 'Client', 'Caregiver', 'ClientSearch', 'ClientSchedule', 'AssessmentChoicePanel']
  controllers: ['Event']
  requires: [
    'Ext.tip.QuickTipManager'
    'Ext.container.Viewport'
    'Ext.layout.*'
    'Ext.form.Panel'
    'Ext.form.Label'
    'Ext.grid.*'
    'Ext.data.*'
    'Ext.tree.*'
    'Ext.selection.*'
    'Ext.tab.Panel'
    'Ext.ux.form.SearchField'
    'Ext.ux.DataTip'
    'Ext.ux.layout.Center'
  ]
  name: 'HomeTrak'
  launch: ->
    Ext.tip.QuickTipManager.init()
    viewport = Ext.create('Ext.Viewport',
      layout: 'card'
      items: [
        xtype: 'caregiver'
      ,
        xtype: 'home'
      ]
      renderTo: Ext.getBody())
    return