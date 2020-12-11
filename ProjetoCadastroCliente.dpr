program ProjetoCadastroCliente;

uses
  Vcl.Forms,
  UCadastroCliente in 'UCadastroCliente.pas' {frmCadastroCliente},
  UDataModulo in 'UDataModulo.pas' {dm: TDataModule},
  URetornoCepJson in 'URetornoCepJson.pas',
  UEnvioEmail in 'UEnvioEmail.pas',
  UCriaXml in 'UCriaXml.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
