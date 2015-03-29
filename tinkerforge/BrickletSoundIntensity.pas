{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletSoundIntensity;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_SOUND_INTENSITY_DEVICE_IDENTIFIER = 238;

  BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY = 1;
  BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_PERIOD = 2;
  BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_PERIOD = 3;
  BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_THRESHOLD = 4;
  BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_THRESHOLD = 5;
  BRICKLET_SOUND_INTENSITY_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_SOUND_INTENSITY_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_SOUND_INTENSITY_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY = 8;
  BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY_REACHED = 9;

  BRICKLET_SOUND_INTENSITY_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_SOUND_INTENSITY_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_SOUND_INTENSITY_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_SOUND_INTENSITY_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_SOUND_INTENSITY_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletSoundIntensity = class;
  TBrickletSoundIntensityNotifyIntensity = procedure(sender: TBrickletSoundIntensity; const intensity: word) of object;
  TBrickletSoundIntensityNotifyIntensityReached = procedure(sender: TBrickletSoundIntensity; const intensity: word) of object;

  /// <summary>
  ///  Device for sensing sound intensity
  /// </summary>
  TBrickletSoundIntensity = class(TDevice)
  private
    intensityCallback: TBrickletSoundIntensityNotifyIntensity;
    intensityReachedCallback: TBrickletSoundIntensityNotifyIntensityReached;
  protected
    procedure CallbackWrapperIntensity(const packet: TByteArray); virtual;
    procedure CallbackWrapperIntensityReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current sound intensity. The value has a range of
    ///  0 to 4095.
    ///  
    ///  The value corresponds to the `upper envelop &lt;http://en.wikipedia.org/wiki/Envelope_(waves)&gt;`__
    ///  of the signal of the microphone capsule.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  callback <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.Intensity"/> and set the period with 
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>.
    /// </summary>
    function GetIntensity: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.Intensity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.Intensity"/> is only triggered if the intensity has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetIntensityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>.
    /// </summary>
    function GetIntensityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.IntensityReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the intensity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the intensity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the intensity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the intensity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetIntensityCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/>.
    /// </summary>
    procedure GetIntensityCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.IntensityReached"/>
    ///  
    ///  is triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>. The parameter is the intensity of
    ///  the encoder.
    ///  
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.Intensity"/> is only triggered if the intensity has changed since the
    ///  last triggering.
    /// </summary>
    property OnIntensity: TBrickletSoundIntensityNotifyIntensity read intensityCallback write intensityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/> is reached.
    ///  The parameter is the intensity of the encoder.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetDebouncePeriod"/>.
    /// </summary>
    property OnIntensityReached: TBrickletSoundIntensityNotifyIntensityReached read intensityReachedCallback write intensityReachedCallback;
  end;

implementation

constructor TBrickletSoundIntensity.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY] := {$ifdef FPC}@{$endif}CallbackWrapperIntensity;
  callbackWrappers[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperIntensityReached;
end;

function TBrickletSoundIntensity.GetIntensity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletSoundIntensity.SetIntensityCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletSoundIntensity.GetIntensityCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletSoundIntensity.SetIntensityCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletSoundIntensity.GetIntensityCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletSoundIntensity.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletSoundIntensity.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletSoundIntensity.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletSoundIntensity.CallbackWrapperIntensity(const packet: TByteArray);
var intensity: word;
begin
  if (Assigned(intensityCallback)) then begin
    intensity := LEConvertUInt16From(8, packet);
    intensityCallback(self, intensity);
  end;
end;

procedure TBrickletSoundIntensity.CallbackWrapperIntensityReached(const packet: TByteArray);
var intensity: word;
begin
  if (Assigned(intensityReachedCallback)) then begin
    intensity := LEConvertUInt16From(8, packet);
    intensityReachedCallback(self, intensity);
  end;
end;

end.
