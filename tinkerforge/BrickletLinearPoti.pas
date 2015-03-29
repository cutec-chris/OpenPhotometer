{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLinearPoti;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LINEAR_POTI_DEVICE_IDENTIFIER = 213;

  BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION = 1;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD = 3;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD = 4;
  BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD = 7;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD = 8;
  BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_LINEAR_POTI_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_LINEAR_POTI_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LINEAR_POTI_CALLBACK_POSITION = 13;
  BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE = 14;
  BRICKLET_LINEAR_POTI_CALLBACK_POSITION_REACHED = 15;
  BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE_REACHED = 16;

  BRICKLET_LINEAR_POTI_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_LINEAR_POTI_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_LINEAR_POTI_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_LINEAR_POTI_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_LINEAR_POTI_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLinearPoti = class;
  TBrickletLinearPotiNotifyPosition = procedure(sender: TBrickletLinearPoti; const position: word) of object;
  TBrickletLinearPotiNotifyAnalogValue = procedure(sender: TBrickletLinearPoti; const value: word) of object;
  TBrickletLinearPotiNotifyPositionReached = procedure(sender: TBrickletLinearPoti; const position: word) of object;
  TBrickletLinearPotiNotifyAnalogValueReached = procedure(sender: TBrickletLinearPoti; const value: word) of object;

  /// <summary>
  ///  Device for sensing Linear Potentiometer input
  /// </summary>
  TBrickletLinearPoti = class(TDevice)
  private
    positionCallback: TBrickletLinearPotiNotifyPosition;
    analogValueCallback: TBrickletLinearPotiNotifyAnalogValue;
    positionReachedCallback: TBrickletLinearPotiNotifyPositionReached;
    analogValueReachedCallback: TBrickletLinearPotiNotifyAnalogValueReached;
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
    ///  Returns the position of the Linear Potentiometer. The value is  
    ///  between 0 (slider down) and 100 (slider up).
    ///  
    ///  If you want to get the position periodically, it is recommended to use the
    ///  callback <see cref="BrickletLinearPoti.TBrickletLinearPoti.Position"/> and set the period with 
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPosition: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetPosition"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLinearPoti.TBrickletLinearPoti.Position"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetPositionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPositionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLinearPoti.TBrickletLinearPoti.PositionReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.PositionReached"/>,
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/>,
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>. The parameter is the position of the
    ///  Linear Potentiometer.
    ///  
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnPosition: TBrickletLinearPotiNotifyPosition read positionCallback write positionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  Linear Potentiometer.
    ///  
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.AnalogValue"/> is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletLinearPotiNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/> is reached.
    ///  The parameter is the position of the Linear Potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnPositionReached: TBrickletLinearPotiNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the Linear Potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletLinearPotiNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletLinearPoti.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LINEAR_POTI_CALLBACK_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINEAR_POTI_CALLBACK_POSITION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LINEAR_POTI_CALLBACK_POSITION] := {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  callbackWrappers[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_LINEAR_POTI_CALLBACK_POSITION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  callbackWrappers[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletLinearPoti.GetPosition: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletLinearPoti.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletLinearPoti.SetPositionCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLinearPoti.GetPositionCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLinearPoti.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLinearPoti.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLinearPoti.SetPositionCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletLinearPoti.GetPositionCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletLinearPoti.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletLinearPoti.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletLinearPoti.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletLinearPoti.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLinearPoti.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLinearPoti.CallbackWrapperPosition(const packet: TByteArray);
var position: word;
begin
  if (Assigned(positionCallback)) then begin
    position := LEConvertUInt16From(8, packet);
    positionCallback(self, position);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperPositionReached(const packet: TByteArray);
var position: word;
begin
  if (Assigned(positionReachedCallback)) then begin
    position := LEConvertUInt16From(8, packet);
    positionReachedCallback(self, position);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
