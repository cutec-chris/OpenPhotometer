{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletDualButton;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_DUAL_BUTTON_DEVICE_IDENTIFIER = 230;

  BRICKLET_DUAL_BUTTON_FUNCTION_SET_LED_STATE = 1;
  BRICKLET_DUAL_BUTTON_FUNCTION_GET_LED_STATE = 2;
  BRICKLET_DUAL_BUTTON_FUNCTION_GET_BUTTON_STATE = 3;
  BRICKLET_DUAL_BUTTON_FUNCTION_SET_SELECTED_LED_STATE = 5;
  BRICKLET_DUAL_BUTTON_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_DUAL_BUTTON_CALLBACK_STATE_CHANGED = 4;

  BRICKLET_DUAL_BUTTON_LED_STATE_AUTO_TOGGLE_ON = 0;
  BRICKLET_DUAL_BUTTON_LED_STATE_AUTO_TOGGLE_OFF = 1;
  BRICKLET_DUAL_BUTTON_LED_STATE_ON = 2;
  BRICKLET_DUAL_BUTTON_LED_STATE_OFF = 3;
  BRICKLET_DUAL_BUTTON_BUTTON_STATE_PRESSED = 0;
  BRICKLET_DUAL_BUTTON_BUTTON_STATE_RELEASED = 1;
  BRICKLET_DUAL_BUTTON_LED_LEFT = 0;
  BRICKLET_DUAL_BUTTON_LED_RIGHT = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDualButton = class;
  TBrickletDualButtonNotifyStateChanged = procedure(sender: TBrickletDualButton; const buttonL: byte; const buttonR: byte; const ledL: byte; const ledR: byte) of object;

  /// <summary>
  ///  Device with two buttons and two LEDs
  /// </summary>
  TBrickletDualButton = class(TDevice)
  private
    stateChangedCallback: TBrickletDualButtonNotifyStateChanged;
  protected
    procedure CallbackWrapperStateChanged(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the state of the LEDs. Possible states are:
    ///  
    ///  * 0 = AutoToggleOn: Enables auto toggle with initially enabled LED.
    ///  * 1 = AutoToggleOff: Activates auto toggle with initially disabled LED.
    ///  * 2 = On: Enables LED (auto toggle is disabled).
    ///  * 3 = Off: Disables LED (auto toggle is disabled).
    ///  
    ///  In auto toggle mode the LED is toggled automatically at each press of a button.
    ///  
    ///  If you just want to set one of the LEDs and don't know the current state
    ///  of the other LED, you can get the state with <see cref="BrickletDualButton.TBrickletDualButton.GetLEDState"/> or you
    ///  can use <see cref="BrickletDualButton.TBrickletDualButton.SetSelectedLEDState"/>.
    ///  
    ///  The default value is (1, 1).
    /// </summary>
    procedure SetLEDState(const ledL: byte; const ledR: byte); virtual;

    /// <summary>
    ///  Returns the current state of the LEDs, as set by <see cref="BrickletDualButton.TBrickletDualButton.SetLEDState"/>.
    /// </summary>
    procedure GetLEDState(out ledL: byte; out ledR: byte); virtual;

    /// <summary>
    ///  Returns the current state for both buttons. Possible states are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    /// </summary>
    procedure GetButtonState(out buttonL: byte; out buttonR: byte); virtual;

    /// <summary>
    ///  Sets the state of the selected LED (0 or 1). 
    ///  
    ///  The other LED remains untouched.
    /// </summary>
    procedure SetSelectedLEDState(const led: byte; const state: byte); virtual;

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
    ///  This callback is called whenever a button is pressed. 
    ///  
    ///  Possible states for buttons are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    ///  
    ///  Possible states for LEDs are:
    ///  
    ///  * 0 = AutoToggleOn: Auto toggle enabled and LED on.
    ///  * 1 = AutoToggleOff: Auto toggle enabled and LED off.
    ///  * 2 = On: LED on (auto toggle is disabled).
    ///  * 3 = Off: LED off (auto toggle is disabled).
    /// </summary>
    property OnStateChanged: TBrickletDualButtonNotifyStateChanged read stateChangedCallback write stateChangedCallback;
  end;

implementation

constructor TBrickletDualButton.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_SET_LED_STATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_LED_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_BUTTON_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUAL_BUTTON_CALLBACK_STATE_CHANGED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_SET_SELECTED_LED_STATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_DUAL_BUTTON_CALLBACK_STATE_CHANGED] := {$ifdef FPC}@{$endif}CallbackWrapperStateChanged;
end;

procedure TBrickletDualButton.SetLEDState(const ledL: byte; const ledR: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_SET_LED_STATE, 10);
  LEConvertUInt8To(ledL, 8, request);
  LEConvertUInt8To(ledR, 9, request);
  SendRequest(request);
end;

procedure TBrickletDualButton.GetLEDState(out ledL: byte; out ledR: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_LED_STATE, 8);
  response := SendRequest(request);
  ledL := LEConvertUInt8From(8, response);
  ledR := LEConvertUInt8From(9, response);
end;

procedure TBrickletDualButton.GetButtonState(out buttonL: byte; out buttonR: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_BUTTON_STATE, 8);
  response := SendRequest(request);
  buttonL := LEConvertUInt8From(8, response);
  buttonR := LEConvertUInt8From(9, response);
end;

procedure TBrickletDualButton.SetSelectedLEDState(const led: byte; const state: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_SET_SELECTED_LED_STATE, 10);
  LEConvertUInt8To(led, 8, request);
  LEConvertUInt8To(state, 9, request);
  SendRequest(request);
end;

procedure TBrickletDualButton.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletDualButton.CallbackWrapperStateChanged(const packet: TByteArray);
var buttonL: byte; buttonR: byte; ledL: byte; ledR: byte;
begin
  if (Assigned(stateChangedCallback)) then begin
    buttonL := LEConvertUInt8From(8, packet);
    buttonR := LEConvertUInt8From(9, packet);
    ledL := LEConvertUInt8From(10, packet);
    ledR := LEConvertUInt8From(11, packet);
    stateChangedCallback(self, buttonL, buttonR, ledL, ledR);
  end;
end;

end.
