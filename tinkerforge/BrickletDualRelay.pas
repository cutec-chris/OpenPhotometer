{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletDualRelay;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_DUAL_RELAY_DEVICE_IDENTIFIER = 26;

  BRICKLET_DUAL_RELAY_FUNCTION_SET_STATE = 1;
  BRICKLET_DUAL_RELAY_FUNCTION_GET_STATE = 2;
  BRICKLET_DUAL_RELAY_FUNCTION_SET_MONOFLOP = 3;
  BRICKLET_DUAL_RELAY_FUNCTION_GET_MONOFLOP = 4;
  BRICKLET_DUAL_RELAY_FUNCTION_SET_SELECTED_STATE = 6;
  BRICKLET_DUAL_RELAY_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_DUAL_RELAY_CALLBACK_MONOFLOP_DONE = 5;


type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDualRelay = class;
  TBrickletDualRelayNotifyMonoflopDone = procedure(sender: TBrickletDualRelay; const relay: byte; const state: boolean) of object;

  /// <summary>
  ///  Device for controlling two relays
  /// </summary>
  TBrickletDualRelay = class(TDevice)
  private
    monoflopDoneCallback: TBrickletDualRelayNotifyMonoflopDone;
  protected
    procedure CallbackWrapperMonoflopDone(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the state of the relays, *true* means on and *false* means off. 
    ///  For example: (true, false) turns relay 1 on and relay 2 off.
    ///  
    ///  If you just want to set one of the relays and don't know the current state
    ///  of the other relay, you can get the state with <see cref="BrickletDualRelay.TBrickletDualRelay.GetState"/> or you
    ///  can use <see cref="BrickletDualRelay.TBrickletDualRelay.SetSelectedState"/>.
    ///  
    ///  Running monoflop timers will be overwritten if this function is called.
    ///  
    ///  The default value is (*false*, *false*).
    /// </summary>
    procedure SetState(const relay1: boolean; const relay2: boolean); virtual;

    /// <summary>
    ///  Returns the state of the relays, *true* means on and *false* means off.
    /// </summary>
    procedure GetState(out relay1: boolean; out relay2: boolean); virtual;

    /// <summary>
    ///  The first parameter can be 1 or 2 (relay 1 or relay 2). The second parameter 
    ///  is the desired state of the relay (*true* means on and *false* means off).
    ///  The third parameter indicates the time (in ms) that the relay should hold 
    ///  the state.
    ///  
    ///  If this function is called with the parameters (1, true, 1500):
    ///  Relay 1 will turn on and in 1.5s it will turn off again.
    ///  
    ///  A monoflop can be used as a failsafe mechanism. For example: Lets assume you 
    ///  have a RS485 bus and a Dual Relay Bricklet connected to one of the slave 
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds. The relay will be on all the time. If now the RS485 
    ///  connection is lost, the relay will turn off in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const relay: byte; const state: boolean; const time: longword); virtual;

    /// <summary>
    ///  Returns (for the given relay) the current state and the time as set by 
    ///  <see cref="BrickletDualRelay.TBrickletDualRelay.SetMonoflop"/> as well as the remaining time until the state flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const relay: byte; out state: boolean; out time: longword; out timeRemaining: longword); virtual;

    /// <summary>
    ///  Sets the state of the selected relay (1 or 2), *true* means on and *false* means off. 
    ///  
    ///  The other relay remains untouched.
    /// </summary>
    procedure SetSelectedState(const relay: byte; const state: boolean); virtual;

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
    ///  This callback is triggered whenever a monoflop timer reaches 0. The 
    ///  parameter contain the relay (1 or 2) and the current state of the relay 
    ///  (the state after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletDualRelayNotifyMonoflopDone read monoflopDoneCallback write monoflopDoneCallback;
  end;

implementation

constructor TBrickletDualRelay.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_STATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUAL_RELAY_CALLBACK_MONOFLOP_DONE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_SELECTED_STATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_DUAL_RELAY_CALLBACK_MONOFLOP_DONE] := {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletDualRelay.SetState(const relay1: boolean; const relay2: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_STATE, 10);
  LEConvertBooleanTo(relay1, 8, request);
  LEConvertBooleanTo(relay2, 9, request);
  SendRequest(request);
end;

procedure TBrickletDualRelay.GetState(out relay1: boolean; out relay2: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_STATE, 8);
  response := SendRequest(request);
  relay1 := LEConvertBooleanFrom(8, response);
  relay2 := LEConvertBooleanFrom(9, response);
end;

procedure TBrickletDualRelay.SetMonoflop(const relay: byte; const state: boolean; const time: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_MONOFLOP, 14);
  LEConvertUInt8To(relay, 8, request);
  LEConvertBooleanTo(state, 9, request);
  LEConvertUInt32To(time, 10, request);
  SendRequest(request);
end;

procedure TBrickletDualRelay.GetMonoflop(const relay: byte; out state: boolean; out time: longword; out timeRemaining: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(relay, 8, request);
  response := SendRequest(request);
  state := LEConvertBooleanFrom(8, response);
  time := LEConvertUInt32From(9, response);
  timeRemaining := LEConvertUInt32From(13, response);
end;

procedure TBrickletDualRelay.SetSelectedState(const relay: byte; const state: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_SELECTED_STATE, 10);
  LEConvertUInt8To(relay, 8, request);
  LEConvertBooleanTo(state, 9, request);
  SendRequest(request);
end;

procedure TBrickletDualRelay.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletDualRelay.CallbackWrapperMonoflopDone(const packet: TByteArray);
var relay: byte; state: boolean;
begin
  if (Assigned(monoflopDoneCallback)) then begin
    relay := LEConvertUInt8From(8, packet);
    state := LEConvertBooleanFrom(9, packet);
    monoflopDoneCallback(self, relay, state);
  end;
end;

end.
