{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletTilt;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_TILT_DEVICE_IDENTIFIER = 239;

  BRICKLET_TILT_FUNCTION_GET_TILT_STATE = 1;
  BRICKLET_TILT_FUNCTION_ENABLE_TILT_STATE_CALLBACK = 2;
  BRICKLET_TILT_FUNCTION_DISABLE_TILT_STATE_CALLBACK = 3;
  BRICKLET_TILT_FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED = 4;
  BRICKLET_TILT_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_TILT_CALLBACK_TILT_STATE = 5;

  BRICKLET_TILT_TILT_STATE_CLOSED = 0;
  BRICKLET_TILT_TILT_STATE_OPEN = 1;
  BRICKLET_TILT_TILT_STATE_CLOSED_VIBRATING = 2;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTilt = class;
  TBrickletTiltNotifyTiltState = procedure(sender: TBrickletTilt; const state: byte) of object;

  /// <summary>
  ///  Device for sensing tilt and vibration
  /// </summary>
  TBrickletTilt = class(TDevice)
  private
    tiltStateCallback: TBrickletTiltNotifyTiltState;
  protected
    procedure CallbackWrapperTiltState(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current tilt state. The state can either be
    ///  
    ///  * 0 = Closed: The ball in the tilt switch closes the circuit.
    ///  * 1 = Open: The ball in the tilt switch does not close the circuit.
    ///  * 2 = Closed Vibrating: The tilt switch is in motion (rapid change between open and close).
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_tilt_mechanics.jpg
    ///     :scale: 100 %
    ///     :alt: Tilt states
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_tilt_mechanics.jpg
    /// </summary>
    function GetTiltState: byte; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletTilt.TBrickletTilt.TiltState"/> callback.
    /// </summary>
    procedure EnableTiltStateCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletTilt.TBrickletTilt.TiltState"/> callback.
    /// </summary>
    procedure DisableTiltStateCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletTilt.TBrickletTilt.TiltState"/> callback is enabled.
    /// </summary>
    function IsTiltStateCallbackEnabled: boolean; virtual;

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
    ///  This callback provides the current tilt state. It is called every time the
    ///  state changes.
    ///  
    ///  See <see cref="BrickletTilt.TBrickletTilt.GetTiltState"/> for a description of the states.
    /// </summary>
    property OnTiltState: TBrickletTiltNotifyTiltState read tiltStateCallback write tiltStateCallback;
  end;

implementation

constructor TBrickletTilt.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_TILT_FUNCTION_GET_TILT_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TILT_FUNCTION_ENABLE_TILT_STATE_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TILT_FUNCTION_DISABLE_TILT_STATE_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_TILT_FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_TILT_CALLBACK_TILT_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_TILT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_TILT_CALLBACK_TILT_STATE] := {$ifdef FPC}@{$endif}CallbackWrapperTiltState;
end;

function TBrickletTilt.GetTiltState: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_GET_TILT_STATE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletTilt.EnableTiltStateCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_ENABLE_TILT_STATE_CALLBACK, 8);
  SendRequest(request);
end;

procedure TBrickletTilt.DisableTiltStateCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_DISABLE_TILT_STATE_CALLBACK, 8);
  SendRequest(request);
end;

function TBrickletTilt.IsTiltStateCallbackEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletTilt.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletTilt.CallbackWrapperTiltState(const packet: TByteArray);
var state: byte;
begin
  if (Assigned(tiltStateCallback)) then begin
    state := LEConvertUInt8From(8, packet);
    tiltStateCallback(self, state);
  end;
end;

end.
