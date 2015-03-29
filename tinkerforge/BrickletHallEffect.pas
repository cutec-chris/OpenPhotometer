{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletHallEffect;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_HALL_EFFECT_DEVICE_IDENTIFIER = 240;

  BRICKLET_HALL_EFFECT_FUNCTION_GET_VALUE = 1;
  BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT = 2;
  BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CONFIG = 3;
  BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CONFIG = 4;
  BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_INTERRUPT = 5;
  BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_INTERRUPT = 6;
  BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD = 7;
  BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD = 8;
  BRICKLET_HALL_EFFECT_FUNCTION_EDGE_INTERRUPT = 9;
  BRICKLET_HALL_EFFECT_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_HALL_EFFECT_CALLBACK_EDGE_COUNT = 10;

  BRICKLET_HALL_EFFECT_EDGE_TYPE_RISING = 0;
  BRICKLET_HALL_EFFECT_EDGE_TYPE_FALLING = 1;
  BRICKLET_HALL_EFFECT_EDGE_TYPE_BOTH = 2;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletHallEffect = class;
  TBrickletHallEffectNotifyEdgeCount = procedure(sender: TBrickletHallEffect; const count: longword; const value: boolean) of object;

  /// <summary>
  ///  Device that detects presence of magnetic field via hall effect
  /// </summary>
  TBrickletHallEffect = class(TDevice)
  private
    edgeCountCallback: TBrickletHallEffectNotifyEdgeCount;
  protected
    procedure CallbackWrapperEdgeCount(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns *true* if a magnetic field of 35 Gauss (3.5mT) or greater is detected.
    /// </summary>
    function GetValue: boolean; virtual;

    /// <summary>
    ///  Returns the current value of the edge counter. You can configure
    ///  edge type (rising, falling, both) that is counted with
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    /// </summary>
    function GetEdgeCount(const resetCounter: boolean): longword; virtual;

    /// <summary>
    ///  The edge type parameter configures if rising edges, falling edges or 
    ///  both are counted. Possible edge types are:
    ///  
    ///  * 0 = rising (default)
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  A magnetic field of 35 Gauss (3.5mT) or greater causes a falling edge and a
    ///  magnetic field of 25 Gauss (2.5mT) or smaller causes a rising edge.
    ///  
    ///  If a magnet comes near the Bricklet the signal goes low (falling edge), if
    ///  a magnet is removed from the vicinity the signal goes high (rising edge).
    ///  
    ///  The debounce time is given in ms.
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    ///  
    ///  Default values: 0 (edge type) and 100ms (debounce time)
    /// </summary>
    procedure SetEdgeCountConfig(const edgeType: byte; const debounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountConfig"/>.
    /// </summary>
    procedure GetEdgeCountConfig(out edgeType: byte; out debounce: byte); virtual;

    /// <summary>
    ///  Sets the number of edges until an interrupt is invoked.
    ///  
    ///  If *edges* is set to n, an interrupt is invoked for every n-th detected edge.
    ///  
    ///  If *edges* is set to 0, the interrupt is disabled.
    ///  
    ///  Default value is 0.
    /// </summary>
    procedure SetEdgeInterrupt(const edges: longword); virtual;

    /// <summary>
    ///  Returns the edges as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeInterrupt"/>.
    /// </summary>
    function GetEdgeInterrupt: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletHallEffect.TBrickletHallEffect.EdgeCount"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.EdgeCount"/> is only triggered if the edge count has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetEdgeCountCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountCallbackPeriod"/>.
    /// </summary>
    function GetEdgeCountCallbackPeriod: longword; virtual;

    /// <summary>
    ///  This callback is triggered every n-th count, as configured with
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeInterrupt"/>. The parameters are the
    ///  current count and the current value (see <see cref="BrickletHallEffect.TBrickletHallEffect.GetValue"/> and <see cref="BrickletHallEffect.TBrickletHallEffect.GetEdgeCount"/>).
    /// </summary>
    procedure EdgeInterrupt(out count: longword; out value: boolean); virtual;

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
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountCallbackPeriod"/>. The parameters are the
    ///  current count and the current value (see <see cref="BrickletHallEffect.TBrickletHallEffect.GetValue"/> and <see cref="BrickletHallEffect.TBrickletHallEffect.GetEdgeCount"/>).
    ///  
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.EdgeCount"/> is only triggered if the count or value changed since the
    ///  last triggering.
    /// </summary>
    property OnEdgeCount: TBrickletHallEffectNotifyEdgeCount read edgeCountCallback write edgeCountCallback;
  end;

implementation

constructor TBrickletHallEffect.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CONFIG] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CONFIG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_EDGE_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_HALL_EFFECT_CALLBACK_EDGE_COUNT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_HALL_EFFECT_CALLBACK_EDGE_COUNT] := {$ifdef FPC}@{$endif}CallbackWrapperEdgeCount;
end;

function TBrickletHallEffect.GetValue: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

function TBrickletHallEffect.GetEdgeCount(const resetCounter: boolean): longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT, 9);
  LEConvertBooleanTo(resetCounter, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHallEffect.SetEdgeCountConfig(const edgeType: byte; const debounce: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CONFIG, 10);
  LEConvertUInt8To(edgeType, 8, request);
  LEConvertUInt8To(debounce, 9, request);
  SendRequest(request);
end;

procedure TBrickletHallEffect.GetEdgeCountConfig(out edgeType: byte; out debounce: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CONFIG, 8);
  response := SendRequest(request);
  edgeType := LEConvertUInt8From(8, response);
  debounce := LEConvertUInt8From(9, response);
end;

procedure TBrickletHallEffect.SetEdgeInterrupt(const edges: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_INTERRUPT, 12);
  LEConvertUInt32To(edges, 8, request);
  SendRequest(request);
end;

function TBrickletHallEffect.GetEdgeInterrupt: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_INTERRUPT, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHallEffect.SetEdgeCountCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletHallEffect.GetEdgeCountCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletHallEffect.EdgeInterrupt(out count: longword; out value: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_EDGE_INTERRUPT, 8);
  response := SendRequest(request);
  count := LEConvertUInt32From(8, response);
  value := LEConvertBooleanFrom(12, response);
end;

procedure TBrickletHallEffect.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletHallEffect.CallbackWrapperEdgeCount(const packet: TByteArray);
var count: longword; value: boolean;
begin
  if (Assigned(edgeCountCallback)) then begin
    count := LEConvertUInt32From(8, packet);
    value := LEConvertBooleanFrom(12, packet);
    edgeCountCallback(self, count, value);
  end;
end;

end.
