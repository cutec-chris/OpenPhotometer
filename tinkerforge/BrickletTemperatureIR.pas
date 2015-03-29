{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletTemperatureIR;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_TEMPERATURE_IR_DEVICE_IDENTIFIER = 217;

  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE = 1;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE = 2;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_EMISSIVITY = 3;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_EMISSIVITY = 4;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD = 5;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD = 6;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD = 7;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD = 8;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD = 9;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD = 10;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD = 11;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD = 12;
  BRICKLET_TEMPERATURE_IR_FUNCTION_SET_DEBOUNCE_PERIOD = 13;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_DEBOUNCE_PERIOD = 14;
  BRICKLET_TEMPERATURE_IR_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE = 15;
  BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE = 16;
  BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE_REACHED = 17;
  BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE_REACHED = 18;

  BRICKLET_TEMPERATURE_IR_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_TEMPERATURE_IR_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_TEMPERATURE_IR_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_TEMPERATURE_IR_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_TEMPERATURE_IR_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTemperatureIR = class;
  TBrickletTemperatureIRNotifyAmbientTemperature = procedure(sender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyObjectTemperature = procedure(sender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyAmbientTemperatureReached = procedure(sender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyObjectTemperatureReached = procedure(sender: TBrickletTemperatureIR; const temperature: smallint) of object;

  /// <summary>
  ///  Device for non-contact temperature sensing
  /// </summary>
  TBrickletTemperatureIR = class(TDevice)
  private
    ambientTemperatureCallback: TBrickletTemperatureIRNotifyAmbientTemperature;
    objectTemperatureCallback: TBrickletTemperatureIRNotifyObjectTemperature;
    ambientTemperatureReachedCallback: TBrickletTemperatureIRNotifyAmbientTemperatureReached;
    objectTemperatureReachedCallback: TBrickletTemperatureIRNotifyObjectTemperatureReached;
  protected
    procedure CallbackWrapperAmbientTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperObjectTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperAmbientTemperatureReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperObjectTemperatureReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the ambient temperature of the sensor. The value
    ///  has a range of -400 to 1250 and is given in °C/10,
    ///  e.g. a value of 423 means that an ambient temperature of 42.3 °C is 
    ///  measured.
    ///  
    ///  If you want to get the ambient temperature periodically, it is recommended 
    ///  to use the callback <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperature"/> and set the period with 
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetAmbientTemperature: smallint; virtual;

    /// <summary>
    ///  Returns the object temperature of the sensor, i.e. the temperature
    ///  of the surface of the object the sensor is aimed at. The value
    ///  has a range of -700 to 3800 and is given in °C/10,
    ///  e.g. a value of 3001 means that a temperature of 300.1 °C is measured
    ///  on the surface of the object.
    ///  
    ///  The temperature of different materials is dependent on their `emissivity 
    ///  &lt;http://en.wikipedia.org/wiki/Emissivity&gt;`__. The emissivity of the material
    ///  can be set with <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/>.
    ///  
    ///  If you want to get the object temperature periodically, it is recommended 
    ///  to use the callback <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperature"/> and set the period with 
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetObjectTemperature: smallint; virtual;

    /// <summary>
    ///  Sets the `emissivity &lt;http://en.wikipedia.org/wiki/Emissivity&gt;`__ that is
    ///  used to calculate the surface temperature as returned by 
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.GetObjectTemperature"/>. 
    ///  
    ///  The emissivity is usually given as a value between 0.0 and 1.0. A list of
    ///  emissivities of different materials can be found 
    ///  `here &lt;http://www.infrared-thermography.com/material.htm&gt;`__.
    ///  
    ///  The parameter of <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/> has to be given with a factor of
    ///  65535 (16-bit). For example: An emissivity of 0.1 can be set with the
    ///  value 6553, an emissivity of 0.5 with the value 32767 and so on.
    ///  
    ///  <note>
    ///   If you need a precise measurement for the object temperature, it is
    ///   absolutely crucial that you also provide a precise emissivity.
    ///  </note>
    ///  
    ///  The default emissivity is 1.0 (value of 65535) and the minimum emissivity the
    ///  sensor can handle is 0.1 (value of 6553).
    /// </summary>
    procedure SetEmissivity(const emissivity: word); virtual;

    /// <summary>
    ///  Returns the emissivity as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/>.
    /// </summary>
    function GetEmissivity: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAmbientTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetAmbientTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetObjectTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetObjectTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperatureReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the ambient temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the ambient temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the ambient temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the ambient temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetAmbientTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetAmbientTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperatureReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the object temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the object temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the object temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the object temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetObjectTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetObjectTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperatureReached"/>,
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperatureReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/>,
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>. The parameter is the ambient
    ///  temperature of the sensor.
    ///  
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.AmbientTemperature"/> is only triggered if the ambient temperature
    ///  has changed since the last triggering.
    /// </summary>
    property OnAmbientTemperature: TBrickletTemperatureIRNotifyAmbientTemperature read ambientTemperatureCallback write ambientTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>. The parameter is the object
    ///  temperature of the sensor.
    ///  
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.ObjectTemperature"/> is only triggered if the object temperature
    ///  has changed since the last triggering.
    /// </summary>
    property OnObjectTemperature: TBrickletTemperatureIRNotifyObjectTemperature read objectTemperatureCallback write objectTemperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the ambient temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnAmbientTemperatureReached: TBrickletTemperatureIRNotifyAmbientTemperatureReached read ambientTemperatureReachedCallback write ambientTemperatureReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the object temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnObjectTemperatureReached: TBrickletTemperatureIRNotifyObjectTemperatureReached read objectTemperatureReachedCallback write objectTemperatureReachedCallback;
  end;

implementation

constructor TBrickletTemperatureIR.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_EMISSIVITY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_EMISSIVITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperAmbientTemperature;
  callbackWrappers[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperObjectTemperature;
  callbackWrappers[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAmbientTemperatureReached;
  callbackWrappers[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperObjectTemperatureReached;
end;

function TBrickletTemperatureIR.GetAmbientTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

function TBrickletTemperatureIR.GetObjectTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickletTemperatureIR.SetEmissivity(const emissivity: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_EMISSIVITY, 10);
  LEConvertUInt16To(emissivity, 8, request);
  SendRequest(request);
end;

function TBrickletTemperatureIR.GetEmissivity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_EMISSIVITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletTemperatureIR.GetAmbientTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletTemperatureIR.GetObjectTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletTemperatureIR.GetAmbientTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletTemperatureIR.GetObjectTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletTemperatureIR.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletTemperatureIR.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletTemperatureIR.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletTemperatureIR.CallbackWrapperAmbientTemperature(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(ambientTemperatureCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    ambientTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperObjectTemperature(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(objectTemperatureCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    objectTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperAmbientTemperatureReached(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(ambientTemperatureReachedCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    ambientTemperatureReachedCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperObjectTemperatureReached(const packet: TByteArray);
var temperature: smallint;
begin
  if (Assigned(objectTemperatureReachedCallback)) then begin
    temperature := LEConvertInt16From(8, packet);
    objectTemperatureReachedCallback(self, temperature);
  end;
end;

end.
