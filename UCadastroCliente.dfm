object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 587
  ClientWidth = 672
  Color = clBtnFace
  Constraints.MinHeight = 615
  Constraints.MinWidth = 678
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 587
    Align = alClient
    TabOrder = 0
    object pnCliente: TPanel
      Left = 1
      Top = 1
      Width = 670
      Height = 136
      Align = alTop
      TabOrder = 0
      TabStop = True
      object Label1: TLabel
        Left = 24
        Top = 40
        Width = 30
        Height = 13
        Caption = 'Nome'
        FocusControl = edtNome
      end
      object Label2: TLabel
        Left = 399
        Top = 40
        Width = 56
        Height = 13
        Caption = 'Identidade'
        FocusControl = edtRG
      end
      object Label3: TLabel
        Left = 24
        Top = 77
        Width = 19
        Height = 13
        Caption = 'CPF'
        FocusControl = edtCPF
      end
      object Label4: TLabel
        Left = 164
        Top = 77
        Width = 44
        Height = 13
        Caption = 'Telefone'
        FocusControl = edtTelefone
      end
      object Label5: TLabel
        Left = 304
        Top = 77
        Width = 27
        Height = 13
        Caption = 'Email'
        FocusControl = edtEmail
      end
      object Label15: TLabel
        Left = 24
        Top = 9
        Width = 151
        Height = 25
        Caption = 'Dados do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNome: TDBEdit
        Left = 24
        Top = 56
        Width = 369
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = dsCliente
        TabOrder = 0
      end
      object edtRG: TDBEdit
        Left = 399
        Top = 56
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Identidade'
        DataSource = dsCliente
        TabOrder = 1
      end
      object edtCPF: TDBEdit
        Left = 24
        Top = 93
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CPF'
        DataSource = dsCliente
        TabOrder = 2
      end
      object edtTelefone: TDBEdit
        Left = 164
        Top = 93
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Telefone'
        DataSource = dsCliente
        TabOrder = 3
      end
      object edtEmail: TDBEdit
        Left = 304
        Top = 93
        Width = 229
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Email'
        DataSource = dsCliente
        TabOrder = 4
      end
    end
    object pnEndereco: TPanel
      Left = 1
      Top = 137
      Width = 670
      Height = 176
      Align = alTop
      TabOrder = 1
      TabStop = True
      object Label7: TLabel
        Left = 138
        Top = 32
        Width = 61
        Height = 13
        Caption = 'Logradouro'
        FocusControl = edtLogradouro
      end
      object Label8: TLabel
        Left = 24
        Top = 75
        Width = 41
        Height = 13
        Caption = 'Numero'
        FocusControl = edtNumero
      end
      object Label9: TLabel
        Left = 164
        Top = 75
        Width = 72
        Height = 13
        Caption = 'Complemento'
        FocusControl = edtComplemento
      end
      object Label10: TLabel
        Left = 24
        Top = 118
        Width = 31
        Height = 13
        Caption = 'Bairro'
        FocusControl = edtBairro
      end
      object Label11: TLabel
        Left = 164
        Top = 118
        Width = 36
        Height = 13
        Caption = 'Cidade'
        FocusControl = edtCidade
      end
      object Label12: TLabel
        Left = 355
        Top = 118
        Width = 35
        Height = 13
        Caption = 'Estado'
        FocusControl = edtEstado
      end
      object Label13: TLabel
        Left = 399
        Top = 118
        Width = 20
        Height = 13
        Caption = 'Pais'
        FocusControl = edtPais
      end
      object Label6: TLabel
        Left = 24
        Top = 32
        Width = 20
        Height = 13
        Caption = 'Cep'
        FocusControl = edtCep
      end
      object Label14: TLabel
        Left = 24
        Top = 3
        Width = 83
        Height = 25
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtLogradouro: TDBEdit
        Left = 138
        Top = 48
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Logradouro'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 1
      end
      object edtNumero: TDBEdit
        Left = 24
        Top = 91
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Numero'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 2
      end
      object edtComplemento: TDBEdit
        Left = 164
        Top = 91
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 3
      end
      object edtBairro: TDBEdit
        Left = 24
        Top = 134
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 4
      end
      object edtCidade: TDBEdit
        Left = 164
        Top = 134
        Width = 185
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 5
      end
      object edtEstado: TDBEdit
        Left = 355
        Top = 134
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Estado'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 6
      end
      object edtPais: TDBEdit
        Left = 399
        Top = 134
        Width = 149
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Pais'
        DataSource = dsCliente
        Enabled = False
        TabOrder = 7
      end
      object edtCep: TDBEdit
        Left = 24
        Top = 48
        Width = 108
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Cep'
        DataSource = dsCliente
        TabOrder = 0
        OnClick = edtCepClick
        OnEnter = edtCepEnter
        OnExit = edtCepExit
      end
    end
    object pnBotoes: TPanel
      Left = 1
      Top = 524
      Width = 670
      Height = 62
      Align = alBottom
      TabOrder = 3
      object btnAdicionar: TSpeedButton
        Left = 1
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = 'Adicionar'
        OnClick = btnAdicionarClick
        ExplicitLeft = 62
        ExplicitTop = 5
      end
      object btnEditar: TSpeedButton
        Left = 132
        Top = 1
        Width = 67
        Height = 60
        Align = alLeft
        Caption = 'Editar'
        OnClick = btnEditarClick
        ExplicitLeft = 56
        ExplicitTop = 5
      end
      object btnPrimeiro: TSpeedButton
        Left = 330
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = 'Primeiro'
        OnClick = btnPrimeiroClick
        ExplicitLeft = 111
        ExplicitTop = 5
      end
      object btnAnterior: TSpeedButton
        Left = 394
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = 'Anterior'
        OnClick = btnAnteriorClick
        ExplicitLeft = 111
        ExplicitTop = 5
      end
      object btnProximo: TSpeedButton
        Left = 458
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = 'Pr'#243'ximo'
        OnClick = btnProximoClick
        ExplicitLeft = 111
        ExplicitTop = 5
      end
      object btnUltimo: TSpeedButton
        Left = 522
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = #218'ltimo'
        OnClick = btnUltimoClick
        ExplicitLeft = 111
        ExplicitTop = 5
      end
      object btnSair: TSpeedButton
        Left = 602
        Top = 1
        Width = 67
        Height = 60
        Align = alRight
        Caption = 'Sair'
        OnClick = btnSairClick
        ExplicitLeft = 394
      end
      object btnEnviarEmail: TSpeedButton
        Left = 263
        Top = 1
        Width = 67
        Height = 60
        Align = alLeft
        Caption = 'Env. Email'
        OnClick = btnEnviarEmailClick
        ExplicitLeft = 187
      end
      object btnExcluir: TSpeedButton
        Left = 199
        Top = 1
        Width = 64
        Height = 60
        Align = alLeft
        Caption = 'Excluir'
        OnClick = btnExcluirClick
        ExplicitLeft = 111
        ExplicitTop = 5
      end
      object btnCancelar: TSpeedButton
        Left = 65
        Top = 1
        Width = 67
        Height = 60
        Align = alLeft
        Caption = 'Cancelar'
        OnClick = btnCancelarClick
        ExplicitLeft = 56
        ExplicitTop = 5
      end
    end
    object pnGrid: TPanel
      Left = 1
      Top = 313
      Width = 670
      Height = 211
      Align = alClient
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 668
        Height = 209
        TabStop = False
        Align = alClient
        DataSource = dsCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Identidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cep'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Logradouro'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estado'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pais'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = dm.memCliente
    Left = 544
    Top = 80
  end
  object XMLDocument1: TXMLDocument
    Left = 545
    Top = 129
  end
end
