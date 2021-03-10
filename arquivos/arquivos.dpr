program arquivos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream,
  System.Classes,
  System.SysUtils, CaminhosPC;

var
  AHorse: THorse;
begin
  AHorse := THorse.Create;
  AHorse.Use(OctetStream);


  AHorse.Get('/stream',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TFileStream;
    begin
      LStream := TFileStream.Create(ImagemOriginal,  fmOpenRead);
      Res.Send<TStream>(LStream);
    end
  );

  AHorse.post('/stream',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TMemoryStream;
      Buffer: PByte;
    begin
      LStream := Req.Body<TMemoryStream>;
      LStream.SaveToFile(ImagemCopiada);
      Res.Send('Imagem cadastrada com sucesso !').Status(THTTPStatus.Created);
    end
  );

  AHorse.Listen(9000);
end.
