unit UCriaXml;

interface

uses
  Data.DB, Xml.XMLIntf, Vcl.Forms, System.SysUtils,Xml.xmldom, Xml.XmlTransform, Xml.XMLDoc;

type TCriaXml = class
  private
    Fdataset: TDataSet;//dataset onde será extraído os nomes dos Fields para serem colocados nas tags do arquivo XML
    Fdiretorioarquivo: string; //diretório onde se encontra o arquivo
    Fnomearquivo: string; //nome do arquivo com a extensão
    procedure Setdataset(const Value: TDataSet);
    procedure Setdiretorioarquivo(const Value: string);
    procedure Setnomearquivo(const Value: string);
  published
  property diretorioarquivo:string read Fdiretorioarquivo write Setdiretorioarquivo;
  property nomearquivo:string read Fnomearquivo write Setnomearquivo;
  property dataset: TDataSet read Fdataset write Setdataset;
  procedure DataSetParaXml(NomeNivel:string);
end;

implementation


{ TCriaXml }

procedure TCriaXml.DataSetParaXml(NomeNivel: string);
var
  Nivel : IXMLNode;
  XMLDocument1 : TXMLDocument;
  I,NodesCount:Integer;
begin
  try
    nomearquivo := StringReplace(StringReplace(DateTimeToStr(Now)+' '+copy(nomearquivo, 0, POS(' ',nomearquivo)),'/','',[rfReplaceAll]),':','',[rfReplaceAll])+'.xml';

    XMLDocument1 := TXMLDocument.Create(nil);
    XMLDocument1.Active   := True;
    XMLDocument1.Version  := '1.0';
    XMLDocument1.Encoding := 'UTF-8';
    Nivel := XMLDocument1.AddChild(NomeNivel);
    for I := 0 to dataset.FieldCount -1 do
    begin
      if dataset.Fields[I].DisplayName <> emptystr then
        Nivel.AddChild(dataset.Fields[I].DisplayName).Text := dataset.Fields[I].AsString
      else if dataset.Fields[I].FieldName <> emptystr then
        Nivel.AddChild(dataset.Fields[I].FieldName).Text   := dataset.Fields[I].AsString;
    end;
    XMLDocument1.SaveToFile(diretorioarquivo+nomearquivo);
  finally
    NodesCount := XMLDocument1.ChildNodes.Count -1;
    for I := 1 to NodesCount do
      XMLDocument1.ChildNodes.Delete(I);
    XMLDocument1.Active := False;
  end;
end;

procedure TCriaXml.Setdataset(const Value: TDataSet);
begin
  Fdataset := Value;
end;

procedure TCriaXml.Setdiretorioarquivo(const Value: string);
begin
  Fdiretorioarquivo := Value;
end;

procedure TCriaXml.Setnomearquivo(const Value: string);
begin
  Fnomearquivo := Value;
end;

end.
