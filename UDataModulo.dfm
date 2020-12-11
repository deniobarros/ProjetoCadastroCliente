object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 186
  Width = 370
  object memCliente: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 48
    object memClienteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object memClienteIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object memClienteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###########;1;_'
      Size = 11
    end
    object memClienteTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '(##)####-####;1;_'
      Size = 13
    end
    object memClienteEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object memClienteCep: TStringField
      FieldName = 'Cep'
      EditMask = '########;1;_'
      Size = 8
    end
    object memClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object memClienteNumero: TIntegerField
      FieldName = 'Numero'
    end
    object memClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object memClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object memClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object memClienteEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object memClientePais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
  end
end
