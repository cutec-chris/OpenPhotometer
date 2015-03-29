{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletVoltage;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_VOLTAGE_DEVICE_IDENTIFIER = 218;

  BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE = 1;
  BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD = 3;
  BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD = 4;
  BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD = 7;
  BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD = 8;
  BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_VOLTAGE_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_VOLTAGE_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_VOLTAGE_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_VOLTAGE_CALLBACK_VOLTAGE = 13;
  BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE = 14;
  BRICKLET_VOLTAGE_CALLBACK_VOLTAGE_REACHED = 15;
  BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE_REACHED = 16;

  BRICKLET_VOLTAGE_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_VOLTAGE_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_VOLTAGE_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_VOLTAGE_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_VOLTAGE_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletVoltage = class;
  TBrickletVoltageNotifyVoltage = procedure(sender: TBrickletVoltage; const voltage: word) of object;
  TBrickletVoltageNotifyAnalogValue = procedure(sender: TBrickletVoltage; const value: word) of object;
  TBrickletVoltageNotifyVoltageReached = procedure(sender: TBrickletVoltage; const voltage: word) of object;
  TBrickletVoltageNotifyAnalogValueReached = procedure(sender: TBrickletVoltage; const value: word) of object;

  /// <summary>
  ///  Device for sensing Voltages between 0 and 50V
  /// </summary>
  TBrickletVoltage = class(TDevice)
  private
    voltageCallback: TBrickletVoltageNotifyVoltage;
    analogValueCallback: TBrickletVoltageNotifyAnalogValue;
    voltageReachedCallback: TBrickletVoltageNotifyVoltageReached;
    analogValueReachedCallback: TBrickletVoltageNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the voltage of the sensor. The value is in mV and
    ///  between 0mV and 50000mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  callback <see cref="BrickletVoltage.TBrickletVoltage.Voltage"/> and set the period with 
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletVoltage.TBrickletVoltage.GetVoltage"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletVoltage.TBrickletVoltage.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletVoltage.TBrickletVoltage.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletVoltage.TBrickletVoltage.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletVoltage.TBrickletVoltage.Voltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletVoltage.TBrickletVoltage.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletVoltage.TBrickletVoltage.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletVoltage.TBrickletVoltage.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltage.TBrickletVoltage.VoltageReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetVoltageCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltage.TBrickletVoltage.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletVoltage.TBrickletVoltage.VoltageReached"/>,
    ///  * <see cref="BrickletVoltage.TBrickletVoltage.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletVoltage.TBrickletVoltage.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletVoltage.TBrickletVoltage.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnVoltage: TBrickletVoltageNotifyVoltage read voltageCallback write voltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletVoltage.TBrickletVoltage.AnalogValue"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletVoltageNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltage.TBrickletVoltage.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletVoltageNotifyVoltageReached read voltageReachedCallback write voltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltage.TBrickletVoltage.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltage.TBrickletVoltage.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletVoltageNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletVoltage.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CALLBACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CALLBACK_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_VOLTAGE_CALLBACK_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  callbackWrappers[BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_VOLTAGE_CALLBACK_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  callbackWrappers[BRICKLET_VOLTAGE_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletVoltage.GetVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletVoltage.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletVoltage.SetVoltageCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletVoltage.GetVoltageCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltage.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletVoltage.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltage.SetVoltageCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletVoltage.GetVoltageCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletVoltage.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletVoltage.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletVoltage.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletVoltage.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltage.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletVoltage.CallbackWrapperVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(voltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    voltageCallback(self, voltage);
  end;
end;

procedure TBrickletVoltage.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletVoltage.CallbackWrapperVoltageReached(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(voltageReachedCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    voltageReachedCallback(self, voltage);
  end;
end;

procedure TBrickletVoltage.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
