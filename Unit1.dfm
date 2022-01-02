object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Create dataset dinamico'
  ClientHeight = 268
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotalizador: TLabel
    Left = 287
    Top = 11
    Width = 57
    Height = 13
    Caption = 'Totalizador:'
  end
  object btnCriar: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Criar'
    TabOrder = 0
    OnClick = btnCriarClick
  end
  object btnRelacionar: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Relacionar'
    TabOrder = 1
    OnClick = btnRelacionarClick
  end
  object btnTotalizador: TButton
    Left = 8
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Totalizador'
    TabOrder = 2
    OnClick = btnTotalizadorClick
  end
  object edtFiltrar: TEdit
    Left = 120
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object btnFiltrar: TButton
    Left = 247
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 4
    OnClick = btnFiltrarClick
  end
  object btnLimparFiltro: TButton
    Left = 328
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Limpar Filtro'
    TabOrder = 5
    OnClick = btnLimparFiltroClick
  end
  object edtLocalizar: TEdit
    Left = 120
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object btnLocaizar: TButton
    Left = 247
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 7
    OnClick = btnLocaizarClick
  end
  object grid: TDBGrid
    Left = 0
    Top = 109
    Width = 415
    Height = 159
    Align = alBottom
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Visible = True
      end>
  end
  object edtTotalizador: TEdit
    Left = 346
    Top = 8
    Width = 57
    Height = 21
    TabOrder = 9
  end
end
