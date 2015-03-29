{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletRotaryPoti;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ROTARY_POTI_DEVICE_IDENTIFIER = 215;

  BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION = 1;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD = 3;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD = 4;
  BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD = 7;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD = 8;
  BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_ROTARY_POTI_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_ROTARY_POTI_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_ROTARY_POTI_CALLBACK_POSITION = 13;
  BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE = 14;
  BRICKLET_ROTARY_POTI_CALLBACK_POSITION_REACHED = 15;
  BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE_REACHED = 16;

  BRICKLET_ROTARY_POTI_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_ROTARY_POTI_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_ROTARY_POTI_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_ROTARY_POTI_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_ROTARY_POTI_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRotaryPoti = class;
  TBrickletRotaryPotiNotifyPosition = procedure(sender: TBrickletRotaryPoti; const position: smallint) of object;
  TBrickletRotaryPotiNotifyAnalogValue = procedure(sender: TBrickletRotaryPoti; const value: word) of object;
  TBrickletRotaryPotiNotifyPositionReached = procedure(sender: TBrickletRotaryPoti; const position: smallint) of object;
  TBrickletRotaryPotiNotifyAnalogValueReached = procedure(sender: TBrickletRotaryPoti; const value: word) of object;

  /// <summary>
  ///  Device for sensing Rotary Potentiometer input
  /// </summary>
  TBrickletRotaryPoti = class(TDevice)
  private
    positionCallback: TBrickletRotaryPotiNotifyPosition;
    analogValueCallback: TBrickletRotaryPotiNotifyAnalogValue;
    positionReachedCallback: TBrickletRotaryPotiNotifyPositionReached;
    analogValueReachedCallback: TBrickletRotaryPotiNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperPosition(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperPositionReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the position of the Rotary Potentiometer. The value is in degree 
    ///  and between -150° (turned left) and 150° (turned right).
    ///  
    ///  If you want to get the position periodically, it is recommended to use the
    ///  callback <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.Position"/> and set the period with 
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPosition: smallint; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.GetPosition"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.Position"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetPositionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPositionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.PositionReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the position is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the position is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the position is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the position is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetPositionCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValueReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.PositionReached"/>,
    ///  * <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackThreshold"/>,
    ///  * <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackPeriod"/>. The parameter is the position of the
    ///  Rotary Potentiometer.
    ///  
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnPosition: TBrickletRotaryPotiNotifyPosition read positionCallback write positionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  Rotary Potentiometer.
    ///  
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.AnalogValue"/> is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletRotaryPotiNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetPositionCallbackThreshold"/> is reached.
    ///  The parameter is the position of the Rotary Potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnPositionReached: TBrickletRotaryPotiNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the Rotary Potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletRotaryPoti.TBrickletRotaryPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletRotaryPotiNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletRotaryPoti.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_POTI_CALLBACK_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_POTI_CALLBACK_POSITION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_POTI_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_ROTARY_POTI_CALLBACK_POSITION] := {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  callbackWrappers[BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_ROTARY_POTI_CALLBACK_POSITION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  callbackWrappers[BRICKLET_ROTARY_POTI_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletRotaryPoti.GetPosition: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

function TBrickletRotaryPoti.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletRotaryPoti.SetPositionCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletRotaryPoti.GetPositionCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletRotaryPoti.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletRotaryPoti.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletRotaryPoti.SetPositionCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletRotaryPoti.GetPositionCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletRotaryPoti.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletRotaryPoti.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletRotaryPoti.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletRotaryPoti.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletRotaryPoti.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_POTI_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletRotaryPoti.CallbackWrapperPosition(const packet: TByteArray);
var position: smallint;
begin
  if (Assigned(positionCallback)) then begin
    position := LEConvertInt16From(8, packet);
    positionCallback(self, position);
  end;
end;

procedure TBrickletRotaryPoti.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletRotaryPoti.CallbackWrapperPositionReached(const packet: TByteArray);
var position: smallint;
begin
  if (Assigned(positionReachedCallback)) then begin
    position := LEConvertInt16From(8, packet);
    positionReachedCallback(self, position);
  end;
end;

procedure TBrickletRotaryPoti.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
