object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 651
  ClientWidth = 886
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 89
    Align = alTop
    Color = clMedGray
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 25
      Width = 346
      Height = 29
      Caption = 'Sistema Cadastro de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 448
      Top = 36
      Width = 63
      Height = 16
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 517
      Top = 35
      Width = 241
      Height = 21
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 764
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 886
    Height = 562
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 884
      Height = 560
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cadastro'
        object Label2: TLabel
          Left = 11
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object Label3: TLabel
          Left = 226
          Top = 24
          Width = 29
          Height = 13
          Caption = 'NOME'
        end
        object Label4: TLabel
          Left = 441
          Top = 24
          Width = 62
          Height = 13
          Caption = 'SOBRENOME'
        end
        object Label6: TLabel
          Left = 11
          Top = 80
          Width = 26
          Height = 13
          Caption = 'PESO'
        end
        object Label7: TLabel
          Left = 391
          Top = 80
          Width = 30
          Height = 13
          Caption = 'EMAIL'
        end
        object Label8: TLabel
          Left = 656
          Top = 80
          Width = 38
          Height = 13
          Caption = 'CIDADE'
        end
        object Label9: TLabel
          Left = 11
          Top = 136
          Width = 39
          Height = 13
          Caption = 'BAIRRO'
        end
        object Label10: TLabel
          Left = 226
          Top = 136
          Width = 54
          Height = 13
          Caption = 'ENDERE'#199'O'
        end
        object Label11: TLabel
          Left = 441
          Top = 136
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label12: TLabel
          Left = 656
          Top = 136
          Width = 58
          Height = 13
          Caption = 'PROFISS'#195'O'
        end
        object Label5: TLabel
          Left = 656
          Top = 24
          Width = 121
          Height = 13
          AutoSize = False
          Caption = 'DATA DE NASCIMENTO'
        end
        object edtId: TEdit
          Left = 11
          Top = 43
          Width = 209
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 226
          Top = 43
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
        end
        object edtSobrenome: TEdit
          Left = 441
          Top = 43
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
        end
        object edtPeso: TEdit
          Left = 11
          Top = 99
          Width = 209
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object edtSexo: TRadioGroup
          Left = 226
          Top = 80
          Width = 159
          Height = 49
          Caption = 'SEXO'
          Columns = 2
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Masculino'
            'Feminino')
          TabOrder = 4
        end
        object edtEmail: TEdit
          Left = 391
          Top = 99
          Width = 259
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 5
        end
        object edtCidade: TEdit
          Left = 656
          Top = 99
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 6
        end
        object edtBairro: TEdit
          Left = 11
          Top = 155
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 7
        end
        object edtEndereco: TEdit
          Left = 226
          Top = 155
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 8
        end
        object edtProfissao: TEdit
          Left = 656
          Top = 155
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 9
        end
        object comboUF: TComboBox
          Left = 441
          Top = 155
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 10
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO'
            'DF')
        end
        object Panel3: TPanel
          Left = 0
          Top = 440
          Width = 876
          Height = 92
          Align = alBottom
          Color = clMedGray
          ParentBackground = False
          TabOrder = 11
          object btnNovo: TButton
            Left = 310
            Top = 40
            Width = 75
            Height = 25
            Caption = 'NOVO'
            TabOrder = 0
            OnClick = btnNovoClick
          end
          object btnGravar: TButton
            Left = 428
            Top = 40
            Width = 75
            Height = 25
            Caption = 'GRAVAR'
            TabOrder = 1
            OnClick = btnGravarClick
          end
          object Button1: TButton
            Left = 532
            Top = 40
            Width = 75
            Height = 25
            Caption = 'CANCELAR'
            TabOrder = 2
            OnClick = Button1Click
          end
        end
        object maskDataNascimento: TMaskEdit
          Left = 656
          Top = 43
          Width = 178
          Height = 21
          EditMask = '99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 12
          Text = '  /  /    '
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pesquisa'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 48
          Top = 48
          Width = 761
          Height = 377
          DataSource = DM.dsClientes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel4: TPanel
          Left = 0
          Top = 464
          Width = 876
          Height = 68
          Align = alBottom
          Color = clMedGray
          ParentBackground = False
          TabOrder = 1
          object btnEditar: TButton
            Left = 320
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Editar'
            TabOrder = 0
            OnClick = btnEditarClick
          end
          object btnExcluir: TButton
            Left = 472
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 1
            OnClick = btnExcluirClick
          end
        end
      end
    end
  end
end
