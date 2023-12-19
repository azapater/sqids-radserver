unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.StdCtrls, REST.Types, Vcl.ComCtrls,
  REST.Backend.EMSProvider, REST.Backend.ServiceTypes, System.JSON,
  REST.Backend.EMSServices, REST.Backend.EndPoint, Vcl.ExtCtrls;

type
  TMain = class(TForm)
    mmResp: TMemo;
    RESTResponse1: TRESTResponse;
    mmReq: TMemo;
    EMSProvider1: TEMSProvider;
    BackendEndpoint1: TBackendEndpoint;
    Panel1: TPanel;
    btnDelete: TButton;
    btnPost: TButton;
    btnPut: TButton;
    btnGet: TButton;
    bntList: TButton;
    edtPage: TEdit;
    UpDown1: TUpDown;
    Label4: TLabel;
    edtOrderID: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    lblRequest: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure bntListClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnPutClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure edtPageChange(Sender: TObject);
    procedure BackendEndpoint1AfterExecute(Sender: TCustomRESTRequest);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.edtPageChange(Sender: TObject);
begin
  bntListClick(nil);
end;

procedure TMain.BackendEndpoint1AfterExecute(Sender: TCustomRESTRequest);
begin
  var lMethodType: string;
  if BackendEndpoint1.Method = rmGET then
    lMethodType := 'GET'
  else if BackendEndpoint1.Method = rmPOST then
    lMethodType := 'POST'
  else if BackendEndpoint1.Method = rmPUT then
    lMethodType := 'PUT'
  else if BackendEndpoint1.Method = rmDELETE then
    lMethodType := 'DELETE';
  var lRequest := BackendEndpoint1.GetFullRequestURL(true);
  lblRequest.Caption := lMethodType + ' - ' + lRequest;
end;

procedure TMain.bntListClick(Sender: TObject);
var
  LPage: Integer;
begin
  BackendEndpoint1.ResetToDefaults;
  try
    BackendEndpoint1.Method := rmGET;
    if edtPage.Text = '0'  then
      BackendEndpoint1.ResourceSuffix := ''
    else
    begin
      LPage := StrToInt(edtPage.Text);
      BackendEndpoint1.ResourceSuffix :=
        Format('/?page=%d&start=%d&limit=%d', [LPage, (LPage - 1) * 10, 10]);
    end;
    BackendEndpoint1.Execute;
  finally
    mmResp.Text := RESTResponse1.JSONText;
  end;
end;

procedure TMain.btnGetClick(Sender: TObject);
begin
  BackendEndpoint1.ResetToDefaults;
  try
    BackendEndpoint1.Method := rmGET;
    BackendEndpoint1.ResourceSuffix := '/{#CUST_NO}';
    BackendEndpoint1.Params.ParameterByName('CUST_NO').Value := edtOrderID.Text;
    BackendEndpoint1.Execute;
  finally
    mmResp.Text := RESTResponse1.JSONText;
  end;
end;

procedure TMain.btnPutClick(Sender: TObject);
begin
  BackendEndpoint1.ResetToDefaults;
  try
    BackendEndpoint1.Method := rmPUT;
    BackendEndpoint1.ResourceSuffix := '/{#CUST_NO}';
    BackendEndpoint1.Params.ParameterByName('CUST_NO').Value := edtOrderID.Text;
    BackendEndpoint1.AddBody(mmReq.Text, ctAPPLICATION_JSON);
    BackendEndpoint1.Execute;
  finally
    mmResp.Text := RESTResponse1.JSONText;
  end;
end;

procedure TMain.btnPostClick(Sender: TObject);
begin
  BackendEndpoint1.ResetToDefaults;
  try
    BackendEndpoint1.Method := rmPOST;
    BackendEndpoint1.ResourceSuffix := '/';
    BackendEndpoint1.AddBody(mmReq.Text, ctAPPLICATION_JSON);
    BackendEndpoint1.Execute;
  finally
    mmResp.Text := RESTResponse1.JSONText;
  end;
end;

procedure TMain.btnDeleteClick(Sender: TObject);
begin
  BackendEndpoint1.ResetToDefaults;
  try
    BackendEndpoint1.Method := rmDELETE;
    BackendEndpoint1.ResourceSuffix := '/{#CUST_NO}';
    BackendEndpoint1.Params.ParameterByName('CUST_NO').Value := edtOrderID.Text;
    BackendEndpoint1.Execute;
  finally
    mmResp.Text := RESTResponse1.JSONText;
  end;
end;

end.
