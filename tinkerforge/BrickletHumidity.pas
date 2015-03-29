{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletHumidity;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_HUMIDITY_DEVICE_IDENTIFIER = 27;

  BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY = 1;
  BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_PERIOD = 3;
  BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_PERIOD = 4;
  BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_THRESHOLD = 7;
  BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_THRESHOLD = 8;
  BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_HUMIDITY_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_HUMIDITY_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_HUMIDITY_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_HUMIDITY_CALLBACK_HUMIDITY = 13;
  BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE = 14;
  BRICKLET_HUMIDITY_CALLBACK_HUMIDITY_REACHED = 15;
  BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE_REACHED = 16;

  BRICKLET_HUMIDITY_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_HUMIDITY_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_HUMIDITY_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_HUMIDITY_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_HUMIDITY_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletHumidity = class;
  TBrickletHumidityNotifyHumidity = procedure(sender: TBrickletHumidity; const humidity: word) of object;
  TBrickletHumidityNotifyAnalogValue = procedure(sender: TBrickletHumidity; const value: word) of object;
  TBrickletHumidityNotifyHumidityReached = procedure(sender: TBrickletHumidity; const humidity: word) of object;
  TBrickletHumidityNotifyAnalogValueReached = procedure(sender: TBrickletHumidity; const value: word) of object;

  /// <summary>
  ///  Device for sensing Humidity
  /// </summary>
  TBrickletHumidity = class(TDevice)
  private
    humidityCallback: TBrickletHumidityNotifyHumidity;
    analogValueCallback: TBrickletHumidityNotifyAnalogValue;
    humidityReachedCallback: TBrickletHumidityNotifyHumidityReached;
    analogValueReachedCallback: TBrickletHumidityNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperHumidity(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperHumidityReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the humidity of the sensor. The value
    ///  has a range of 0 to 1000 and is given in %RH/10 (Relative Humidity), 
    ///  i.e. a value of 421 means that a humidity of 42.1 %RH is measured.
    ///  
    ///  If you want to get the humidity periodically, it is recommended to use the
    ///  callback <see cref="BrickletHumidity.TBrickletHumidity.Humidity"/> and set the period with 
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>.
    /// </summary>
    function GetHumidity: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletHumidity.TBrickletHumidity.GetHumidity"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletHumidity.TBrickletHumidity.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The returned humidity value is calibrated for
    ///   room temperatures, if you use the sensor in extreme cold or extreme
    ///   warm environments, you might want to calculate the humidity from
    ///   the analog value yourself. See the `HIH 5030 datasheet
    ///   &lt;https://github.com/Tinkerforge/humidity-bricklet/raw/master/datasheets/hih-5030.pdf&gt;`__.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletHumidity.TBrickletHumidity.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletHumidity.TBrickletHumidity.Humidity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletHumidity.TBrickletHumidity.Humidity"/> is only triggered if the humidity has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetHumidityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>.
    /// </summary>
    function GetHumidityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletHumidity.TBrickletHumidity.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletHumidity.TBrickletHumidity.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletHumidity.TBrickletHumidity.HumidityReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the humidity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the humidity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the humidity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the humidity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetHumidityCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/>.
    /// </summary>
    procedure GetHumidityCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletHumidity.TBrickletHumidity.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.HumidityReached"/>,
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/>,
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>. The parameter is the humidity of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletHumidity.TBrickletHumidity.Humidity"/> is only triggered if the humidity has changed since the
    ///  last triggering.
    /// </summary>
    property OnHumidity: TBrickletHumidityNotifyHumidity read humidityCallback write humidityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletHumidity.TBrickletHumidity.AnalogValue"/> is only triggered if the humidity has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletHumidityNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/> is reached.
    ///  The parameter is the humidity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
    /// </summary>
    property OnHumidityReached: TBrickletHumidityNotifyHumidityReached read humidityReachedCallback write humidityReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletHumidityNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletHumidity.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY] := {$ifdef FPC}@{$endif}CallbackWrapperHumidity;
  callbackWrappers[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperHumidityReached;
  callbackWrappers[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletHumidity.GetHumidity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletHumidity.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletHumidity.SetHumidityCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletHumidity.GetHumidityCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHumidity.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletHumidity.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHumidity.SetHumidityCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletHumidity.GetHumidityCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletHumidity.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletHumidity.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletHumidity.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletHumidity.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHumidity.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletHumidity.CallbackWrapperHumidity(const packet: TByteArray);
var humidity: word;
begin
  if (Assigned(humidityCallback)) then begin
    humidity := LEConvertUInt16From(8, packet);
    humidityCallback(self, humidity);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperHumidityReached(const packet: TByteArray);
var humidity: word;
begin
  if (Assigned(humidityReachedCallback)) then begin
    humidity := LEConvertUInt16From(8, packet);
    humidityReachedCallback(self, humidity);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
