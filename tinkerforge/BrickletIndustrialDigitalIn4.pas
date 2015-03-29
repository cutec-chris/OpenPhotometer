{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletIndustrialDigitalIn4;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_DEVICE_IDENTIFIER = 223;

  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_VALUE = 1;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_GROUP = 2;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_GROUP = 3;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_AVAILABLE_FOR_GROUP = 4;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_DEBOUNCE_PERIOD = 5;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_DEBOUNCE_PERIOD = 6;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_INTERRUPT = 7;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_INTERRUPT = 8;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT = 10;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_EDGE_COUNT_CONFIG = 11;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT_CONFIG = 12;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_CALLBACK_INTERRUPT = 9;

  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_EDGE_TYPE_RISING = 0;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_EDGE_TYPE_FALLING = 1;
  BRICKLET_INDUSTRIAL_DIGITAL_IN_4_EDGE_TYPE_BOTH = 2;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfChar = array [0..3] of char;

  TBrickletIndustrialDigitalIn4 = class;
  TBrickletIndustrialDigitalIn4NotifyInterrupt = procedure(sender: TBrickletIndustrialDigitalIn4; const interruptMask: word; const valueMask: word) of object;

  /// <summary>
  ///  Device for controlling up to 4 optically coupled digital inputs
  /// </summary>
  TBrickletIndustrialDigitalIn4 = class(TDevice)
  private
    interruptCallback: TBrickletIndustrialDigitalIn4NotifyInterrupt;
  protected
    procedure CallbackWrapperInterrupt(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the input value with a bitmask. The bitmask is 16bit long, *true*
    ///  refers to high and *false* refers to low.
    ///  
    ///  For example: The value 3 or 0b0011 means that pins 0-1 are high and the other
    ///  pins are low.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>), the pins correspond to the
    ///  markings on the Digital In 4 Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    /// </summary>
    function GetValue: word; virtual;

    /// <summary>
    ///  Sets a group of Digital In 4 Bricklets that should work together. You can
    ///  find Bricklets that can be grouped together with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.GetAvailableForGroup"/>.
    ///  
    ///  The group consists of 4 elements. Element 1 in the group will get pins 0-3,
    ///  element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.
    ///  
    ///  Each element can either be one of the ports ('a' to 'd') or 'n' if it should
    ///  not be used.
    ///  
    ///  For example: If you have two Digital In 4 Bricklets connected to port A and
    ///  port B respectively, you could call with ``['a', 'b', 'n', 'n']``.
    ///  
    ///  Now the pins on the Digital In 4 on port A are assigned to 0-3 and the
    ///  pins on the Digital In 4 on port B are assigned to 4-7. It is now possible
    ///  to call <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.GetValue"/> and read out two Bricklets at the same time.
    ///  
    ///  Changing the group configuration resets all edge counter configurations
    ///  and values.
    /// </summary>
    procedure SetGroup(const group: TArray0To3OfChar); virtual;

    /// <summary>
    ///  Returns the group as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>
    /// </summary>
    function GetGroup: TArray0To3OfChar; virtual;

    /// <summary>
    ///  Returns a bitmask of ports that are available for grouping. For example the
    ///  value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
    ///  can be grouped together.
    /// </summary>
    function GetAvailableForGroup: byte; virtual;

    /// <summary>
    ///  Sets the debounce period of the <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.Interrupt"/> callback in ms.
    ///  
    ///  For example: If you set this value to 100, you will get the interrupt
    ///  maximal every 100ms. This is necessary if something that bounces is
    ///  connected to the Digital In 4 Bricklet, such as a button.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the pins on which an interrupt is activated with a bitmask.
    ///  Interrupts are triggered on changes of the voltage level of the pin,
    ///  i.e. changes from high to low and low to high.
    ///  
    ///  For example: An interrupt bitmask of 9 or 0b1001 will enable the interrupt for
    ///  pins 0 and 3.
    ///  
    ///  The interrupts use the grouping as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>.
    ///  
    ///  The interrupt is delivered with the callback <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.Interrupt"/>.
    /// </summary>
    procedure SetInterrupt(const interruptMask: word); virtual;

    /// <summary>
    ///  Returns the interrupt bitmask as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetInterrupt"/>.
    /// </summary>
    function GetInterrupt: word; virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected pin. You can
    ///  configure the edges that are counted with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    function GetEdgeCount(const pin: byte; const resetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for the selected pins. A bitmask of 9 or 0b1001 will
    ///  enable the edge counter for pins 0 and 3.
    ///  
    ///  The edge type parameter configures if rising edges, falling edges or
    ///  both are counted if the pin is configured for input. Possible edge types are:
    ///  
    ///  * 0 = rising (default)
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  The debounce time is given in ms.
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    ///  
    ///  Default values: 0 (edge type) and 100ms (debounce time)
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure SetEdgeCountConfig(const selectionMask: word; const edgeType: byte; const debounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected pin as set by
    ///  <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetEdgeCountConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure GetEdgeCountConfig(const pin: byte; out edgeType: byte; out debounce: byte); virtual;

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
    ///  This callback is triggered whenever a change of the voltage level is detected
    ///  on pins where the interrupt was activated with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetInterrupt"/>.
    ///  
    ///  The values are a bitmask that specifies which interrupts occurred
    ///  and the current value bitmask.
    ///  
    ///  For example:
    ///  
    ///  * (1, 1) or (0b0001, 0b0001) means that an interrupt on pin 0 occurred and
    ///    currently pin 0 is high and pins 1-3 are low.
    ///  * (9, 14) or (0b1001, 0b1110) means that interrupts on pins 0 and 3
    ///    occurred and currently pin 0 is low and pins 1-3 are high.
    /// </summary>
    property OnInterrupt: TBrickletIndustrialDigitalIn4NotifyInterrupt read interruptCallback write interruptCallback;
  end;

implementation

constructor TBrickletIndustrialDigitalIn4.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_GROUP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_GROUP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_AVAILABLE_FOR_GROUP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_CALLBACK_INTERRUPT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_EDGE_COUNT_CONFIG] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT_CONFIG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_CALLBACK_INTERRUPT] := {$ifdef FPC}@{$endif}CallbackWrapperInterrupt;
end;

function TBrickletIndustrialDigitalIn4.GetValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletIndustrialDigitalIn4.SetGroup(const group: TArray0To3OfChar);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_GROUP, 12);
  for i := 0 to Length(group) - 1 do LEConvertCharTo(group[i], 8 + (i * 1), request);
  SendRequest(request);
