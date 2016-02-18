Ext.define 'HomeTrak.view.Client',
  extend: 'Ext.tab.Panel'
  xtype: 'client'
  autoScroll: true
  layout:
    xtype: 'vbox'
    align: 'stretch'
  initComponent: ->
    l10n = HomeTrak.util.Localization
    @bbar = [
      { xtype: 'button', text: l10n.get 'client.submit' }
      '-'
      { xtype: 'button', text: l10n.get 'client.analysis' }
      '-'
    ]
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
          title: l10n.get 'client.basic_info'
          defaults:
            columnWidth: 1 / 9
            margin: '2px 1px 2px 1px'
            labelAlign: 'right'
            height: 26
          items: [
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.id'
              xtype: 'textfield'
            }
            {
              columnWidth: 1 / 9
              fieldLabel: l10n.get 'client.status'
              xtype: 'textfield'
            }
            {
              columnWidth: 5 / 9
              xtype: 'component'
              html: '&nbsp;'
            }
            {
              columnWidth: 4 / 9
              fieldLabel: l10n.get 'client.first_name'
              xtype: 'textfield'
            }
            {
              columnWidth: 2 / 9
              fieldLabel: l10n.get 'client.phone'
              xtype: 'textfield'
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.district'
              xtype: 'textfield'
            }
            {
              columnWidth: 4 / 9
              fieldLabel: l10n.get 'client.last_name'
              xtype: 'textfield'
            }
            {
              xtype: 'component'
              columnWidth: 2 / 9
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.language'
              xtype: 'textfield'
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.address'
              xtype: 'textfield'
            }
            {
              columnWidth: 1 / 9
              fieldLabel: l10n.get 'client.apt'
              xtype: 'textfield'
            }
            {
              columnWidth: 2 / 9
              fieldLabel: l10n.get 'client.ssn'
              xtype: 'textfield'
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.gender'
              xtype: 'textfield'
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.address2'
              xtype: 'textfield'
            }
            {
              columnWidth: 1 / 9
              fieldLabel: l10n.get 'client.state'
              xtype: 'textfield'
            }
            {
              columnWidth: 2 / 9
              fieldLabel: l10n.get 'client.birthday'
              xtype: 'textfield'
            }
            {
              columnWidth: 3 / 9
              xtype: 'component'
            }
            {
              columnWidth: 3 / 9
              fieldLabel: l10n.get 'client.city'
              xtype: 'textfield'
            }
            {
              columnWidth: 1 / 9
              fieldLabel: l10n.get 'client.zip'
              xtype: 'textfield'
            }
            {
              columnWidth: 2 / 9
              fieldLabel: l10n.get 'client.email'
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
          title: l10n.get 'client.general_info'
          layout: 'column'
          defaults:
            margin: '5px 5px 5px 5px'
            labelAlign: 'right'
            labelWidth: 150
          items: [
            {
              xtype: 'fieldset'
              columnWidth: 0.55
              title: l10n.get 'client.diagnosis_code'
              collapsible: true
              defaultType: 'textfield'
              defaults: anchor: '100%'
              layout: 'anchor'
              items: [
                {
                  xtype: 'combobox'
                  fieldLabel: l10n.get 'client.sympton'
                  store: symptom
                  queryMode: 'local'
                  displayField: 'name'
                  valueField: 'code'
                  value: 's1'
                }
                {
                  xtype: 'combobox'
                  fieldLabel: l10n.get 'client.sympton2'
                  store: symptom
                  queryMode: 'local'
                  displayField: 'name'
                  valueField: 'code'
                  value: 's2'
                }
                {
                  xtype: 'combobox'
                  fieldLabel: l10n.get 'client.sympton3'
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
              title: l10n.get 'client.health_index'
              collapsible: true
              defaultType: 'textfield'
              defaults: anchor: '100%'
              layout: 'anchor'
              items: [
                {
                  fieldLabel: l10n.get 'client.heat_beats'
                  name: 'field1'
                }
                {
                  fieldLabel: l10n.get 'client.pressure'
                  name: 'field2'
                }
                {
                  fieldLabel: l10n.get 'client.others'
                  name: 'field2'
                }
              ]
            }
          ]
        }
    ]
    @items = [
        {
            title: l10n.get 'client.profile'
            items: pItems
        }
        {
            title: l10n.get 'client.coc_notes'
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
            title: l10n.get 'client.goals'
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
            title: l10n.get 'client.health_maintenance'
            items:
                {
                  xtype: 'fieldset'
                  columnWidth: 0.55
                  title: l10n.get 'client.health_index'
                  collapsible: true
                  defaultType: 'textfield'
                  defaults: anchor: '100%'
                  layout: 'anchor'
                  items: [
                    {
                      fieldLabel: l10n.get 'client.heat_beats'
                      name: 'field1'
                    }
                    {
                      fieldLabel: l10n.get 'client.pressure'
                      name: 'field2'
                    }
                    {
                      fieldLabel: l10n.get 'client.others'
                      name: 'field2'
                    }
                  ]
                }
        }
        {
            title: l10n.get 'client.visits'
            items: 
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
        }
        {
            title: l10n.get 'client.oasis'
            xtype: 'tabpanel'
            items: 
                title: l10n.get 'client.soc_assess'
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
                                        title: l10n.get 'client.reqd'
                                        xtype: 'form'
                                        layout: 'fit'
                                        items: 
                                            fieldLabel: 'ReferalHealHistory'
                                            labelAlign: 'top'
                                            margin: '2 2 2 2'
                                            xtype: 'textarea'
                                    }
                                    {
                                        title: l10n.get 'client.no_visit'
                                        xtype: 'form'
                                        layout: 'fit'
                                        items: 
                                            margin: '2 2 2 2'
                                            xtype: 'textarea'
                                    }
                                    {
                                        title: l10n.get 'client.no_visit'
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
                                title: l10n.get 'client.allergies'
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
                                                fieldLabel: l10n.get 'client.vns_allergies'
                                            }
                                        ]
                                    }
                                    {
                                        xtype: 'tabpanel'
                                        flex: 1
                                        items: [
                                            {
                                                title: l10n.get 'client.drug'
                                                layout: 
                                                    type: 'hbox'
                                                    align: 'stretch'
                                                items: [
                                                    {
                                                        flex: 1
                                                        xtype: 'checkboxgroup'
                                                        fieldLabel: l10n.get 'client.allergic_reaction'
                                                        labelAlign: 'top'
                                                        columns: 1
                                                        border: 1
                                                        style: 
                                                            borderStyle: 'solid'
                                                        vertical: true
                                                        items: [
                                                            {
                                                              boxLabel: l10n.get 'client.penicillin'
                                                              name: 'rb'
                                                              inputValue: '1'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.sulfa'
                                                              name: 'rb'
                                                              inputValue: '2'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.aspirin'
                                                              name: 'rb'
                                                              inputValue: '3'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.codeine'
                                                              name: 'rb'
                                                              inputValue: '4'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.other'
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
                                                              boxLabel: l10n.get 'client.anaphylaxis'
                                                              name: 'rb1'
                                                              inputValue: '1'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.diarrhea'
                                                              name: 'rb1'
                                                              inputValue: '2'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.nausea_Vomiting'
                                                              name: 'rb1'
                                                              inputValue: '3'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.rash'
                                                              name: 'rb1'
                                                              inputValue: '4'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.upper_respiratory_symptoms'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.asthma_attack'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.unknown'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                            {
                                                              boxLabel: l10n.get 'client.other'
                                                              name: 'rb1'
                                                              inputValue: '5'
                                                            }
                                                        ]
                                                    }
                                                ]
                                            }
                                            {
                                                title: l10n.get 'client.food'
                                            }
                                            {
                                                title: l10n.get 'client.enviornmental'
                                            }
                                        ]
                                    }
                                ]
                            }
                            {
                                title: l10n.get 'client.substance_abuse1'
                            }
                            {
                                title: l10n.get 'client.substance_abuse2'
                            }
                            {
                                title: l10n.get 'client.substance_abuse3'
                            }
                            {
                                title: l10n.get 'client.substance_abuse4'
                            }
                        ]
                    }
                ]

        }
    ]
    @activeTab = 5
    @callParent arguments
    return