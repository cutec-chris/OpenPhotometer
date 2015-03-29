{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletDistanceIR;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_DISTANCE_IR_DEVICE_IDENTIFIER = 25;

  BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE = 1;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_SAMPLING_POINT = 3;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_SAMPLING_POINT = 4;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD = 5;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD = 6;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 7;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 8;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD = 9;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD = 10;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 11;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 12;
  BRICKLET_DISTANCE_IR_FUNCTION_SET_DEBOUNCE_PERIOD = 13;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_DEBOUNCE_PERIOD = 14;
  BRICKLET_DISTANCE_IR_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE = 15;
  BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE = 16;
  BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE_REACHED = 17;
  BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE_REACHED = 18;

  BRICKLET_DISTANCE_IR_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_DISTANCE_IR_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_DISTANCE_IR_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_DISTANCE_IR_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_DISTANCE_IR_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDistanceIR = class;
  TBrickletDistanceIRNotifyDistance = procedure(sender: TBrickletDistanceIR; const distance: word) of object;
  TBrickletDistanceIRNotifyAnalogValue = procedure(sender: TBrickletDistanceIR; const value: word) of object;
  TBrickletDistanceIRNotifyDistanceReached = procedure(sender: TBrickletDistanceIR; const distance: word) of object;
  TBrickletDistanceIRNotifyAnalogValueReached = procedure(sender: TBrickletDistanceIR; const value: word) of object;

  /// <summary>
  ///  Device for sensing distance via infrared
  /// </summary>
  TBrickletDistanceIR = class(TDevice)
  private
    distanceCallback: TBrickletDistanceIRNotifyDistance;
    analogValueCallback: TBrickletDistanceIRNotifyAnalogValue;
    distanceReachedCallback: TBrickletDistanceIRNotifyDistanceReached;
    analogValueReachedCallback: TBrickletDistanceIRNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperDistance(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the distance measured by the sensor. The value is in mm and possible
    ///  distance ranges are 40 to 300, 100 to 800 and 200 to 1500, depending on the
    ///  selected IR sensor.
    ///  
    ///  If you want to get the distance periodically, it is recommended to use the
    ///  callback <see cref="BrickletDistanceIR.TBrickletDistanceIR.Distance"/> and set the period with 
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistance: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetDistance"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets a sampling point value to a specific position of the lookup table.
    ///  The lookup table comprises 128 equidistant analog values with
    ///  corresponding distances.
    ///  
    ///  If you measure a distance of 50cm at the analog value 2048, you
    ///  should call this function with (64, 5000). The utilized analog-to-digital
    ///  converter has a resolution of 12 bit. With 128 sampling points on the
    ///  whole range, this means that every sampling point has a size of 32
    ///  analog values. Thus the analog value 2048 has the corresponding sampling
    ///  point 64 = 2048/32.
    ///  
    ///  Sampling points are saved on the EEPROM of the Distance IR Bricklet and
    ///  loaded again on startup.
    ///  
    ///  <note>
    ///   An easy way to calibrate the sampling points of the Distance IR Bricklet is
    ///   implemented in the Brick Viewer. If you want to calibrate your Bricklet it is
    ///   highly recommended to use this implementation.
    ///  </note>
    /// </summary>
    procedure SetSamplingPoint(const position: byte; const distance: word); virtual;

    /// <summary>
    ///  Returns the distance to a sampling point position as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetSamplingPoint"/>.
    /// </summary>
    function GetSamplingPoint(const position: byte): word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletDistanceIR.TBrickletDistanceIR.Distance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.Distance"/> is only triggered if the distance has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceIR.TBrickletDistanceIR.DistanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetDistanceCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.DistanceReached"/>,
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/>,
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>. The parameter is the distance of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.Distance"/> is only triggered if the distance has changed since the
    ///  last triggering.
    /// </summary>
    property OnDistance: TBrickletDistanceIRNotifyDistance read distanceCallback write distanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletDistanceIRNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletDistanceIRNotifyDistanceReached read distanceReachedCallback write distanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletDistanceIRNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletDistanceIR.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_SAMPLING_POINT] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_SAMPLING_POINT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE] := {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  callbackWrappers[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
  callbackWrappers[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletDistanceIR.GetDistance: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletDistanceIR.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletDistanceIR.SetSamplingPoint(const position: byte; const distance: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_SAMPLING_POINT, 11);
  LEConvertUInt8To(position, 8, request);
  LEConvertUInt16To(distance, 9, request);
  SendRequest(request);
end;

function TBrickletDistanceIR.GetSamplingPoint(const position: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_SAMPLING_POINT, 9);
  LEConvertUInt8To(position, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletDistanceIR.SetDistanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceIR.GetDistanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDistanceIR.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceIR.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDistanceIR.SetDistanceCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletDistanceIR.GetDistanceCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletDistanceIR.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletDistanceIR.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletDistanceIR.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceIR.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDistanceIR.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletDistanceIR.CallbackWrapperDistance(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceCallback(self, distance);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperDistanceReached(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceReachedCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceReachedCallback(self, distance);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
