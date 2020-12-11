unit URetornoCepJson;

interface

uses
  System.JSON, Vcl.Forms, System.SysUtils, Winapi.Windows,REST.Client,REST.Types;

type TRetornoCepJson = class
  private
    Flogradouro: string;
    Fbairro: string;
    Fuf: string;
    Fcep: string;
    Flocalidade: string;
    Fcomplemento: string;
    procedure Setbairro(const Value: string);
    procedure Setcep(const Value: string);
    procedure Setcomplemento(const Value: string);
    procedure Setlocalidade(const Value: string);
    procedure Setlogradouro(const Value: string);
    procedure Setuf(const Value: string);
  published
  property cep:string read Fcep write Setcep;
  property logradouro:string read Flogradouro write Setlogradouro;
  property complemento:string read Fcomplemento write Setcomplemento;
  property bairro:string read Fbairro write Setbairro;
  property localidade:string read Flocalidade write Setlocalidade;
  property uf:string read Fuf write Setuf;
  function RetornaEnderecoPorCEPJson(cep: string) : Boolean;
end;

implementation



{ TRetornoCepJson }

function TRetornoCepJson.RetornaEnderecoPorCEPJson(cep: string): boolean;
  var
  retorno: TJSONObject;
  cepformatado:string;
  RESTRequest1: TRESTRequest;
  RESTClient1: TRESTClient;
begin
  try
    Result := false;
    cepformatado := Trim(StringReplace(cep,'_','',[rfReplaceAll]));
    cepformatado := Trim(StringReplace(cep,'-','',[rfReplaceAll]));

    if Length(cepformatado) < 8 then
    begin
      Application.MessageBox(PChar('CEP inválido'), 'Aviso', MB_OK + MB_ICONWARNING);
      exit;
    end;

    try
      RESTClient1 := TRESTClient.Create(nil);
      RESTClient1.BaseURL :='http://viacep.com.br/';

      RESTRequest1 := TRESTRequest.Create(nil);
      RESTRequest1.Client := RESTClient1;
      RESTRequest1.Resource := 'ws/{CEP}/json/';
      RESTRequest1.Params.AddUrlSegment('CEP',cepformatado);
      RESTRequest1.Execute;
      retorno := RESTRequest1.Response.JSONValue as TJSONObject;

      cep         := StringReplace(retorno.GetValue('cep').Value,'-','',[rfReplaceAll]);
      logradouro  := UpperCase(retorno.GetValue('logradouro').Value);
      complemento := UpperCase(retorno.GetValue('complemento').Value);
      bairro      := UpperCase(retorno.GetValue('bairro').Value);
      localidade  := UpperCase(retorno.GetValue('localidade').Value);
      uf          := UpperCase(retorno.GetValue('uf').Value);
    except
      try
        Result := strToBool(retorno.GetValue('erro').Value);
      except
        Application.MessageBox(PChar('Falha ao consultar CEP!'), 'Aviso', MB_OK + MB_ICONWARNING);
      end;
      if Result then
         Application.MessageBox(PChar('CEP inválido ou não cadastrado na base de dados'), 'Aviso', MB_OK + MB_ICONWARNING)
    end;
  finally
    if Assigned(RESTClient1)then
      RESTClient1.Free;
    if Assigned(RESTRequest1)then
      RESTRequest1.Free;
  end;
end;

procedure TRetornoCepJson.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TRetornoCepJson.Setcep(const Value: string);
begin
  Fcep := Value;
end;

procedure TRetornoCepJson.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TRetornoCepJson.Setlocalidade(const Value: string);
begin
  Flocalidade := Value;
end;

procedure TRetornoCepJson.Setlogradouro(const Value: string);
begin
  Flogradouro := Value;
end;

procedure TRetornoCepJson.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
