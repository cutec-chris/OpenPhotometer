{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletMultiTouch;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_MULTI_TOUCH_DEVICE_IDENTIFIER = 234;

  BRICKLET_MULTI_TOUCH_FUNCTION_GET_TOUCH_STATE = 1;
  BRICKLET_MULTI_TOUCH_FUNCTION_RECALIBRATE = 2;
  BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_CONFIG = 3;
  BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_CONFIG = 4;
  BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_SENSITIVITY = 6;
  BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_SENSITIVITY = 7;
  BRICKLET_MULTI_TOUCH_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_MULTI_TOUCH_CALLBACK_TOUCH_STATE = 5;


type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMultiTouch = class;
  TBrickletMultiTouchNotifyTouchState = procedure(sender: TBrickletMultiTouch; const state: word) of object;

  /// <summary>
  ///  Device with 12 touch sensors
  /// </summary>
  TBrickletMultiTouch = class(TDevice)
  private
    touchStateCallback: TBrickletMultiTouchNotifyTouchState;
  protected
    procedure CallbackWrapperTouchState(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current touch state. The state is given as a bitfield.
    ///  
    ///  Bits 0 to 11 represent the 12 electrodes and bit 12 represents
    ///  the proximity.
    ///  
    ///  If an electrode is touched, the corresponding bit is true. If
    ///  a hand or similar is in proximity to the electrodes, bit 12 is
    ///  *true*.
    ///  
    ///  Example: The state 4103 = 0x1007 = 0b1000000000111 means that
    ///  electrodes 0, 1 and 2 are touched and that something is in the
    ///  proximity of the electrodes.
    ///  
    ///  The proximity is activated with a distance of 1-2cm. An electrode
    ///  is already counted as touched if a finger is nearly touching the
    ///  electrode. This means that you can put a piece of paper or foil
    ///  or similar on top of a electrode to build a touch panel with
    ///  a professional look.
    /// </summary>
    function GetTouchState: word; virtual;

    /// <summary>
    ///  Recalibrates the electrodes. Call this function whenever you changed
    ///  or moved you electrodes.
    /// </summary>
    procedure Recalibrate; virtual;

    /// <summary>
    ///  Enables/disables electrodes with a bitfield (see <see cref="BrickletMultiTouch.TBrickletMultiTouch.GetTouchState"/>).
    ///  
    ///  *True* enables the electrode, *false* disables the electrode. A
    ///  disabled electrode will always return *false* as its state. If you
    ///  don't need all electrodes you can disable the electrodes that are
    ///  not needed.
    ///  
    ///  It is recommended that you disable the proximity bit (bit 12) if
    ///  the proximity feature is not needed. This will reduce the amount of
    ///  traffic that is produced by the <see cref="BrickletMultiTouch.TBrickletMultiTouch.TouchState"/> callback.
    ///  
    ///  Disabling electrodes will also reduce power consumption.
    ///  
    ///  Default: 8191 = 0x1FFF = 0b1111111111111 (all electrodes enabled)
    /// </summary>
    procedure SetElectrodeConfig(const enabledElectrodes: word); virtual;

    /// <summary>
    ///  Returns the electrode configuration, as set by <see cref="BrickletMultiTouch.TBrickletMultiTouch.SetElectrodeConfig"/>.
    /// </summary>
    function GetElectrodeConfig: word; virtual;

    /// <summary>
    ///  Sets the sensitivity of the electrodes. An electrode with a high sensitivity
    ///  will register a touch earlier then an electrode with a low sensitivity.
    ///  
    ///  If you build a big electrode you might need to decrease the sensitivity, since
    ///  the area that can be charged will get bigger. If you want to be able to
    ///  activate an electrode from further away you need to increase the sensitivity.
    ///  
    ///  After a new sensitivity is set, you likely want to call <see cref="BrickletMultiTouch.TBrickletMultiTouch.Recalibrate"/>
    ///  to calibrate the electrodes with the newly defined sensitivity.
    ///  
    ///  The valid sensitivity value range is 5-201.
    ///  
    ///  The default sensitivity value is 181.
    /// </summary>
    procedure SetElectrodeSensitivity(const sensitivity: byte); virtual;

    /// <summary>
    ///  Returns the current sensitivity, as set by <see cref="BrickletMultiTouch.TBrickletMultiTouch.SetElectrodeSensitivity"/>.
    /// </summary>
    function GetElectrodeSensitivity: byte; virtual;

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
    ///  Returns the current touch state, see <see cref="BrickletMultiTouch.TBrickletMultiTouch.GetTouchState"/> for
    ///  information about the state.
    ///  
    ///  This callback is triggered every time the touch state changes.
    /// </summary>
    property OnTouchState: TBrickletMultiTouchNotifyTouchState read touchStateCallback write touchStateCallback;
  end;

implementation

constructor TBrickletMultiTouch.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_TOUCH_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_RECALIBRATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_CONFIG] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_CONFIG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MULTI_TOUCH_CALLBACK_TOUCH_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_SENSITIVITY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_SENSITIVITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_MULTI_TOUCH_CALLBACK_TOUCH_STATE] := {$ifdef FPC}@{$endif}CallbackWrapperTouchState;
end;

function TBrickletMultiTouch.GetTouchState: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_TOUCH_STATE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletMultiTouch.Recalibrate;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_RECALIBRATE, 8);
  SendRequest(request);
end;

procedure TBrickletMultiTouch.SetElectrodeConfig(const enabledElectrodes: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_CONFIG, 10);
  LEConvertUInt16To(enabledElectrodes, 8, request);
  SendRequest(request);
end;

function TBrickletMultiTouch.GetElectrodeConfig: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_CONFIG, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletMultiTouch.SetElectrodeSensitivity(const sensitivity: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_SENSITIVITY, 9);
  LEConvertUInt8To(sensitivity, 8, request);
  SendRequest(request);
end;

function TBrickletMultiTouch.GetElectrodeSensitivity: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_SENSITIVITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletMultiTouch.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletMultiTouch.CallbackWrapperTouchState(const packet: TByteArray);
var state: word;
begin
  if (Assigned(touchStateCallback)) then begin
    state := LEConvertUInt16From(8, packet);
    touchStateCallback(self, state);
  end;
end;

end.
