{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickServo;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_SERVO_DEVICE_IDENTIFIER = 14;

  BRICK_SERVO_FUNCTION_ENABLE = 1;
  BRICK_SERVO_FUNCTION_DISABLE = 2;
  BRICK_SERVO_FUNCTION_IS_ENABLED = 3;
  BRICK_SERVO_FUNCTION_SET_POSITION = 4;
  BRICK_SERVO_FUNCTION_GET_POSITION = 5;
  BRICK_SERVO_FUNCTION_GET_CURRENT_POSITION = 6;
  BRICK_SERVO_FUNCTION_SET_VELOCITY = 7;
  BRICK_SERVO_FUNCTION_GET_VELOCITY = 8;
  BRICK_SERVO_FUNCTION_GET_CURRENT_VELOCITY = 9;
  BRICK_SERVO_FUNCTION_SET_ACCELERATION = 10;
  BRICK_SERVO_FUNCTION_GET_ACCELERATION = 11;
  BRICK_SERVO_FUNCTION_SET_OUTPUT_VOLTAGE = 12;
  BRICK_SERVO_FUNCTION_GET_OUTPUT_VOLTAGE = 13;
  BRICK_SERVO_FUNCTION_SET_PULSE_WIDTH = 14;
  BRICK_SERVO_FUNCTION_GET_PULSE_WIDTH = 15;
  BRICK_SERVO_FUNCTION_SET_DEGREE = 16;
  BRICK_SERVO_FUNCTION_GET_DEGREE = 17;
  BRICK_SERVO_FUNCTION_SET_PERIOD = 18;
  BRICK_SERVO_FUNCTION_GET_PERIOD = 19;
  BRICK_SERVO_FUNCTION_GET_SERVO_CURRENT = 20;
  BRICK_SERVO_FUNCTION_GET_OVERALL_CURRENT = 21;
  BRICK_SERVO_FUNCTION_GET_STACK_INPUT_VOLTAGE = 22;
  BRICK_SERVO_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE = 23;
  BRICK_SERVO_FUNCTION_SET_MINIMUM_VOLTAGE = 24;
  BRICK_SERVO_FUNCTION_GET_MINIMUM_VOLTAGE = 25;
  BRICK_SERVO_FUNCTION_ENABLE_POSITION_REACHED_CALLBACK = 29;
  BRICK_SERVO_FUNCTION_DISABLE_POSITION_REACHED_CALLBACK = 30;
  BRICK_SERVO_FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED = 31;
  BRICK_SERVO_FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK = 32;
  BRICK_SERVO_FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK = 33;
  BRICK_SERVO_FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED = 34;
  BRICK_SERVO_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_SERVO_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_SERVO_FUNCTION_RESET = 243;
  BRICK_SERVO_FUNCTION_GET_IDENTITY = 255;

  BRICK_SERVO_CALLBACK_UNDER_VOLTAGE = 26;
  BRICK_SERVO_CALLBACK_POSITION_REACHED = 27;
  BRICK_SERVO_CALLBACK_VELOCITY_REACHED = 28;


type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickServo = class;
  TBrickServoNotifyUnderVoltage = procedure(sender: TBrickServo; const voltage: word) of object;
  TBrickServoNotifyPositionReached = procedure(sender: TBrickServo; const servoNum: byte; const position: smallint) of object;
  TBrickServoNotifyVelocityReached = procedure(sender: TBrickServo; const servoNum: byte; const velocity: smallint) of object;

  /// <summary>
  ///  Device for controlling up to seven servos
  /// </summary>
  TBrickServo = class(TDevice)
  private
    underVoltageCallback: TBrickServoNotifyUnderVoltage;
    positionReachedCallback: TBrickServoNotifyPositionReached;
    velocityReachedCallback: TBrickServoNotifyVelocityReached;
  protected
    procedure CallbackWrapperUnderVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperPositionReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Enables a servo (0 to 6). If a servo is enabled, the configured position,
    ///  velocity, acceleration, etc. are applied immediately.
    /// </summary>
    procedure Enable(const servoNum: byte); virtual;

    /// <summary>
    ///  Disables a servo (0 to 6). Disabled servos are not driven at all, i.e. a
    ///  disabled servo will not hold its position if a load is applied.
    /// </summary>
    procedure Disable(const servoNum: byte); virtual;

    /// <summary>
    ///  Returns *true* if the specified servo is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled(const servoNum: byte): boolean; virtual;

    /// <summary>
    ///  Sets the position in °/100 for the specified servo. 
    ///  
    ///  The default range of the position is -9000 to 9000, but it can be specified
    ///  according to your servo with <see cref="BrickServo.TBrickServo.SetDegree"/>.
    ///  
    ///  If you want to control a linear servo or RC brushless motor controller or
    ///  similar with the Servo Brick, you can also define lengths or speeds with
    ///  <see cref="BrickServo.TBrickServo.SetDegree"/>.
    /// </summary>
    procedure SetPosition(const servoNum: byte; const position: smallint); virtual;

    /// <summary>
    ///  Returns the position of the specified servo as set by <see cref="BrickServo.TBrickServo.SetPosition"/>.
    /// </summary>
    function GetPosition(const servoNum: byte): smallint; virtual;

    /// <summary>
    ///  Returns the *current* position of the specified servo. This may not be the
    ///  value of <see cref="BrickServo.TBrickServo.SetPosition"/> if the servo is currently approaching a
    ///  position goal.
    /// </summary>
    function GetCurrentPosition(const servoNum: byte): smallint; virtual;

    /// <summary>
    ///  Sets the maximum velocity of the specified servo in °/100s. The velocity
    ///  is accelerated according to the value set by <see cref="BrickServo.TBrickServo.SetAcceleration"/>.
    ///  
    ///  The minimum velocity is 0 (no movement) and the maximum velocity is 65535.
    ///  With a value of 65535 the position will be set immediately (no velocity).
    ///  
    ///  The default value is 65535.
    /// </summary>
    procedure SetVelocity(const servoNum: byte; const velocity: word); virtual;

    /// <summary>
    ///  Returns the velocity of the specified servo as set by <see cref="BrickServo.TBrickServo.SetVelocity"/>.
    /// </summary>
    function GetVelocity(const servoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the specified servo. This may not be the
    ///  value of <see cref="BrickServo.TBrickServo.SetVelocity"/> if the servo is currently approaching a
    ///  velocity goal.
    /// </summary>
    function GetCurrentVelocity(const servoNum: byte): word; virtual;

    /// <summary>
    ///  Sets the acceleration of the specified servo in °/100s².
    ///  
    ///  The minimum acceleration is 1 and the maximum acceleration is 65535.
    ///  With a value of 65535 the velocity will be set immediately (no acceleration).
    ///  
    ///  The default value is 65535.
    /// </summary>
    procedure SetAcceleration(const servoNum: byte; const acceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration for the specified servo as set by 
    ///  <see cref="BrickServo.TBrickServo.SetAcceleration"/>.
    /// </summary>
    function GetAcceleration(const servoNum: byte): word; virtual;

    /// <summary>
    ///  Sets the output voltages with which the servos are driven in mV.
    ///  The minimum output voltage is 2000mV and the maximum output voltage is 
    ///  9000mV.
    ///  
    ///  <note>
    ///   We recommend that you set this value to the maximum voltage that is
    ///   specified for your servo, most servos achieve their maximum force only
    ///   with high voltages.
    ///  </note>
    ///  
    ///  The default value is 5000.
    /// </summary>
    procedure SetOutputVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the output voltage as specified by <see cref="BrickServo.TBrickServo.SetOutputVoltage"/>.
    /// </summary>
    function GetOutputVoltage: word; virtual;

    /// <summary>
    ///  Sets the minimum and maximum pulse width of the specified servo in µs.
    ///  
    ///  Usually, servos are controlled with a 
    ///  `PWM &lt;http://en.wikipedia.org/wiki/Pulse-width_modulation&gt;`__, whereby the
    ///  length of the pulse controls the position of the servo. Every servo has
    ///  different minimum and maximum pulse widths, these can be specified with
    ///  this function.
    ///  
    ///  If you have a datasheet for your servo that specifies the minimum and
    ///  maximum pulse width, you should set the values accordingly. If your servo
    ///  comes without any datasheet you have to find the values via trial and error.
    ///  
    ///  Both values have a range from 1 to 65535 (unsigned 16-bit integer). The
    ///  minimum must be smaller than the maximum.
    ///  
    ///  The default values are 1000µs (1ms) and 2000µs (2ms) for minimum and 
    ///  maximum pulse width.
    /// </summary>
    procedure SetPulseWidth(const servoNum: byte; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the minimum and maximum pulse width for the specified servo as set by
    ///  <see cref="BrickServo.TBrickServo.SetPulseWidth"/>.
    /// </summary>
    procedure GetPulseWidth(const servoNum: byte; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the minimum and maximum degree for the specified servo (by default
    ///  given as °/100).
    ///  
    ///  This only specifies the abstract values between which the minimum and maximum
    ///  pulse width is scaled. For example: If you specify a pulse width of 1000µs
    ///  to 2000µs and a degree range of -90° to 90°, a call of <see cref="BrickServo.TBrickServo.SetPosition"/>
    ///  with 0 will result in a pulse width of 1500µs 
    ///  (-90° = 1000µs, 90° = 2000µs, etc.).
    ///  
    ///  Possible usage:
    ///  
    ///  * The datasheet of your servo specifies a range of 200° with the middle position
    ///    at 110°. In this case you can set the minimum to -9000 and the maximum to 11000.
    ///  * You measure a range of 220° on your servo and you don't have or need a middle
    ///    position. In this case you can set the minimum to 0 and the maximum to 22000.
    ///  * You have a linear servo with a drive length of 20cm, In this case you could
    ///    set the minimum to 0 and the maximum to 20000. Now you can set the Position
    ///    with <see cref="BrickServo.TBrickServo.SetPosition"/> with a resolution of cm/100. Also the velocity will
    ///    have a resolution of cm/100s and the acceleration will have a resolution of
    ///    cm/100s².
    ///  * You don't care about units and just want the highest possible resolution. In
    ///    this case you should set the minimum to -32767 and the maximum to 32767.
    ///  * You have a brushless motor with a maximum speed of 10000 rpm and want to
    ///    control it with a RC brushless motor controller. In this case you can set the
    ///    minimum to 0 and the maximum to 10000. <see cref="BrickServo.TBrickServo.SetPosition"/> now controls the rpm.
    ///  
    ///  Both values have a possible range from -32767 to 32767 
    ///  (signed 16-bit integer). The minimum must be smaller than the maximum.
    ///  
    ///  The default values are -9000 and 9000 for the minimum and maximum degree.
    /// </summary>
    procedure SetDegree(const servoNum: byte; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the minimum and maximum degree for the specified servo as set by
    ///  <see cref="BrickServo.TBrickServo.SetDegree"/>.
    /// </summary>
    procedure GetDegree(const servoNum: byte; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period of the specified servo in µs.
    ///  
    ///  Usually, servos are controlled with a 
    ///  `PWM &lt;http://en.wikipedia.org/wiki/Pulse-width_modulation&gt;`__. Different
    ///  servos expect PWMs with different periods. Most servos run well with a 
    ///  period of about 20ms.
    ///  
    ///  If your servo comes with a datasheet that specifies a period, you should
    ///  set it accordingly. If you don't have a datasheet and you have no idea
    ///  what the correct period is, the default value (19.5ms) will most likely
    ///  work fine. 
    ///  
    ///  The minimum possible period is 1µs and the maximum is 65535µs.
    ///  
    ///  The default value is 19.5ms (19500µs).
    /// </summary>
    procedure SetPeriod(const servoNum: byte; const period: word); virtual;

    /// <summary>
    ///  Returns the period for the specified servo as set by <see cref="BrickServo.TBrickServo.SetPeriod"/>.
    /// </summary>
    function GetPeriod(const servoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the current consumption of the specified servo in mA.
    /// </summary>
    function GetServoCurrent(const servoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the current consumption of all servos together in mA.
    /// </summary>
    function GetOverallCurrent: word; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a 
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the Servo Brick. 
    ///   
    ///  If there is an external input voltage and a stack input voltage, the motors
    ///  will be driven by the external input voltage. If there is only a stack 
    ///  voltage present, the motors will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motors will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickServo.TBrickServo.UnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the Servo Brick is 5V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the stepper motor. If you have a fixed power supply, you likely do 
    ///  not need this functionality.
    ///  
    ///  The default value is 5V (5000mV).
    /// </summary>
    procedure SetMinimumVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickServo.TBrickServo.SetMinimumVoltage"/>
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickServo.TBrickServo.PositionReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    procedure EnablePositionReachedCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickServo.TBrickServo.PositionReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    procedure DisablePositionReachedCallback; virtual;

    /// <summary>
    ///  Returns *true* if <see cref="BrickServo.TBrickServo.PositionReached"/> callback is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    function IsPositionReachedCallbackEnabled: byte; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickServo.TBrickServo.VelocityReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    procedure EnableVelocityReachedCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickServo.TBrickServo.VelocityReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    procedure DisableVelocityReachedCallback; virtual;

    /// <summary>
    ///  Returns *true* if <see cref="BrickServo.TBrickServo.VelocityReached"/> callback is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.1~(Firmware)
    /// </summary>
    function IsVelocityReachedCallbackEnabled: byte; virtual;

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
    ///  <see cref="BrickServo.TBrickServo.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickServoNotifyUnderVoltage read underVoltageCallback write underVoltageCallback;

    /// <summary>
    ///  This callback is triggered when a position set by <see cref="BrickServo.TBrickServo.SetPosition"/>
    ///  is reached. The parameters are the servo and the position that is reached.
    ///  
    ///  You can enable this callback with <see cref="BrickServo.TBrickServo.EnablePositionReachedCallback"/>.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the servo, this only works if the
    ///   velocity (see <see cref="BrickServo.TBrickServo.SetVelocity"/>) is set smaller or equal to the
    ///   maximum velocity of the servo. Otherwise the servo will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnPositionReached: TBrickServoNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered when a velocity set by <see cref="BrickServo.TBrickServo.SetVelocity"/>
    ///  is reached. The parameters are the servo and the velocity that is reached.
    ///  
    ///  You can enable this callback with <see cref="BrickServo.TBrickServo.EnableVelocityReachedCallback"/>.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the servo, this only works if the
    ///   acceleration (see <see cref="BrickServo.TBrickServo.SetAcceleration"/>) is set smaller or equal to the
    ///   maximum acceleration of the servo. Otherwise the servo will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnVelocityReached: TBrickServoNotifyVelocityReached read velocityReachedCallback write velocityReachedCallback;
  end;

implementation

constructor TBrickServo.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICK_SERVO_FUNCTION_ENABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_DISABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_IS_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_POSITION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_CURRENT_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_VELOCITY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_CURRENT_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_OUTPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_OUTPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_PULSE_WIDTH] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_PULSE_WIDTH] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_DEGREE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_DEGREE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_PERIOD] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_SERVO_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_OVERALL_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_STACK_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_SET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_CALLBACK_UNDER_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_SERVO_CALLBACK_POSITION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_SERVO_CALLBACK_VELOCITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_ENABLE_POSITION_REACHED_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_DISABLE_POSITION_REACHED_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_SERVO_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_SERVO_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_SERVO_CALLBACK_UNDER_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  callbackWrappers[BRICK_SERVO_CALLBACK_POSITION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  callbackWrappers[BRICK_SERVO_CALLBACK_VELOCITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
end;

procedure TBrickServo.Enable(const servoNum: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE, 9);
  LEConvertUInt8To(servoNum, 8, request);
  SendRequest(request);
end;

procedure TBrickServo.Disable(const servoNum: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE, 9);
  LEConvertUInt8To(servoNum, 8, request);
  SendRequest(request);
end;

function TBrickServo.IsEnabled(const servoNum: byte): boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_ENABLED, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickServo.SetPosition(const servoNum: byte; const position: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_POSITION, 11);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertInt16To(position, 9, request);
  SendRequest(request);
end;

function TBrickServo.GetPosition(const servoNum: byte): smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_POSITION, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

function TBrickServo.GetCurrentPosition(const servoNum: byte): smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CURRENT_POSITION, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickServo.SetVelocity(const servoNum: byte; const velocity: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_VELOCITY, 11);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertUInt16To(velocity, 9, request);
  SendRequest(request);
end;

function TBrickServo.GetVelocity(const servoNum: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_VELOCITY, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickServo.GetCurrentVelocity(const servoNum: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CURRENT_VELOCITY, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickServo.SetAcceleration(const servoNum: byte; const acceleration: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_ACCELERATION, 11);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertUInt16To(acceleration, 9, request);
  SendRequest(request);
end;

function TBrickServo.GetAcceleration(const servoNum: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_ACCELERATION, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickServo.SetOutputVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_OUTPUT_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickServo.GetOutputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_OUTPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickServo.SetPulseWidth(const servoNum: byte; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_PULSE_WIDTH, 13);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickServo.GetPulseWidth(const servoNum: byte; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PULSE_WIDTH, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  min := LEConvertUInt16From(8, response);
  max := LEConvertUInt16From(10, response);
end;

procedure TBrickServo.SetDegree(const servoNum: byte; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_DEGREE, 13);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickServo.GetDegree(const servoNum: byte; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_DEGREE, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  min := LEConvertInt16From(8, response);
  max := LEConvertInt16From(10, response);
end;

procedure TBrickServo.SetPeriod(const servoNum: byte; const period: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_PERIOD, 11);
  LEConvertUInt8To(servoNum, 8, request);
  LEConvertUInt16To(period, 9, request);
  SendRequest(request);
end;

function TBrickServo.GetPeriod(const servoNum: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PERIOD, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickServo.GetServoCurrent(const servoNum: byte): word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SERVO_CURRENT, 9);
  LEConvertUInt8To(servoNum, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickServo.GetOverallCurrent: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_OVERALL_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickServo.GetStackInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickServo.GetExternalInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickServo.SetMinimumVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickServo.GetMinimumVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickServo.EnablePositionReachedCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE_POSITION_REACHED_CALLBACK, 8);
  SendRequest(request);
end;

procedure TBrickServo.DisablePositionReachedCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE_POSITION_REACHED_CALLBACK, 8);
  SendRequest(request);
end;

function TBrickServo.IsPositionReachedCallbackEnabled: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickServo.EnableVelocityReachedCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK, 8);
  SendRequest(request);
end;

procedure TBrickServo.DisableVelocityReachedCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK, 8);
  SendRequest(request);
end;

function TBrickServo.IsVelocityReachedCallbackEnabled: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickServo.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickServo.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickServo.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickServo.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickServo.CallbackWrapperUnderVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(underVoltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    underVoltageCallback(self, voltage);
  end;
end;

procedure TBrickServo.CallbackWrapperPositionReached(const packet: TByteArray);
var servoNum: byte; position: smallint;
begin
  if (Assigned(positionReachedCallback)) then begin
    servoNum := LEConvertUInt8From(8, packet);
    position := LEConvertInt16From(9, packet);
    positionReachedCallback(self, servoNum, position);
  end;
end;

procedure TBrickServo.CallbackWrapperVelocityReached(const packet: TByteArray);
var servoNum: byte; velocity: smallint;
begin
  if (Assigned(velocityReachedCallback)) then begin
    servoNum := LEConvertUInt8From(8, packet);
    velocity := LEConvertInt16From(9, packet);
    velocityReachedCallback(self, servoNum, velocity);
  end;
end;

end.
