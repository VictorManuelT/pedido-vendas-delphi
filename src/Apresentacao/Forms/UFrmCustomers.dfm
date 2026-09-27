object FrmCustomers: TFrmCustomers
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 520
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object lblTitle: TLabel
    Left = 24
    Top = 20
    Width = 146
    Height = 21
    Caption = 'Cadastro de Pessoa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblName: TLabel
    Left = 32
    Top = 59
    Width = 33
    Height = 13
    Caption = 'Nome:'
  end
  object lblCpfCnpj: TLabel
    Left = 32
    Top = 99
    Width = 50
    Height = 13
    Caption = 'CPF/CNPJ:'
  end
  object lblCity: TLabel
    Left = 32
    Top = 139
    Width = 39
    Height = 13
    Caption = 'Cidade:'
  end
  object edtName: TEdit
    Left = 118
    Top = 54
    Width = 350
    Height = 21
    TabOrder = 0
  end
  object edtCpfCnpj: TEdit
    Left = 118
    Top = 94
    Width = 220
    Height = 21
    TabOrder = 1
  end
  object edtCity: TEdit
    Left = 118
    Top = 134
    Width = 220
    Height = 21
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 24
    Top = 161
    Width = 100
    Height = 30
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 456
    Top = 480
    Width = 100
    Height = 30
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object grdCustomers: TStringGrid
    Left = 24
    Top = 194
    Width = 548
    Height = 280
    ColCount = 4
    DefaultColWidth = 120
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 5
    OnSelectCell = grdCustomersSelectCell
  end
  object bntEdit: TButton
    Left = 24
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = bntEditClick
  end
  object bntExcluir: TButton
    Left = 105
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = bntExcluirClick
  end
end
