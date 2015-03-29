{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletBarometer;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_BAROMETER_DEVICE_IDENTIFIER = 221;

  BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE = 1;
  BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE = 2;
  BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD = 3;
  BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD = 4;
  BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD = 5;
  BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD = 6;
  BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD = 7;
  BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD = 8;
  BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD = 9;
  BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD = 10;
  BRICKLET_BAROMETER_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_BAROMETER_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_BAROMETER_FUNCTION_SET_REFERENCE_AIR_PRESSURE = 13;
  BRICKLET_BAROMETER_FUNCTION_GET_CHIP_TEMPERATURE = 14;
  BRICKLET_BAROMETER_FUNCTION_GET_REFERENCE_AIR_PRESSURE = 19;
  BRICKLET_BAROMETER_FUNCTION_SET_AVERAGING = 20;
  BRICKLET_BAROMETER_FUNCTION_GET_AVERAGING = 21;
  BRICKLET_BAROMETER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE = 15;
  BRICKLET_BAROMETER_CALLBACK_ALTITUDE = 16;
  BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE_REACHED = 17;
  BRICKLET_BAROMETER_CALLBACK_ALTITUDE_REACHED = 18;

  BRICKLET_BAROMETER_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_BAROMETER_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_BAROMETER_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_BAROMETER_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_BAROMETER_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletBarometer = class;
  TBrickletBarometerNotifyAirPressure = procedure(sender: TBrickletBarometer; const airPressure: longint) of object;
  TBrickletBarometerNotifyAltitude = procedure(sender: TBrickletBarometer; const altitude: longint) of object;
  TBrickletBarometerNotifyAirPressureReached = procedure(sender: TBrickletBarometer; const airPressure: longint) of object;
  TBrickletBarometerNotifyAltitudeReached = procedure(sender: TBrickletBarometer; const altitude: longint) of object;

  /// <summary>
  ///  Device for sensing air pressure and altitude changes
  /// </summary>
  TBrickletBarometer = class(TDevice)
  private
    airPressureCallback: TBrickletBarometerNotifyAirPressure;
    altitudeCallback: TBrickletBarometerNotifyAltitude;
    airPressureReachedCallback: TBrickletBarometerNotifyAirPressureReached;
    altitudeReachedCallback: TBrickletBarometerNotifyAltitudeReached;
  protected
    procedure CallbackWrapperAirPressure(const packet: TByteArray); virtual;
    procedure CallbackWrapperAltitude(const packet: TByteArray); virtual;
    procedure CallbackWrapperAirPressureReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAltitudeReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the air pressure of the air pressure sensor. The value
    ///  has a range of 10000 to 1200000 and is given in mbar/1000, i.e. a value
    ///  of 1001092 means that an air pressure of 1001.092 mbar is measured.
    ///  
    ///  If you want to get the air pressure periodically, it is recommended to use the
    ///  callback <see cref="BrickletBarometer.TBrickletBarometer.AirPressure"/> and set the period with
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>.
    /// </summary>
    function GetAirPressure: longint; virtual;

    /// <summary>
    ///  Returns the relative altitude of the air pressure sensor. The value is given in
    ///  cm and is calculated based on the difference between the current air pressure
    ///  and the reference air pressure that can be set with <see cref="BrickletBarometer.TBrickletBarometer.SetReferenceAirPressure"/>.
    ///  
    ///  If you want to get the altitude periodically, it is recommended to use the
    ///  callback <see cref="BrickletBarometer.TBrickletBarometer.Altitude"/> and set the period with
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitude: longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletBarometer.TBrickletBarometer.AirPressure"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletBarometer.TBrickletBarometer.AirPressure"/> is only triggered if the air pressure has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAirPressureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>.
    /// </summary>
    function GetAirPressureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletBarometer.TBrickletBarometer.Altitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletBarometer.TBrickletBarometer.Altitude"/> is only triggered if the altitude has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAltitudeCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitudeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletBarometer.TBrickletBarometer.AirPressureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the air pressure is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the air pressure is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the air pressure is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the air pressure is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetAirPressureCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/>.
    /// </summary>
    procedure GetAirPressureCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletBarometer.TBrickletBarometer.AltitudeReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the altitude is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the altitude is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the altitude is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the altitude is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetAltitudeCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/>.
    /// </summary>
    procedure GetAltitudeCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.AirPressureReached"/>,
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.AltitudeReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/>,
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the reference air pressure in mbar/1000 for the altitude calculation.
    ///  Setting the reference to the current air pressure results in a calculated
    ///  altitude of 0cm. Passing 0 is a shortcut for passing the current air pressure as
    ///  reference.
    ///  
    ///  Well known reference values are the Q codes
    ///  `QNH &lt;http://en.wikipedia.org/wiki/QNH&gt;`__ and
    ///  `QFE &lt;http://en.wikipedia.org/wiki/Mean_sea_level_pressure#Mean_sea_level_pressure&gt;`__
    ///  used in aviation.
    ///  
    ///  The default value is 1013.25mbar.
    /// </summary>
    procedure SetReferenceAirPressure(const airPressure: longint); virtual;

    /// <summary>
    ///  Returns the temperature of the air pressure sensor. The value
    ///  has a range of -4000 to 8500 and is given in °C/100, i.e. a value
    ///  of 2007 means that a temperature of 20.07 °C is measured.
    ///  
    ///  This temperature is used internally for temperature compensation of the air
    ///  pressure measurement. It is not as accurate as the temperature measured by the
    ///  :ref:`temperature_bricklet` or the :ref:`temperature_ir_bricklet`.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Returns the reference air pressure as set by <see cref="BrickletBarometer.TBrickletBarometer.SetReferenceAirPressure"/>.
    /// </summary>
    function GetReferenceAirPressure: longint; virtual;

    /// <summary>
    ///  Sets the different averaging parameters. It is possible to set
    ///  the length of a normal averaging for the temperature and pressure,
    ///  as well as an additional length of a 
    ///  `moving average &lt;http://en.wikipedia.org/wiki/Moving_average&gt;`__ 
    ///  for the pressure. The moving average is calculated from the normal 
    ///  averages.  There is no moving average for the temperature.
    ///  
    ///  The maximum length for the pressure average is 10, for the
    ///  temperature average is 255 and for the moving average is 25.
    ///  
    ///  Setting the all three parameters to 0 will turn the averaging
    ///  completely off. If the averaging is off, there is lots of noise
    ///  on the data, but the data is without delay. Thus we recommend
    ///  to turn the averaging off if the Barometer Bricklet data is
    ///  to be used for sensor fusion with other sensors.
    ///  
    ///  The default values are 10 for the normal averages and 25 for the
    ///  moving average.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure SetAveraging(const movingAveragePressure: byte; const averagePressure: byte; const averageTemperature: byte); virtual;

    /// <summary>
    ///  Returns the averaging configuration as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAveraging"/>.
    ///  
    ///  .. versionadded:: 2.0.1~(Plugin)
    /// </summary>
    procedure GetAveraging(out movingAveragePressure: byte; out averagePressure: byte; out averageTemperature: byte); virtual;

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
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>. The parameter is the air pressure of the
    ///  air pressure sensor.
    ///  
    ///  <see cref="BrickletBarometer.TBrickletBarometer.AirPressure"/> is only triggered if the air pressure has changed since the
    ///  last triggering.
    /// </summary>
    property OnAirPressure: TBrickletBarometerNotifyAirPressure read airPressureCallback write airPressureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>. The parameter is the altitude of the
    ///  air pressure sensor.
    ///  
    ///  <see cref="BrickletBarometer.TBrickletBarometer.Altitude"/> is only triggered if the altitude has changed since the
    ///  last triggering.
    /// </summary>
    property OnAltitude: TBrickletBarometerNotifyAltitude read altitudeCallback write altitudeCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/> is reached.
    ///  The parameter is the air pressure of the air pressure sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAirPressureReached: TBrickletBarometerNotifyAirPressureReached read airPressureReachedCallback write airPressureReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/> is reached.
    ///  The parameter is the altitude of the air pressure sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAltitudeReached: TBrickletBarometerNotifyAltitudeReached read altitudeReachedCallback write altitudeReachedCallback;
  end;

implementation

constructor TBrickletBarometer.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_REFERENCE_AIR_PRESSURE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_BAROMETER_CALLBACK_ALTITUDE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_BAROMETER_CALLBACK_ALTITUDE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_REFERENCE_AIR_PRESSURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AVERAGING] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AVERAGING] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_BAROMETER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE] := {$ifdef FPC}@{$endif}CallbackWrapperAirPressure;
  callbackWrappers[BRICKLET_BAROMETER_CALLBACK_ALTITUDE] := {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  callbackWrappers[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAirPressureReached;
  callbackWrappers[BRICKLET_BAROMETER_CALLBACK_ALTITUDE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAltitudeReached;
end;

function TBrickletBarometer.GetAirPressure: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

function TBrickletBarometer.GetAltitude: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletBarometer.SetAirPressureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletBarometer.GetAirPressureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletBarometer.SetAltitudeCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletBarometer.GetAltitudeCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletBarometer.SetAirPressureCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletBarometer.GetAirPressureCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletBarometer.SetAltitudeCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletBarometer.GetAltitudeCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletBarometer.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletBarometer.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletBarometer.SetReferenceAirPressure(const airPressure: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_REFERENCE_AIR_PRESSURE, 12);
  LEConvertInt32To(airPressure, 8, request);
  SendRequest(request);
end;

function TBrickletBarometer.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

function TBrickletBarometer.GetReferenceAirPressure: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_REFERENCE_AIR_PRESSURE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletBarometer.SetAveraging(const movingAveragePressure: byte; const averagePressure: byte; const averageTemperature: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AVERAGING, 11);
  LEConvertUInt8To(movingAveragePressure, 8, request);
  LEConvertUInt8To(averagePressure, 9, request);
  LEConvertUInt8To(averageTemperature, 10, request);
  SendRequest(request);
end;

procedure TBrickletBarometer.GetAveraging(out movingAveragePressure: byte; out averagePressure: byte; out averageTemperature: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AVERAGING, 8);
  response := SendRequest(request);
  movingAveragePressure := LEConvertUInt8From(8, response);
  averagePressure := LEConvertUInt8From(9, response);
  averageTemperature := LEConvertUInt8From(10, response);
end;

procedure TBrickletBarometer.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletBarometer.CallbackWrapperAirPressure(const packet: TByteArray);
var airPressure: longint;
begin
  if (Assigned(airPressureCallback)) then begin
    airPressure := LEConvertInt32From(8, packet);
    airPressureCallback(self, airPressure);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAltitude(const packet: TByteArray);
var altitude: longint;
begin
  if (Assigned(altitudeCallback)) then begin
    altitude := LEConvertInt32From(8, packet);
    altitudeCallback(self, altitude);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAirPressureReached(const packet: TByteArray);
var airPressure: longint;
begin
  if (Assigned(airPressureReachedCallback)) then begin
    airPressure := LEConvertInt32From(8, packet);
    airPressureReachedCallback(self, airPressure);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAltitudeReached(const packet: TByteArray);
var altitude: longint;
begin
  if (Assigned(altitudeReachedCallback)) then begin
    altitude := LEConvertInt32From(8, packet);
    altitudeReachedCallback(self, altitude);
  end;
end;

end.
