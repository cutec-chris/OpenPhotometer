{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletIndustrialDual020mA;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_DEVICE_IDENTIFIER = 228;

  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT = 1;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_PERIOD = 2;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_PERIOD = 3;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD = 4;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD = 5;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_SAMPLE_RATE = 8;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_SAMPLE_RATE = 9;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT = 10;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT_REACHED = 11;

  BRICKLET_INDUSTRIAL_DUAL_0_20MA_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_SAMPLE_RATE_240_SPS = 0;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_SAMPLE_RATE_60_SPS = 1;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_SAMPLE_RATE_15_SPS = 2;
  BRICKLET_INDUSTRIAL_DUAL_0_20MA_SAMPLE_RATE_4_SPS = 3;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletIndustrialDual020mA = class;
  TBrickletIndustrialDual020mANotifyCurrent = procedure(sender: TBrickletIndustrialDual020mA; const sensor: byte; const current: longint) of object;
  TBrickletIndustrialDual020mANotifyCurrentReached = procedure(sender: TBrickletIndustrialDual020mA; const sensor: byte; const current: longint) of object;

  /// <summary>
  ///  Device for sensing two currents between 0 and 20mA (IEC 60381-1)
  /// </summary>
  TBrickletIndustrialDual020mA = class(TDevice)
  private
    currentCallback: TBrickletIndustrialDual020mANotifyCurrent;
    currentReachedCallback: TBrickletIndustrialDual020mANotifyCurrentReached;
  protected
    procedure CallbackWrapperCurrent(const packet: TByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current of the specified sensor (0 or 1). The value is in nA
    ///  and between 0nA and 22505322nA (22.5mA).
    ///  
    ///  It is possible to detect if an IEC 60381-1 compatible sensor is connected
    ///  and if it works probably.
    ///  
    ///  If the returned current is below 4mA, there is likely no sensor connected
    ///  or the sensor may be defect. If the returned current is over 20mA, there might
    ///  be a short circuit or the sensor may be defect.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  callback <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.Current"/> and set the period with 
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent(const sensor: byte): longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.Current"/> callback is triggered
    ///  periodically for the given sensor. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const sensor: byte; const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod(const sensor: byte): longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.CurrentReached"/> callback for the given
    ///  sensor.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCurrentCallbackThreshold(const sensor: byte; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(const sensor: byte; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.CurrentReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the sample rate to either 240, 60, 15 or 4 samples per second.
    ///  The resolution for the rates is 12, 14, 16 and 18 bit respectively.
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0",    "240 samples per second, 12 bit resolution"
    ///   "1",    "60 samples per second, 14 bit resolution"
    ///   "2",    "15 samples per second, 16 bit resolution"
    ///   "3",    "4 samples per second, 18 bit resolution"
    ///  </code>
    ///  
    ///  The default value is 3: 4 samples per second with 18 bit resolution.
    /// </summary>
    procedure SetSampleRate(const rate: byte); virtual;

    /// <summary>
    ///  Returns the sample rate as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

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
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnCurrent: TBrickletIndustrialDual020mANotifyCurrent read currentCallback write currentCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletIndustrialDual020mANotifyCurrentReached read currentReachedCallback write currentReachedCallback;
  end;

implementation

constructor TBrickletIndustrialDual020mA.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_SAMPLE_RATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_SAMPLE_RATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT] := {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  callbackWrappers[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
end;

function TBrickletIndustrialDual020mA.GetCurrent(const sensor: byte): longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT, 9);
  LEConvertUInt8To(sensor, 8, request);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod(const sensor: byte; const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 13);
  LEConvertUInt8To(sensor, 8, request);
  LEConvertUInt32To(period, 9, request);
  SendRequest(request);
end;

function TBrickletIndustrialDual020mA.GetCurrentCallbackPeriod(const sensor: byte): longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 9);
  LEConvertUInt8To(sensor, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold(const sensor: byte; const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 18);
  LEConvertUInt8To(sensor, 8, request);
  LEConvertCharTo(option, 9, request);
  LEConvertInt32To(min, 10, request);
  LEConvertInt32To(max, 14, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialDual020mA.GetCurrentCallbackThreshold(const sensor: byte; out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 9);
  LEConvertUInt8To(sensor, 8, request);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletIndustrialDual020mA.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDual020mA.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDual020mA.SetSampleRate(const rate: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(rate, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDual020mA.GetSampleRate: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_SAMPLE_RATE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletIndustrialDual020mA.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletIndustrialDual020mA.CallbackWrapperCurrent(const packet: TByteArray);
var sensor: byte; current: longint;
begin
  if (Assigned(currentCallback)) then begin
    sensor := LEConvertUInt8From(8, packet);
    current := LEConvertInt32From(9, packet);
    currentCallback(self, sensor, current);
  end;
end;

procedure TBrickletIndustrialDual020mA.CallbackWrapperCurrentReached(const packet: TByteArray);
var sensor: byte; current: longint;
begin
  if (Assigned(currentReachedCallback)) then begin
    sensor := LEConvertUInt8From(8, packet);
    current := LEConvertInt32From(9, packet);
    currentReachedCallback(self, sensor, current);
  end;
end;

end.
