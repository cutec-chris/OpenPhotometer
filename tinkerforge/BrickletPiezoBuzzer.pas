{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletPiezoBuzzer;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_PIEZO_BUZZER_DEVICE_IDENTIFIER = 214;

  BRICKLET_PIEZO_BUZZER_FUNCTION_BEEP = 1;
  BRICKLET_PIEZO_BUZZER_FUNCTION_MORSE_CODE = 2;
  BRICKLET_PIEZO_BUZZER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_PIEZO_BUZZER_CALLBACK_BEEP_FINISHED = 3;
  BRICKLET_PIEZO_BUZZER_CALLBACK_MORSE_CODE_FINISHED = 4;


type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPiezoBuzzer = class;
  TBrickletPiezoBuzzerNotifyBeepFinished = procedure(sender: TBrickletPiezoBuzzer) of object;
  TBrickletPiezoBuzzerNotifyMorseCodeFinished = procedure(sender: TBrickletPiezoBuzzer) of object;

  /// <summary>
  ///  Device for controlling a piezo buzzer
  /// </summary>
  TBrickletPiezoBuzzer = class(TDevice)
  private
    beepFinishedCallback: TBrickletPiezoBuzzerNotifyBeepFinished;
    morseCodeFinishedCallback: TBrickletPiezoBuzzerNotifyMorseCodeFinished;
  protected
    procedure CallbackWrapperBeepFinished(const packet: TByteArray); virtual;
    procedure CallbackWrapperMorseCodeFinished(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Beeps with the duration in ms. For example: If you set a value of 1000,
    ///  the piezo buzzer will beep for one second.
    /// </summary>
    procedure Beep(const duration: longword); virtual;

    /// <summary>
    ///  Sets morse code that will be played by the piezo buzzer. The morse code
    ///  is given as a string consisting of "." (dot), "-" (minus) and " " (space)
    ///  for *dits*, *dahs* and *pauses*. Every other character is ignored.
    ///  
    ///  For example: If you set the string "...---...", the piezo buzzer will beep
    ///  nine times with the durations "short short short long long long short 
    ///  short short".
    ///  
    ///  The maximum string size is 60.
    /// </summary>
    procedure MorseCode(const morse: string); virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to, 
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered if a beep set by <see cref="BrickletPiezoBuzzer.TBrickletPiezoBuzzer.Beep"/> is finished
    /// </summary>
    property OnBeepFinished: TBrickletPiezoBuzzerNotifyBeepFinished read beepFinishedCallback write beepFinishedCallback;

    /// <summary>
    ///  This callback is triggered if the playback of the morse code set by
    ///  <see cref="BrickletPiezoBuzzer.TBrickletPiezoBuzzer.MorseCode"/> is finished.
    /// </summary>
    property OnMorseCodeFinished: TBrickletPiezoBuzzerNotifyMorseCodeFinished read morseCodeFinishedCallback write morseCodeFinishedCallback;
  end;

implementation

constructor TBrickletPiezoBuzzer.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_BEEP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_MORSE_CODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PIEZO_BUZZER_CALLBACK_BEEP_FINISHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PIEZO_BUZZER_CALLBACK_MORSE_CODE_FINISHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_PIEZO_BUZZER_CALLBACK_BEEP_FINISHED] := {$ifdef FPC}@{$endif}CallbackWrapperBeepFinished;
  callbackWrappers[BRICKLET_PIEZO_BUZZER_CALLBACK_MORSE_CODE_FINISHED] := {$ifdef FPC}@{$endif}CallbackWrapperMorseCodeFinished;
end;

procedure TBrickletPiezoBuzzer.Beep(const duration: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_BEEP, 12);
  LEConvertUInt32To(duration, 8, request);
  SendRequest(request);
end;

procedure TBrickletPiezoBuzzer.MorseCode(const morse: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_MORSE_CODE, 68);
  LEConvertStringTo(morse, 8, 60, request);
  SendRequest(request);
end;

procedure TBrickletPiezoBuzzer.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletPiezoBuzzer.CallbackWrapperBeepFinished(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(beepFinishedCallback)) then begin
    beepFinishedCallback(self);
  end;
end;

procedure TBrickletPiezoBuzzer.CallbackWrapperMorseCodeFinished(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(morseCodeFinishedCallback)) then begin
    morseCodeFinishedCallback(self);
  end;
end;

end.
