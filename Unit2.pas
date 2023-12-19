unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Backend.ServiceTypes, System.JSON,
  REST.Backend.EMSServices, REST.Client, REST.Backend.EndPoint,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.EMSProvider;

type
  TForm2 = class(TForm)
    EMSProvider1: TEMSProvider;
    RESTResponse1: TRESTResponse;
    BackendEndpoint1: TBackendEndpoint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
