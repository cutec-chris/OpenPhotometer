{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletSolidStateRelay;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_SOLID_STATE_RELAY_DEVICE_IDENTIFIER = 244;

  BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_STATE = 1;
  BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_STATE = 2;
  BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_MONOFLOP = 3;
  BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_MONOFLOP = 4;
  BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_SOLID_STATE_RELAY_CALLBACK_MONOFLOP_DONE = 5;


type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletSolidStateRelay = class;
  TBrickletSolidStateRelayNotifyMonoflopDone = procedure(sender: TBrickletSolidStateRelay; const state: boolean) of object;

  /// <summary>
  ///  Device for controlling AC and DC Solid State Relays
  /// </summary>
  TBrickletSolidStateRelay = class(TDevice)
  private
    monoflopDoneCallback: TBrickletSolidStateRelayNotifyMonoflopDone;
  protected
    procedure CallbackWrapperMonoflopDone(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the state of the relays *true* means on and *false* means off. 
    ///  
    ///  Running monoflop timers will be overwritten if this function is called.
    ///  
    ///  The default value is *false*.
    /// </summary>
    procedure SetState(const state: boolean); virtual;

    /// <summary>
    ///  Returns the state of the relay, *true* means on and *false* means off.
    /// </summary>
    function GetState: boolean; virtual;

    /// <summary>
    ///  The first parameter  is the desired state of the relay (*true* means on 
    ///  and *false* means off). The second parameter indicates the time (in ms) that 
    ///  the relay should hold the state.
    ///  
    ///  If this function is called with the parameters (true, 1500):
    ///  The relay will turn on and in 1.5s it will turn off again.
    ///  
    ///  A monoflop can be used as a failsafe mechanism. For example: Lets assume you 
    ///  have a RS485 bus and a Solid State Relay Bricklet connected to one of the slave 
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds. The relay will be on all the time. If now the RS485 
    ///  connection is lost, the relay will turn off in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const state: boolean; const time: longword); virtual;

    /// <summary>
    ///  Returns the current state and the time as set by 
    ///  <see cref="BrickletSolidStateRelay.TBrickletSolidStateRelay.SetMonoflop"/> as well as the remaining time until the state flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(out state: boolean; out time: longword; out timeRemaining: longword); virtual;

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
    ///  This callback is triggered whenever the monoflop timer reaches 0. 
    ///  The parameter is the current state of the relay 
    ///  (the state after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletSolidStateRelayNotifyMonoflopDone read monoflopDoneCallback write monoflopDoneCallback;
  end;

implementation

constructor TBrickletSolidStateRelay.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_STATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SOLID_STATE_RELAY_CALLBACK_MONOFLOP_DONE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_SOLID_STATE_RELAY_CALLBACK_MONOFLOP_DONE] := {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletSolidStateRelay.SetState(const state: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_STATE, 9);
  LEConvertBooleanTo(state, 8, request);
  SendRequest(request);
end;

function TBrickletSolidStateRelay.GetState: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_STATE, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletSolidStateRelay.SetMonoflop(const state: boolean; const time: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_MONOFLOP, 13);
  LEConvertBooleanTo(state, 8, request);
  LEConvertUInt32To(time, 9, request);
  SendRequest(request);
end;

procedure TBrickletSolidStateRelay.GetMonoflop(out state: boolean; out time: longword; out timeRemaining: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_MONOFLOP, 8);
  response := SendRequest(request);
  state := LEConvertBooleanFrom(8, response);
  time := LEConvertUInt32From(9, response);
  timeRemaining := LEConvertUInt32From(13, response);
end;

procedure TBrickletSolidStateRelay.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletSolidStateRelay.CallbackWrapperMonoflopDone(const packet: TByteArray);
var state: boolean;
begin
  if (Assigned(monoflopDoneCallback)) then begin
    state := LEConvertBooleanFrom(8, packet);
    monoflopDoneCallback(self, state);
  end;
end;

end.
