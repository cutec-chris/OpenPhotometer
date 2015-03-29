{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickDC;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_DC_DEVICE_IDENTIFIER = 11;

  BRICK_DC_FUNCTION_SET_VELOCITY = 1;
  BRICK_DC_FUNCTION_GET_VELOCITY = 2;
  BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY = 3;
  BRICK_DC_FUNCTION_SET_ACCELERATION = 4;
  BRICK_DC_FUNCTION_GET_ACCELERATION = 5;
  BRICK_DC_FUNCTION_SET_PWM_FREQUENCY = 6;
  BRICK_DC_FUNCTION_GET_PWM_FREQUENCY = 7;
  BRICK_DC_FUNCTION_FULL_BRAKE = 8;
  BRICK_DC_FUNCTION_GET_STACK_INPUT_VOLTAGE = 9;
  BRICK_DC_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE = 10;
  BRICK_DC_FUNCTION_GET_CURRENT_CONSUMPTION = 11;
  BRICK_DC_FUNCTION_ENABLE = 12;
  BRICK_DC_FUNCTION_DISABLE = 13;
  BRICK_DC_FUNCTION_IS_ENABLED = 14;
  BRICK_DC_FUNCTION_SET_MINIMUM_VOLTAGE = 15;
  BRICK_DC_FUNCTION_GET_MINIMUM_VOLTAGE = 16;
  BRICK_DC_FUNCTION_SET_DRIVE_MODE = 17;
  BRICK_DC_FUNCTION_GET_DRIVE_MODE = 18;
  BRICK_DC_FUNCTION_SET_CURRENT_VELOCITY_PERIOD = 19;
  BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY_PERIOD = 20;
  BRICK_DC_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_DC_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_DC_FUNCTION_RESET = 243;
  BRICK_DC_FUNCTION_GET_IDENTITY = 255;

  BRICK_DC_CALLBACK_UNDER_VOLTAGE = 21;
  BRICK_DC_CALLBACK_EMERGENCY_SHUTDOWN = 22;
  BRICK_DC_CALLBACK_VELOCITY_REACHED = 23;
  BRICK_DC_CALLBACK_CURRENT_VELOCITY = 24;

  BRICK_DC_DRIVE_MODE_DRIVE_BRAKE = 0;
  BRICK_DC_DRIVE_MODE_DRIVE_COAST = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickDC = class;
  TBrickDCNotifyUnderVoltage = procedure(sender: TBrickDC; const voltage: word) of object;
  TBrickDCNotifyEmergencyShutdown = procedure(sender: TBrickDC) of object;
  TBrickDCNotifyVelocityReached = procedure(sender: TBrickDC; const velocity: smallint) of object;
  TBrickDCNotifyCurrentVelocity = procedure(sender: TBrickDC; const velocity: smallint) of object;

  /// <summary>
  ///  Device for controlling DC motors
  /// </summary>
  TBrickDC = class(TDevice)
  private
    underVoltageCallback: TBrickDCNotifyUnderVoltage;
    emergencyShutdownCallback: TBrickDCNotifyEmergencyShutdown;
    velocityReachedCallback: TBrickDCNotifyVelocityReached;
    currentVelocityCallback: TBrickDCNotifyCurrentVelocity;
  protected
    procedure CallbackWrapperUnderVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperEmergencyShutdown(const packet: TByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperCurrentVelocity(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the velocity of the motor. Whereas -32767 is full speed backward,
    ///  0 is stop and 32767 is full speed forward. Depending on the
    ///  acceleration (see <see cref="BrickDC.TBrickDC.SetAcceleration"/>), the motor is not immediately
    ///  brought to the velocity but smoothly accelerated.
    ///  
    ///  The velocity describes the duty cycle of the PWM with which the motor is
    ///  controlled, e.g. a velocity of 3277 sets a PWM with a 10% duty cycle.
    ///  You can not only control the duty cycle of the PWM but also the frequency,
    ///  see <see cref="BrickDC.TBrickDC.SetPWMFrequency"/>.
    ///  
    ///  The default velocity is 0.
    /// </summary>
    procedure SetVelocity(const velocity: smallint); virtual;

    /// <summary>
    ///  Returns the velocity as set by <see cref="BrickDC.TBrickDC.SetVelocity"/>.
    /// </summary>
    function GetVelocity: smallint; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the motor. This value is different
    ///  from <see cref="BrickDC.TBrickDC.GetVelocity"/> whenever the motor is currently accelerating
    ///  to a goal set by <see cref="BrickDC.TBrickDC.SetVelocity"/>.
    /// </summary>
    function GetCurrentVelocity: smallint; virtual;

    /// <summary>
    ///  Sets the acceleration of the motor. It is given in *velocity/s*. An
    ///  acceleration of 10000 means, that every second the velocity is increased
    ///  by 10000 (or about 30% duty cycle).
    ///  
    ///  For example: If the current velocity is 0 and you want to accelerate to a
    ///  velocity of 16000 (about 50% duty cycle) in 10 seconds, you should set
    ///  an acceleration of 1600.
    ///  
    ///  If acceleration is set to 0, there is no speed ramping, i.e. a new velocity
    ///  is immediately given to the motor.
    ///  
    ///  The default acceleration is 10000.
    /// </summary>
    procedure SetAcceleration(const acceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration as set by <see cref="BrickDC.TBrickDC.SetAcceleration"/>.
    /// </summary>
    function GetAcceleration: word; virtual;

    /// <summary>
    ///  Sets the frequency (in Hz) of the PWM with which the motor is driven.
    ///  The possible range of the frequency is 1-20000Hz. Often a high frequency
    ///  is less noisy and the motor runs smoother. However, with a low frequency
    ///  there are less switches and therefore fewer switching losses. Also with
    ///  most motors lower frequencies enable higher torque.
    ///  
    ///  If you have no idea what all this means, just ignore this function and use
    ///  the default frequency, it will very likely work fine.
    ///  
    ///  The default frequency is 15 kHz.
    /// </summary>
    procedure SetPWMFrequency(const frequency: word); virtual;

    /// <summary>
    ///  Returns the PWM frequency (in Hz) as set by <see cref="BrickDC.TBrickDC.SetPWMFrequency"/>.
    /// </summary>
    function GetPWMFrequency: word; virtual;

    /// <summary>
    ///  Executes an active full brake.
    ///  
    ///  <note type="caution">
    ///   This function is for emergency purposes,
    ///   where an immediate brake is necessary. Depending on the current velocity and
    ///   the strength of the motor, a full brake can be quite violent.
    ///  </note>
    ///  
    ///  Call <see cref="BrickDC.TBrickDC.SetVelocity"/> with 0 if you just want to stop the motor.
    /// </summary>
    procedure FullBrake; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the DC Brick.
    ///  
    ///  If there is an external input voltage and a stack input voltage, the motor
    ///  will be driven by the external input voltage. If there is only a stack
    ///  voltage present, the motor will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motor will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage.
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the current consumption of the motor in mA.
    /// </summary>
    function GetCurrentConsumption: word; virtual;

    /// <summary>
    ///  Enables the driver chip. The driver parameters can be configured (velocity,
    ///  acceleration, etc) before it is enabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the driver chip. The configurations are kept (velocity,
    ///  acceleration, etc) but the motor is not driven until it is enabled again.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if the driver chip is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickDC.TBrickDC.UnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the DC Brick is 6V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the motor. If you have a fixed power supply, you likely do not need
    ///  this functionality.
    ///  
    ///  The default value is 6V.
    /// </summary>
    procedure SetMinimumVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickDC.TBrickDC.SetMinimumVoltage"/>
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Sets the drive mode. Possible modes are:
    ///  
    ///  * 0 = Drive/Brake
    ///  * 1 = Drive/Coast
    ///  
    ///  These modes are different kinds of motor controls.
    ///  
    ///  In Drive/Brake mode, the motor is always either driving or braking. There
    ///  is no freewheeling. Advantages are: A more linear correlation between
    ///  PWM and velocity, more exact accelerations and the possibility to drive
    ///  with slower velocities.
    ///  
    ///  In Drive/Coast mode, the motor is always either driving or freewheeling.
    ///  Advantages are: Less current consumption and less demands on the motor and
    ///  driver chip.
    ///  
    ///  The default value is 0 = Drive/Brake.
    /// </summary>
    procedure SetDriveMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the drive mode, as set by <see cref="BrickDC.TBrickDC.SetDriveMode"/>.
    /// </summary>
    function GetDriveMode: byte; virtual;

    /// <summary>
    ///  Sets a period in ms with which the <see cref="BrickDC.TBrickDC.CurrentVelocity"/> callback is triggered.
    ///  A period of 0 turns the callback off.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCurrentVelocityPeriod(const period: word); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickDC.TBrickDC.SetCurrentVelocityPeriod"/>.
    /// </summary>
    function GetCurrentVelocityPeriod: word; virtual;

    /// <summary>
    ///  Returns the firmware and protocol version and the name of the Bricklet for a
    ///  given port.
    ///  
    ///  This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
    ///  plugins.
    /// </summary>
    procedure GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string); virtual;

    /// <summary>
    ///  Returns the temperature in °C/10 as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has an
    ///  accuracy of +-15%. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Brick. Calling this function
    ///  on a Brick inside of a stack will reset the whole stack.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Brick is connected to, 
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be '0'-'8' (stack position).
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered when the input voltage drops below the value set by
    ///  <see cref="BrickDC.TBrickDC.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickDCNotifyUnderVoltage read underVoltageCallback write underVoltageCallback;

    /// <summary>
    ///  This callback is triggered if either the current consumption
    ///  is too high (above 5A) or the temperature of the driver chip is too high
    ///  (above 175°C). These two possibilities are essentially the same, since the
    ///  temperature will reach this threshold immediately if the motor consumes too
    ///  much current. In case of a voltage below 3.3V (external or stack) this
    ///  callback is triggered as well.
    ///  
    ///  If this callback is triggered, the driver chip gets disabled at the same time.
    ///  That means, <see cref="BrickDC.TBrickDC.Enable"/> has to be called to drive the motor again.
    ///  
    ///  <note>
    ///   This callback only works in Drive/Brake mode (see <see cref="BrickDC.TBrickDC.SetDriveMode"/>). In
    ///   Drive/Coast mode it is unfortunately impossible to reliably read the
    ///   overcurrent/overtemperature signal from the driver chip.
    ///  </note>
    /// </summary>
    property OnEmergencyShutdown: TBrickDCNotifyEmergencyShutdown read emergencyShutdownCallback write emergencyShutdownCallback;

    /// <summary>
    ///  This callback is triggered whenever a set velocity is reached. For example:
    ///  If a velocity of 0 is present, acceleration is set to 5000 and velocity
    ///  to 10000, <see cref="BrickDC.TBrickDC.VelocityReached"/> will be triggered after about 2 seconds, when
    ///  the set velocity is actually reached.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the DC motor, this only works if the
    ///   acceleration (see <see cref="BrickDC.TBrickDC.SetAcceleration"/>) is set smaller or equal to the
    ///   maximum acceleration of the motor. Otherwise the motor will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnVelocityReached: TBrickDCNotifyVelocityReached read velocityReachedCallback write velocityReachedCallback;

    /// <summary>
    ///  This callback is triggered with the period that is set by
    ///  <see cref="BrickDC.TBrickDC.SetCurrentVelocityPeriod"/>. The parameter is the *current* velocity
    ///  used by the motor.
    ///  
    ///  <see cref="BrickDC.TBrickDC.CurrentVelocity"/> is only triggered after the set period if there is
    ///  a change in the velocity.
    /// </summary>
    property OnCurrentVelocity: TBrickDCNotifyCurrentVelocity read currentVelocityCallback write currentVelocityCallback;
  end;

implementation

constructor TBrickDC.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICK_DC_FUNCTION_SET_VELOCITY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_SET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_SET_PWM_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_PWM_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_FULL_BRAKE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_STACK_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_CURRENT_CONSUMPTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_ENABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_DISABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_IS_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_SET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_SET_DRIVE_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_DRIVE_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_SET_CURRENT_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_CALLBACK_UNDER_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_DC_CALLBACK_EMERGENCY_SHUTDOWN] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_DC_CALLBACK_VELOCITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_DC_CALLBACK_CURRENT_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_DC_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_DC_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_DC_CALLBACK_UNDER_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  callbackWrappers[BRICK_DC_CALLBACK_EMERGENCY_SHUTDOWN] := {$ifdef FPC}@{$endif}CallbackWrapperEmergencyShutdown;
  callbackWrappers[BRICK_DC_CALLBACK_VELOCITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
  callbackWrappers[BRICK_DC_CALLBACK_CURRENT_VELOCITY] := {$ifdef FPC}@{$endif}CallbackWrapperCurrentVelocity;
end;

procedure TBrickDC.SetVelocity(const velocity: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_VELOCITY, 10);
  LEConvertInt16To(velocity, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetVelocity: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_VELOCITY, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

function TBrickDC.GetCurrentVelocity: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickDC.SetAcceleration(const acceleration: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_ACCELERATION, 10);
  LEConvertUInt16To(acceleration, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetAcceleration: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_ACCELERATION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickDC.SetPWMFrequency(const frequency: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_PWM_FREQUENCY, 10);
  LEConvertUInt16To(frequency, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetPWMFrequency: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_PWM_FREQUENCY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickDC.FullBrake;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_FULL_BRAKE, 8);
  SendRequest(request);
end;

function TBrickDC.GetStackInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickDC.GetExternalInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickDC.GetCurrentConsumption: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_CONSUMPTION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickDC.Enable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_ENABLE, 8);
  SendRequest(request);
end;

procedure TBrickDC.Disable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_DISABLE, 8);
  SendRequest(request);
end;

function TBrickDC.IsEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_IS_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickDC.SetMinimumVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetMinimumVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickDC.SetDriveMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_DRIVE_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetDriveMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_DRIVE_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickDC.SetCurrentVelocityPeriod(const period: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_CURRENT_VELOCITY_PERIOD, 10);
  LEConvertUInt16To(period, 8, request);
  SendRequest(request);
end;

function TBrickDC.GetCurrentVelocityPeriod: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickDC.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickDC.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickDC.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickDC.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickDC.CallbackWrapperUnderVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(underVoltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    underVoltageCallback(self, voltage);
  end;
end;

procedure TBrickDC.CallbackWrapperEmergencyShutdown(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(emergencyShutdownCallback)) then begin
    emergencyShutdownCallback(self);
  end;
end;

procedure TBrickDC.CallbackWrapperVelocityReached(const packet: TByteArray);
var velocity: smallint;
begin
  if (Assigned(velocityReachedCallback)) then begin
    velocity := LEConvertInt16From(8, packet);
    velocityReachedCallback(self, velocity);
  end;
end;

procedure TBrickDC.CallbackWrapperCurrentVelocity(const packet: TByteArray);
var velocity: smallint;
begin
  if (Assigned(currentVelocityCallback)) then begin
    velocity := LEConvertInt16From(8, packet);
    currentVelocityCallback(self, velocity);
  end;
end;

end.
