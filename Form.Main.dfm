object Main: TMain
  Left = 0
  Top = 0
  Caption = 'VCL - RAD Server & Sqids'
  ClientHeight = 770
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object Label5: TLabel
    Left = 0
    Top = 99
    Width = 707
    Height = 32
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Include in the request Body'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitTop = 114
  end
  object Label6: TLabel
    Left = 0
    Top = 378
    Width = 707
    Height = 32
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Response from RAD Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitLeft = -8
    ExplicitTop = 431
  end
  object mmResp: TMemo
    Left = 0
    Top = 410
    Width = 707
    Height = 360
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object mmReq: TMemo
    Left = 0
    Top = 131
    Width = 707
    Height = 247
    Align = alTop
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    object Label4: TLabel
      Left = 9
      Top = 43
      Width = 28
      Height = 13
      Caption = 'Page:'
    end
    object Label1: TLabel
      Left = 246
      Top = 42
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cust. No:'
    end
    object btnDelete: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnPost: TButton
      Left = 265
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Post'
      TabOrder = 1
      OnClick = btnPostClick
    end
    object btnPut: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Put'
      TabOrder = 2
      OnClick = btnPutClick
    end
    object btnGet: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Get'
      TabOrder = 3
      OnClick = btnGetClick
    end
    object bntList: TButton
      Left = 8
      Top = 8
      Width = 90
      Height = 25
      Caption = 'List'
      TabOrder = 4
      OnClick = bntListClick
    end
    object edtPage: TEdit
      Left = 42
      Top = 39
      Width = 42
      Height = 21
      TabOrder = 5
      Text = '0'
      OnChange = edtPageChange
    end
    object UpDown1: TUpDown
      Left = 84
      Top = 39
      Width = 16
      Height = 21
      Associate = edtPage
      TabOrder = 6
    end
    object edtOrderID: TEdit
      Left = 298
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 7
      TextHint = 'Enter the PK'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 707
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 3
    object lblRequest: TLabel
      Left = 78
      Top = 0
      Width = 629
      Height = 26
      Align = alClient
      Caption = 'Request'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 47
      ExplicitHeight = 13
    end
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 78
      Height = 26
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Request sent:'
      Layout = tlCenter
      ExplicitHeight = 41
    end
  end
  object RESTResponse1: TRESTResponse
    Left = 592
    Top = 624
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = '127.0.0.1'
    URLPort = 8080
    URLBasePath = 'Customers'
    Left = 384
    Top = 624
  end
  object BackendEndpoint1: TBackendEndpoint
    Provider = EMSProvider1
    Params = <>
    Response = RESTResponse1
    OnAfterExecute = BackendEndpoint1AfterExecute
    Left = 488
    Top = 624
  end
end
