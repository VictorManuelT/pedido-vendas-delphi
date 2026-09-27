object FrmProducts: TFrmProducts
  Left = 0
  Top = 0
  Caption = 'Produto'
  ClientHeight = 520
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClick = btnEditClick
  TextHeight = 13
  object lblTitle: TLabel
    Left = 24
    Top = 20
    Width = 156
    Height = 21
    Caption = 'Cadastro de Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescription: TLabel
    Left = 32
    Top = 52
    Width = 52
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object lblSalePrice: TLabel
    Left = 32
    Top = 92
    Width = 82
    Height = 13
    Caption = 'Pre'#231'o de Venda:'
  end
  object lblUnit: TLabel
    Left = 32
    Top = 132
    Width = 63
    Height = 13
    Caption = 'Un. Medida:'
  end
  object edtDescription: TEdit
    Left = 118
    Top = 47
    Width = 350
    Height = 21
    TabOrder = 0
  end
  object edtUnit: TEdit
    Left = 118
    Top = 127
    Width = 150
    Height = 21
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 24
    Top = 158
    Width = 100
    Height = 30
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 429
    Top = 480
    Width = 100
    Height = 30
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object grdProducts: TStringGrid
    Left = 24
    Top = 194
    Width = 505
    Height = 280
    ColCount = 4
    DefaultColWidth = 120
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 5
  end
  object nbbSalePrice: TNumberBox
    Left = 120
    Top = 89
    Width = 121
    Height = 21
    Mode = nbmCurrency
    TabOrder = 1
    NegativeValueColor = clRed
  end
  object bntEdit: TButton
    Left = 24
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = btnEditClick
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
