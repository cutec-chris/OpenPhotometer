{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletSegmentDisplay4x7;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_SEGMENT_DISPLAY_4X7_DEVICE_IDENTIFIER = 237;

  BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_SET_SEGMENTS = 1;
  BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_SEGMENTS = 2;
  BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_START_COUNTER = 3;
  BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_COUNTER_VALUE = 4;
  BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_SEGMENT_DISPLAY_4X7_CALLBACK_COUNTER_FINISHED = 5;


type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfUInt8 = array [0..3] of byte;

  TBrickletSegmentDisplay4x7 = class;
  TBrickletSegmentDisplay4x7NotifyCounterFinished = procedure(sender: TBrickletSegmentDisplay4x7) of object;

  /// <summary>
  ///  Device for controling four 7-segment displays
  /// </summary>
  TBrickletSegmentDisplay4x7 = class(TDevice)
  private
    counterFinishedCallback: TBrickletSegmentDisplay4x7NotifyCounterFinished;
  protected
    procedure CallbackWrapperCounterFinished(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  The 7-segment display can be set with bitmaps. Every bit controls one
    ///  segment:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_segment_display_4x7_bit_order.png
    ///     :scale: 100 %
    ///     :alt: Bit order of one segment
    ///     :align: center
    ///  
    ///  For example to set a "5" you would want to activate segments 0, 2, 3, 5 and 6.
    ///  This is represented by the number 0b01101101 = 0x6d = 109.
    ///  
    ///  The brightness can be set between 0 (dark) and 7 (bright). The colon
    ///  parameter turns the colon of the display on or off.
    /// </summary>
    procedure SetSegments(const segments: TArray0To3OfUInt8; const brightness: byte; const colon: boolean); virtual;

    /// <summary>
    ///  Returns the segment, brightness and color data as set by 
    ///  <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.SetSegments"/>.
    /// </summary>
    procedure GetSegments(out segments: TArray0To3OfUInt8; out brightness: byte; out colon: boolean); virtual;

    /// <summary>
    ///  Starts a counter with the *from* value that counts to the *to*
    ///  value with the each step incremented by *increment*.
    ///  The *length* of the increment is given in ms.
    ///  
    ///  Example: If you set *from* to 0, *to* to 100, *increment* to 1 and
    ///  *length* to 1000, a counter that goes from 0 to 100 with 1 second
    ///  pause between each increment will be started.
    ///  
    ///  The maximum values for *from*, *to* and *increment* is 9999, 
    ///  the minimum value is -999.
    ///  
    ///  You can stop the counter at every time by calling <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.SetSegments"/>.
    /// </summary>
    procedure StartCounter(const valueFrom: smallint; const valueTo: smallint; const increment: smallint; const length2: longword); virtual;

    /// <summary>
    ///  Returns the counter value that is currently shown on the display.
    ///  
    ///  If there is no counter running a 0 will be returned.
    /// </summary>
    function GetCounterValue: word; virtual;

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
    ///  This callback is triggered when the counter (see <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.StartCounter"/>) is
    ///  finished.
    /// </summary>
    property OnCounterFinished: TBrickletSegmentDisplay4x7NotifyCounterFinished read counterFinishedCallback write counterFinishedCallback;
  end;

implementation

constructor TBrickletSegmentDisplay4x7.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_SET_SEGMENTS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_SEGMENTS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_START_COUNTER] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_COUNTER_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_CALLBACK_COUNTER_FINISHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_SEGMENT_DISPLAY_4X7_CALLBACK_COUNTER_FINISHED] := {$ifdef FPC}@{$endif}CallbackWrapperCounterFinished;
end;

procedure TBrickletSegmentDisplay4x7.SetSegments(const segments: TArray0To3OfUInt8; const brightness: byte; const colon: boolean);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_SET_SEGMENTS, 14);
  for i := 0 to Length(segments) - 1 do LEConvertUInt8To(segments[i], 8 + (i * 1), request);
  LEConvertUInt8To(brightness, 12, request);
  LEConvertBooleanTo(colon, 13, request);
  SendRequest(request);
end;

procedure TBrickletSegmentDisplay4x7.GetSegments(out segments: TArray0To3OfUInt8; out brightness: byte; out colon: boolean);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_SEGMENTS, 8);
  response := SendRequest(request);
  for i := 0 to 3 do segments[i] := LEConvertUInt8From(8 + (i * 1), response);
  brightness := LEConvertUInt8From(12, response);
  colon := LEConvertBooleanFrom(13, response);
end;

procedure TBrickletSegmentDisplay4x7.StartCounter(const valueFrom: smallint; const valueTo: smallint; const increment: smallint; const length2: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_START_COUNTER, 18);
  LEConvertInt16To(valueFrom, 8, request);
  LEConvertInt16To(valueTo, 10, request);
  LEConvertInt16To(increment, 12, request);
  LEConvertUInt32To(length2, 14, request);
  SendRequest(request);
end;

function TBrickletSegmentDisplay4x7.GetCounterValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_COUNTER_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletSegmentDisplay4x7.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletSegmentDisplay4x7.CallbackWrapperCounterFinished(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(counterFinishedCallback)) then begin
    counterFinishedCallback(self);
  end;
end;

end.
