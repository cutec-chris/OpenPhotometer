{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletMoisture;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_MOISTURE_DEVICE_IDENTIFIER = 232;

  BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_VALUE = 1;
  BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_PERIOD = 2;
  BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_PERIOD = 3;
  BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD = 4;
  BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD = 5;
  BRICKLET_MOISTURE_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_MOISTURE_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_MOISTURE_FUNCTION_SET_MOVING_AVERAGE = 10;
  BRICKLET_MOISTURE_FUNCTION_GET_MOVING_AVERAGE = 11;
  BRICKLET_MOISTURE_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_MOISTURE_CALLBACK_MOISTURE = 8;
  BRICKLET_MOISTURE_CALLBACK_MOISTURE_REACHED = 9;

  BRICKLET_MOISTURE_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_MOISTURE_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_MOISTURE_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_MOISTURE_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_MOISTURE_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMoisture = class;
  TBrickletMoistureNotifyMoisture = procedure(sender: TBrickletMoisture; const moisture: word) of object;
  TBrickletMoistureNotifyMoistureReached = procedure(sender: TBrickletMoisture; const moisture: word) of object;

  /// <summary>
  ///  Device for sensing Moisture
  /// </summary>
  TBrickletMoisture = class(TDevice)
  private
    moistureCallback: TBrickletMoistureNotifyMoisture;
    moistureReachedCallback: TBrickletMoistureNotifyMoistureReached;
  protected
    procedure CallbackWrapperMoisture(const packet: TByteArray); virtual;
    procedure CallbackWrapperMoistureReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current moisture value. The value has a range of
    ///  0 to 4095. A small value corresponds to little moisture, a big
    ///  value corresponds to much moisture.
    ///  
    ///  If you want to get the moisture value periodically, it is recommended 
    ///  to use the callback <see cref="BrickletMoisture.TBrickletMoisture.Moisture"/> and set the period with 
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>.
    /// </summary>
    function GetMoistureValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletMoisture.TBrickletMoisture.Moisture"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletMoisture.TBrickletMoisture.Moisture"/> is only triggered if the moisture value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetMoistureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>.
    /// </summary>
    function GetMoistureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletMoisture.TBrickletMoisture.MoistureReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the moisture value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the moisture value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the moisture value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the moisture value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetMoistureCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/>.
    /// </summary>
    procedure GetMoistureCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletMoisture.TBrickletMoisture.MoistureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;http://en.wikipedia.org/wiki/Moving_average&gt;`__ 
    ///  for the moisture value.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 0-100.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMovingAverage"/>.
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
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>. The parameter is the moisture value
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletMoisture.TBrickletMoisture.Moisture"/> is only triggered if the moisture value has changed since the
    ///  last triggering.
    /// </summary>
    property OnMoisture: TBrickletMoistureNotifyMoisture read moistureCallback write moistureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/> is reached.
    ///  The parameter is the moisture value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetDebouncePeriod"/>.
    /// </summary>
    property OnMoistureReached: TBrickletMoistureNotifyMoistureReached read moistureReachedCallback write moistureReachedCallback;
  end;

implementation

constructor TBrickletMoisture.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOISTURE_CALLBACK_MOISTURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_MOISTURE_CALLBACK_MOISTURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOISTURE_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_MOISTURE_CALLBACK_MOISTURE] := {$ifdef FPC}@{$endif}CallbackWrapperMoisture;
  callbackWrappers[BRICKLET_MOISTURE_CALLBACK_MOISTURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperMoistureReached;
end;

function TBrickletMoisture.GetMoistureValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletMoisture.SetMoistureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletMoisture.GetMoistureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletMoisture.SetMoistureCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletMoisture.GetMoistureCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletMoisture.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletMoisture.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletMoisture.SetMovingAverage(const average: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, request);
  SendRequest(request);
end;

function TBrickletMoisture.GetMovingAverage: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletMoisture.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletMoisture.CallbackWrapperMoisture(const packet: TByteArray);
var moisture: word;
begin
  if (Assigned(moistureCallback)) then begin
    moisture := LEConvertUInt16From(8, packet);
    moistureCallback(self, moisture);
  end;
end;

procedure TBrickletMoisture.CallbackWrapperMoistureReached(const packet: TByteArray);
var moisture: word;
begin
  if (Assigned(moistureReachedCallback)) then begin
    moisture := LEConvertUInt16From(8, packet);
    moistureReachedCallback(self, moisture);
  end;
end;

end.
