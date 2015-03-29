{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAnalogOut;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ANALOG_OUT_DEVICE_IDENTIFIER = 220;

  BRICKLET_ANALOG_OUT_FUNCTION_SET_VOLTAGE = 1;
  BRICKLET_ANALOG_OUT_FUNCTION_GET_VOLTAGE = 2;
  BRICKLET_ANALOG_OUT_FUNCTION_SET_MODE = 3;
  BRICKLET_ANALOG_OUT_FUNCTION_GET_MODE = 4;
  BRICKLET_ANALOG_OUT_FUNCTION_GET_IDENTITY = 255;


  BRICKLET_ANALOG_OUT_MODE_ANALOG_VALUE = 0;
  BRICKLET_ANALOG_OUT_MODE_1K_TO_GROUND = 1;
  BRICKLET_ANALOG_OUT_MODE_100K_TO_GROUND = 2;
  BRICKLET_ANALOG_OUT_MODE_500K_TO_GROUND = 3;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Device for output of voltage between 0 and 5V
  /// </summary>
  TBrickletAnalogOut = class(TDevice)
  private
  protected
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the voltage in mV. The possible range is 0V to 5V (0-5000).
    ///  Calling this function will set the mode to 0 (see <see cref="BrickletAnalogOut.TBrickletAnalogOut.SetMode"/>).
    ///  
    ///  The default value is 0 (with mode 1).
    /// </summary>
    procedure SetVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletAnalogOut.TBrickletAnalogOut.SetVoltage"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Sets the mode of the analog value. Possible modes:
    ///  
    ///  * 0: Normal Mode (Analog value as set by <see cref="BrickletAnalogOut.TBrickletAnalogOut.SetVoltage"/> is applied)
    ///  * 1: 1k Ohm resistor to ground
    ///  * 2: 100k Ohm resistor to ground
    ///  * 3: 500k Ohm resistor to ground
    ///  
    ///  Setting the mode to 0 will result in an output voltage of 0. You can jump
    ///  to a higher output voltage directly by calling <see cref="BrickletAnalogOut.TBrickletAnalogOut.SetVoltage"/>.
    ///  
    ///  The default mode is 1.
    /// </summary>
    procedure SetMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the mode as set by <see cref="BrickletAnalogOut.TBrickletAnalogOut.SetMode"/>.
    /// </summary>
    function GetMode: byte; virtual;

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
  end;

implementation

constructor TBrickletAnalogOut.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_ANALOG_OUT_FUNCTION_SET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ANALOG_OUT_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_OUT_FUNCTION_SET_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ANALOG_OUT_FUNCTION_GET_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_OUT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

end;

procedure TBrickletAnalogOut.SetVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_FUNCTION_SET_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogOut.GetVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_FUNCTION_GET_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletAnalogOut.SetMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_FUNCTION_SET_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogOut.GetMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_FUNCTION_GET_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletAnalogOut.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

end.
