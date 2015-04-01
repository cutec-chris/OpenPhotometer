unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, ComCtrls, IPConnection, BrickletColor,IniFiles;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'oPf'; { Change to your UID }

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    cbValue: TComboBox;
    cbChem: TComboBox;
    cbColor: TComboBox;
    Edit1: TEdit;
    eMax: TEdit;
    eMin: TEdit;
    eRMax: TEdit;
    eValue: TEdit;
    eRMin: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    seTimer1: TFloatSpinEdit;
    Label1: TLabel;
    lTimer1: TLabel;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    TimerRef: TTimer;
    Timer1: TTimer;
    tbR: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure eRMaxChange(Sender: TObject);
    procedure eRMinChange(Sender: TObject);
    procedure eValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerRefTimer(Sender: TObject);
  private
    { private declarations }
    FTimer1 : Integer;
    FOffsR : word;
    FOffsG : word;
    FOffsB : word;
    FOffsC : word;
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
  ColorBricklet.SetConfig(60,154);
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

procedure TForm1.Button3Click(Sender: TObject);
begin
  ColorBricklet.GetColor(FOffsR,FOffsG,FOffsB,FOffsC);
  case cbColor.Text of
  'rot':eRMax.Text:=IntToStr(FOffsR);
  'grün':eRMax.Text:=IntToStr(FOffsG);
  'blau':eRMax.Text:=IntToStr(FOffsB);
  'alles':eRMax.Text:=IntToStr(FOffsC);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ColorBricklet.GetColor(FOffsR,FOffsG,FOffsB,FOffsC);
  case cbColor.Text of
  'rot':eRMin.Text:=IntToStr(FOffsR);
  'grün':eRMin.Text:=IntToStr(FOffsG);
  'blau':eRMin.Text:=IntToStr(FOffsB);
  'alles':eRMin.Text:=IntToStr(FOffsC);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(cbValue.Text+'.'+cbChem.Text+'.ini');
  ini.WriteString('Value','Min',eRMin.Text);
  ini.WriteString('Value','Max',eRMax.Text);
  ini.WriteString('Value','Color',cbColor.Text);
  ini.WriteString('Value','RealMin',eMin.Text);
  ini.WriteString('Value','RealMax',eMax.Text);
  ini.UpdateFile;
  ini.Free;
end;

procedure TForm1.eRMaxChange(Sender: TObject);
begin
  tbR.Max:=StrToIntDef(eRMax.Text,65535);
end;

procedure TForm1.eRMinChange(Sender: TObject);
begin
  tbR.Min:=StrToIntDef(eRMin.Text,0);
end;

procedure TForm1.eValueChange(Sender: TObject);
begin
  tbR.Position:=StrToIntDef(eValue.Text,0);
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
  if eValue.text<>'' then exit;
  ColorBricklet.GetColor(r,g,b,c);
  Panel1.Color:=RGBToColor(round((r/SpinEdit1.Value)),round((g/SpinEdit1.Value)),round((b/SpinEdit1.Value)));
  case cbColor.Text of
  'rot':tbR.Position:=r;
  'grün':tbR.Position:=g;
  'blau':tbR.Position:=b;
  'alles':tbR.Position:=c;
  end;
end;

end.

