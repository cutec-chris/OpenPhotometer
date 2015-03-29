{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletPTC;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_PTC_DEVICE_IDENTIFIER = 226;

  BRICKLET_PTC_FUNCTION_GET_TEMPERATURE = 1;
  BRICKLET_PTC_FUNCTION_GET_RESISTANCE = 2;
  BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD = 3;
  BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD = 4;
  BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD = 5;
  BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD = 6;
  BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD = 7;
  BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD = 8;
  BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD = 9;
  BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD = 10;
  BRICKLET_PTC_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_PTC_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_PTC_FUNCTION_SET_NOISE_REJECTION_FILTER = 17;
  BRICKLET_PTC_FUNCTION_GET_NOISE_REJECTION_FILTER = 18;
  BRICKLET_PTC_FUNCTION_IS_SENSOR_CONNECTED = 19;
  BRICKLET_PTC_FUNCTION_SET_WIRE_MODE = 20;
  BRICKLET_PTC_FUNCTION_GET_WIRE_MODE = 21;
  BRICKLET_PTC_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_PTC_CALLBACK_TEMPERATURE = 13;
  BRICKLET_PTC_CALLBACK_TEMPERATURE_REACHED = 14;
  BRICKLET_PTC_CALLBACK_RESISTANCE = 15;
  BRICKLET_PTC_CALLBACK_RESISTANCE_REACHED = 16;

  BRICKLET_PTC_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_PTC_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_PTC_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_PTC_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_PTC_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_PTC_FILTER_OPTION_50HZ = 0;
  BRICKLET_PTC_FILTER_OPTION_60HZ = 1;
  BRICKLET_PTC_WIRE_MODE_2 = 2;
  BRICKLET_PTC_WIRE_MODE_3 = 3;
  BRICKLET_PTC_WIRE_MODE_4 = 4;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPTC = class;
  TBrickletPTCNotifyTemperature = procedure(sender: TBrickletPTC; const temperature: longint) of object;
  TBrickletPTCNotifyTemperatureReached = procedure(sender: TBrickletPTC; const temperature: longint) of object;
  TBrickletPTCNotifyResistance = procedure(sender: TBrickletPTC; const resistance: word) of object;
  TBrickletPTCNotifyResistanceReached = procedure(sender: TBrickletPTC; const resistance: word) of object;

  /// <summary>
  ///  Device for reading temperatures from Pt100 or Pt1000 sensors
  /// </summary>
  TBrickletPTC = class(TDevice)
  private
    temperatureCallback: TBrickletPTCNotifyTemperature;
    temperatureReachedCallback: TBrickletPTCNotifyTemperatureReached;
    resistanceCallback: TBrickletPTCNotifyResistance;
    resistanceReachedCallback: TBrickletPTCNotifyResistanceReached;
  protected
    procedure CallbackWrapperTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperResistance(const packet: TByteArray); virtual;
    procedure CallbackWrapperResistanceReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the temperature of connected sensor. The value
    ///  has a range of -246 to 849 °C and is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended 
    ///  to use the callback <see cref="BrickletPTC.TBrickletPTC.Temperature"/> and set the period with 
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  Returns the value as measured by the MAX31865 precision delta-sigma ADC.
    ///  
    ///  The value can be converted with the following formulas:
    ///  
    ///  * Pt100:  resistance = (value * 390) / 32768
    ///  * Pt1000: resistance = (value * 3900) / 32768
    ///  
    ///  If you want to get the resistance periodically, it is recommended 
    ///  to use the callback <see cref="BrickletPTC.TBrickletPTC.Resistance"/> and set the period with 
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>.
    /// </summary>
    function GetResistance: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletPTC.TBrickletPTC.Temperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletPTC.TBrickletPTC.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletPTC.TBrickletPTC.Resistance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletPTC.TBrickletPTC.Resistance"/> is only triggered if the resistance has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetResistanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>.
    /// </summary>
    function GetResistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletPTC.TBrickletPTC.TemperatureReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetTemperatureCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletPTC.TBrickletPTC.ResistanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetResistanceCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetResistanceCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletPTC.TBrickletPTC.TemperatureReached"/>,
    ///  * <see cref="BrickletPTC.TBrickletPTC.ResistanceReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/>,
    ///  * <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the noise rejection filter to either 50Hz (0) or 60Hz (1).
    ///  Noise from 50Hz or 60Hz power sources (including
    ///  harmonics of the AC power's fundamental frequency) is
    ///  attenuated by 82dB.
    ///  
    ///  Default value is 0 = 50Hz.
    /// </summary>
    procedure SetNoiseRejectionFilter(const filter: byte); virtual;

    /// <summary>
    ///  Returns the noise rejection filter option as set by 
    ///  <see cref="BrickletPTC.TBrickletPTC.SetNoiseRejectionFilter"/>
    /// </summary>
    function GetNoiseRejectionFilter: byte; virtual;

    /// <summary>
    ///  Returns *true* if the sensor is connected correctly. 
    ///  
    ///  If this function
    ///  returns *false*, there is either no Pt100 or Pt1000 sensor connected,
    ///  the sensor is connected incorrectly or the sensor itself is faulty.
    /// </summary>
    function IsSensorConnected: boolean; virtual;

    /// <summary>
    ///  Sets the wire mode of the sensor. Possible values are 2, 3 and 4 which
    ///  correspond to 2-, 3- and 4-wire sensors. The value has to match the jumper
    ///  configuration on the Bricklet.
    ///  
    ///  The default value is 2 = 2-wire.
    /// </summary>
    procedure SetWireMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the wire mode as set by <see cref="BrickletPTC.TBrickletPTC.SetWireMode"/>
    /// </summary>
    function GetWireMode: byte; virtual;

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
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>. The parameter is the temperature
    ///  of the connected sensor.
    ///  
    ///  <see cref="BrickletPTC.TBrickletPTC.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    /// </summary>
    property OnTemperature: TBrickletPTCNotifyTemperature read temperatureCallback write temperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the connected sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletPTCNotifyTemperatureReached read temperatureReachedCallback write temperatureReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>. The parameter is the resistance
    ///  of the connected sensor.
    ///  
    ///  <see cref="BrickletPTC.TBrickletPTC.Resistance"/> is only triggered if the resistance has changed since the
    ///  last triggering.
    /// </summary>
    property OnResistance: TBrickletPTCNotifyResistance read resistanceCallback write resistanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/> is reached.
    ///  The parameter is the resistance of the connected sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    property OnResistanceReached: TBrickletPTCNotifyResistanceReached read resistanceReachedCallback write resistanceReachedCallback;
  end;

implementation

constructor TBrickletPTC.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_CALLBACK_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PTC_CALLBACK_TEMPERATURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PTC_CALLBACK_RESISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PTC_CALLBACK_RESISTANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_NOISE_REJECTION_FILTER] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_NOISE_REJECTION_FILTER] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_IS_SENSOR_CONNECTED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_SET_WIRE_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_WIRE_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_PTC_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_PTC_CALLBACK_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  callbackWrappers[BRICKLET_PTC_CALLBACK_TEMPERATURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
  callbackWrappers[BRICKLET_PTC_CALLBACK_RESISTANCE] := {$ifdef FPC}@{$endif}CallbackWrapperResistance;
  callbackWrappers[BRICKLET_PTC_CALLBACK_RESISTANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperResistanceReached;
end;

function TBrickletPTC.GetTemperature: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

function TBrickletPTC.GetResistance: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletPTC.SetTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletPTC.GetTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletPTC.SetResistanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletPTC.GetResistanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletPTC.SetTemperatureCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletPTC.GetTemperatureCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletPTC.SetResistanceCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletPTC.GetResistanceCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletPTC.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletPTC.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletPTC.SetNoiseRejectionFilter(const filter: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_NOISE_REJECTION_FILTER, 9);
  LEConvertUInt8To(filter, 8, request);
  SendRequest(request);
end;

function TBrickletPTC.GetNoiseRejectionFilter: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_NOISE_REJECTION_FILTER, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickletPTC.IsSensorConnected: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_IS_SENSOR_CONNECTED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletPTC.SetWireMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_WIRE_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickletPTC.GetWireMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_WIRE_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletPTC.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletPTC.CallbackWrapperTemperature(const packet: TByteArray);
var temperature: longint;
begin
  if (Assigned(temperatureCallback)) then begin
    temperature := LEConvertInt32From(8, packet);
    temperatureCallback(self, temperature);
  end;
end;

procedure TBrickletPTC.CallbackWrapperTemperatureReached(const packet: TByteArray);
var temperature: longint;
begin
  if (Assigned(temperatureReachedCallback)) then begin
    temperature := LEConvertInt32From(8, packet);
    temperatureReachedCallback(self, temperature);
  end;
end;

procedure TBrickletPTC.CallbackWrapperResistance(const packet: TByteArray);
var resistance: word;
begin
  if (Assigned(resistanceCallback)) then begin
    resistance := LEConvertUInt16From(8, packet);
    resistanceCallback(self, resistance);
  end;
end;

procedure TBrickletPTC.CallbackWrapperResistanceReached(const packet: TByteArray);
var resistance: word;
begin
  if (Assigned(resistanceReachedCallback)) then begin
    resistance := LEConvertUInt16From(8, packet);
    resistanceReachedCallback(self, resistance);
  end;
end;

end.
