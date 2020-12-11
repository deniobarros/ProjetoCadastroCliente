unit UCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, System.JSON, IPPeerClient,
  Data.Bind.Components, Data.Bind.ObjectScope,REST.Client,REST.Types, Vcl.Grids,
  Vcl.DBGrids, Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc,IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage,IdAttachmentFile,
  URetornoCepJson, UEnvioEmail, UCriaXml;

type
  TfrmCadastroCliente = class(TForm)
    dsCliente: TDataSource;
    pnEndereco: TPanel;
    Label7: TLabel;
    edtLogradouro: TDBEdit;
    Label8: TLabel;
    edtNumero: TDBEdit;
    Label9: TLabel;
    edtComplemento: TDBEdit;
    Label10: TLabel;
    edtBairro: TDBEdit;
    Label11: TLabel;
    edtCidade: TDBEdit;
    Label12: TLabel;
    edtEstado: TDBEdit;
    Label13: TLabel;
    edtPais: TDBEdit;
    Label6: TLabel;
    edtCep: TDBEdit;
    Label14: TLabel;
    pnCliente: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    edtNome: TDBEdit;
    edtRG: TDBEdit;
    edtCPF: TDBEdit;
    edtTelefone: TDBEdit;
    edtEmail: TDBEdit;
    pnPrincipal: TPanel;
    pnBotoes: TPanel;
    btnAdicionar: TSpeedButton;
    btnEditar: TSpeedButton;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    XMLDocument1: TXMLDocument;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnSair: TSpeedButton;
    btnEnviarEmail: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnEditarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCepExit(Sender: TObject);
    procedure edtCepEnter(Sender: TObject);
    procedure edtCepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherEndereco(Edit: TDBEdit;Valor:String);
    procedure HabilitaCampos(control: Boolean);
    procedure EnviarXML;
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;
  retornoCepJson :TRetornoCepJson;
  envioEmail: TEnvioEmail;
  criaXml: TCriaXML;

implementation

{$R *.dfm}
uses
  uDataModulo, System.SysUtils;
{ TForm1 }

procedure TfrmCadastroCliente.edtCepClick(Sender: TObject);
begin
  TDBEdit(Sender).SelStart := 0;
end;

procedure TfrmCadastroCliente.edtCepEnter(Sender: TObject);
begin
  TDBEdit(Sender).SelStart := 0;
end;

procedure TfrmCadastroCliente.edtCepExit(Sender: TObject);
begin
  with retornoCepJson do
  begin
    if not RetornaEnderecoPorCEPJson(edtCep.Text) then
    begin
      PreencherEndereco(edtLogradouro,logradouro);
      PreencherEndereco(edtComplemento,complemento);
      PreencherEndereco(edtBairro,bairro);
      PreencherEndereco(edtCidade,localidade);
      PreencherEndereco(edtEstado,uf);
    end
    else
    begin
      edtLogradouro.SetFocus;
      dm.memClienteLogradouro.AsString := emptystr;
      dm.memClienteBairro.AsString := emptystr;
      dm.memClienteComplemento.AsString := emptystr;
      dm.memClienteCidade.AsString := emptystr;
      dm.memClienteEstado.AsString := emptystr;
    end;
  end;
end;

procedure TfrmCadastroCliente.EnviarXML;
begin
  if (dm.memClienteNome.AsString <> emptystr) and (dm.memClienteEmail.AsString <> emptystr) then
  begin
    if dm.memCliente.State in [dsEdit,dsInsert] then dm.memCliente.Post;

    with criaXml do
    begin
      diretorioarquivo := ExtractFilePath(Application.ExeName);
      nomearquivo      := dm.memClienteNome.AsString;
      dataset          := dm.memCliente;
      DataSetParaXml('cliente');
    end;

    with envioEmail do
    begin
      servidor     := 'smtp.gmail.com';
      porta        := 587;
      remetente    := 'envioemailxml@gmail.com';
      senha        := '15092019';
      destinatario := dm.memClienteEmail.AsString;
      assunto      := 'Cadastro efetuado';
      mensagem     := 'Segue em anexo o arquivo xml';
      anexo        := criaXml.diretorioarquivo+criaXml.nomearquivo;
      EnviarEmail;
      deletefile(anexo);
    end;

  end
  else Application.MessageBox(PChar('Nome e Email devem ser preenchidos!'), 'Aviso', MB_OK + MB_ICONWARNING);
