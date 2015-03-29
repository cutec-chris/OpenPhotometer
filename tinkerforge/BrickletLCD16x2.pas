{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLCD16x2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LCD_16X2_DEVICE_IDENTIFIER = 211;

  BRICKLET_LCD_16X2_FUNCTION_WRITE_LINE = 1;
  BRICKLET_LCD_16X2_FUNCTION_CLEAR_DISPLAY = 2;
  BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_ON = 3;
  BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_OFF = 4;
  BRICKLET_LCD_16X2_FUNCTION_IS_BACKLIGHT_ON = 5;
  BRICKLET_LCD_16X2_FUNCTION_SET_CONFIG = 6;
  BRICKLET_LCD_16X2_FUNCTION_GET_CONFIG = 7;
  BRICKLET_LCD_16X2_FUNCTION_IS_BUTTON_PRESSED = 8;
  BRICKLET_LCD_16X2_FUNCTION_SET_CUSTOM_CHARACTER = 11;
  BRICKLET_LCD_16X2_FUNCTION_GET_CUSTOM_CHARACTER = 12;
  BRICKLET_LCD_16X2_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LCD_16X2_CALLBACK_BUTTON_PRESSED = 9;
  BRICKLET_LCD_16X2_CALLBACK_BUTTON_RELEASED = 10;


type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To7OfUInt8 = array [0..7] of byte;

  TBrickletLCD16x2 = class;
  TBrickletLCD16x2NotifyButtonPressed = procedure(sender: TBrickletLCD16x2; const button: byte) of object;
  TBrickletLCD16x2NotifyButtonReleased = procedure(sender: TBrickletLCD16x2; const button: byte) of object;

  /// <summary>
  ///  Device for controlling a LCD with 2 lines a 16 characters
  /// </summary>
  TBrickletLCD16x2 = class(TDevice)
  private
    buttonPressedCallback: TBrickletLCD16x2NotifyButtonPressed;
    buttonReleasedCallback: TBrickletLCD16x2NotifyButtonReleased;
  protected
    procedure CallbackWrapperButtonPressed(const packet: TByteArray); virtual;
    procedure CallbackWrapperButtonReleased(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Writes text to a specific line (0 to 1) with a specific position 
    ///  (0 to 15). The text can have a maximum of 16 characters.
    ///  
    ///  For example: (0, 5, "Hello") will write *Hello* in the middle of the
    ///  first line of the display.
    ///  
    ///  The display uses a special charset that includes all ASCII characters except
    ///  backslash and tilde. The LCD charset also includes several other non-ASCII characters, see
    ///  the `charset specification &lt;https://github.com/Tinkerforge/lcd-16x2-bricklet/raw/master/datasheets/standard_charset.pdf&gt;`__
    ///  for details. The Unicode example above shows how to specify non-ASCII characters
    ///  and how to translate from Unicode to the LCD charset.
    /// </summary>
    procedure WriteLine(const line: byte; const position: byte; const text: string); virtual;

    /// <summary>
    ///  Deletes all characters from the display.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Turns the backlight on.
    /// </summary>
    procedure BacklightOn; virtual;

    /// <summary>
    ///  Turns the backlight off.
    /// </summary>
    procedure BacklightOff; virtual;

    /// <summary>
    ///  Returns *true* if the backlight is on and *false* otherwise.
    /// </summary>
    function IsBacklightOn: boolean; virtual;

    /// <summary>
    ///  Configures if the cursor (shown as "_") should be visible and if it
    ///  should be blinking (shown as a blinking block). The cursor position
    ///  is one character behind the the last text written with 
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.WriteLine"/>.
    ///  
    ///  The default is (false, false).
    /// </summary>
    procedure SetConfig(const cursor: boolean; const blinking: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD16x2.TBrickletLCD16x2.SetConfig"/>.
    /// </summary>
    procedure GetConfig(out cursor: boolean; out blinking: boolean); virtual;

    /// <summary>
    ///  Returns *true* if the button (0 to 2) is pressed. If you want to react
    ///  on button presses and releases it is recommended to use the
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.ButtonPressed"/> and <see cref="BrickletLCD16x2.TBrickletLCD16x2.ButtonReleased"/> callbacks.
    /// </summary>
    function IsButtonPressed(const button: byte): boolean; virtual;

    /// <summary>
    ///  The LCD 16x2 Bricklet can store up to 8 custom characters. The characters
    ///  consist of 5x8 pixels and can be addressed with the index 0-7. To describe
    ///  the pixels, the first 5 bits of 8 bytes are used. For example, to make
    ///  a custom character "H", you should transfer the following:
    ///  
    ///  * ``character[0] = 0b00010001`` (decimal value 17)
    ///  * ``character[1] = 0b00010001`` (decimal value 17)
    ///  * ``character[2] = 0b00010001`` (decimal value 17)
    ///  * ``character[3] = 0b00011111`` (decimal value 31)
    ///  * ``character[4] = 0b00010001`` (decimal value 17)
    ///  * ``character[5] = 0b00010001`` (decimal value 17)
    ///  * ``character[6] = 0b00010001`` (decimal value 17)
    ///  * ``character[7] = 0b00000000`` (decimal value 0)
    ///  
    ///  The characters can later be written with <see cref="BrickletLCD16x2.TBrickletLCD16x2.WriteLine"/> by using the
    ///  characters with the byte representation 8 to 15.
    ///  
    ///  You can play around with the custom characters in Brick Viewer since
    ///  version 2.0.1.
    ///  
    ///  Custom characters are stored by the LCD in RAM, so they have to be set
    ///  after each startup.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure SetCustomCharacter(const index: byte; const character: TArray0To7OfUInt8); virtual;

    /// <summary>
    ///  Returns the custom character for a given index, as set with
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.SetCustomCharacter"/>.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    function GetCustomCharacter(const index: byte): TArray0To7OfUInt8; virtual;

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
    ///  This callback is triggered when a button is pressed. The parameter is
    ///  the number of the button (0 to 2).
    /// </summary>
    property OnButtonPressed: TBrickletLCD16x2NotifyButtonPressed read buttonPressedCallback write buttonPressedCallback;

    /// <summary>
    ///  This callback is triggered when a button is released. The parameter is
    ///  the number of the button (0 to 2).
    /// </summary>
    property OnButtonReleased: TBrickletLCD16x2NotifyButtonReleased read buttonReleasedCallback write buttonReleasedCallback;
  end;

implementation

constructor TBrickletLCD16x2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_LCD_16X2_FUNCTION_WRITE_LINE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_CLEAR_DISPLAY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_IS_BACKLIGHT_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_SET_CONFIG] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_CONFIG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_IS_BUTTON_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LCD_16X2_CALLBACK_BUTTON_PRESSED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LCD_16X2_CALLBACK_BUTTON_RELEASED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_SET_CUSTOM_CHARACTER] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_CUSTOM_CHARACTER] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LCD_16X2_CALLBACK_BUTTON_PRESSED] := {$ifdef FPC}@{$endif}CallbackWrapperButtonPressed;
  callbackWrappers[BRICKLET_LCD_16X2_CALLBACK_BUTTON_RELEASED] := {$ifdef FPC}@{$endif}CallbackWrapperButtonReleased;
