{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLine;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LINE_DEVICE_IDENTIFIER = 241;

  BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY = 1;
  BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_PERIOD = 2;
  BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_PERIOD = 3;
  BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_THRESHOLD = 4;
  BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_THRESHOLD = 5;
  BRICKLET_LINE_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_LINE_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_LINE_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LINE_CALLBACK_REFLECTIVITY = 8;
  BRICKLET_LINE_CALLBACK_REFLECTIVITY_REACHED = 9;

  BRICKLET_LINE_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_LINE_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_LINE_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_LINE_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_LINE_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLine = class;
  TBrickletLineNotifyReflectivity = procedure(sender: TBrickletLine; const reflectivity: word) of object;
  TBrickletLineNotifyReflectivityReached = procedure(sender: TBrickletLine; const reflectivity: word) of object;

  /// <summary>
  ///  Device that measures reflectivity to allow following a line
  /// </summary>
  TBrickletLine = class(TDevice)
  private
    reflectivityCallback: TBrickletLineNotifyReflectivity;
    reflectivityReachedCallback: TBrickletLineNotifyReflectivityReached;
  protected
    procedure CallbackWrapperReflectivity(const packet: TByteArray); virtual;
    procedure CallbackWrapperReflectivityReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the currently measured reflectivity. The reflectivity is
    ///  a value between 0 (not reflective) and 4095 (very reflective).
    ///  
    ///  Usually black has a low reflectivity while white has a high
    ///  reflectivity.
    ///  
    ///  If you want to get the reflectivity periodically, it is recommended 
    ///  to use the callback <see cref="BrickletLine.TBrickletLine.Reflectivity"/> and set the period with 
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>.
    /// </summary>
    function GetReflectivity: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLine.TBrickletLine.Reflectivity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLine.TBrickletLine.Reflectivity"/> is only triggered if the reflectivity has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetReflectivityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>.
    /// </summary>
    function GetReflectivityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLine.TBrickletLine.ReflectivityReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the reflectivity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the reflectivity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the reflectivity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the reflectivity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetReflectivityCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/>.
    /// </summary>
    procedure GetReflectivityCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletLine.TBrickletLine.ReflectivityReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLine.TBrickletLine.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>. The parameter is the reflectivity
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletLine.TBrickletLine.Reflectivity"/> is only triggered if the reflectivity has changed since the
    ///  last triggering.
    /// </summary>
    property OnReflectivity: TBrickletLineNotifyReflectivity read reflectivityCallback write reflectivityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/> is reached.
    ///  The parameter is the reflectivity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLine.TBrickletLine.SetDebouncePeriod"/>.
    /// </summary>
    property OnReflectivityReached: TBrickletLineNotifyReflectivityReached read reflectivityReachedCallback write reflectivityReachedCallback;
  end;

implementation

constructor TBrickletLine.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINE_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINE_CALLBACK_REFLECTIVITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINE_CALLBACK_REFLECTIVITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINE_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LINE_CALLBACK_REFLECTIVITY] := {$ifdef FPC}@{$endif}CallbackWrapperReflectivity;
  callbackWrappers[BRICKLET_LINE_CALLBACK_REFLECTIVITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperReflectivityReached;
end;

function TBrickletLine.GetReflectivity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletLine.SetReflectivityCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLine.GetReflectivityCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLine.SetReflectivityCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletLine.GetReflectivityCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletLine.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletLine.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLine.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLine.CallbackWrapperReflectivity(const packet: TByteArray);
var reflectivity: word;
begin
  if (Assigned(reflectivityCallback)) then begin
    reflectivity := LEConvertUInt16From(8, packet);
    reflectivityCallback(self, reflectivity);
  end;
end;

procedure TBrickletLine.CallbackWrapperReflectivityReached(const packet: TByteArray);
var reflectivity: word;
begin
  if (Assigned(reflectivityReachedCallback)) then begin
    reflectivity := LEConvertUInt16From(8, packet);
    reflectivityReachedCallback(self, reflectivity);
  end;
end;

end.
