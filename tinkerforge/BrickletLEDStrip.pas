{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLEDStrip;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LED_STRIP_DEVICE_IDENTIFIER = 231;

  BRICKLET_LED_STRIP_FUNCTION_SET_RGB_VALUES = 1;
  BRICKLET_LED_STRIP_FUNCTION_GET_RGB_VALUES = 2;
  BRICKLET_LED_STRIP_FUNCTION_SET_FRAME_DURATION = 3;
  BRICKLET_LED_STRIP_FUNCTION_GET_FRAME_DURATION = 4;
  BRICKLET_LED_STRIP_FUNCTION_GET_SUPPLY_VOLTAGE = 5;
  BRICKLET_LED_STRIP_FUNCTION_SET_CLOCK_FREQUENCY = 7;
  BRICKLET_LED_STRIP_FUNCTION_GET_CLOCK_FREQUENCY = 8;
  BRICKLET_LED_STRIP_FUNCTION_SET_CHIP_TYPE = 9;
  BRICKLET_LED_STRIP_FUNCTION_GET_CHIP_TYPE = 10;
  BRICKLET_LED_STRIP_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LED_STRIP_CALLBACK_FRAME_RENDERED = 6;

  BRICKLET_LED_STRIP_CHIP_TYPE_WS2801 = 2801;
  BRICKLET_LED_STRIP_CHIP_TYPE_WS2811 = 2811;
  BRICKLET_LED_STRIP_CHIP_TYPE_WS2812 = 2812;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To15OfUInt8 = array [0..15] of byte;

  TBrickletLEDStrip = class;
  TBrickletLEDStripNotifyFrameRendered = procedure(sender: TBrickletLEDStrip; const length2: word) of object;

  /// <summary>
  ///  Device to control up to 320 RGB LEDs
  /// </summary>
  TBrickletLEDStrip = class(TDevice)
  private
    frameRenderedCallback: TBrickletLEDStripNotifyFrameRendered;
  protected
    procedure CallbackWrapperFrameRendered(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the *rgb* values for the LEDs with the given *length* starting 
    ///  from *index*.
    ///  
    ///  The maximum length is 16, the index goes from 0 to 319 and the rgb values
    ///  have 8 bits each.
    ///  
    ///  Example: If you set
    ///  
    ///  * index to 5,
    ///  * length to 3,
    ///  * r to [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ///  * g to [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] and
    ///  * b to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ///  
    ///  the LED with index 5 will be red, 6 will be green and 7 will be blue.
    ///  
    ///  .. note:: Depending on the LED circuitry colors can be permuted.
    ///  
    ///  The colors will be transfered to actual LEDs when the next
    ///  frame duration ends, see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetFrameDuration"/>.
    ///  
    ///  Generic approach: 
    ///  
    ///  * Set the frame duration to a value that represents
    ///    the number of frames per second you want to achieve. 
    ///  * Set all of the LED colors for one frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.FrameRendered"/> callback.
    ///  * Set all of the LED colors for next frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.FrameRendered"/> callback.
    ///  * and so on.
    ///  
    ///  This approach ensures that you can change the LED colors with
    ///  a fixed frame rate.
    ///  
    ///  The actual number of controllable LEDs depends on the number of free
    ///  Bricklet ports. See :ref:`here &lt;led_strip_bricklet_ram_constraints&gt;` for more
    ///  information. A call of <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/> with index + length above the
    ///  bounds is ignored completely.
    /// </summary>
    procedure SetRGBValues(const index: word; const length2: byte; const r: TArray0To15OfUInt8; const g: TArray0To15OfUInt8; const b: TArray0To15OfUInt8); virtual;

    /// <summary>
    ///  Returns the rgb with the given *length* starting from the
    ///  given *index*.
    ///  
    ///  The values are the last values that were set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    /// </summary>
    procedure GetRGBValues(const index: word; const length2: byte; out r: TArray0To15OfUInt8; out g: TArray0To15OfUInt8; out b: TArray0To15OfUInt8); virtual;

    /// <summary>
    ///  Sets the frame duration in ms.
    ///  
    ///  Example: If you want to achieve 20 frames per second, you should
    ///  set the frame duration to 50ms (50ms * 20 = 1 second). 
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    ///  
    ///  Default value: 100ms (10 frames per second).
    /// </summary>
    procedure SetFrameDuration(const duration: word); virtual;

    /// <summary>
    ///  Returns the frame duration as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetFrameDuration"/>.
    /// </summary>
    function GetFrameDuration: word; virtual;

    /// <summary>
    ///  Returns the current supply voltage of the LEDs. The voltage is given in mV.
    /// </summary>
    function GetSupplyVoltage: word; virtual;

    /// <summary>
    ///  Sets the frequency of the clock in Hz. The range is 10000Hz (10kHz) up to
    ///  2000000Hz (2MHz).
    ///  
    ///  The Bricklet will choose the nearest achievable frequency, which may
    ///  be off by a few Hz. You can get the exact frequency that is used by
    ///  calling <see cref="BrickletLEDStrip.TBrickletLEDStrip.GetClockFrequency"/>.
    ///  
    ///  If you have problems with flickering LEDs, they may be bits flipping. You
    ///  can fix this by either making the connection between the LEDs and the
    ///  Bricklet shorter or by reducing the frequency.
    ///  
    ///  With a decreasing frequency your maximum frames per second will decrease
    ///  too.
    ///  
    ///  The default value is 1.66MHz.
    ///  
    ///  <note>
    ///   The frequency in firmware version 2.0.0 is fixed at 2MHz.
    ///  </note>
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure SetClockFrequency(const frequency: longword); virtual;

    /// <summary>
    ///  Returns the currently used clock frequency as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetClockFrequency"/>.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    function GetClockFrequency: longword; virtual;

    /// <summary>
    ///  Sets the type of the led driver chip. We currently support
    ///  the chips
    ///  
    ///  * WS2801 (``chip`` = 2801),
    ///  * WS2811 (``chip`` = 2811) and
    ///  * WS2812 (``chip`` = 2812).
    ///  
    ///  The WS2812 is sometimes also called "NeoPixel", a name coined by
    ///  Adafruit.
    ///  
    ///  The default value is WS2801 (``chip`` = 2801).
    ///  
    ///  .. versionadded:: 2.0.2~(Plugin)
    /// </summary>
    procedure SetChipType(const chip: word); virtual;

    /// <summary>
    ///  Returns the currently used chip type as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChipType"/>.
    ///  
    ///  .. versionadded:: 2.0.2~(Plugin)
    /// </summary>
    function GetChipType: word; virtual;

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
    ///  This callback is triggered directly after a new frame is rendered.
    ///  
    ///  You should send the data for the next frame directly after this callback
    ///  was triggered.
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    /// </summary>
    property OnFrameRendered: TBrickletLEDStripNotifyFrameRendered read frameRenderedCallback write frameRenderedCallback;
  end;

implementation

constructor TBrickletLEDStrip.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 2;

  responseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_RGB_VALUES] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_RGB_VALUES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_FRAME_DURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_FRAME_DURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_SUPPLY_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LED_STRIP_CALLBACK_FRAME_RENDERED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_CLOCK_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_CLOCK_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_CHIP_TYPE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_CHIP_TYPE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LED_STRIP_CALLBACK_FRAME_RENDERED] := {$ifdef FPC}@{$endif}CallbackWrapperFrameRendered;
