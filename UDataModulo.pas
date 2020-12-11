unit UDataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    memCliente: TFDMemTable;
    memClienteNome: TStringField;
    memClienteIdentidade: TStringField;
    memClienteTelefone: TStringField;
    memClienteEmail: TStringField;
    memClienteCep: TStringField;
    memClienteLogradouro: TStringField;
    memClienteNumero: TIntegerField;
    memClienteComplemento: TStringField;
    memClienteBairro: TStringField;
    memClienteCidade: TStringField;
    memClienteEstado: TStringField;
    memClientePais: TStringField;
    memClienteCPF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  memCliente.Active := True;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  memCliente.Active := False;
end;

end.
