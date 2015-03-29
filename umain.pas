unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, IPConnection, BrickletColor;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'oPf'; { Change to your UID }

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cbValue: TComboBox;
    cbChem: TComboBox;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    seTimer1: TFloatSpinEdit;
    Label1: TLabel;
    lTimer1: TLabel;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    TimerRef: TTimer;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerRefTimer(Sender: TObject);
  private
    { private declarations }
    FTimer1 : Integer;
  public
    { public declarations }
    ipcon: TIPConnection;
    ColorBricklet: TBrickletColor;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  ipcon := TIPConnection.Create;
  ColorBricklet := TBrickletColor.Create(UID, ipcon);
  ipcon.Connect(HOST, PORT);
  ColorBricklet.LightOn;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
  r: word;
  g: word;
  b: word;
  c: word;
begin
  sl := TStringList.Create;
  if FileExistsUTF8('ranges.txt') then
    sl.LoadFromFile('ranges.txt');
  ColorBricklet.GetColor(r,g,b,c);
  sl.Add(Edit1.Text+':'+IntToStr(r)+','+IntToStr(g)+','+IntToStr(b)+','+IntToStr(c));
  sl.SaveToFile('ranges.txt');
  sl.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FTimer1:=round(seTimer1.Value*60);
  lTimer1.Caption:=IntToStr(trunc(FTimer1/60))+':'+IntToStr(round(frac(FTimer1/60)*10));
  Timer1.Enabled:=True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ColorBricklet.Free;
  ipcon.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  dec(FTimer1);
  lTimer1.Caption:=IntToStr(trunc(FTimer1/60))+':'+IntToStr(round(frac(FTimer1/60)*60));
end;

procedure TForm1.TimerRefTimer(Sender: TObject);
var
  r: word;
  g: word;
  b: word;
  c: word;
begin
  ColorBricklet.GetColor(r,g,b,c);
  Panel1.Color:=RGBToColor(round((r/SpinEdit1.Value)),round((g/SpinEdit1.Value)),round((b/SpinEdit1.Value)));
end;

end.

