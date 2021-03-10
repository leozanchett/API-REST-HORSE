unit Services.bairro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TServiceBairro = class(TDataModule)
    mtBairros: TFDMemTable;
    mtBairrosID: TIntegerField;
    mtBairrosNOME: TStringField;
  private

  public
    function ListarBairros: TDataSet;
  end;

implementation


{$R *.dfm}

{ TServiceBairro }

function TServiceBairro.ListarBairros: TDataSet;
var
  i : integer;
begin
  mtBairros.Open;
  Result := mtBairros;
  for I := 1 to 200 do begin
    mtBairros.Append;
    mtBairrosNOME.AsString := concat('Bairro (',i.ToString,')');
    mtBairros.Post;
  end;
end;

end.
