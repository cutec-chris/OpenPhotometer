unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, TAGraph, TASeries, TASources,
  Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Spin, ComCtrls,
  IPConnection, BrickletColor, IniFiles, Device;

const
  HOST = 'localhost';
  PORT = 4223;

type

  { TfPhotometer }

  TfPhotometer = class(TForm)
    bNull: TButton;
    bSave: TButton;
    Button1: TButton;
    Button2: TButton;
    bMeasure: TButton;
    Button4: TButton;
    cbColor: TComboBox;
    cbValue: TComboBox;
    cbChem: TComboBox;
    Chart1: TChart;
    Chart1BarSeries1: TBarSeries;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    DividerBevel3: TDividerBevel;
    DividerBevel4: TDividerBevel;
    DividerBevel5: TDividerBevel;
    eMax: TEdit;
    eMin: TEdit;
    eRange: TEdit;
    eRMax: TEdit;
    eRMin: TEdit;
    eValue: TEdit;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListChartSource1: TListChartSource;
    lValue: TLabel;
    mRanges: TMemo;
    mUsage: TMemo;
    pcMain: TPageControl;
    seTimer1: TFloatSpinEdit;
    Label1: TLabel;
    lTimer1: TLabel;
    tbR: TTrackBar;
    tsSettings: TTabSheet;
    tsNull: TTabSheet;
    tsMeasurement: TTabSheet;
    TimerRef: TTimer;
    Timer1: TTimer;
    procedure bNullClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bMeasureClick(Sender: TObject);
    procedure cbChemSelect(Sender: TObject);
    procedure cbColorSelect(Sender: TObject);
    procedure cbValueSelect(Sender: TObject);
    procedure eRMaxChange(Sender: TObject);
    procedure eRMinChange(Sender: TObject);
    procedure eValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ipconEnumerate(sender: TIPConnection; const uid: string;
      const connectedUid: string; const aposition: char;
      const hardwareVersion: TVersionNumber;
      const firmwareVersion: TVersionNumber; const deviceIdentifier: word;
      const enumerationType: byte);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerRefTimer(Sender: TObject);
  private
    { private declarations }
    FTimer1 : Integer;
    FOffsR : word;
    FOffsG : word;
    FOffsB : word;
    FOffsC : word;
    FOffsM : word;
  public
    { public declarations }
    ipcon: TIPConnection;
    ColorBricklet: TBrickletColor;
    BrickletID : string;
    procedure StartMeasurement;
  end;

var
  fPhotometer: TfPhotometer;

implementation

{$R *.lfm}

{ TfPhotometer }

procedure TfPhotometer.FormCreate(Sender: TObject);
begin
  ipcon := TIPConnection.Create;
  ipcon.OnEnumerate:=@ipconEnumerate;
  ColorBricklet:=nil;
  ipcon.Connect(HOST, PORT);
  ipcon.Enumerate;
  FOffsR:=65535;
  FOffsG:=65535;
  FOffsB:=65535;
  FOffsC:=65535;
  pcMain.ActivePage:=tsNull;
end;

