object DM: TDM
  OldCreateOrder = False
  Height = 464
  Width = 633
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=wkteste'
      'Database=testewk'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 384
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 496
    Top = 72
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 112
    Top = 104
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\WKTeste\TesteWK\TesteWK\libmysql.dll'
    Left = 280
    Top = 104
  end
end
