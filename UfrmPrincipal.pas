unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    edtProduto: TEdit;
    edtQtd: TEdit;
    edtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnPedido: TButton;
    fdqProduto: TFDQuery;
    fdqProdutoidproduto: TFDAutoIncField;
    fdqProdutoproduto_descricao: TStringField;
    fdqProdutoproduto_precovenda: TFloatField;
    dsTemp: TDataSource;
    fdmTempPedido: TFDMemTable;
    fdmTempPedidoCodigo: TIntegerField;
    fdmTempPedidoDescricao: TStringField;
    fdmTempPedidoQtd: TIntegerField;
    fdmTempPedidoValor: TFloatField;
    fdmTempPedidoTotal: TFloatField;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lblTotalPedido: TLabel;
    btnGravar: TButton;
    fdqCliente: TFDQuery;
    Label4: TLabel;
    edtCliente: TEdit;
    InseriPedido: TFDQuery;
    GroupBox4: TGroupBox;
    InseriItensPedido: TFDQuery;
    fdqPedidos: TFDQuery;
    DBGrid2: TDBGrid;
    dsPedidos: TDataSource;
    DBGrid4: TDBGrid;
    fdqItensPedido: TFDQuery;
    dsItens_Pedidos: TDataSource;
    fdqItensPedidopedido: TIntegerField;
    fdqItensPedidoproduto: TIntegerField;
    fdqItensPedidoqtd: TIntegerField;
    fdqItensPedidovalor_unitario: TFloatField;
    fdqItensPedidoproduto_descricao: TStringField;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    edtPedido: TEdit;
    Label5: TLabel;
    fdqPesqPedido: TFDQuery;
    fdqDelPedido: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    DateField1: TDateField;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    fdqClienteidcliente: TFDAutoIncField;
    fdqClientenomeCliente: TStringField;
    fdqPesqPedidoidpedido: TFDAutoIncField;
    fdqPesqPedidodt_emissao: TDateField;
    fdqPesqPedidocliente: TIntegerField;
    fdqPesqPedidonomecliente: TStringField;
    fdqPedidosidpedido: TIntegerField;
    fdqPedidosdt_emissao: TDateField;
    fdqPedidoscliente: TIntegerField;
    fdqPedidosnomeCliente: TStringField;
    fdqPesqPedidovalor_total: TFloatField;
    fdqPedidosvalor_total: TFloatField;
    fdqClientecidadeCliente: TStringField;
    fdqClienteUFCliente: TStringField;
    procedure btnPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fdmTempPedidoAfterPost(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function ValidaPedido: Boolean;
    function ValidaCliente: Boolean;
    function ItemPedido: Boolean;
    procedure GravaPedido;
    procedure PesquisaProduto(codigo:Integer);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
    if ValidaCliente then
    begin
      GravaPedido;
      fdmTempPedido.EmptyDataset;
    end;
end;

procedure TfrmPrincipal.btnPedidoClick(Sender: TObject);
var
  total: Double;
begin

    if ValidaPedido then
    begin
      //PesquisaProduto(strtoint(edtProduto.Text));
      // grava na tabela temporaria
      if fdmTempPedido.State in [dsEdit] then
      begin

        //fdmTempPedido.Append;
        fdmTempPedidoCodigo.AsInteger   :=  StrToInt(edtProduto.Text);
        fdmTempPedidoDescricao.AsString :=  fdqProdutoproduto_descricao.AsString;
        fdmTempPedidoQtd.AsInteger      :=  StrToInt(edtQtd.Text);
        fdmTempPedidoValor.AsFloat      :=  StrToFloat(edtValor.Text);
        fdmTempPedidoTotal.AsFloat      :=  StrToInt(edtQtd.Text) *  StrToFloat(edtValor.Text);
        fdmTempPedido.Post;
        fdmTempPedido.Refresh;
        edtProduto.Text := '';
        edtQtd.Text := '';
        edtValor.Text := '';

      end
      else
      begin

        fdmTempPedido.Append;
        fdmTempPedidoCodigo.AsInteger   :=  StrToInt(edtProduto.Text);
        fdmTempPedidoDescricao.AsString :=  fdqProdutoproduto_descricao.AsString;
        fdmTempPedidoQtd.AsInteger      :=  StrToInt(edtQtd.Text);
        fdmTempPedidoValor.AsFloat      :=  StrToFloat(edtValor.Text);
        fdmTempPedidoTotal.AsFloat      :=  StrToInt(edtQtd.Text) *  StrToFloat(edtValor.Text);
        fdmTempPedido.Post;
        fdmTempPedido.Refresh;
        edtProduto.Text := '';
        edtQtd.Text := '';
        edtValor.Text := '';

      end;
    end;

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  if (Length(edtPedido.Text)=0) or (StrToInt(edtPedido.Text)=0) then
  begin
    ShowMessage('? necess?rio informar um c?digo de pedido v?lido!');
    //Result := false;
    Exit;
  end
  else
  begin
    with fdqPesqPedido do
    begin
      Close;
      Params.ParamByName('pedido').Value := StrToInt(edtPedido.Text);
      Open();
      Refresh;
    end;
    itemPedido;
   end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if Application.MessageBox('Tem certeceza que deseja deletar este registro?', 'Aviso do sistema', mb_YesNo+mb_iconinformation)=idno then
        Abort
  else
  begin
    with fdqDelPedido do
    begin
      Close;
      Params.ParamByName('pedido').Value := StrToInt(edtPedido.Text);
      execSql;
    end;
    with fdqPesqPedido do
    begin
      Close;
      Open();
      Refresh;
    end;
    with fdqPedidos do
    begin
      Close;
      Open();
      Refresh;
    end;

  end;

end;

procedure TfrmPrincipal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin

      // Edita tabela temporaria
      fdmTempPedido.edit;
      edtProduto.Text := IntToStr(fdmTempPedidoCodigo.AsInteger);
      edtQtd.Text := IntToStr(fdmTempPedidoQtd.AsInteger);
      edtValor.Text := FloatToStr(fdmTempPedidoValor.AsFloat);
      //fdmTempPedido.Post;
      //fdmTempPedido.Refresh;

  end;

  if key = VK_DELETE then
  begin
  //  fdmTempPedido.Edit;
    if Application.MessageBox('Tem certeceza que deseja deletar este registro?', 'Aviso do sistema', mb_YesNo+mb_iconinformation)=idno then
           Abort
    else
    begin
      fdmTempPedido.Delete;
      fdmTempPedido.Edit;
      fdmTempPedido.Post;
      fdmTempPedido.Refresh;
    end;
  end;

end;

procedure TfrmPrincipal.fdmTempPedidoAfterPost(DataSet: TDataSet);
var
  total: Double;
begin
  total:=0;
  fdmTempPedido.First;
  while not fdmTempPedido.Eof do
  begin
    total:=total + fdmTempPedidoTotal.AsFloat;
    fdmTempPedido.Next;
  end;
  lblTotalPedido.Caption:=FormatFloat('#,,,,0.00', total);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fdmTempPedido.Active:=true;
end;

procedure TfrmPrincipal.GravaPedido;
var
  nPedido:integer;
begin

  try

   with InseriPedido do
   begin
     //Close;
     Prepare;
     Params.ParamByName('data').Value     := Date;
     Params.ParamByName('cliente').Value  := StrToInt(edtCliente.Text);
     Params.ParamByName('valor').Value    := StrToFloat(lblTotalPedido.Caption) ;
     ExecSQL;
   end;

   with fdqPedidos do
   begin
     Close;
     Open();
     Refresh;
   end;

   nPedido:=fdqPedidosidpedido.AsInteger;

   with fdqPesqPedido do
   begin
     Close;
     Params.ParamByName('pedido').Value := nPedido;
     Open();
     Refresh;
   end;


   fdmTempPedido.First;
   while not fdmTempPedido.Eof do
   begin
     with InseriItensPedido do
     begin
       //Close;
       Prepare;
       Params.ParamByName('pedido').Value   := nPedido;
       Params.ParamByName('produto').Value  := fdmTempPedidoCodigo.AsInteger;
       Params.ParamByName('qtd').Value      := fdmTempPedidoQtd.AsInteger;
       Params.ParamByName('unitario').Value := fdmTempPedidoValor.AsFloat;
       Params.ParamByName('total').Value    := fdmTempPedidoTotal.AsFloat;
       ExecSQL;
     end;

    fdmTempPedido.Next;
   end;

   ItemPedido;
   edtCliente.Text  := '';

  except on E: Exception do
  begin
    Application.MessageBox(pchar('Erro inexperado ao tentar conex?o com o banco de dados.'+#13+#13+e.Message),'Pedidos', MB_OK+MB_ICONERROR);
  end;

  end;
end;

procedure TfrmPrincipal.PesquisaProduto(codigo: Integer);
begin
  with fdqProduto do
  begin
    Close;
    Params.ParamByName('codigo').Value:=codigo;
    Open();
  end;

  if fdqProduto.RecordCount=0 then
  begin
    ShowMessage('O produto informado n?o foi localizado!');
    Exit;
  end;
end;

function TfrmPrincipal.ValidaCliente: Boolean;
begin
  Result:=true;

  if (Length(edtCliente.Text)=0) or (StrToInt(edtCliente.Text)=0) then
  begin
    ShowMessage('? necess?rio informar um c?digo de cliente v?lido!');
    Result := false;
    Exit;
  end
  else
  begin
    with fdqCliente do
    begin
      Close;
      Params.ParamByName('cliente').Value:=StrToInt(edtCliente.Text);
      Open();
    end;

    if fdqCliente.RecordCount=0 then
    begin
      ShowMessage('O cliente informado n?o foi localizado!');
      Result := false;
      Exit;
    end;
  end;

end;

function TfrmPrincipal.ValidaPedido: Boolean;
begin
  Result:=true;

  if (Length(edtProduto.Text)=0) or (StrToInt(edtProduto.Text)=0) then
  begin
    ShowMessage('? necess?rio informar um c?digo de produto v?lido!');
    Result := false;
    Exit;
  end
  else
  begin
    with fdqProduto do
    begin
      Close;
      Params.ParamByName('codigo').Value:=StrToInt(edtProduto.Text);
      Open();
    end;

    if fdqProduto.RecordCount=0 then
    begin
      ShowMessage('O produto informado n?o foi localizado!');
      Result := false;
      Exit;
    end;
  end;

  if (Length(edtQtd.Text)=0) or (StrToInt(edtQtd.Text)=0) then
  begin
    ShowMessage('? necess?rio informar uma quantidade de produto v?lido!');
    Result := false;
    Exit;
  end;

  if (Length(edtValor.Text)=0) or (StrToInt(edtValor.Text)=0) then
  begin
    ShowMessage('? necess?rio informar um valor v?lido!');
    Result := false;
    Exit;
  end;

end;

function TfrmPrincipal.ItemPedido: Boolean;
begin
  Result:=true;
  with fdqItensPedido do
  begin
    Close;
    Params.ParamByName('pedido').Value := fdqPesqPedidoIdpedido.value;
    Open();
    lblTotalPedido.Caption:=FormatFloat('#,,,,0.00', fdqPesqPedidoValor_total.Value);
  end;

end;

end.
