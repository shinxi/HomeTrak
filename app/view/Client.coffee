Ext.define 'HomeTrak.view.Client',
  extend: 'Ext.panel.Panel'
  xtype: 'client'
  layout: 'fit'
  initComponent: ->
    searchTreeStore = Ext.create('Ext.data.TreeStore', root:
      expanded: true
      children: [
        {
          text: 'A'
          leaf: false
          children: [
            {
              text: 'Albright, Mary(Z)'
              leaf: true
            }
            {
              text: 'Albright, Atty(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'B'
          leaf: false
          children: [
            {
              text: 'Bellaire, Marcy(A)'
              leaf: true
            }
            {
              text: 'Briggs, John(A)'
              leaf: true
            }
            {
              text: 'Broderick, Betty(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'C'
          leaf: false
          children: [
            {
              text: 'Clothier, Bert(A)'
              leaf: true
            }
            {
              text: 'Colhoun, Jessica(A)'
              leaf: true
            }
            {
              text: 'Colhoun, Jessica(A)'
              leaf: true
            }
          ]
        }
        {
          text: 'D'
          leaf: true
        }
        {
          text: 'E'
          leaf: true
        }
        {
          text: 'F'
          leaf: true
        }
        {
          text: 'G'
          leaf: true
        }
        {
          text: 'H'
          leaf: true
        }
        {
          text: 'I'
          leaf: true
        }
      ])
    searchTree =
      xtype: 'treepanel'
      flex: 1
      store: searchTreeStore
      frame: false
      rowLines: true
      rootVisible: false

    symptom = Ext.create('Ext.data.Store',
      fields: [
        'code'
        'name'
      ]
      data: [
        {
          'code': 's1'
          'name': 'Arthritis'
        }
        {
          'code': 's2'
          'name': 'Bedbound'
        }
        {
          'code': 's3'
          'name': 'Bland'
        }
        {
          'code': 's3'
          'name': 'Cancer'
        }
      ])

    @items = [
      xtype: 'panel'
      title: 'Caregiver Name: John'
      layout: 
        type: 'hbox'
        align: 'stretch'
      items: [
        {
          layout: 'border',
          width: 500
          items: [{
              title: 'Client Search',
              region:'west',
              xtype: "clientSearch"
              margins: '2 0 0 2',
              width: 220,
              collapsible: true
          },{
              region: 'center'
              xtype: 'clientSchedule'
              margins: '2 1 0 0'
          }]
        }
        {
          xtype: 'splitter'
          width: 3
        }
        {
          region: 'center'
          flex: 1
          autoScroll: true
          bbar: [
            { xtype: 'button', text: 'Submit' }
            '-'
            { xtype: 'button', text: 'Analysis' }
            '-'
          ]
          layout:
            xtype: 'vbox'
            align: 'stretch'
          items: [
            {
              xtype: 'form'
              layout: 'column'
              collapsible: true
              title: 'Basic Information'
              defaults:
                columnWidth: 1 / 9
                margin: '2px 1px 2px 1px'
                labelAlign: 'right'
                height: 26
              items: [
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'Client ID'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 1 / 9
                  fieldLabel: 'Status'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 5 / 9
                  xtype: 'component'
                  html: '&nbsp;'
                }
                {
                  columnWidth: 4 / 9
                  fieldLabel: 'First Name'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 2 / 9
                  fieldLabel: 'Phone'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'District'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 4 / 9
                  fieldLabel: 'Last Name'
                  xtype: 'textfield'
                }
                {
                  xtype: 'component'
                  columnWidth: 2 / 9
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'Language'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'Address'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 1 / 9
                  fieldLabel: 'APT'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 2 / 9
                  fieldLabel: 'S.S.N'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'Gender'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'Address2'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 1 / 9
                  fieldLabel: 'State'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 2 / 9
                  fieldLabel: 'Birthday'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  xtype: 'component'
                }
                {
                  columnWidth: 3 / 9
                  fieldLabel: 'City'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 1 / 9
                  fieldLabel: 'Zip'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 2 / 9
                  fieldLabel: 'Email'
                  xtype: 'textfield'
                }
                {
                  columnWidth: 3 / 9
                  xtype: 'component'
                }
              ]
            }
            {
              xtype: 'form'
              collapsible: true
              title: 'General Information'
              layout: 'column'
              defaults:
                margin: '5px 5px 5px 5px'
                labelAlign: 'right'
                labelWidth: 150
              items: [
                {
                  xtype: 'fieldset'
                  columnWidth: 0.55
                  title: 'Diagnosis Codes'
                  collapsible: true
                  defaultType: 'textfield'
                  defaults: anchor: '100%'
                  layout: 'anchor'
                  items: [
                    {
                      xtype: 'combobox'
                      fieldLabel: 'Symptom'
                      store: symptom
                      queryMode: 'local'
                      displayField: 'name'
                      valueField: 'code'
                      value: 's1'
                    }
                    {
                      xtype: 'combobox'
                      fieldLabel: 'Symptom2'
                      store: symptom
                      queryMode: 'local'
                      displayField: 'name'
                      valueField: 'code'
                      value: 's2'
                    }
                    {
                      xtype: 'combobox'
                      fieldLabel: 'Symptom3'
                      store: symptom
                      queryMode: 'local'
                      displayField: 'name'
                      valueField: 'code'
                      value: 's3'
                    }
                  ]
                }
                {
                  xtype: 'fieldset'
                  columnWidth: 0.55
                  title: 'Health Index'
                  collapsible: true
                  defaultType: 'textfield'
                  defaults: anchor: '100%'
                  layout: 'anchor'
                  items: [
                    {
                      fieldLabel: 'Heart Beats'
                      name: 'field1'
                    }
                    {
                      fieldLabel: 'Pressure'
                      name: 'field2'
                    }
                    {
                      fieldLabel: 'Others'
                      name: 'field2'
                    }
                  ]
                }
              ]
            }
            {
              xtype: 'form'
              collapsible: true
              title: 'Notes'
              defaults:
                margin: '5px 5px 5px 5px'
              items: [
                xtype: 'htmleditor'
                value: '<b>Do <u>not</u> </b> allow the <i>client</i> to <b> drive a car.</b>'
              ]
            }
          ]
        }
      ]
    ]
    @callParent arguments
    return