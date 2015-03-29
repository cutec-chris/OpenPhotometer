{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletRotaryEncoder;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ROTARY_ENCODER_DEVICE_IDENTIFIER = 236;

  BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT = 1;
  BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_PERIOD = 2;
  BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_PERIOD = 3;
  BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_THRESHOLD = 4;
  BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_THRESHOLD = 5;
  BRICKLET_ROTARY_ENCODER_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_ROTARY_ENCODER_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_ROTARY_ENCODER_FUNCTION_IS_PRESSED = 10;
  BRICKLET_ROTARY_ENCODER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT = 8;
  BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT_REACHED = 9;
  BRICKLET_ROTARY_ENCODER_CALLBACK_PRESSED = 11;
  BRICKLET_ROTARY_ENCODER_CALLBACK_RELEASED = 12;

  BRICKLET_ROTARY_ENCODER_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_ROTARY_ENCODER_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_ROTARY_ENCODER_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_ROTARY_ENCODER_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_ROTARY_ENCODER_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRotaryEncoder = class;
  TBrickletRotaryEncoderNotifyCount = procedure(sender: TBrickletRotaryEncoder; const count: longint) of object;
  TBrickletRotaryEncoderNotifyCountReached = procedure(sender: TBrickletRotaryEncoder; const count: longint) of object;
  TBrickletRotaryEncoderNotifyPressed = procedure(sender: TBrickletRotaryEncoder) of object;
  TBrickletRotaryEncoderNotifyReleased = procedure(sender: TBrickletRotaryEncoder) of object;

  /// <summary>
  ///  Device for sensing Rotary Encoder input
  /// </summary>
  TBrickletRotaryEncoder = class(TDevice)
  private
    countCallback: TBrickletRotaryEncoderNotifyCount;
    countReachedCallback: TBrickletRotaryEncoderNotifyCountReached;
    pressedCallback: TBrickletRotaryEncoderNotifyPressed;
    releasedCallback: TBrickletRotaryEncoderNotifyReleased;
  protected
    procedure CallbackWrapperCount(const packet: TByteArray); virtual;
    procedure CallbackWrapperCountReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperPressed(const packet: TByteArray); virtual;
    procedure CallbackWrapperReleased(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current count of the encoder. If you set reset
    ///  to true, the count is set back to 0 directly after the
    ///  current count is read.
    ///  
    ///  The encoder has 24 steps per rotation
    ///  
    ///  Turning the encoder to the left decrements the counter,
    ///  so a negative count is possible.
    /// </summary>
    function GetCount(const reset: boolean): longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.Count"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.Count"/> is only triggered if the count has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCountCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackPeriod"/>.
    /// </summary>
    function GetCountCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.CountReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the count is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the count is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the count is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the count is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCountCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/>.
    /// </summary>
    procedure GetCountCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.CountReached"/>
    ///  
    ///  is triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns *true* if the button is pressed and *false* otherwise.
    ///  
    ///  It is recommended to use the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.Pressed"/> and <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.Released"/> callbacks
    ///  to handle the button.
    /// </summary>
    function IsPressed: boolean; virtual;

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
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackPeriod"/>. The parameter is the count of
    ///  the encoder.
    ///  
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.Count"/> is only triggered if the count has changed since the
    ///  last triggering.
    /// </summary>
    property OnCount: TBrickletRotaryEncoderNotifyCount read countCallback write countCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/> is reached.
    ///  The parameter is the count of the encoder.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetDebouncePeriod"/>.
    /// </summary>
    property OnCountReached: TBrickletRotaryEncoderNotifyCountReached read countReachedCallback write countReachedCallback;

    /// <summary>
    ///  This callback is triggered when the button is pressed.
    /// </summary>
    property OnPressed: TBrickletRotaryEncoderNotifyPressed read pressedCallback write pressedCallback;

    /// <summary>
    ///  This callback is triggered when the button is released.
    /// </summary>
    property OnReleased: TBrickletRotaryEncoderNotifyReleased read releasedCallback write releasedCallback;
  end;

implementation

constructor TBrickletRotaryEncoder.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_IS_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ROTARY_ENCODER_CALLBACK_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_ENCODER_CALLBACK_RELEASED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT] := {$ifdef FPC}@{$endif}CallbackWrapperCount;
  callbackWrappers[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperCountReached;
  callbackWrappers[BRICKLET_ROTARY_ENCODER_CALLBACK_PRESSED] := {$ifdef FPC}@{$endif}CallbackWrapperPressed;
  callbackWrappers[BRICKLET_ROTARY_ENCODER_CALLBACK_RELEASED] := {$ifdef FPC}@{$endif}CallbackWrapperReleased;
end;

function TBrickletRotaryEncoder.GetCount(const reset: boolean): longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT, 9);
  LEConvertBooleanTo(reset, 8, request);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletRotaryEncoder.SetCountCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletRotaryEncoder.GetCountCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletRotaryEncoder.SetCountCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletRotaryEncoder.GetCountCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletRotaryEncoder.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletRotaryEncoder.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

function TBrickletRotaryEncoder.IsPressed: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_IS_PRESSED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletRotaryEncoder.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletRotaryEncoder.CallbackWrapperCount(const packet: TByteArray);
var count: longint;
begin
  if (Assigned(countCallback)) then begin
    count := LEConvertInt32From(8, packet);
    countCallback(self, count);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperCountReached(const packet: TByteArray);
var count: longint;
begin
  if (Assigned(countReachedCallback)) then begin
    count := LEConvertInt32From(8, packet);
    countReachedCallback(self, count);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperPressed(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(pressedCallback)) then begin
    pressedCallback(self);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperReleased(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(releasedCallback)) then begin
    releasedCallback(self);
  end;
end;

end.
