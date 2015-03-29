{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletPiezoSpeaker;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_PIEZO_SPEAKER_DEVICE_IDENTIFIER = 242;

  BRICKLET_PIEZO_SPEAKER_FUNCTION_BEEP = 1;
  BRICKLET_PIEZO_SPEAKER_FUNCTION_MORSE_CODE = 2;
  BRICKLET_PIEZO_SPEAKER_FUNCTION_CALIBRATE = 3;
  BRICKLET_PIEZO_SPEAKER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_PIEZO_SPEAKER_CALLBACK_BEEP_FINISHED = 4;
  BRICKLET_PIEZO_SPEAKER_CALLBACK_MORSE_CODE_FINISHED = 5;

  BRICKLET_PIEZO_SPEAKER_BEEP_DURATION_OFF = 0;
  BRICKLET_PIEZO_SPEAKER_BEEP_DURATION_INFINITE = 4294967295;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPiezoSpeaker = class;
  TBrickletPiezoSpeakerNotifyBeepFinished = procedure(sender: TBrickletPiezoSpeaker) of object;
  TBrickletPiezoSpeakerNotifyMorseCodeFinished = procedure(sender: TBrickletPiezoSpeaker) of object;

  /// <summary>
  ///  Device for controlling a piezo buzzer with configurable frequencies
  /// </summary>
  TBrickletPiezoSpeaker = class(TDevice)
  private
    beepFinishedCallback: TBrickletPiezoSpeakerNotifyBeepFinished;
    morseCodeFinishedCallback: TBrickletPiezoSpeakerNotifyMorseCodeFinished;
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
    ///  Beeps with the given frequency for the duration in ms. For example: 
    ///  If you set a duration of 1000, with a frequency value of 2000
    ///  the piezo buzzer will beep for one second with a frequency of
    ///  approximately 2 kHz.
    ///  
    ///  .. versionchanged:: 2.0.2~(Plugin)
    ///     A duration of 0 stops the current beep if any, the frequency parameter is
    ///     ignored. A duration of 4294967295 results in an infinite beep.
    ///  
    ///  The *frequency* parameter can be set between 585 and 7100.
    ///  
    ///  The Piezo Speaker Bricklet can only approximate the frequency, it will play
    ///  the best possible match by applying the calibration (see <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.Calibrate"/>).
    /// </summary>
    procedure Beep(const duration: longword; const frequency: word); virtual;

    /// <summary>
    ///  Sets morse code that will be played by the piezo buzzer. The morse code
    ///  is given as a string consisting of "." (dot), "-" (minus) and " " (space)
    ///  for *dits*, *dahs* and *pauses*. Every other character is ignored.
    ///  The second parameter is the frequency (see <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.Beep"/>).
    ///  
    ///  For example: If you set the string "...---...", the piezo buzzer will beep
    ///  nine times with the durations "short short short long long long short 
    ///  short short".
    ///  
    ///  The maximum string size is 60.
    /// </summary>
    procedure MorseCode(const morse: string; const frequency: word); virtual;

    /// <summary>
    ///  The Piezo Speaker Bricklet can play 512 different tones. This function
    ///  plays each tone and measures the exact frequency back. The result is a
    ///  mapping between setting value and frequency. This mapping is stored
    ///  in the EEPROM and loaded on startup.
    ///  
    ///  The Bricklet should come calibrated, you only need to call this
    ///  function (once) every time you reflash the Bricklet plugin.
    ///  
    ///  Returns *true* after the calibration finishes.
    /// </summary>
    function Calibrate: boolean; virtual;

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
    ///  This callback is triggered if a beep set by <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.Beep"/> is finished
    /// </summary>
    property OnBeepFinished: TBrickletPiezoSpeakerNotifyBeepFinished read beepFinishedCallback write beepFinishedCallback;

    /// <summary>
    ///  This callback is triggered if the playback of the morse code set by
    ///  <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.MorseCode"/> is finished.
    /// </summary>
    property OnMorseCodeFinished: TBrickletPiezoSpeakerNotifyMorseCodeFinished read morseCodeFinishedCallback write morseCodeFinishedCallback;
  end;

implementation

constructor TBrickletPiezoSpeaker.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_BEEP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_MORSE_CODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_CALIBRATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PIEZO_SPEAKER_CALLBACK_BEEP_FINISHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PIEZO_SPEAKER_CALLBACK_MORSE_CODE_FINISHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_PIEZO_SPEAKER_CALLBACK_BEEP_FINISHED] := {$ifdef FPC}@{$endif}CallbackWrapperBeepFinished;
  callbackWrappers[BRICKLET_PIEZO_SPEAKER_CALLBACK_MORSE_CODE_FINISHED] := {$ifdef FPC}@{$endif}CallbackWrapperMorseCodeFinished;
end;

procedure TBrickletPiezoSpeaker.Beep(const duration: longword; const frequency: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_BEEP, 14);
  LEConvertUInt32To(duration, 8, request);
  LEConvertUInt16To(frequency, 12, request);
  SendRequest(request);
end;

procedure TBrickletPiezoSpeaker.MorseCode(const morse: string; const frequency: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_MORSE_CODE, 70);
  LEConvertStringTo(morse, 8, 60, request);
  LEConvertUInt16To(frequency, 68, request);
  SendRequest(request);
end;

function TBrickletPiezoSpeaker.Calibrate: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_CALIBRATE, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletPiezoSpeaker.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletPiezoSpeaker.CallbackWrapperBeepFinished(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(beepFinishedCallback)) then begin
    beepFinishedCallback(self);
  end;
end;

procedure TBrickletPiezoSpeaker.CallbackWrapperMorseCodeFinished(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(morseCodeFinishedCallback)) then begin
    morseCodeFinishedCallback(self);
  end;
end;

end.
