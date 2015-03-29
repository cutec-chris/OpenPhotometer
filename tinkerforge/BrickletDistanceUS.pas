{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletDistanceUS;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_DISTANCE_US_DEVICE_IDENTIFIER = 229;

  BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_VALUE = 1;
  BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD = 2;
  BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD = 3;
  BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD = 4;
  BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD = 5;
  BRICKLET_DISTANCE_US_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_DISTANCE_US_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_DISTANCE_US_FUNCTION_SET_MOVING_AVERAGE = 10;
  BRICKLET_DISTANCE_US_FUNCTION_GET_MOVING_AVERAGE = 11;
  BRICKLET_DISTANCE_US_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_DISTANCE_US_CALLBACK_DISTANCE = 8;
  BRICKLET_DISTANCE_US_CALLBACK_DISTANCE_REACHED = 9;

  BRICKLET_DISTANCE_US_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_DISTANCE_US_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_DISTANCE_US_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_DISTANCE_US_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_DISTANCE_US_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDistanceUS = class;
  TBrickletDistanceUSNotifyDistance = procedure(sender: TBrickletDistanceUS; const distance: word) of object;
  TBrickletDistanceUSNotifyDistanceReached = procedure(sender: TBrickletDistanceUS; const distance: word) of object;

  /// <summary>
  ///  Device for sensing distance via ultrasound
  /// </summary>
  TBrickletDistanceUS = class(TDevice)
  private
    distanceCallback: TBrickletDistanceUSNotifyDistance;
    distanceReachedCallback: TBrickletDistanceUSNotifyDistanceReached;
  protected
    procedure CallbackWrapperDistance(const packet: TByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current distance value measured by the sensor. The value has a
    ///  range of 0 to 4095. A small value corresponds to a small distance, a big
    ///  value corresponds to a big distance. The relation between the measured distance
    ///  value and the actual distance is affected by the 5V supply voltage (deviations
    ///  in the supply voltage result in deviations in the distance values) and is
    ///  non-linear (resolution is bigger at close range).
    ///  
    ///  If you want to get the distance value periodically, it is recommended to
    ///  use the callback <see cref="BrickletDistanceUS.TBrickletDistanceUS.Distance"/> and set the period with 
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletDistanceUS.TBrickletDistanceUS.Distance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.Distance"/> is only triggered if the distance value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceUS.TBrickletDistanceUS.DistanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetDistanceCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletDistanceUS.TBrickletDistanceUS.DistanceReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;http://en.wikipedia.org/wiki/Moving_average&gt;`__ 
    ///  for the distance value.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 0-100.
    ///  
    ///  The default value is 20.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

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
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>. The parameter is the distance value
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.Distance"/> is only triggered if the distance value has changed since the
    ///  last triggering.
    /// </summary>
    property OnDistance: TBrickletDistanceUSNotifyDistance read distanceCallback write distanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletDistanceUSNotifyDistanceReached read distanceReachedCallback write distanceReachedCallback;
  end;

implementation

constructor TBrickletDistanceUS.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE] := {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  callbackWrappers[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
end;

function TBrickletDistanceUS.GetDistanceValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletDistanceUS.SetDistanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceUS.GetDistanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDistanceUS.SetDistanceCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletDistanceUS.GetDistanceCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletDistanceUS.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceUS.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDistanceUS.SetMovingAverage(const average: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, request);
  SendRequest(request);
end;

function TBrickletDistanceUS.GetMovingAverage: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletDistanceUS.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletDistanceUS.CallbackWrapperDistance(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceCallback(self, distance);
  end;
end;

procedure TBrickletDistanceUS.CallbackWrapperDistanceReached(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceReachedCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceReachedCallback(self, distance);
  end;
end;

end.