end;

function TBrickletIndustrialDigitalIn4.GetGroup: TArray0To3OfChar;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_GROUP, 8);
  response := SendRequest(request);
  for i := 0 to 3 do result[i] := LEConvertCharFrom(8 + (i * 1), response);
end;

function TBrickletIndustrialDigitalIn4.GetAvailableForGroup: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_AVAILABLE_FOR_GROUP, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletIndustrialDigitalIn4.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDigitalIn4.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDigitalIn4.SetInterrupt(const interruptMask: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_INTERRUPT, 10);
  LEConvertUInt16To(interruptMask, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDigitalIn4.GetInterrupt: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_INTERRUPT, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletIndustrialDigitalIn4.GetEdgeCount(const pin: byte; const resetCounter: boolean): longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(pin, 8, request);
  LEConvertBooleanTo(resetCounter, 9, request);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDigitalIn4.SetEdgeCountConfig(const selectionMask: word; const edgeType: byte; const debounce: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_EDGE_COUNT_CONFIG, 12);
  LEConvertUInt16To(selectionMask, 8, request);
  LEConvertUInt8To(edgeType, 10, request);
  LEConvertUInt8To(debounce, 11, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialDigitalIn4.GetEdgeCountConfig(const pin: byte; out edgeType: byte; out debounce: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT_CONFIG, 9);
  LEConvertUInt8To(pin, 8, request);
  response := SendRequest(request);
  edgeType := LEConvertUInt8From(8, response);
  debounce := LEConvertUInt8From(9, response);
end;

procedure TBrickletIndustrialDigitalIn4.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletIndustrialDigitalIn4.CallbackWrapperInterrupt(const packet: TByteArray);
var interruptMask: word; valueMask: word;
begin
  if (Assigned(interruptCallback)) then begin
    interruptMask := LEConvertUInt16From(8, packet);
    valueMask := LEConvertUInt16From(10, packet);
    interruptCallback(self, interruptMask, valueMask);
  end;
end;

end.
