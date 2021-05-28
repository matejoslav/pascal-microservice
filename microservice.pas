program microservice;

{$mode objfpc}{$H+}uses
  {$IFDEF UNIX}cthreads, cmem,{$ENDIF}
  SysUtils, fphttpapp, httpdefs, httproute, fpjson, jsonparser;

procedure jsonResponse(var res: TResponse; data: String);
begin
  res.Content := data;
  res.Code := 200;
  res.ContentType := 'application/json';
  res.ContentLength := length(res.Content);
  res.SendContent;
end;

procedure timeEndpoint(req: TRequest; res: TResponse);
var
  jObject : TJSONObject;
begin
  jObject := TJSONObject.Create;
  try
    jObject.Strings['time'] := TimeToStr(Time);
    jsonResponse(res, jObject.AsJSON);
  finally
    jObject.Free;
  end;
end;

procedure greetingEndpoint(req: TRequest; res: TResponse);
var
  jObject : TJSONObject;
begin
  jObject := TJSONObject.Create;
  try
    jObject.Strings['greeting'] := 'Hello, ' + req.RouteParams['name'];
    jsonResponse(res, jObject.AsJSON);
  finally
    jObject.Free;
  end;
end;

begin
  Application.Port := 9080;
  HTTPRouter.RegisterRoute('/time', @timeEndpoint, true);
  HTTPRouter.RegisterRoute('/greeting/:name', @greetingEndpoint);
  Application.Threaded := true;
  Application.Initialize;
  Application.Run;
end.
