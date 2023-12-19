unit Unit1;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  dbclient, FireDAC.Phys.SQLiteWrapper.FDEStat, FireDAC.Comp.UI,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  [ResourceName('Customers')]
  TCustomersResource = class(TDataModule)
    qryCustomers: TFDQuery;
    [ResourceSuffix('list', '/')]
    [ResourceSuffix('get', '/{#CUST_NO}')]
    [ResourceSuffix('put', '/{#CUST_NO}')]
    [ResourceSuffix('post', '/')]
    [ResourceSuffix('delete', '/{#CUST_NO}')]
    resCustomers: TEMSDataSetResource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TCustomersResource));
end;

initialization
  Register;
end.


