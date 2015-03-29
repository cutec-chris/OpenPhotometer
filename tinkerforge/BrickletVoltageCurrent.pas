{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletVoltageCurrent;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_VOLTAGE_CURRENT_DEVICE_IDENTIFIER = 227;

  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT = 1;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE = 2;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER = 3;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CONFIGURATION = 4;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CONFIGURATION = 5;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CALIBRATION = 6;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CALIBRATION = 7;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_PERIOD = 8;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_PERIOD = 9;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD = 10;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD = 11;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_PERIOD = 12;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_PERIOD = 13;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD = 14;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD = 15;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD = 16;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD = 17;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_THRESHOLD = 18;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_THRESHOLD = 19;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_DEBOUNCE_PERIOD = 20;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_DEBOUNCE_PERIOD = 21;
  BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT = 22;
  BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE = 23;
  BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER = 24;
  BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT_REACHED = 25;
  BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE_REACHED = 26;
  BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER_REACHED = 27;

  BRICKLET_VOLTAGE_CURRENT_AVERAGING_1 = 0;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_4 = 1;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_16 = 2;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_64 = 3;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_128 = 4;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_256 = 5;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_512 = 6;
  BRICKLET_VOLTAGE_CURRENT_AVERAGING_1024 = 7;
  BRICKLET_VOLTAGE_CURRENT_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_VOLTAGE_CURRENT_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_VOLTAGE_CURRENT_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_VOLTAGE_CURRENT_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_VOLTAGE_CURRENT_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletVoltageCurrent = class;
  TBrickletVoltageCurrentNotifyCurrent = procedure(sender: TBrickletVoltageCurrent; const current: longint) of object;
  TBrickletVoltageCurrentNotifyVoltage = procedure(sender: TBrickletVoltageCurrent; const voltage: longint) of object;
  TBrickletVoltageCurrentNotifyPower = procedure(sender: TBrickletVoltageCurrent; const power: longint) of object;
  TBrickletVoltageCurrentNotifyCurrentReached = procedure(sender: TBrickletVoltageCurrent; const current: longint) of object;
  TBrickletVoltageCurrentNotifyVoltageReached = procedure(sender: TBrickletVoltageCurrent; const voltage: longint) of object;
  TBrickletVoltageCurrentNotifyPowerReached = procedure(sender: TBrickletVoltageCurrent; const power: longint) of object;

  /// <summary>
  ///  Device for high precision sensing of voltage and current
  /// </summary>
  TBrickletVoltageCurrent = class(TDevice)
  private
    currentCallback: TBrickletVoltageCurrentNotifyCurrent;
    voltageCallback: TBrickletVoltageCurrentNotifyVoltage;
    powerCallback: TBrickletVoltageCurrentNotifyPower;
    currentReachedCallback: TBrickletVoltageCurrentNotifyCurrentReached;
    voltageReachedCallback: TBrickletVoltageCurrentNotifyVoltageReached;
    powerReachedCallback: TBrickletVoltageCurrentNotifyPowerReached;
  protected
    procedure CallbackWrapperCurrent(const packet: TByteArray); virtual;
    procedure CallbackWrapperVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperPower(const packet: TByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperPowerReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the current. The value is in mA
    ///  and between -20000mA and 20000mA.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  callback <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Current"/> and set the period with 
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent: longint; virtual;

    /// <summary>
    ///  Returns the voltage. The value is in mV
    ///  and between 0mV and 36000mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  callback <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Voltage"/> and set the period with 
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: longint; virtual;

    /// <summary>
    ///  Returns the power. The value is in mW
    ///  and between 0mV and 720000mW.
    ///  
    ///  If you want to get the power periodically, it is recommended to use the
    ///  callback <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Power"/> and set the period with 
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackPeriod"/>.
    /// </summary>
    function GetPower: longint; virtual;

    /// <summary>
    ///  Sets the configuration of the Voltage/Current Bricklet. It is
    ///  possible to configure number of averages as well as
    ///  voltage and current conversion time.
    ///  
    ///  Averaging:
    ///  
    ///  <code>
    ///   "Value", "Number of Averages"
    ///  
    ///   "0",    "1"
    ///   "1",    "4"
    ///   "2",    "16"
    ///   "3",    "64"
    ///   "4",    "128"
    ///   "5",    "256"
    ///   "6",    "512"
    ///   "&gt;=7",  "1024"
    ///  </code>
    ///  
    ///  Voltage/Current conversion:
    ///  
    ///  <code>
    ///   "Value", "Conversion time"
    ///  
    ///   "0",    "140µs"
    ///   "1",    "204µs"
    ///   "2",    "332µs"
    ///   "3",    "588µs"
    ///   "4",    "1.1ms"
    ///   "5",    "2.116ms"
    ///   "6",    "4.156ms"
    ///   "&gt;=7",  "8.244ms"
    ///  </code>
    ///  
    ///  The default values are 3, 4 and 4 (64, 1.1ms, 1.1ms) for averaging, voltage 
    ///  conversion and current conversion.
    /// </summary>
    procedure SetConfiguration(const averaging: byte; const voltageConversionTime: byte; const currentConversionTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out averaging: byte; out voltageConversionTime: byte; out currentConversionTime: byte); virtual;

    /// <summary>
    ///  Since the shunt resistor that is used to measure the current is not
    ///  perfectly precise, it needs to be calibrated by a multiplier and
    ///  divisor if a very precise reading is needed.
    ///  
    ///  For example, if you are expecting a measurement of 1000mA and you
    ///  are measuring 1023mA, you can calibrate the Voltage/Current Bricklet 
    ///  by setting the multiplier to 1000 and the divisor to 1023.
    /// </summary>
    procedure SetCalibration(const gainMultiplier: word; const gainDivisor: word); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out gainMultiplier: word; out gainDivisor: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Current"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Voltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Power"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Power"/> is only triggered if the power has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetPowerCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.GetPowerCallbackPeriod"/>.
    /// </summary>
    function GetPowerCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.CurrentReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCurrentCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.VoltageReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetVoltageCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.PowerReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the power is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the power is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the power is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the power is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetPowerCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/>.
    /// </summary>
    procedure GetPowerCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.CurrentReached"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.VoltageReached"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.PowerReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

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
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Current"/> is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnCurrent: TBrickletVoltageCurrentNotifyCurrent read currentCallback write currentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnVoltage: TBrickletVoltageCurrentNotifyVoltage read voltageCallback write voltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackPeriod"/>. The parameter is the power of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.Power"/> is only triggered if the power has changed since the
    ///  last triggering.
    /// </summary>
    property OnPower: TBrickletVoltageCurrentNotifyPower read powerCallback write powerCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletVoltageCurrentNotifyCurrentReached read currentReachedCallback write currentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletVoltageCurrentNotifyVoltageReached read voltageReachedCallback write voltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/> is reached.
    ///  The parameter is the power of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnPowerReached: TBrickletVoltageCurrentNotifyPowerReached read powerReachedCallback write powerReachedCallback;
  end;

implementation

constructor TBrickletVoltageCurrent.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT] := {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER] := {$ifdef FPC}@{$endif}CallbackWrapperPower;
  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  callbackWrappers[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPowerReached;
end;

function TBrickletVoltageCurrent.GetCurrent: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

function TBrickletVoltageCurrent.GetVoltage: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

function TBrickletVoltageCurrent.GetPower: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletVoltageCurrent.SetConfiguration(const averaging: byte; const voltageConversionTime: byte; const currentConversionTime: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(averaging, 8, request);
  LEConvertUInt8To(voltageConversionTime, 9, request);
  LEConvertUInt8To(currentConversionTime, 10, request);
  SendRequest(request);
end;

procedure TBrickletVoltageCurrent.GetConfiguration(out averaging: byte; out voltageConversionTime: byte; out currentConversionTime: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  averaging := LEConvertUInt8From(8, response);
  voltageConversionTime := LEConvertUInt8From(9, response);
  currentConversionTime := LEConvertUInt8From(10, response);
end;

procedure TBrickletVoltageCurrent.SetCalibration(const gainMultiplier: word; const gainDivisor: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CALIBRATION, 12);
  LEConvertUInt16To(gainMultiplier, 8, request);
  LEConvertUInt16To(gainDivisor, 10, request);
  SendRequest(request);
end;

procedure TBrickletVoltageCurrent.GetCalibration(out gainMultiplier: word; out gainDivisor: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CALIBRATION, 8);
  response := SendRequest(request);
  gainMultiplier := LEConvertUInt16From(8, response);
  gainDivisor := LEConvertUInt16From(10, response);
end;

procedure TBrickletVoltageCurrent.SetCurrentCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletVoltageCurrent.GetCurrentCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltageCurrent.SetVoltageCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletVoltageCurrent.GetVoltageCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltageCurrent.SetPowerCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletVoltageCurrent.GetPowerCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltageCurrent.SetCurrentCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletVoltageCurrent.GetCurrentCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletVoltageCurrent.SetVoltageCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletVoltageCurrent.GetVoltageCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletVoltageCurrent.SetPowerCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletVoltageCurrent.GetPowerCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletVoltageCurrent.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletVoltageCurrent.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletVoltageCurrent.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletVoltageCurrent.CallbackWrapperCurrent(const packet: TByteArray);
var current: longint;
begin
  if (Assigned(currentCallback)) then begin
    current := LEConvertInt32From(8, packet);
    currentCallback(self, current);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperVoltage(const packet: TByteArray);
var voltage: longint;
begin
  if (Assigned(voltageCallback)) then begin
    voltage := LEConvertInt32From(8, packet);
    voltageCallback(self, voltage);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperPower(const packet: TByteArray);
var power: longint;
begin
  if (Assigned(powerCallback)) then begin
    power := LEConvertInt32From(8, packet);
    powerCallback(self, power);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperCurrentReached(const packet: TByteArray);
var current: longint;
begin
  if (Assigned(currentReachedCallback)) then begin
    current := LEConvertInt32From(8, packet);
    currentReachedCallback(self, current);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperVoltageReached(const packet: TByteArray);
var voltage: longint;
begin
  if (Assigned(voltageReachedCallback)) then begin
    voltage := LEConvertInt32From(8, packet);
    voltageReachedCallback(self, voltage);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperPowerReached(const packet: TByteArray);
var power: longint;
begin
  if (Assigned(powerReachedCallback)) then begin
    power := LEConvertInt32From(8, packet);
    powerReachedCallback(self, power);
  end;
end;

end.
