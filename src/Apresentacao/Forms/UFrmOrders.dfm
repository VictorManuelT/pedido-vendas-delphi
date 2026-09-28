object FrmOrders: TFrmOrders
  Left = 0
  Top = 0
  Caption = 'Orders'
  ClientHeight = 543
  ClientWidth = 512
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
    Width = 129
    Height = 21
    Caption = 'Pedido de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCustomer: TLabel
    Left = 24
    Top = 75
    Width = 39
    Height = 13
    Caption = 'Cliente:'
  end
  object lblProduct: TLabel
    Left = 24
    Top = 115
    Width = 45
    Height = 13
    Caption = 'Produto:'
  end
  object lblQuantity: TLabel
    Left = 24
    Top = 155
    Width = 61
    Height = 13
    Caption = 'Quantidade'
  end
  object lblUnitPrice: TLabel
    Left = 250
    Top = 155
    Width = 76
    Height = 13
    Caption = 'Pre'#231'o Unitario:'
  end
  object lblTotal: TLabel
    Left = 24
    Top = 505
    Width = 230
    Height = 30
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Total: R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cmbCustomer: TComboBox
    Left = 100
    Top = 70
    Width = 350
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object cmbProduct: TComboBox
    Left = 100
    Top = 110
    Width = 350
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = cmbProductChange
  end
  object edtQuantity: TEdit
    Left = 100
    Top = 150
    Width = 144
    Height = 21
    TabOrder = 2
  end
  object btnAddItem: TButton
    Left = 24
    Top = 177
    Width = 120
    Height = 30
    Caption = 'Adicionar Item'
    TabOrder = 3
    OnClick = btnAddItemClick
  end
  object btnSave: TButton
    Left = 294
    Top = 505
    Width = 100
    Height = 30
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 399
    Top = 505
    Width = 90
    Height = 30
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object grdItems: TStringGrid
    Left = 24
    Top = 210
    Width = 465
    Height = 280
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 7
  end
  object nbbUnitPrice: TNumberBox
    Left = 332
    Top = 150
    Width = 121
    Height = 21
    Mode = nbmCurrency
    TabOrder = 4
    NegativeValueColor = clRed
  end
  object bntExcluirItem: TButton
    Left = 150
    Top = 177
    Width = 120
    Height = 30
    Caption = 'Excluir Item'
    TabOrder = 8
    OnClick = bntExcluirItemClick
  end
end
