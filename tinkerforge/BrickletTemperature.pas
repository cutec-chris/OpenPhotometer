{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletTemperature;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_TEMPERATURE_DEVICE_IDENTIFIER = 216;

  BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE = 1;
  BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD = 2;
  BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD = 3;
  BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD = 4;
  BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD = 5;
  BRICKLET_TEMPERATURE_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_TEMPERATURE_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_TEMPERATURE_FUNCTION_SET_I2C_MODE = 10;
  BRICKLET_TEMPERATURE_FUNCTION_GET_I2C_MODE = 11;
  BRICKLET_TEMPERATURE_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE = 8;
  BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE_REACHED = 9;

  BRICKLET_TEMPERATURE_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_TEMPERATURE_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_TEMPERATURE_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_TEMPERATURE_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_TEMPERATURE_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_TEMPERATURE_I2C_MODE_FAST = 0;
  BRICKLET_TEMPERATURE_I2C_MODE_SLOW = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTemperature = class;
  TBrickletTemperatureNotifyTemperature = procedure(sender: TBrickletTemperature; const temperature: smallint) of object;
  TBrickletTemperatureNotifyTemperatureReached = procedure(sender: TBrickletTemperature; const temperature: smallint) of object;

  /// <summary>
  ///  Device for sensing Temperature
  /// </summary>
  TBrickletTemperature = class(TDevice)
  private
    temperatureCallback: TBrickletTemperatureNotifyTemperature;
    temperatureReachedCallback: TBrickletTemperatureNotifyTemperatureReached;
  protected
    procedure CallbackWrapperTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the temperature of the sensor. The value
    ///  has a range of -2500 to 8500 and is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended 
    ///  to use the callback <see cref="BrickletTemperature.TBrickletTemperature.Temperature"/> and set the period with 
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletTemperature.TBrickletTemperature.Temperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletTemperature.TBrickletTemperature.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperature.TBrickletTemperature.TemperatureReached"/> callback. 
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
    procedure SetTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletTemperature.TBrickletTemperature.TemperatureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the I2C mode. Possible modes are:
    ///  
    ///  * 0: Fast (400kHz, default)
    ///  * 1: Slow (100kHz)
    ///  
    ///  If you have problems with obvious outliers in the
    ///  Temperature Bricklet measurements, they may be caused by EMI issues.
    ///  In this case it may be helpful to lower the I2C speed.
    ///  
    ///  It is however not recommended to lower the I2C speed in applications where
    ///  a high throughput needs to be achieved.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure SetI2CMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the I2C mode as set by <see cref="BrickletTemperature.TBrickletTemperature.SetI2CMode"/>.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    function GetI2CMode: byte; virtual;

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
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>. The parameter is the temperature
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletTemperature.TBrickletTemperature.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    /// </summary>
    property OnTemperature: TBrickletTemperatureNotifyTemperature read temperatureCallback write temperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletTemperatureNotifyTemperatureReached read temperatureReachedCallback write temperatureReachedCallback;
  end;

implementation

constructor TBrickletTemperature.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_I2C_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_I2C_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  callbackWrappers[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
end;

function TBrickletTemperature.GetTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickletTemperature.SetTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletTemperature.GetTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletTemperature.SetTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletTemperature.GetTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletTemperature.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletTemperature.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletTemperature.SetI2CMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_I2C_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickletTemperature.GetI2CMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_I2C_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletTemperature.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletTemperature.CallbackWrapperTemperature(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(temperatureCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    temperatureCallback(self, temperature);
  end;
end;

procedure TBrickletTemperature.CallbackWrapperTemperatureReached(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(temperatureReachedCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    temperatureReachedCallback(self, temperature);
  end;
end;

end.
