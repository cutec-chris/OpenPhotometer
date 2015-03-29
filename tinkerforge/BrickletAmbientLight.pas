{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAmbientLight;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_AMBIENT_LIGHT_DEVICE_IDENTIFIER = 21;

  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE = 1;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD = 3;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD = 4;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD = 7;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD = 8;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE = 13;
  BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE = 14;
  BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE_REACHED = 15;
  BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE_REACHED = 16;

  BRICKLET_AMBIENT_LIGHT_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_AMBIENT_LIGHT_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_AMBIENT_LIGHT_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_AMBIENT_LIGHT_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_AMBIENT_LIGHT_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAmbientLight = class;
  TBrickletAmbientLightNotifyIlluminance = procedure(sender: TBrickletAmbientLight; const illuminance: word) of object;
  TBrickletAmbientLightNotifyAnalogValue = procedure(sender: TBrickletAmbientLight; const value: word) of object;
  TBrickletAmbientLightNotifyIlluminanceReached = procedure(sender: TBrickletAmbientLight; const illuminance: word) of object;
  TBrickletAmbientLightNotifyAnalogValueReached = procedure(sender: TBrickletAmbientLight; const value: word) of object;

  /// <summary>
  ///  Device for sensing Ambient Light
  /// </summary>
  TBrickletAmbientLight = class(TDevice)
  private
    illuminanceCallback: TBrickletAmbientLightNotifyIlluminance;
    analogValueCallback: TBrickletAmbientLightNotifyAnalogValue;
    illuminanceReachedCallback: TBrickletAmbientLightNotifyIlluminanceReached;
    analogValueReachedCallback: TBrickletAmbientLightNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperIlluminance(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperIlluminanceReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the illuminance of the ambient light sensor. The value
    ///  has a range of 0 to 9000 and is given in Lux/10, i.e. a value
    ///  of 4500 means that an illuminance of 450 Lux is measured.
    ///  
    ///  If you want to get the illuminance periodically, it is recommended to use the
    ///  callback <see cref="BrickletAmbientLight.TBrickletAmbientLight.Illuminance"/> and set the period with 
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminance: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetIlluminance"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///   Also, the analog-to-digital converter covers three different ranges that are
    ///   set dynamically depending on the light intensity. It is impossible to
    ///   distinguish between these ranges with the analog value.
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAmbientLight.TBrickletAmbientLight.Illuminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLight.TBrickletAmbientLight.IlluminanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the illuminance is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the illuminance is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the illuminance is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the illuminance is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetIlluminanceCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/>.
    /// </summary>
    procedure GetIlluminanceCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.IlluminanceReached"/>,
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/>,
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance of the
    ///  ambient light sensor.
    ///  
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    /// </summary>
    property OnIlluminance: TBrickletAmbientLightNotifyIlluminance read illuminanceCallback write illuminanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  ambient light sensor.
    ///  
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletAmbientLightNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/> is reached.
    ///  The parameter is the illuminance of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnIlluminanceReached: TBrickletAmbientLightNotifyIlluminanceReached read illuminanceReachedCallback write illuminanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletAmbientLightNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletAmbientLight.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE] := {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  callbackWrappers[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperIlluminanceReached;
  callbackWrappers[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletAmbientLight.GetIlluminance: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletAmbientLight.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletAmbientLight.SetIlluminanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAmbientLight.GetIlluminanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLight.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAmbientLight.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLight.SetIlluminanceCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletAmbientLight.GetIlluminanceCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletAmbientLight.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletAmbientLight.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletAmbientLight.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletAmbientLight.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLight.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletAmbientLight.CallbackWrapperIlluminance(const packet: TByteArray);
var illuminance: word;
begin
  if (Assigned(illuminanceCallback)) then begin
    illuminance := LEConvertUInt16From(8, packet);
    illuminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperIlluminanceReached(const packet: TByteArray);
var illuminance: word;
begin
  if (Assigned(illuminanceReachedCallback)) then begin
    illuminance := LEConvertUInt16From(8, packet);
    illuminanceReachedCallback(self, illuminance);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
