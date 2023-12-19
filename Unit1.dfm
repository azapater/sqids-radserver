object CustomersResource: TCustomersResource
  Height = 214
  Width = 340
  object qryCustomers: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER'
      'ORDER BY {IIF(!SORT, !SORT, CUST_NO)}')
    Left = 30
    Top = 75
    MacroData = <
      item
        Value = Null
        Name = 'SORT'
      end>
  end
  object resCustomers: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCustomers
    PageSize = 10
    Left = 32
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 248
    Top = 136
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    Left = 32
    Top = 16
  end
end
