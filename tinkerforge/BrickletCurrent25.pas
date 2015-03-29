{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletCurrent25;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_CURRENT25_DEVICE_IDENTIFIER = 24;

  BRICKLET_CURRENT25_FUNCTION_GET_CURRENT = 1;
  BRICKLET_CURRENT25_FUNCTION_CALIBRATE = 2;
  BRICKLET_CURRENT25_FUNCTION_IS_OVER_CURRENT = 3;
  BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE = 4;
  BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_PERIOD = 5;
  BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_PERIOD = 6;
  BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 7;
  BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 8;
  BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD = 9;
  BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD = 10;
  BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 11;
  BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 12;
  BRICKLET_CURRENT25_FUNCTION_SET_DEBOUNCE_PERIOD = 13;
  BRICKLET_CURRENT25_FUNCTION_GET_DEBOUNCE_PERIOD = 14;
  BRICKLET_CURRENT25_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_CURRENT25_CALLBACK_CURRENT = 15;
  BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE = 16;
  BRICKLET_CURRENT25_CALLBACK_CURRENT_REACHED = 17;
  BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE_REACHED = 18;
  BRICKLET_CURRENT25_CALLBACK_OVER_CURRENT = 19;

  BRICKLET_CURRENT25_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_CURRENT25_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_CURRENT25_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_CURRENT25_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_CURRENT25_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletCurrent25 = class;
  TBrickletCurrent25NotifyCurrent = procedure(sender: TBrickletCurrent25; const current: smallint) of object;
  TBrickletCurrent25NotifyAnalogValue = procedure(sender: TBrickletCurrent25; const value: word) of object;
  TBrickletCurrent25NotifyCurrentReached = procedure(sender: TBrickletCurrent25; const current: smallint) of object;
  TBrickletCurrent25NotifyAnalogValueReached = procedure(sender: TBrickletCurrent25; const value: word) of object;
  TBrickletCurrent25NotifyOverCurrent = procedure(sender: TBrickletCurrent25) of object;

  /// <summary>
  ///  Device for sensing current of up to 25A
  /// </summary>
  TBrickletCurrent25 = class(TDevice)
  private
    currentCallback: TBrickletCurrent25NotifyCurrent;
    analogValueCallback: TBrickletCurrent25NotifyAnalogValue;
    currentReachedCallback: TBrickletCurrent25NotifyCurrentReached;
    analogValueReachedCallback: TBrickletCurrent25NotifyAnalogValueReached;
    overCurrentCallback: TBrickletCurrent25NotifyOverCurrent;
  protected
    procedure CallbackWrapperCurrent(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperOverCurrent(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current of the sensor. The value is in mA
    ///  and between -25000mA and 25000mA.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  callback <see cref="BrickletCurrent25.TBrickletCurrent25.Current"/> and set the period with 
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent: smallint; virtual;

    /// <summary>
    ///  Calibrates the 0 value of the sensor. You have to call this function
    ///  when there is no current present. 
    ///  
    ///  The zero point of the current sensor
    ///  is depending on the exact properties of the analog-to-digital converter,
    ///  the length of the Bricklet cable and the temperature. Thus, if you change
    ///  the Brick or the environment in which the Bricklet is used, you might
    ///  have to recalibrate.
    ///  
    ///  The resulting calibration will be saved on the EEPROM of the Current
    ///  Bricklet.
    /// </summary>
    procedure Calibrate; virtual;

    /// <summary>
    ///  Returns *true* if more than 25A were measured.
    ///  
    ///  <note>
    ///   To reset this value you have to power cycle the Bricklet.
    ///  </note>
    /// </summary>
    function IsOverCurrent: boolean; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletCurrent25.TBrickletCurrent25.GetCurrent"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletCurrent25.TBrickletCurrent25.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletCurrent25.TBrickletCurrent25.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the 
    ///  callback <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletCurrent25.TBrickletCurrent25.Current"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent25.TBrickletCurrent25.CurrentReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCurrentCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValueReached"/> callback. 
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
    ///  Returns the threshold as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.CurrentReached"/>,
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnCurrent: TBrickletCurrent25NotifyCurrent read currentCallback write currentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.AnalogValue"/> is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletCurrent25NotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletCurrent25NotifyCurrentReached read currentReachedCallback write currentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletCurrent25NotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;

    /// <summary>
    ///  This callback is triggered when an over current is measured
    ///  (see <see cref="BrickletCurrent25.TBrickletCurrent25.IsOverCurrent"/>).
    /// </summary>
    property OnOverCurrent: TBrickletCurrent25NotifyOverCurrent read overCurrentCallback write overCurrentCallback;
  end;

implementation

constructor TBrickletCurrent25.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_CALIBRATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_IS_OVER_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CURRENT25_CALLBACK_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CURRENT25_CALLBACK_CURRENT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CURRENT25_CALLBACK_OVER_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CURRENT25_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_CURRENT25_CALLBACK_CURRENT] := {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  callbackWrappers[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_CURRENT25_CALLBACK_CURRENT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
  callbackWrappers[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
  callbackWrappers[BRICKLET_CURRENT25_CALLBACK_OVER_CURRENT] := {$ifdef FPC}@{$endif}CallbackWrapperOverCurrent;
end;

function TBrickletCurrent25.GetCurrent: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickletCurrent25.Calibrate;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_CALIBRATE, 8);
  SendRequest(request);
end;

function TBrickletCurrent25.IsOverCurrent: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_IS_OVER_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

function TBrickletCurrent25.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletCurrent25.SetCurrentCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletCurrent25.GetCurrentCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletCurrent25.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletCurrent25.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletCurrent25.SetCurrentCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletCurrent25.GetCurrentCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletCurrent25.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletCurrent25.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletCurrent25.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletCurrent25.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletCurrent25.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletCurrent25.CallbackWrapperCurrent(const packet: TByteArray);
var current: smallint;
begin
  if (Assigned(currentCallback)) then begin
    current := LEConvertInt16From(8, packet);
    currentCallback(self, current);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperCurrentReached(const packet: TByteArray);
var current: smallint;
begin
  if (Assigned(currentReachedCallback)) then begin
    current := LEConvertInt16From(8, packet);
    currentReachedCallback(self, current);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperOverCurrent(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(overCurrentCallback)) then begin
    overCurrentCallback(self);
  end;
end;

end.
