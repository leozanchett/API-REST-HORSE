program eTagProject;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse, Horse.Etag, Horse.Jhonson, System.JSON;

var
  APP: THorse;
begin
  APP := THorse.Create(9000);
  APP.Use(Jhonson).Use(Etag);

  APP.Get('login',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc) begin
      Res.Send<TJsonObject>(TJsonObject.Create.AddPair('login', 'Leo'));
    end
    );

  APP.Listen(9000);
end.