end;

procedure TBrickletLCD16x2.WriteLine(const line: byte; const position: byte; const text: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_WRITE_LINE, 26);
  LEConvertUInt8To(line, 8, request);
  LEConvertUInt8To(position, 9, request);
  LEConvertStringTo(text, 10, 16, request);
  SendRequest(request);
end;

procedure TBrickletLCD16x2.ClearDisplay;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(request);
end;

procedure TBrickletLCD16x2.BacklightOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_ON, 8);
  SendRequest(request);
end;

procedure TBrickletLCD16x2.BacklightOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_OFF, 8);
  SendRequest(request);
end;

function TBrickletLCD16x2.IsBacklightOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_IS_BACKLIGHT_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletLCD16x2.SetConfig(const cursor: boolean; const blinking: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_SET_CONFIG, 10);
  LEConvertBooleanTo(cursor, 8, request);
  LEConvertBooleanTo(blinking, 9, request);
  SendRequest(request);
end;

procedure TBrickletLCD16x2.GetConfig(out cursor: boolean; out blinking: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_CONFIG, 8);
  response := SendRequest(request);
  cursor := LEConvertBooleanFrom(8, response);
  blinking := LEConvertBooleanFrom(9, response);
end;

function TBrickletLCD16x2.IsButtonPressed(const button: byte): boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_IS_BUTTON_PRESSED, 9);
  LEConvertUInt8To(button, 8, request);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletLCD16x2.SetCustomCharacter(const index: byte; const character: TArray0To7OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_SET_CUSTOM_CHARACTER, 17);
  LEConvertUInt8To(index, 8, request);
  for i := 0 to Length(character) - 1 do LEConvertUInt8To(character[i], 9 + (i * 1), request);
  SendRequest(request);
end;

function TBrickletLCD16x2.GetCustomCharacter(const index: byte): TArray0To7OfUInt8;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_CUSTOM_CHARACTER, 9);
  LEConvertUInt8To(index, 8, request);
  response := SendRequest(request);
  for i := 0 to 7 do result[i] := LEConvertUInt8From(8 + (i * 1), response);
end;

procedure TBrickletLCD16x2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLCD16x2.CallbackWrapperButtonPressed(const packet: TByteArray);
var button: byte;
begin
  if (Assigned(buttonPressedCallback)) then begin
    button := LEConvertUInt8From(8, packet);
    buttonPressedCallback(self, button);
  end;
end;

procedure TBrickletLCD16x2.CallbackWrapperButtonReleased(const packet: TByteArray);
var button: byte;
begin
  if (Assigned(buttonReleasedCallback)) then begin
    button := LEConvertUInt8From(8, packet);
    buttonReleasedCallback(self, button);
  end;
end;

end.