procedure TfPhotometer.Button1Click(Sender: TObject);
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
  sl.Add(DateTimeToStr(Now())+':'+BrickletID+':'+cbValue.Text+':'+cbChem.Text+':'+eRange.Text+':'+#9#9#9+IntToStr(r)+','+#9+IntToStr(g)+','+#9+IntToStr(b)+','+#9+IntToStr(c)+#9+',T:'+IntToStr(ColorBricklet.GetColorTemperature)+',I:'+IntToStr(ColorBricklet.GetIlluminance)+',A:'+IntToStr(FOffsM));
  sl.SaveToFile('ranges.txt');
  sl.Free;
end;

procedure TfPhotometer.bNullClick(Sender: TObject);
var
  r: word;
  g: word;
  b: word;
  c: word;
  sl: TStringList;
  ini: TIniFile;
begin
  if not ipcon.IsConnected then exit;
  if not Assigned(ColorBricklet) then exit;
  try
    if Assigned(ColorBricklet) then
      ColorBricklet.GetColor(r,g,b,c);
  except
    eValue.Text:='Wert';
    exit;
  end;
  FOffsM := r;
  if g>FOffsM then FOffsM := g;
  if b>FOffsM then FOffsM := b;
  FOffsM:=FOffsM+5000;
  FOffsR:=r;
  FOffsG:=g;
  FOffsB:=b;
  FOffsC:=c;
  sl := TStringList.Create;
  if FileExistsUTF8('ranges.txt') then
    sl.LoadFromFile('ranges.txt');
  sl.Add(DateTimeToStr(Now())+':'+BrickletID+':*** Nullen O ***:'+#9#9#9+IntToStr(r)+','+#9+IntToStr(g)+','+#9+IntToStr(b)+','+#9+IntToStr(c)+#9+',T:'+IntToStr(ColorBricklet.GetColorTemperature)+',I:'+IntToStr(ColorBricklet.GetIlluminance)+',A:'+IntToStr(FOffsM));
  sl.Add(DateTimeToStr(Now())+':'+BrickletID+':*** Nullen F ***:'+#9#9#9+IntToStr(FOffsR)+','+#9+IntToStr(FOffsG)+','+#9+IntToStr(FOffsB)+','+#9+IntToStr(FOffsC)+#9+',A:'+IntToStr(FOffsM));
  sl.SaveToFile('ranges.txt');
  sl.Free;
  ini := TIniFile.Create('adjust_'+BrickletID+'.ini');
  ini.WriteInteger('Offs','M',FOffsM);
  ini.WriteInteger('Offs','R',FOffsR);
  ini.WriteInteger('Offs','G',FOffsG);
  ini.WriteInteger('Offs','B',FOffsB);
  ini.WriteInteger('Offs','C',FOffsC);
  ini.UpdateFile;
  ini.Free;
  pcMain.ActivePage:=tsMeasurement;
end;

procedure TfPhotometer.Button2Click(Sender: TObject);
begin
  FTimer1:=round(seTimer1.Value*60);
  lTimer1.Caption:=IntToStr(trunc(FTimer1/60))+':'+Format('%.*d',[2,round(frac(FTimer1/60)*60)]);
  Timer1.Enabled:=True;
end;

procedure TfPhotometer.Button4Click(Sender: TObject);
begin
  try
    ColorBricklet.GetColor(FOffsR,FOffsG,FOffsB,FOffsC);
  except
  end;
  case cbColor.Text of
  'rot':eRMin.Text:=IntToStr(FOffsR);
  'grün':eRMin.Text:=IntToStr(FOffsG);
  'blau':eRMin.Text:=IntToStr(FOffsB);
  'alles':eRMin.Text:=IntToStr(FOffsC);
  end;
end;

procedure TfPhotometer.bSaveClick(Sender: TObject);
var
  ini: TIniFile;
  ss: TStringStream;
begin
  ini := TIniFile.Create(cbValue.Text+'.'+cbChem.Text+'.ini');
  ini.WriteString('Value','Min',eRMin.Text);
  ini.WriteString('Value','Max',eRMax.Text);
  ini.WriteString('Value','Color',cbColor.Text);
  ini.WriteString('Value','RealMin',eMin.Text);
  ini.WriteString('Value','RealMax',eMax.Text);
  ss := TStringStream.Create(mUsage.Text);
  ini.WriteBinaryStream('Usage','Text',ss);
  ss.Free;
  ss := TStringStream.Create(mRanges.Text);
  ini.WriteBinaryStream('Ranges','Text',ss);
  ss.Free;
  ini.WriteFloat('Time','Timer',seTimer1.Value);
  ini.UpdateFile;
  ini.Free;
end;

procedure TfPhotometer.bMeasureClick(Sender: TObject);
begin
  StartMeasurement;
end;

procedure TfPhotometer.cbChemSelect(Sender: TObject);
var
  ini: TIniFile;
  ss: TStringStream;
begin
  ini := TIniFile.Create(cbValue.Text+'.'+cbChem.Text+'.ini');
  eRMin.Text:=ini.ReadString('Value','Min',eRMin.Text);
  eRMax.Text:=ini.ReadString('Value','Max',eRMax.Text);
  cbColor.Text:=ini.ReadString('Value','Color',cbColor.Text);
  eMin.Text:=ini.ReadString('Value','RealMin',eMin.Text);
  eMax.Text:=ini.ReadString('Value','RealMax',eMax.Text);
  ss := TStringStream.Create('');
  ini.ReadBinaryStream('Usage','Text',ss);
  mUsage.Text:=ss.DataString;
  ss.Free;
  ss := TStringStream.Create('');
  ini.ReadBinaryStream('Ranges','Text',ss);
  mRanges.Text:=ss.DataString;
  ss.Free;
  seTimer1.Value := ini.ReadFloat('Time','Timer',seTimer1.Value);
  ini.Free;
end;

procedure TfPhotometer.cbColorSelect(Sender: TObject);
begin
  case cbColor.Text of
  'rot':tbR.Max:=FOffsR;
  'grün':tbR.Max:=FOffsG;
  'blau':tbR.Max:=FOffsB;
  'alles':tbR.Max:=FOffsC;
  end;
end;

procedure TfPhotometer.cbValueSelect(Sender: TObject);
var
  Info: TSearchRec;
  tmp: String;
begin
  cbChem.Clear;
  If FindFirst ('*.ini',faAnyFile,Info)=0 then
    begin
      repeat
        With Info do
          If (Attr and faDirectory) <> faDirectory then
            begin
              if copy(Name,0,length(cbValue.Text))=cbValue.Text then
                begin
                  tmp := Name;
                  tmp := copy(tmp,length(cbValue.Text)+2,length(tmp));
                  tmp := copy(tmp,0,pos('.',tmp)-1);
                  cbChem.items.Add(tmp);
                end;
            end;
      until FindNext(info)<>0;
    end;
  if cbChem.Items.Count=1 then
    begin
      cbChem.ItemIndex:=0;
      cbChemSelect(cbChem);
    end;
end;

procedure TfPhotometer.eRMaxChange(Sender: TObject);
begin
  tbR.Max:=StrToIntDef(eRMax.Text,65535);
end;

procedure TfPhotometer.eRMinChange(Sender: TObject);
begin
  tbR.Min:=StrToIntDef(eRMin.Text,0);
end;

procedure TfPhotometer.eValueChange(Sender: TObject);
begin
  tbR.Position:=StrToIntDef(eValue.Text,0);
end;

procedure TfPhotometer.FormDestroy(Sender: TObject);
begin
  ColorBricklet.Free;
  ipcon.Free;
end;

procedure TfPhotometer.ipconEnumerate(sender: TIPConnection; const uid: string;
  const connectedUid: string; const aposition: char;
  const hardwareVersion: TVersionNumber; const firmwareVersion: TVersionNumber;
  const deviceIdentifier: word; const enumerationType: byte);
var
  ini: TIniFile;
begin
  if deviceIdentifier=BRICKLET_COLOR_DEVICE_IDENTIFIER then
    begin
      ColorBricklet := TBrickletColor.Create(UID, ipcon);
      ColorBricklet.LightOn;
      ColorBricklet.SetConfig(60,154);
      TimerRef.Enabled:=True;
      bMeasure.Enabled:=True;
      pcMain.ActivePage:=tsNull;
      BrickletID := uid;
      if FileExistsUTF8('adjust_'+BrickletID+'.ini') then
        begin
          ini := TIniFile.Create('adjust_'+BrickletID+'.ini');
          FOffsM := ini.ReadInteger('Offs','M',FOffsM);
          FOffsR := ini.ReadInteger('Offs','R',FOffsR);
          FOffsG := ini.ReadInteger('Offs','G',FOffsG);
          FOffsB := ini.ReadInteger('Offs','B',FOffsB);
          FOffsC := ini.ReadInteger('Offs','C',FOffsC);
          ini.Free;
          pcMain.ActivePage:=tsMeasurement;
        end;
    end;
end;

procedure TfPhotometer.Timer1Timer(Sender: TObject);
begin
  dec(FTimer1);
  lTimer1.Caption:=IntToStr(trunc(FTimer1/60))+':'+Format('%.*d',[2,round(frac(FTimer1/60)*60)]);
  if FTimer1<0 then
    begin
      StartMeasurement;
      Timer1.Enabled:=False;
    end;
end;

procedure TfPhotometer.TimerRefTimer(Sender: TObject);
var
  r: word;
  g: word;
  b: word;
  c: word;
  r1: Integer;
  g1: Integer;
  b1: Integer;
  c1: Integer;
begin
  if not ipcon.IsConnected then exit;
  try
    if Assigned(ColorBricklet) then
      ColorBricklet.GetColor(r,g,b,c);
  except
    eValue.Text:='Wert';
  end;

  r1 := FOffsM-r;
  g1 := FOffsM-g;
  b1 := FOffsM-b;
  c1 := FOffsM-c;
  if r1>0 then  r := r1 else r := 0;
  if g1>0 then  g := g1 else g := 0;
  if b1>0 then  b := b1 else b := 0;
  if c1>0 then  c := c1 else c := 0;

  ListChartSource1.SetYValue(0,r);
  ListChartSource1.SetYValue(1,g);
  ListChartSource1.SetYValue(2,b);
  ListChartSource1.SetYValue(3,c);
  case cbColor.Text of
  'rot':tbR.Position:=r;
  'grün':tbR.Position:=g;
  'blau':tbR.Position:=b;
  'alles':tbR.Position:=c;
  end;
end;

procedure TfPhotometer.StartMeasurement;
var
  r: word;
  g: word;
  b: word;
  c: word;
  val: Word;
  i: Integer;
  aVal: LongInt;
  aMin : LongInt = 0;
  aMax : LongInt = 65535;
  aValR: Extended;
  aMaxR: Extended;
  aMinR: Extended;
  aRes: Extended;
  r1: Integer;
  g1: Integer;
  b1: Integer;
  c1: Integer;
  aNewValue: String;
begin
  if eValue.Text='' then
    begin
      try
        if Assigned(ColorBricklet) then
          ColorBricklet.GetColor(r,g,b,c);
      except
      end;
      r1 := FOffsM-r;
      g1 := FOffsM-g;
      b1 := FOffsM-b;
      c1 := FOffsM-c;
      if r1>0 then  r := r1 else r := 0;
      if g1>0 then  g := g1 else g := 0;
      if b1>0 then  b := b1 else b := 0;
      if c1>0 then  c := c1 else c := 0;
      case cbColor.Text of
      'rot':val:=r1;
      'grün':val:=g1;
      'blau':val:=b1;
      'alles':val:=c1;
      end;
    end
  else val := StrToInt(eValue.Text);
  for i := 0 to mRanges.Lines.Count-1 do
    begin
      aVal := StrToIntDef(copy(mRanges.Lines[i],pos('=',mRanges.Lines[i])+1,length(mRanges.Lines[i])),0);
      aValR := StrToFloatDef(copy(mRanges.Lines[i],0,pos('=',mRanges.Lines[i])-1),0);
      if (val>aVal) and (aVal>aMin) then
        begin
          aMin := aVal;
          aMinR := aValR;
        end;
      if (val<aVal) and (aVal<aMax) then
        begin
          aMax := aVal;
          aMaxR := aValR;
        end;
    end;
  if aMax=65535 then
    begin
      lValue.Caption:='>';
      aNewValue := InputBox('Wert >','Der Wert ist größer als bisherige, bitte messen Sie den Wert mit Vergleichkarte nach','');
      if aNewValue<>'' then
        begin
          mRanges.Append(aNewValue+'='+IntToStr(Val));
          bSave.Click;
        end;
    end
  else if aMin=0 then
    begin
      lValue.Caption:='<';
      aNewValue := InputBox('Wert <','Der Wert ist kleiner als bisherige, bitte messen Sie den Wert mit Vergleichkarte nach','');
      if aNewValue<>'' then
        begin
          mRanges.Append(aNewValue+'='+IntToStr(Val));
          bSave.Click;
        end;
    end
  else
    begin
      aRes := aMinR+((aMaxR-aMinR)/(aMax-aMin))*(val-aMin);
      lValue.Caption:=FormatFloat('0.00',aRes);
    end;
end;

end.

