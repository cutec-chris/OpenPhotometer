{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletColor;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_COLOR_DEVICE_IDENTIFIER = 243;

  BRICKLET_COLOR_FUNCTION_GET_COLOR = 1;
  BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_PERIOD = 2;
  BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_PERIOD = 3;
  BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_THRESHOLD = 4;
  BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_THRESHOLD = 5;
  BRICKLET_COLOR_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_COLOR_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_COLOR_FUNCTION_LIGHT_ON = 10;
  BRICKLET_COLOR_FUNCTION_LIGHT_OFF = 11;
  BRICKLET_COLOR_FUNCTION_IS_LIGHT_ON = 12;
  BRICKLET_COLOR_FUNCTION_SET_CONFIG = 13;
  BRICKLET_COLOR_FUNCTION_GET_CONFIG = 14;
  BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE = 15;
  BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE = 16;
  BRICKLET_COLOR_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD = 17;
  BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD = 18;
  BRICKLET_COLOR_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD = 19;
  BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD = 20;
  BRICKLET_COLOR_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_COLOR_CALLBACK_COLOR = 8;
  BRICKLET_COLOR_CALLBACK_COLOR_REACHED = 9;
  BRICKLET_COLOR_CALLBACK_ILLUMINANCE = 21;
  BRICKLET_COLOR_CALLBACK_COLOR_TEMPERATURE = 22;

  BRICKLET_COLOR_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_COLOR_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_COLOR_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_COLOR_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_COLOR_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_COLOR_LIGHT_ON = 0;
  BRICKLET_COLOR_LIGHT_OFF = 1;
  BRICKLET_COLOR_GAIN_1X = 0;
  BRICKLET_COLOR_GAIN_4X = 1;
  BRICKLET_COLOR_GAIN_16X = 2;
  BRICKLET_COLOR_GAIN_60X = 3;
  BRICKLET_COLOR_INTEGRATION_TIME_2MS = 0;
  BRICKLET_COLOR_INTEGRATION_TIME_24MS = 1;
  BRICKLET_COLOR_INTEGRATION_TIME_101MS = 2;
  BRICKLET_COLOR_INTEGRATION_TIME_154MS = 3;
  BRICKLET_COLOR_INTEGRATION_TIME_700MS = 4;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletColor = class;
  TBrickletColorNotifyColor = procedure(sender: TBrickletColor; const r: word; const g: word; const b: word; const c: word) of object;
  TBrickletColorNotifyColorReached = procedure(sender: TBrickletColor; const r: word; const g: word; const b: word; const c: word) of object;
  TBrickletColorNotifyIlluminance = procedure(sender: TBrickletColor; const illuminance: longword) of object;
  TBrickletColorNotifyColorTemperature = procedure(sender: TBrickletColor; const colorTemperature: word) of object;

  /// <summary>
  ///  Device for measuring color (RGB value), illuminance and color temperature
  /// </summary>
  TBrickletColor = class(TDevice)
  private
    colorCallback: TBrickletColorNotifyColor;
    colorReachedCallback: TBrickletColorNotifyColorReached;
    illuminanceCallback: TBrickletColorNotifyIlluminance;
    colorTemperatureCallback: TBrickletColorNotifyColorTemperature;
  protected
    procedure CallbackWrapperColor(const packet: TByteArray); virtual;
    procedure CallbackWrapperColorReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperIlluminance(const packet: TByteArray); virtual;
    procedure CallbackWrapperColorTemperature(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the measured color of the sensor. The values
    ///  have a range of 0 to 65535.
    ///  
    ///  The red (r), green (g), blue (b) and clear (c) colors are measured
    ///  with four different photodiodes that are responsive at different
    ///  wavelengths:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///     :scale: 100 %
    ///     :alt: Chart Responsivity / Wavelength
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///  
    ///  If you want to get the color periodically, it is recommended 
    ///  to use the callback <see cref="BrickletColor.TBrickletColor.Color"/> and set the period with 
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>.
    /// </summary>
    procedure GetColor(out r: word; out g: word; out b: word; out c: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletColor.TBrickletColor.Color"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.Color"/> is only triggered if the color has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetColorCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>.
    /// </summary>
    function GetColorCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletColor.TBrickletColor.ColorReached"/> callback. 
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
    ///  The default value is ('x', 0, 0, 0, 0, 0, 0, 0, 0).
    /// </summary>
    procedure SetColorCallbackThreshold(const option: char; const minR: word; const maxR: word; const minG: word; const maxG: word; const minB: word; const maxB: word; const minC: word; const maxC: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletColor.TBrickletColor.SetColorCallbackThreshold"/>.
    /// </summary>
    procedure GetColorCallbackThreshold(out option: char; out minR: word; out maxR: word; out minG: word; out maxG: word; out minB: word; out maxB: word; out minC: word; out maxC: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletColor.TBrickletColor.ColorReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletColor.TBrickletColor.SetColorCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletColor.TBrickletColor.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Turns the LED on.
    /// </summary>
    procedure LightOn; virtual;

    /// <summary>
    ///  Turns the LED off.
    /// </summary>
    procedure LightOff; virtual;

    /// <summary>
    ///  Returns the state of the LED. Possible values are:
    ///  
    ///  * 0: On
    ///  * 1: Off
    /// </summary>
    function IsLightOn: byte; virtual;

    /// <summary>
    ///  Sets the configuration of the sensor. Gain and integration time
    ///  can be configured in this way.
    ///  
    ///  For configuring the gain:
    ///  
    ///  * 0: 1x Gain
    ///  * 1: 4x Gain
    ///  * 2: 16x Gain
    ///  * 3: 60x Gain
    ///  
    ///  For configuring the integration time:
    ///  
    ///  * 0: 2.4ms
    ///  * 1: 24ms
    ///  * 2: 101ms
    ///  * 3: 154ms
    ///  * 4: 700ms
    ///  
    ///  Increasing the gain enables the sensor to detect a
    ///  color from a higher distance.
    ///  
    ///  The integration time provides a trade-off between conversion time
    ///  and accuracy. With a longer integration time the values read will
    ///  be more accurate but it will take longer time to get the conversion
    ///  results.
    ///  
    ///  The default values are 60x gain and 154ms integration time.
    /// </summary>
    procedure SetConfig(const gain: byte; const integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    procedure GetConfig(out gain: byte; out integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the illuminance affected by the gain and integration time as
    ///  set by <see cref="BrickletColor.TBrickletColor.SetConfig"/>. To get the illuminance in Lux apply this formula::
    ///  
    ///   lux = illuminance * 700 / gain / integration_time
    ///  
    ///  To get a correct illuminance measurement make sure that the color
    ///  values themself are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  Returns the color temperature in Kelvin.
    ///  
    ///  To get a correct color temperature measurement make sure that the color
    ///  values themself are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    function GetColorTemperature: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletColor.TBrickletColor.Illuminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletColor.TBrickletColor.ColorTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.ColorTemperature"/> is only triggered if the color temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetColorTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetColorTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetColorTemperatureCallbackPeriod: longword; virtual;

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
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>. The parameter is the color
    ///  of the sensor as RGBC.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.Color"/> is only triggered if the color has changed since the
    ///  last triggering.
    /// </summary>
    property OnColor: TBrickletColorNotifyColor read colorCallback write colorCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>. The parameter is the color
    ///  of the sensor as RGBC.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.Color"/> is only triggered if the color has changed since the
    ///  last triggering.
    /// </summary>
    property OnColorReached: TBrickletColorNotifyColorReached read colorReachedCallback write colorReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColor.TBrickletColor.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance.
    ///  See <see cref="BrickletColor.TBrickletColor.GetIlluminance"/> for how to interpret this value.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    /// </summary>
    property OnIlluminance: TBrickletColorNotifyIlluminance read illuminanceCallback write illuminanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColor.TBrickletColor.SetColorTemperatureCallbackPeriod"/>. The parameter is the 
    ///  color temperature in Kelvin.
    ///  
    ///  <see cref="BrickletColor.TBrickletColor.ColorTemperature"/> is only triggered if the color temperature has 
    ///  changed since the last triggering.
    /// </summary>
    property OnColorTemperature: TBrickletColorNotifyColorTemperature read colorTemperatureCallback write colorTemperatureCallback;
  end;

implementation

constructor TBrickletColor.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_CALLBACK_COLOR] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_COLOR_CALLBACK_COLOR_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_COLOR_FUNCTION_LIGHT_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_COLOR_FUNCTION_LIGHT_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_COLOR_FUNCTION_IS_LIGHT_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_CONFIG] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_CONFIG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_COLOR_CALLBACK_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_COLOR_CALLBACK_COLOR_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_COLOR_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_COLOR_CALLBACK_COLOR] := {$ifdef FPC}@{$endif}CallbackWrapperColor;
  callbackWrappers[BRICKLET_COLOR_CALLBACK_COLOR_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperColorReached;
  callbackWrappers[BRICKLET_COLOR_CALLBACK_ILLUMINANCE] := {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  callbackWrappers[BRICKLET_COLOR_CALLBACK_COLOR_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperColorTemperature;
end;

procedure TBrickletColor.GetColor(out r: word; out g: word; out b: word; out c: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR, 8);
  response := SendRequest(request);
  r := LEConvertUInt16From(8, response);
  g := LEConvertUInt16From(10, response);
  b := LEConvertUInt16From(12, response);
  c := LEConvertUInt16From(14, response);
end;

procedure TBrickletColor.SetColorCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletColor.GetColorCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletColor.SetColorCallbackThreshold(const option: char; const minR: word; const maxR: word; const minG: word; const maxG: word; const minB: word; const maxB: word; const minC: word; const maxC: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_THRESHOLD, 25);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(minR, 9, request);
  LEConvertUInt16To(maxR, 11, request);
  LEConvertUInt16To(minG, 13, request);
  LEConvertUInt16To(maxG, 15, request);
  LEConvertUInt16To(minB, 17, request);
  LEConvertUInt16To(maxB, 19, request);
  LEConvertUInt16To(minC, 21, request);
  LEConvertUInt16To(maxC, 23, request);
  SendRequest(request);
end;

procedure TBrickletColor.GetColorCallbackThreshold(out option: char; out minR: word; out maxR: word; out minG: word; out maxG: word; out minB: word; out maxB: word; out minC: word; out maxC: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  minR := LEConvertUInt16From(9, response);
  maxR := LEConvertUInt16From(11, response);
  minG := LEConvertUInt16From(13, response);
  maxG := LEConvertUInt16From(15, response);
  minB := LEConvertUInt16From(17, response);
  maxB := LEConvertUInt16From(19, response);
  minC := LEConvertUInt16From(21, response);
  maxC := LEConvertUInt16From(23, response);
end;

procedure TBrickletColor.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletColor.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletColor.LightOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_LIGHT_ON, 8);
  SendRequest(request);
end;

procedure TBrickletColor.LightOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_LIGHT_OFF, 8);
  SendRequest(request);
end;

function TBrickletColor.IsLightOn: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_IS_LIGHT_ON, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletColor.SetConfig(const gain: byte; const integrationTime: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_CONFIG, 10);
  LEConvertUInt8To(gain, 8, request);
  LEConvertUInt8To(integrationTime, 9, request);
  SendRequest(request);
end;

procedure TBrickletColor.GetConfig(out gain: byte; out integrationTime: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_CONFIG, 8);
  response := SendRequest(request);
  gain := LEConvertUInt8From(8, response);
  integrationTime := LEConvertUInt8From(9, response);
end;

function TBrickletColor.GetIlluminance: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

function TBrickletColor.GetColorTemperature: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletColor.SetIlluminanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletColor.GetIlluminanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletColor.SetColorTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletColor.GetColorTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletColor.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletColor.CallbackWrapperColor(const packet: TByteArray);
var r: word; g: word; b: word; c: word;
begin
  if (Assigned(colorCallback)) then begin
    r := LEConvertUInt16From(8, packet);
    g := LEConvertUInt16From(10, packet);
    b := LEConvertUInt16From(12, packet);
    c := LEConvertUInt16From(14, packet);
    colorCallback(self, r, g, b, c);
  end;
end;

procedure TBrickletColor.CallbackWrapperColorReached(const packet: TByteArray);
var r: word; g: word; b: word; c: word;
begin
  if (Assigned(colorReachedCallback)) then begin
    r := LEConvertUInt16From(8, packet);
    g := LEConvertUInt16From(10, packet);
    b := LEConvertUInt16From(12, packet);
    c := LEConvertUInt16From(14, packet);
    colorReachedCallback(self, r, g, b, c);
  end;
end;

procedure TBrickletColor.CallbackWrapperIlluminance(const packet: TByteArray);
var illuminance: longword;
begin
  if (Assigned(illuminanceCallback)) then begin
    illuminance := LEConvertUInt32From(8, packet);
    illuminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletColor.CallbackWrapperColorTemperature(const packet: TByteArray);
var colorTemperature: word;
begin
  if (Assigned(colorTemperatureCallback)) then begin
    colorTemperature := LEConvertUInt16From(8, packet);
    colorTemperatureCallback(self, colorTemperature);
  end;
end;

end.