end;

procedure TBrickletLEDStrip.SetRGBValues(const index: word; const length2: byte; const r: TArray0To15OfUInt8; const g: TArray0To15OfUInt8; const b: TArray0To15OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_RGB_VALUES, 59);
  LEConvertUInt16To(index, 8, request);
  LEConvertUInt8To(length2, 10, request);
  for i := 0 to Length(r) - 1 do LEConvertUInt8To(r[i], 11 + (i * 1), request);
  for i := 0 to Length(g) - 1 do LEConvertUInt8To(g[i], 27 + (i * 1), request);
  for i := 0 to Length(b) - 1 do LEConvertUInt8To(b[i], 43 + (i * 1), request);
  SendRequest(request);
end;

procedure TBrickletLEDStrip.GetRGBValues(const index: word; const length2: byte; out r: TArray0To15OfUInt8; out g: TArray0To15OfUInt8; out b: TArray0To15OfUInt8);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_RGB_VALUES, 11);
  LEConvertUInt16To(index, 8, request);
  LEConvertUInt8To(length2, 10, request);
  response := SendRequest(request);
  for i := 0 to 15 do r[i] := LEConvertUInt8From(8 + (i * 1), response);
  for i := 0 to 15 do g[i] := LEConvertUInt8From(24 + (i * 1), response);
  for i := 0 to 15 do b[i] := LEConvertUInt8From(40 + (i * 1), response);
end;

procedure TBrickletLEDStrip.SetFrameDuration(const duration: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_FRAME_DURATION, 10);
  LEConvertUInt16To(duration, 8, request);
  SendRequest(request);
end;

function TBrickletLEDStrip.GetFrameDuration: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_FRAME_DURATION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletLEDStrip.GetSupplyVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_SUPPLY_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletLEDStrip.SetClockFrequency(const frequency: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_CLOCK_FREQUENCY, 12);
  LEConvertUInt32To(frequency, 8, request);
  SendRequest(request);
end;

function TBrickletLEDStrip.GetClockFrequency: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_CLOCK_FREQUENCY, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLEDStrip.SetChipType(const chip: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_CHIP_TYPE, 10);
  LEConvertUInt16To(chip, 8, request);
  SendRequest(request);
end;

function TBrickletLEDStrip.GetChipType: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_CHIP_TYPE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletLEDStrip.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLEDStrip.CallbackWrapperFrameRendered(const packet: TByteArray);
var length2: word;
begin
  if (Assigned(frameRenderedCallback)) then begin
    length2 := LEConvertUInt16From(8, packet);
    frameRenderedCallback(self, length2);
  end;
end;

end.