end;

procedure TfrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(criaXml);
  FreeAndNil(envioEmail);
  FreeAndNil(retornoCepJson);
  Action := caFree;
  frmCadastroCliente := nil;
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  retornoCepJson := TRetornoCepJson.Create;
  envioEmail     := TEnvioEmail.Create;
  criaXml        := TCriaXML.Create;
end;

procedure TfrmCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
  HabilitaCampos(False);
end;

procedure TfrmCadastroCliente.HabilitaCampos(control: Boolean);
var
  I: Integer;
begin
  for I := 0 to pnCliente.ControlCount -1 do
    if pnCliente.Controls[I] is TDBEdit then
       TDBEdit(pnCliente.Controls[I]).Enabled := control;
  for I := 0 to pnEndereco.ControlCount -1 do
    if pnEndereco.Controls[I] is TDBEdit then
       TDBEdit(pnEndereco.Controls[I]).Enabled := control;
end;

procedure TfrmCadastroCliente.PreencherEndereco(Edit :TDBEdit; Valor:String);
begin
  dm.memCliente.FieldByName(Edit.DataField).AsString := Valor;
  if Valor <> emptystr
  then Edit.Enabled := False
  else Edit.Enabled := True;
end;

procedure TfrmCadastroCliente.btnAdicionarClick(Sender: TObject);
begin
  HabilitaCampos(True);
  dm.memCliente.Append;
  edtNome.SetFocus;
end;

procedure TfrmCadastroCliente.btnAnteriorClick(Sender: TObject);
begin
  if not (dm.memCliente.State in [dsInsert,dsEdit]) then
    dm.memCliente.Prior;
end;

procedure TfrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  if dm.memCliente.State in [dsEdit, dsInsert] then
  begin
    dm.memCliente.CancelUpdates;
    HabilitaCampos(False);
  end;
end;

procedure TfrmCadastroCliente.btnEditarClick(Sender: TObject);
begin
  if dm.memCliente.RecordCount > 0 then
  begin
    HabilitaCampos(True);
    dm.memCliente.Edit;
  end
  else Application.MessageBox(PChar('Não há registros para editar!'), 'Aviso', MB_OK + MB_ICONWARNING);
end;

procedure TfrmCadastroCliente.btnEnviarEmailClick(Sender: TObject);
begin
  if dm.memCliente.State in [dsEdit,dsInsert] then dm.memCliente.Post;
    EnviarXML;
end;

procedure TfrmCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  if dm.memCliente.RecordCount > 0 then
  begin
    dm.memCliente.Delete;
    HabilitaCampos(False);
    Application.MessageBox(PChar('Registro excluído!'), 'Aviso', MB_OK + MB_ICONINFORMATION);
  end
  else Application.MessageBox(PChar('Não há registros para excluir!'), 'Aviso', MB_OK + MB_ICONWARNING);
end;

procedure TfrmCadastroCliente.btnPrimeiroClick(Sender: TObject);
begin
  if not (dm.memCliente.State in [dsInsert,dsEdit]) then
    dm.memCliente.First;
end;

procedure TfrmCadastroCliente.btnProximoClick(Sender: TObject);
begin
  if not (dm.memCliente.State in [dsInsert,dsEdit]) then
    dm.memCliente.Next;
end;

procedure TfrmCadastroCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroCliente.btnUltimoClick(Sender: TObject);
begin
  if not (dm.memCliente.State in [dsInsert,dsEdit]) then
    dm.memCliente.Prior;
end;

end.
