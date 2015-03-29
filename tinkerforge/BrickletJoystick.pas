{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletJoystick;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_JOYSTICK_DEVICE_IDENTIFIER = 210;

  BRICKLET_JOYSTICK_FUNCTION_GET_POSITION = 1;
  BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED = 2;
  BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE = 3;
  BRICKLET_JOYSTICK_FUNCTION_CALIBRATE = 4;
  BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD = 5;
  BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_PERIOD = 6;
  BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 7;
  BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 8;
  BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD = 9;
  BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD = 10;
  BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 11;
  BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 12;
  BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD = 13;
  BRICKLET_JOYSTICK_FUNCTION_GET_DEBOUNCE_PERIOD = 14;
  BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_JOYSTICK_CALLBACK_POSITION = 15;
  BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE = 16;
  BRICKLET_JOYSTICK_CALLBACK_POSITION_REACHED = 17;
  BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE_REACHED = 18;
  BRICKLET_JOYSTICK_CALLBACK_PRESSED = 19;
  BRICKLET_JOYSTICK_CALLBACK_RELEASED = 20;

  BRICKLET_JOYSTICK_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_JOYSTICK_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_JOYSTICK_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_JOYSTICK_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_JOYSTICK_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletJoystick = class;
  TBrickletJoystickNotifyPosition = procedure(sender: TBrickletJoystick; const x: smallint; const y: smallint) of object;
  TBrickletJoystickNotifyAnalogValue = procedure(sender: TBrickletJoystick; const x: word; const y: word) of object;
  TBrickletJoystickNotifyPositionReached = procedure(sender: TBrickletJoystick; const x: smallint; const y: smallint) of object;
  TBrickletJoystickNotifyAnalogValueReached = procedure(sender: TBrickletJoystick; const x: word; const y: word) of object;
  TBrickletJoystickNotifyPressed = procedure(sender: TBrickletJoystick) of object;
  TBrickletJoystickNotifyReleased = procedure(sender: TBrickletJoystick) of object;

  /// <summary>
  ///  Dual-Axis Joystick with Button
  /// </summary>
  TBrickletJoystick = class(TDevice)
  private
    positionCallback: TBrickletJoystickNotifyPosition;
    analogValueCallback: TBrickletJoystickNotifyAnalogValue;
    positionReachedCallback: TBrickletJoystickNotifyPositionReached;
    analogValueReachedCallback: TBrickletJoystickNotifyAnalogValueReached;
    pressedCallback: TBrickletJoystickNotifyPressed;
    releasedCallback: TBrickletJoystickNotifyReleased;
  protected
    procedure CallbackWrapperPosition(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperPositionReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperPressed(const packet: TByteArray); virtual;
    procedure CallbackWrapperReleased(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the position of the Joystick. The value ranges between -100 and
    ///  100 for both axis. The middle position of the joystick is x=0, y=0. The
    ///  returned values are averaged and calibrated (see <see cref="BrickletJoystick.TBrickletJoystick.Calibrate"/>).
    ///  
    ///  If you want to get the position periodically, it is recommended to use the
    ///  callback <see cref="BrickletJoystick.TBrickletJoystick.Position"/> and set the period with 
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>.
    /// </summary>
    procedure GetPosition(out x: smallint; out y: smallint); virtual;

    /// <summary>
    ///  Returns *true* if the button is pressed and *false* otherwise.
    ///  
    ///  It is recommended to use the <see cref="BrickletJoystick.TBrickletJoystick.Pressed"/> and <see cref="BrickletJoystick.TBrickletJoystick.Released"/> callbacks
    ///  to handle the button.
    /// </summary>
    function IsPressed: boolean; virtual;

    /// <summary>
    ///  Returns the values as read by a 12-bit analog-to-digital converter.
    ///  The values are between 0 and 4095 for both axis.
    ///  
    ///  <note>
    ///   The values returned by <see cref="BrickletJoystick.TBrickletJoystick.GetPosition"/> are averaged over several samples
    ///   to yield less noise, while <see cref="BrickletJoystick.TBrickletJoystick.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletJoystick.TBrickletJoystick.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog values periodically, it is recommended to use the 
    ///  callback <see cref="BrickletJoystick.TBrickletJoystick.AnalogValue"/> and set the period with 
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    procedure GetAnalogValue(out x: word; out y: word); virtual;

    /// <summary>
    ///  Calibrates the middle position of the Joystick. If your Joystick Bricklet
    ///  does not return x=0 and y=0 in the middle position, call this function
    ///  while the Joystick is standing still in the middle position.
    ///  
    ///  The resulting calibration will be saved on the EEPROM of the Joystick
    ///  Bricklet, thus you only have to calibrate it once.
    /// </summary>
    procedure Calibrate; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletJoystick.TBrickletJoystick.Position"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletJoystick.TBrickletJoystick.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetPositionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPositionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletJoystick.TBrickletJoystick.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletJoystick.TBrickletJoystick.AnalogValue"/> is only triggered if the analog values have changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletJoystick.TBrickletJoystick.PositionReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the position is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the position is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the position is smaller than the min values (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the position is greater than the min values (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0, 0, 0).
    /// </summary>
    procedure SetPositionCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletJoystick.TBrickletJoystick.AnalogValueReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog values are *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog values are *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog values are smaller than the min values (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog values are greater than the min values (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0, 0, 0).
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const option: char; const minX: word; const maxX: word; const minY: word; const maxY: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out minX: word; out maxX: word; out minY: word; out maxY: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.PositionReached"/>,
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/>,
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>. The parameter is the position of the
    ///  Joystick.
    ///  
    ///  <see cref="BrickletJoystick.TBrickletJoystick.Position"/> is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnPosition: TBrickletJoystickNotifyPosition read positionCallback write positionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>. The parameters are the analog values
    ///  of the Joystick.
    ///  
    ///  <see cref="BrickletJoystick.TBrickletJoystick.AnalogValue"/> is only triggered if the values have changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletJoystickNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/> is reached.
    ///  The parameters are the position of the Joystick.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
    /// </summary>
    property OnPositionReached: TBrickletJoystickNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameters are the analog values of the Joystick.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletJoystickNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;

    /// <summary>
    ///  This callback is triggered when the button is pressed.
    /// </summary>
    property OnPressed: TBrickletJoystickNotifyPressed read pressedCallback write pressedCallback;

    /// <summary>
    ///  This callback is triggered when the button is released.
    /// </summary>
    property OnReleased: TBrickletJoystickNotifyReleased read releasedCallback write releasedCallback;
  end;

implementation

constructor TBrickletJoystick.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_CALIBRATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_POSITION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_CALLBACK_RELEASED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_POSITION] := {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_POSITION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_PRESSED] := {$ifdef FPC}@{$endif}CallbackWrapperPressed;
  callbackWrappers[BRICKLET_JOYSTICK_CALLBACK_RELEASED] := {$ifdef FPC}@{$endif}CallbackWrapperReleased;
end;

procedure TBrickletJoystick.GetPosition(out x: smallint; out y: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
end;

function TBrickletJoystick.IsPressed: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletJoystick.GetAnalogValue(out x: word; out y: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  x := LEConvertUInt16From(8, response);
  y := LEConvertUInt16From(10, response);
end;

procedure TBrickletJoystick.Calibrate;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_CALIBRATE, 8);
  SendRequest(request);
end;

procedure TBrickletJoystick.SetPositionCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletJoystick.GetPositionCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletJoystick.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletJoystick.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletJoystick.SetPositionCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(minX, 9, request);
  LEConvertInt16To(maxX, 11, request);
  LEConvertInt16To(minY, 13, request);
  LEConvertInt16To(maxY, 15, request);
  SendRequest(request);
end;

procedure TBrickletJoystick.GetPositionCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  minX := LEConvertInt16From(9, response);
  maxX := LEConvertInt16From(11, response);
  minY := LEConvertInt16From(13, response);
  maxY := LEConvertInt16From(15, response);
end;

procedure TBrickletJoystick.SetAnalogValueCallbackThreshold(const option: char; const minX: word; const maxX: word; const minY: word; const maxY: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(minX, 9, request);
  LEConvertUInt16To(maxX, 11, request);
  LEConvertUInt16To(minY, 13, request);
  LEConvertUInt16To(maxY, 15, request);
  SendRequest(request);
end;

procedure TBrickletJoystick.GetAnalogValueCallbackThreshold(out option: char; out minX: word; out maxX: word; out minY: word; out maxY: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  minX := LEConvertUInt16From(9, response);
  maxX := LEConvertUInt16From(11, response);
  minY := LEConvertUInt16From(13, response);
  maxY := LEConvertUInt16From(15, response);
end;

procedure TBrickletJoystick.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletJoystick.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletJoystick.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletJoystick.CallbackWrapperPosition(const packet: TByteArray);
var x: smallint; y: smallint;
begin
  if (Assigned(positionCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    positionCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValue(const packet: TByteArray);
var x: word; y: word;
begin
  if (Assigned(analogValueCallback)) then begin
    x := LEConvertUInt16From(8, packet);
    y := LEConvertUInt16From(10, packet);
    analogValueCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperPositionReached(const packet: TByteArray);
var x: smallint; y: smallint;
begin
  if (Assigned(positionReachedCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    positionReachedCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var x: word; y: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    x := LEConvertUInt16From(8, packet);
    y := LEConvertUInt16From(10, packet);
    analogValueReachedCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperPressed(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(pressedCallback)) then begin
    pressedCallback(self);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperReleased(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(releasedCallback)) then begin
    releasedCallback(self);
  end;
end;

end.
