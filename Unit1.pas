unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    btnCriar: TButton;
    btnRelacionar: TButton;
    btnTotalizador: TButton;
    edtFiltrar: TEdit;
    btnFiltrar: TButton;
    btnLimparFiltro: TButton;
    edtLocalizar: TEdit;
    btnLocaizar: TButton;
    grid: TDBGrid;
    edtTotalizador: TEdit;
    lblTotalizador: TLabel;
    procedure btnCriarClick(Sender: TObject);
    procedure btnRelacionarClick(Sender: TObject);
    procedure btnTotalizadorClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLocaizarClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
  private
    FClientDataSet: TClientDataSet;
    FDataSource: TDataSource;
    procedure SetFClientDataSet(const Value: TClientDataSet);
    procedure SetFDataSource(const Value: TDataSource);
  public
    property ClientDataSet: TClientDataSet read FClientDataSet write SetFClientDataSet;
    property DataSource: TDataSource read FDataSource write SetFDataSource;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnCriarClick(Sender: TObject);
begin
  ClientDataSet := TClientDataSet.Create(Self);

  ClientDataSet.FieldDefs.Add('CODIGO', ftInteger);
  ClientDataSet.FieldDefs.Add('DESCRICAO', ftString, 60);
  ClientDataSet.FieldDefs.Add('VALOR', ftFloat);
  ClientDataSet.CreateDataSet;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('CODIGO').AsInteger := 1;
  ClientDataSet.FieldByName('DESCRICAO').AsString := 'AGULHA';
  ClientDataSet.FieldByName('VALOR').AsFloat := 1.05;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('CODIGO').AsInteger := 2;
  ClientDataSet.FieldByName('DESCRICAO').AsString := 'ESTOPA';
  ClientDataSet.FieldByName('VALOR').AsFloat := 2.15;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('CODIGO').AsInteger := 3;
  ClientDataSet.FieldByName('DESCRICAO').AsString := 'FOLHA';
  ClientDataSet.FieldByName('VALOR').AsFloat := 3.05;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('CODIGO').AsInteger := 4;
  ClientDataSet.FieldByName('DESCRICAO').AsString := 'PARACETAMOL';
  ClientDataSet.FieldByName('VALOR').AsFloat := 2.35;
  ClientDataSet.Post;

  // cursor move para o primeiro registro
  ClientDataSet.First;
end;

procedure TForm1.btnFiltrarClick(Sender: TObject);
begin
  ClientDataSet.Filter   := 'DESCRICAO LIKE ' + QuotedStr(UpperCase(edtFiltrar.Text) + '%');
  ClientDataSet.Filtered := True;
end;

procedure TForm1.btnLimparFiltroClick(Sender: TObject);
begin
  ClientDataSet.Filter := '';
  edtFiltrar.Text   := '';
  edtLocalizar.Text := '';
end;

procedure TForm1.btnLocaizarClick(Sender: TObject);
begin
    // locate atualiza o dataset retornando o cursor para o primeiro registro
{  if ClientDataSet.Locate('DESCRICAO', edtLocalizar.Text, [loCaseInsensitive]) then
    ShowMessage('encontrado')
  else
    ShowMessage('nao encontrado');
}

  if not VarIsNull(ClientDataSet.Lookup('DESCRICAO', UpperCase(edtLocalizar.Text), 'DESCRICAO'))then
    ShowMessage('encontrado')
  else
    ShowMessage('nao encontrado');
end;

procedure TForm1.btnRelacionarClick(Sender: TObject);
begin
  DataSource := TDataSource.Create(Self);
  DataSource.DataSet := ClientDataSet;
  grid.DataSource    := DataSource;
end;

procedure TForm1.btnTotalizadorClick(Sender: TObject);
begin
  with ClientDataSet.Aggregates.Add do
  begin
    AggregateName := 'ValorTotal';
    Name          := 'valortotal';
    Expression    := 'SUM(VALOR)';
    Active        := True;
  end;
  ClientDataSet.AggregatesActive := True;
  edtTotalizador.Text := FloatToStr(ClientDataSet.Aggregates.Items[0].Value);
end;

procedure TForm1.SetFClientDataSet(const Value: TClientDataSet);
begin
  FClientDataSet := Value;
end;

procedure TForm1.SetFDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

end.
