object DM: TDM
  OldCreateOrder = False
  Height = 625
  Width = 964
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dbcliente'
      'User_Name=root'
      'Password=p@ssw0rd'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 64
  end
  object QryClientes: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'select * from clientes')
    Left = 48
    Top = 160
    object QryClientesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object QryClientessobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Required = True
      Size = 60
    end
    object QryClientesdata_nascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
    end
    object QryClientespeso: TFloatField
      FieldName = 'peso'
      Origin = 'peso'
      Required = True
    end
    object QryClientessexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QryClientesemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 60
    end
    object QryClientescidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 60
    end
    object QryClientesbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 60
    end
    object QryClientesendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 60
    end
    object QryClientesuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QryClientesprofissao: TStringField
      FieldName = 'profissao'
      Origin = 'profissao'
      Required = True
      Size = 60
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Adriano Santos\Documents\Projetos Delphi\Cadastro Clien' +
      'te\libmySQL.dll'
    Left = 864
    Top = 32
  end
  object dsClientes: TDataSource
    DataSet = QryClientes
    Left = 136
    Top = 160
  end
end
