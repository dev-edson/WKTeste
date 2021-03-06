object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 578
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 578
    Align = alLeft
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 431
      Height = 105
      Align = alTop
      Caption = 'Pedido'
      TabOrder = 0
      object Label1: TLabel
        Left = 40
        Top = 73
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label2: TLabel
        Left = 40
        Top = 19
        Width = 93
        Height = 13
        Caption = 'C'#243'digo do Produto:'
      end
      object Label3: TLabel
        Left = 40
        Top = 48
        Width = 60
        Height = 13
        Caption = 'Quantidade:'
      end
      object edtProduto: TEdit
        Left = 152
        Top = 16
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object edtQtd: TEdit
        Left = 152
        Top = 43
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edtValor: TEdit
        Left = 152
        Top = 70
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
      object btnPedido: TButton
        Left = 288
        Top = 43
        Width = 89
        Height = 50
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnPedidoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 106
      Width = 431
      Height = 81
      Align = alTop
      Caption = 'Registro pedido'
      TabOrder = 1
      object Label4: TLabel
        Left = 48
        Top = 27
        Width = 88
        Height = 13
        Caption = 'C'#243'digo do Cliente:'
      end
      object btnGravar: TButton
        Left = 288
        Top = 16
        Width = 89
        Height = 46
        Caption = 'Gravar Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = btnGravarClick
      end
      object edtCliente: TEdit
        Left = 152
        Top = 24
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 187
      Width = 431
      Height = 390
      Align = alClient
      Caption = 'Listagem Pedidos'
      TabOrder = 2
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 427
        Height = 177
        Align = alClient
        DataSource = dsPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'idpedido'
            Title.Caption = 'Pedido'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_emissao'
            Title.Caption = 'Emiss'#227'o'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomecliente'
            Title.Caption = 'Cliente'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Caption = 'Valor Total'
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 2
        Top = 192
        Width = 427
        Height = 120
        Align = alBottom
        DataSource = dsItens_Pedidos
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel3: TPanel
        Left = 2
        Top = 312
        Width = 427
        Height = 76
        Align = alBottom
        TabOrder = 2
        object Label5: TLabel
          Left = 8
          Top = 11
          Width = 83
          Height = 13
          Caption = 'C'#243'digo do Pedido'
        end
        object Button1: TButton
          Left = 164
          Top = 16
          Width = 89
          Height = 46
          Caption = 'Pesquisa Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          WordWrap = True
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 286
          Top = 16
          Width = 89
          Height = 46
          Caption = 'Cancelar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          WordWrap = True
          OnClick = Button2Click
        end
        object edtPedido: TEdit
          Left = 5
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 433
    Top = 0
    Width = 501
    Height = 578
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 26
      Width = 499
      Height = 391
      Align = alTop
      DataSource = dsTemp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 499
      Height = 25
      DataSource = dsTemp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
      Align = alTop
      TabOrder = 1
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 417
      Width = 499
      Height = 160
      Align = alClient
      Caption = 'Total dos pedidos'
      TabOrder = 2
      object lblTotalPedido: TLabel
        Left = 2
        Top = 15
        Width = 495
        Height = 143
        Align = alClient
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -80
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 319
        ExplicitWidth = 178
        ExplicitHeight = 97
      end
    end
  end
  object fdqProduto: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from produtos where idproduto=:codigo')
    Left = 336
    Top = 304
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqProdutoidproduto: TFDAutoIncField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqProdutoproduto_descricao: TStringField
      FieldName = 'produto_descricao'
      Origin = 'produto_descricao'
      Required = True
      Size = 100
    end
    object fdqProdutoproduto_precovenda: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'produto_precovenda'
      Origin = 'produto_precovenda'
    end
  end
  object dsTemp: TDataSource
    DataSet = fdmTempPedido
    Left = 833
    Top = 272
  end
  object fdmTempPedido: TFDMemTable
    AfterPost = fdmTempPedidoAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 769
    Top = 272
    object fdmTempPedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object fdmTempPedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object fdmTempPedidoQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object fdmTempPedidoValor: TFloatField
      FieldName = 'Valor'
    end
    object fdmTempPedidoTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object fdqCliente: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from clientes '
      'where idcliente=:cliente')
    Left = 344
    Top = 376
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqClienteidcliente: TFDAutoIncField
      FieldName = 'idcliente'
      Origin = 'idcliente'
      ReadOnly = True
    end
    object fdqClientenomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      Required = True
      Size = 50
    end
    object fdqClientecidadeCliente: TStringField
      FieldName = 'cidadeCliente'
      Origin = 'cidadeCliente'
      Required = True
      Size = 50
    end
    object fdqClienteUFCliente: TStringField
      FieldName = 'UFCliente'
      Origin = 'UFCliente'
      Required = True
      Size = 2
    end
  end
  object InseriPedido: TFDQuery
    Connection = DM.FDConnection1
    Transaction = DM.FDTransaction1
    SQL.Strings = (
      
        'insert into pedidos (dt_emissao, cliente, valor_total) values(:d' +
        'ata, :cliente,:valor)')
    Left = 256
    Top = 408
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
  end
  object InseriItensPedido: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'insert into pedidos_itens (pedido, produto, qtd, valor_unitario,' +
        ' valor_total) values (:pedido, :produto, :qtd, :unitario, :total' +
        ')')
    Left = 345
    Top = 451
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QTD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNITARIO'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqPedidos: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select p.*, c.nomeCliente'
      'from pedidos p inner join clientes c on p.cliente=c.idcliente'
      'order by idpedido desc')
    Left = 161
    Top = 339
    object fdqPedidosidpedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idpedido'
      Origin = 'idpedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqPedidosdt_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object fdqPedidoscliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
    end
    object fdqPedidosnomeCliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object fdqPedidosvalor_total: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
    end
  end
  object dsPedidos: TDataSource
    DataSet = fdqPesqPedido
    Left = 89
    Top = 411
  end
  object fdqItensPedido: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select pi.*, pr.produto_descricao'
      
        'from pedidos_itens pi inner join produtos pr on pi.produto=pr.id' +
        'produto'
      'where pi.pedido = :pedido'
      'order by pedido desc'
      ''
      ''
      ''
      ''
      '')
    Left = 249
    Top = 319
    ParamData = <
      item
        Name = 'PEDIDO'
        ParamType = ptInput
      end>
    object fdqItensPedidopedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pedido'
      Origin = 'pedido'
    end
    object fdqItensPedidoproduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
    end
    object fdqItensPedidoproduto_descricao: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 50
      FieldName = 'produto_descricao'
      Origin = 'produto_descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object fdqItensPedidoqtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      DisplayFormat = '##,##0.00'
    end
    object fdqItensPedidovalor_unitario: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      DisplayFormat = '##,##0.00'
    end
  end
  object dsItens_Pedidos: TDataSource
    DataSet = fdqItensPedido
    Left = 177
    Top = 419
  end
  object fdqPesqPedido: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select p.*, c.nomecliente '
      'from pedidos p inner join clientes c on p.cliente=c.idcliente'
      'where p.idpedido = :pedido'
      'order by idpedido desc'
      ''
      ''
      ''
      ''
      '')
    Left = 105
    Top = 262
    ParamData = <
      item
        Name = 'pedido'
        DataType = ftString
        ParamType = ptInput
      end>
    object fdqPesqPedidoidpedido: TFDAutoIncField
      FieldName = 'idpedido'
      Origin = 'idpedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqPesqPedidodt_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object fdqPesqPedidocliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
    end
    object fdqPesqPedidonomecliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomecliente'
      Origin = 'nomeCliente'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object fdqPesqPedidovalor_total: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
    end
  end
  object fdqDelPedido: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'delete from pedidos where idpedido = :pedido'
      ''
      ''
      ''
      '')
    Left = 92
    Top = 319
    ParamData = <
      item
        Name = 'pedido'
        DataType = ftString
        ParamType = ptInput
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'idpedido'
      Origin = 'idpedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object IntegerField1: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
    end
    object FloatField1: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
    end
  end
end
