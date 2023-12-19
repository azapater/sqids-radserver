object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = '127.0.0.1'
    URLPort = 8080
    URLBasePath = 'Orders'
    Left = 480
    Top = 312
  end
  object RESTResponse1: TRESTResponse
    Left = 528
    Top = 368
  end
  object BackendEndpoint1: TBackendEndpoint
    Provider = EMSProvider1
    Params = <>
    Response = RESTResponse1
    Left = 416
    Top = 368
  end
end
