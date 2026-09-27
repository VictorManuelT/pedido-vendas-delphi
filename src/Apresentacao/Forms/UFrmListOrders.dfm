object FrmListOrders: TFrmListOrders
  Left = 0
  Top = 0
  Caption = 'FrmListOrders'
  ClientHeight = 400
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object grdOrders: TStringGrid
    Left = 8
    Top = 5
    Width = 608
    Height = 353
    ColCount = 4
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object bntNovoPedido: TButton
    Left = 8
    Top = 364
    Width = 83
    Height = 25
    Caption = 'Novo Pedido'
    TabOrder = 1
    OnClick = bntNovoPedidoClick
  end
  object bntEdit: TButton
    Left = 104
    Top = 364
    Width = 83
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = bntEditClick
  end
  object bntExcluir: TButton
    Left = 193
    Top = 364
    Width = 83
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = bntExcluirClick
  end
  object btnClose: TButton
    Left = 519
    Top = 364
    Width = 90
    Height = 30
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnCloseClick
  end
end
