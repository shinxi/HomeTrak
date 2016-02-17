Ext.define 'HomeTrak.view.Client',
  extend: 'Ext.tab.Panel'
  xtype: 'client'
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
  initComponent: ->
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

    pItems = [
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
    ]
    @items = [
        {
            title: 'Profile'
            items: pItems
        }
        {
            title: 'COC Notes'
            layout: 'fit'
            items:
                {
                  xtype: 'form'
                  layout: 'fit'
                  items: [
                    xtype: 'htmleditor'
                    value: '<b>Do <u>not</u> </b> allow the <i>client</i> to <b> drive a car.</b>'
                  ]
                }
        }
        {
            title: 'Goals'
            layout: 'fit'
            items:
                {
                  xtype: 'form'
                  layout: 'fit'
                  items: [
                    xtype: 'htmleditor'
                    value: '<b>Do <u>not</u> </b> allow the <i>client</i> to <b> drive a car.</b>'
                  ]
                }
        }
        {
            title: 'HEALTH MAINTENANCE'
            items:
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
        }
        {
            title: 'Visits'
            items: 
                {
                  xtype: 'gridpanel'
                  title: 'History'
                  flex: 1
                  store: Ext.data.StoreManager.lookup('historyStore')
                  columns: [
                    {
                      text: 'Date'
                      dataIndex: 'date'
                      width: 75
                    }
                    {
                      text: 'Time'
                      dataIndex: 'time'
                      width: 75
                    }
                    {
                      text: 'Status'
                      dataIndex: 'status'
                      flex: 1
                    }
                  ]
                }
        }
        {
            title: 'Oasis'
            xtype: 'tabpanel'
            items: 
                title: 'SOC Assessment'
                padding: '0 5 0 5'
                style: 
                    backgroundColor: '#dfe8f6'
                layout: 
                    type: 'vbox'
                    align: 'stretch'
                items: [
                    {
                        layout: 'hbox'
                        items: [
                            {
                                flex: 3
                                xtype: 'assessmentChoicePanel'
                            }
                            {
                                flex: 1
                                xtype: 'tabpanel'
                                items: [
                                    {
                                        title: 'Reqd'
                                        xtype: 'form'
                                        layout: 'fit'
                                        items: 
                                            fieldLabel: 'ReferalHealHistory'
                                            labelAlign: 'top'
                                            margin: '2 2 2 2'
                                            xtype: 'textarea'
                                    }
                                    {
                                        title: 'No Visit'
                                        xtype: 'form'
                                        layout: 'fit'
                                        items: 
                                            margin: '2 2 2 2'
                                            xtype: 'textarea'
                                    }
                                    {
                                        title: 'No Visit'
                                        xtype: 'form'
                                        layout: 'fit'
                                        items: 
                                            margin: '2 2 2 2'
                                            xtype: 'textarea'
                                    }
                                ]
                            }
                        ]
                    }
                    {
                        xtype: 'tabpanel'
                        flex: 1
                        items: [
                            {
                                title: 'Allergies'
                                layout: 
                                    type: 'vbox'
                                    align: 'stretch'
                                items: [
                                    {
                                        xtype: 'form'
                                        height: 35
                                        items: [
                                            {
                                                xtype: 'textfield'
                                                padding: '2px 0 0 0'
                                                labelWidth: 150
                                                fieldLabel: '(VNS0004) Allergies'
                                            }
                                        ]
                                    }
                                    {
                                        xtype: 'tabpanel'
                                        flex: 1
                                        items: [
                                            {
                                                title: 'Drug'
                                                layout: 
                                                    type: 'hbox'
                                                    align: 'stretch'
                                                items: [
                                                    {
                                                        flex: 1
                                                        xtype: 'checkboxgroup'
                                                        fieldLabel: 'Allergic Reactions'
                                                        labelAlign: 'top'
                                                        columns: 1
                                                        border: 1
                                                        style: 
                                                            borderStyle: 'solid'
                                                        vertical: true
                                                        items: [
                                                            {
                                                              boxLabel: 'Penicillin'
                                                              name: 'rb'
                                                              inputValue: '1'
                                                            }
                                                            {
                                                              boxLabel: 'Sulfa'
                                                              name: 'rb'
                                                              inputValue: '2'
                                                            }
                                                            {
                                                              boxLabel: 'Aspirin'
                                                              name: 'rb'
                                                              inputValue: '3'
                                                            }
                                                            {
                                                              boxLabel: 'Codeine'
                                                              name: 'rb'
                                                              inputValue: '4'
                                                            }
                                                            {
                                                              boxLabel: 'Other'
                                                              name: 'rb'
                                                              inputValue: '5'
                                                            }
                                                        ]
                                                    }
                                                    {
                                                        flex: 3
                                                        xtype: 'checkboxgroup'
                                                        labelAlign: 'top'
                                                        fieldLabel: '&nbsp;'
                                                        labelSeparator: ''
                                                        columns: 1
                                                        vertical: true
                                                        border: 1
                                                        style: 
                                                            borderStyle: 'solid'
                                                        vertical: true
                                                        items: [
                                                            {
                                                              boxLabel: 'Anaphylaxis'
                                                              name: 'rb1'
                                                              inputValue: '1'
                                                            }
                                                            {
                                                              boxLabel: 'Diarrhea'
                                                              name: 'rb1'
                                                              inputValue: '2'
                                                            }
                                                            {
                                                              boxLabel: 'Nausea/Vomiting'
                                                              name: 'rb1'
                                                              inputValue: '3'
                                                            }
                                                            {
                                                              boxLabel: 'Rash'
                                                              name: 'rb1'
                                                              inputValue: '4'
                                                            }
                                                            {
                                                              boxLabel: 'Upper respiratory symptoms'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: 'Asthma attack'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: 'Unknown'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: 'Other'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                        ]
                                                    }
                                                ]
                                            }
                                            {
                                                title: 'Food'
                                            }
                                            {
                                                title: 'Enviornmental'
                                            }
                                        ]
                                    }
                                ]
                            }
                            {
                                title: 'Substance Abuse 1'
                            }
                            {
                                title: 'Substance Abuse 2'
                            }
                            {
                                title: 'Substance Abuse 3'
                            }
                            {
                                title: 'Substance Abuse 4'
                            }
                        ]
                    }
                ]

        }
    ]
    @activeTab = 5
    @callParent arguments
    return