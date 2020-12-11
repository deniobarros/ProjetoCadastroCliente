unit UEnvioEmail;

interface
  type TEnvioEmail = class
  private
    Fservidor: string;
    Fdestinatario: string;
    Fcopiaoculta: string;
    Fanexo: string;
    Fcopia: string;
    Fremetente: string;
    Fsenha: string;
    Fporta: integer;
    Fassunto: string;
    Fmensagem: string;
    procedure Setanexo(const Value: string);
    procedure Setassunto(const Value: string);
    procedure Setcopia(const Value: string);
    procedure Setcopiaoculta(const Value: string);
    procedure Setdestinatario(const Value: string);
    procedure Setporta(const Value: integer);
    procedure Setremetente(const Value: string);
    procedure Setsenha(const Value: string);
    procedure Setservidor(const Value: string);
    procedure Setmensagem(const Value: string);
  published
   property servidor:string read Fservidor write Setservidor;
   property porta:integer read Fporta write Setporta;
   property remetente:string read Fremetente write Setremetente;
   property senha:string read Fsenha write Setsenha;
   property destinatario:string read Fdestinatario write Setdestinatario;
   property assunto:string read Fassunto write Setassunto;
   property mensagem:string read Fmensagem write Setmensagem;
   property anexo:string read Fanexo write Setanexo;
   property copia:string read Fcopia write Setcopia;
   property copiaoculta:string read Fcopiaoculta write Setcopiaoculta;
   function EnviarEmail:Boolean;
  end;
implementation

uses
  IdMessage, IdSMTP, IdSSLOpenSSL, System.SysUtils,
  IdExplicitTLSClientServerBase, IdAttachmentFile, Vcl.Forms, Winapi.Windows;

{ TEnvioEmail }

function TEnvioEmail.EnviarEmail: Boolean;
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;

begin
  try
    SMTP := TIdSMTP.Create(nil);
    DATA := TIdMessage.Create(nil);
    SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

    SSL.SSLOptions.Method := sslvSSLv23;
    SSL.SSLOptions.Mode := sslmClient;

    DATA.From.Address := remetente;
    DATA.Recipients.EMailAddresses := LowerCase(destinatario);

    if copia <> emptystr then
      DATA.CCList.EMailAddresses  := copia;

    if copiaoculta <> emptystr then
      DATA.BCCList.EMailAddresses := copiaoculta;

    DATA.subject   := assunto;
    DATA.body.text := mensagem;

    SMTP.IOHandler := SSL;
    SMTP.UseTLS    := utUseExplicitTLS;
    SMTP.AuthType  := satDefault;
    SMTP.Host      := servidor;
    SMTP.Port      := porta;
    SMTP.username  := remetente;
    SMTP.password  := senha;

    try
      SMTP.Connect;
      SMTP.Authenticate;
    except on E:Exception do
      begin
        Application.MessageBox(PChar('Erro na autenticação: ' + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
        Result := False;
      end;
    end;

    if anexo <> EmptyStr then
      if FileExists(anexo) then
        TIdAttachmentFile.Create(Data.MessageParts, anexo);

    if SMTP.Connected then
    begin
      try
        SMTP.Send(DATA);
        Application.MessageBox(PChar('Email Enviado!'), 'Aviso', MB_OK + MB_ICONINFORMATION);
        Result := True;
      except on E:Exception do
        begin
          Application.MessageBox(PChar('Erro ao tentar enviar: ' + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
          Result := False;
        end;
      end;
    end;

    if SMTP.Connected then
      SMTP.Disconnect;
  finally
    UnLoadOpenSSLLibrary;
    SMTP.Free;
    DATA.Free;
    SSL.Free;
  end;
end;

procedure TEnvioEmail.Setanexo(const Value: string);
begin
  Fanexo := Value;
end;

procedure TEnvioEmail.Setassunto(const Value: string);
begin
  Fassunto := Value;
end;

procedure TEnvioEmail.Setcopia(const Value: string);
begin
  Fcopia := Value;
end;

procedure TEnvioEmail.Setcopiaoculta(const Value: string);
begin
  Fcopiaoculta := Value;
end;

procedure TEnvioEmail.Setdestinatario(const Value: string);
begin
  Fdestinatario := Value;
end;

procedure TEnvioEmail.Setmensagem(const Value: string);
begin
  Fmensagem := Value;
end;

procedure TEnvioEmail.Setporta(const Value: integer);
begin
  Fporta := Value;
end;

procedure TEnvioEmail.Setremetente(const Value: string);
begin
  Fremetente := Value;
end;

procedure TEnvioEmail.Setsenha(const Value: string);
begin
  Fsenha := Value;
end;

procedure TEnvioEmail.Setservidor(const Value: string);
begin
  Fservidor := Value;
end;

end.
