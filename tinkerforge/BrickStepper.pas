{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickStepper;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_STEPPER_DEVICE_IDENTIFIER = 15;

  BRICK_STEPPER_FUNCTION_SET_MAX_VELOCITY = 1;
  BRICK_STEPPER_FUNCTION_GET_MAX_VELOCITY = 2;
  BRICK_STEPPER_FUNCTION_GET_CURRENT_VELOCITY = 3;
  BRICK_STEPPER_FUNCTION_SET_SPEED_RAMPING = 4;
  BRICK_STEPPER_FUNCTION_GET_SPEED_RAMPING = 5;
  BRICK_STEPPER_FUNCTION_FULL_BRAKE = 6;
  BRICK_STEPPER_FUNCTION_SET_CURRENT_POSITION = 7;
  BRICK_STEPPER_FUNCTION_GET_CURRENT_POSITION = 8;
  BRICK_STEPPER_FUNCTION_SET_TARGET_POSITION = 9;
  BRICK_STEPPER_FUNCTION_GET_TARGET_POSITION = 10;
  BRICK_STEPPER_FUNCTION_SET_STEPS = 11;
  BRICK_STEPPER_FUNCTION_GET_STEPS = 12;
  BRICK_STEPPER_FUNCTION_GET_REMAINING_STEPS = 13;
  BRICK_STEPPER_FUNCTION_SET_STEP_MODE = 14;
  BRICK_STEPPER_FUNCTION_GET_STEP_MODE = 15;
  BRICK_STEPPER_FUNCTION_DRIVE_FORWARD = 16;
  BRICK_STEPPER_FUNCTION_DRIVE_BACKWARD = 17;
  BRICK_STEPPER_FUNCTION_STOP = 18;
  BRICK_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE = 19;
  BRICK_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE = 20;
  BRICK_STEPPER_FUNCTION_GET_CURRENT_CONSUMPTION = 21;
  BRICK_STEPPER_FUNCTION_SET_MOTOR_CURRENT = 22;
  BRICK_STEPPER_FUNCTION_GET_MOTOR_CURRENT = 23;
  BRICK_STEPPER_FUNCTION_ENABLE = 24;
  BRICK_STEPPER_FUNCTION_DISABLE = 25;
  BRICK_STEPPER_FUNCTION_IS_ENABLED = 26;
  BRICK_STEPPER_FUNCTION_SET_DECAY = 27;
  BRICK_STEPPER_FUNCTION_GET_DECAY = 28;
  BRICK_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE = 29;
  BRICK_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE = 30;
  BRICK_STEPPER_FUNCTION_SET_SYNC_RECT = 33;
  BRICK_STEPPER_FUNCTION_IS_SYNC_RECT = 34;
  BRICK_STEPPER_FUNCTION_SET_TIME_BASE = 35;
  BRICK_STEPPER_FUNCTION_GET_TIME_BASE = 36;
  BRICK_STEPPER_FUNCTION_GET_ALL_DATA = 37;
  BRICK_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD = 38;
  BRICK_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD = 39;
  BRICK_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_STEPPER_FUNCTION_RESET = 243;
  BRICK_STEPPER_FUNCTION_GET_IDENTITY = 255;

  BRICK_STEPPER_CALLBACK_UNDER_VOLTAGE = 31;
  BRICK_STEPPER_CALLBACK_POSITION_REACHED = 32;
  BRICK_STEPPER_CALLBACK_ALL_DATA = 40;
  BRICK_STEPPER_CALLBACK_NEW_STATE = 41;

  BRICK_STEPPER_STEP_MODE_FULL_STEP = 1;
  BRICK_STEPPER_STEP_MODE_HALF_STEP = 2;
  BRICK_STEPPER_STEP_MODE_QUARTER_STEP = 4;
  BRICK_STEPPER_STEP_MODE_EIGHTH_STEP = 8;
  BRICK_STEPPER_STATE_STOP = 1;
  BRICK_STEPPER_STATE_ACCELERATION = 2;
  BRICK_STEPPER_STATE_RUN = 3;
  BRICK_STEPPER_STATE_DEACCELERATION = 4;
  BRICK_STEPPER_STATE_DIRECTION_CHANGE_TO_FORWARD = 5;
  BRICK_STEPPER_STATE_DIRECTION_CHANGE_TO_BACKWARD = 6;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickStepper = class;
  TBrickStepperNotifyUnderVoltage = procedure(sender: TBrickStepper; const voltage: word) of object;
  TBrickStepperNotifyPositionReached = procedure(sender: TBrickStepper; const position: longint) of object;
  TBrickStepperNotifyAllData = procedure(sender: TBrickStepper; const currentVelocity: word; const currentPosition: longint; const remainingSteps: longint; const stackVoltage: word; const externalVoltage: word; const currentConsumption: word) of object;
  TBrickStepperNotifyNewState = procedure(sender: TBrickStepper; const stateNew: byte; const statePrevious: byte) of object;

  /// <summary>
  ///  Device for controlling stepper motors
  /// </summary>
  TBrickStepper = class(TDevice)
  private
    underVoltageCallback: TBrickStepperNotifyUnderVoltage;
    positionReachedCallback: TBrickStepperNotifyPositionReached;
    allDataCallback: TBrickStepperNotifyAllData;
    newStateCallback: TBrickStepperNotifyNewState;
  protected
    procedure CallbackWrapperUnderVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperPositionReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAllData(const packet: TByteArray); virtual;
    procedure CallbackWrapperNewState(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the maximum velocity of the stepper motor in steps per second.
    ///  This function does *not* start the motor, it merely sets the maximum
    ///  velocity the stepper motor is accelerated to. To get the motor running use
    ///  either <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>, <see cref="BrickStepper.TBrickStepper.SetSteps"/>, <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.DriveBackward"/>.
    /// </summary>
    procedure SetMaxVelocity(const velocity: word); virtual;

    /// <summary>
    ///  Returns the velocity as set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/>.
    /// </summary>
    function GetMaxVelocity: word; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the stepper motor in steps per second.
    /// </summary>
    function GetCurrentVelocity: word; virtual;

    /// <summary>
    ///  Sets the acceleration and deacceleration of the stepper motor. The values
    ///  are given in *steps/s²*. An acceleration of 1000 means, that
    ///  every second the velocity is increased by 1000 *steps/s*.
    ///  
    ///  For example: If the current velocity is 0 and you want to accelerate to a
    ///  velocity of 8000 *steps/s* in 10 seconds, you should set an acceleration
    ///  of 800 *steps/s²*.
    ///  
    ///  An acceleration/deacceleration of 0 means instantaneous
    ///  acceleration/deacceleration (not recommended)
    ///  
    ///  The default value is 1000 for both
    /// </summary>
    procedure SetSpeedRamping(const acceleration: word; const deacceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration and deacceleration as set by 
    ///  <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    /// </summary>
    procedure GetSpeedRamping(out acceleration: word; out deacceleration: word); virtual;

    /// <summary>
    ///  Executes an active full brake. 
    ///   
    ///  <note type="caution">
    ///   This function is for emergency purposes,
    ///   where an immediate brake is necessary. Depending on the current velocity and
    ///   the strength of the motor, a full brake can be quite violent.
    ///  </note>
    ///  
    ///  Call <see cref="BrickStepper.TBrickStepper.Stop"/> if you just want to stop the motor.
    /// </summary>
    procedure FullBrake; virtual;

    /// <summary>
    ///  Sets the current steps of the internal step counter. This can be used to
    ///  set the current position to 0 when some kind of starting position
    ///  is reached (e.g. when a CNC machine reaches a corner).
    /// </summary>
    procedure SetCurrentPosition(const position: longint); virtual;

    /// <summary>
    ///  Returns the current position of the stepper motor in steps. On startup
    ///  the position is 0. The steps are counted with all possible driving
    ///  functions (<see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>, <see cref="BrickStepper.TBrickStepper.SetSteps"/>, <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.DriveBackward"/>). It also is possible to reset the steps to 0 or
    ///  set them to any other desired value with <see cref="BrickStepper.TBrickStepper.SetCurrentPosition"/>.
    /// </summary>
    function GetCurrentPosition: longint; virtual;

    /// <summary>
    ///  Sets the target position of the stepper motor in steps. For example,
    ///  if the current position of the motor is 500 and <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> is
    ///  called with 1000, the stepper motor will drive 500 steps forward. It will
    ///  use the velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    ///  
    ///  A call of <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> with the parameter *x* is equivalent to
    ///  a call of <see cref="BrickStepper.TBrickStepper.SetSteps"/> with the parameter 
    ///  (*x* - <see cref="BrickStepper.TBrickStepper.GetCurrentPosition"/>).
    /// </summary>
    procedure SetTargetPosition(const position: longint); virtual;

    /// <summary>
    ///  Returns the last target position as set by <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>.
    /// </summary>
    function GetTargetPosition: longint; virtual;

    /// <summary>
    ///  Sets the number of steps the stepper motor should run. Positive values
    ///  will drive the motor forward and negative values backward. 
    ///  The velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure SetSteps(const steps: longint); virtual;

    /// <summary>
    ///  Returns the last steps as set by <see cref="BrickStepper.TBrickStepper.SetSteps"/>.
    /// </summary>
    function GetSteps: longint; virtual;

    /// <summary>
    ///  Returns the remaining steps of the last call of <see cref="BrickStepper.TBrickStepper.SetSteps"/>.
    ///  For example, if <see cref="BrickStepper.TBrickStepper.SetSteps"/> is called with 2000 and 
    ///  <see cref="BrickStepper.TBrickStepper.GetRemainingSteps"/> is called after the motor has run for 500 steps,
    ///  it will return 1500.
    /// </summary>
    function GetRemainingSteps: longint; virtual;

    /// <summary>
    ///  Sets the step mode of the stepper motor. Possible values are:
    ///  
    ///  * Full Step = 1
    ///  * Half Step = 2
    ///  * Quarter Step = 4
    ///  * Eighth Step = 8
    ///  
    ///  A higher value will increase the resolution and
    ///  decrease the torque of the stepper motor.
    ///  
    ///  The default value is 8 (Eighth Step).
    /// </summary>
    procedure SetStepMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the step mode as set by <see cref="BrickStepper.TBrickStepper.SetStepMode"/>.
    /// </summary>
    function GetStepMode: byte; virtual;

    /// <summary>
    ///  Drives the stepper motor forward until <see cref="BrickStepper.TBrickStepper.DriveBackward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.Stop"/> is called. The velocity, acceleration and deacceleration as 
    ///  set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure DriveForward; virtual;

    /// <summary>
    ///  Drives the stepper motor backward until <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.Stop"/> is triggered. The velocity, acceleration and deacceleration as
    ///  set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure DriveBackward; virtual;

    /// <summary>
    ///  Stops the stepper motor with the deacceleration as set by 
    ///  <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    /// </summary>
    procedure Stop; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a 
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the Stepper Brick. 
    ///   
    ///  If there is an external input voltage and a stack input voltage, the motor
    ///  will be driven by the external input voltage. If there is only a stack 
    ///  voltage present, the motor will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motor will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the current consumption of the motor in mA.
    /// </summary>
    function GetCurrentConsumption: word; virtual;

    /// <summary>
    ///  Sets the current in mA with which the motor will be driven.
    ///  The minimum value is 100mA, the maximum value 2291mA and the 
    ///  default value is 800mA.
    ///  
    ///  <note type="caution">
    ///   Do not set this value above the specifications of your stepper motor.
    ///   Otherwise it may damage your motor.
    ///  </note>
    /// </summary>
    procedure SetMotorCurrent(const current: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickStepper.TBrickStepper.SetMotorCurrent"/>.
    /// </summary>
    function GetMotorCurrent: word; virtual;

    /// <summary>
    ///  Enables the driver chip. The driver parameters can be configured (maximum velocity,
    ///  acceleration, etc) before it is enabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the driver chip. The configurations are kept (maximum velocity,
    ///  acceleration, etc) but the motor is not driven until it is enabled again.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if the driver chip is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the decay mode of the stepper motor. The possible value range is
    ///  between 0 and 65535. A value of 0 sets the fast decay mode, a value of
    ///  65535 sets the slow decay mode and a value in between sets the mixed
    ///  decay mode.
    ///  
    ///  Changing the decay mode is only possible if synchronous rectification
    ///  is enabled (see <see cref="BrickStepper.TBrickStepper.SetSyncRect"/>).
    ///  
    ///  For a good explanation of the different decay modes see 
    ///  `this &lt;http://ebldc.com/?p=86/&gt;`__ blog post by Avayan.
    ///  
    ///  A good decay mode is unfortunately different for every motor. The best
    ///  way to work out a good decay mode for your stepper motor, if you can't
    ///  measure the current with an oscilloscope, is to listen to the sound of
    ///  the motor. If the value is too low, you often hear a high pitched 
    ///  sound and if it is too high you can often hear a humming sound.
    ///  
    ///  Generally, fast decay mode (small value) will be noisier but also
    ///  allow higher motor speeds.
    ///  
    ///  The default value is 10000.
    ///  
    ///  <note>
    ///   There is unfortunately no formula to calculate a perfect decay
    ///   mode for a given stepper motor. If you have problems with loud noises
    ///   or the maximum motor speed is too slow, you should try to tinker with
    ///   the decay value
    ///  </note>
    /// </summary>
    procedure SetDecay(const decay: word); virtual;

    /// <summary>
    ///  Returns the decay mode as set by <see cref="BrickStepper.TBrickStepper.SetDecay"/>.
    /// </summary>
    function GetDecay: word; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickStepper.TBrickStepper.UnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the Stepper Brick is 8V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the stepper motor. If you have a fixed power supply, you likely do 
    ///  not need this functionality.
    ///  
    ///  The default value is 8V.
    /// </summary>
    procedure SetMinimumVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickStepper.TBrickStepper.SetMinimumVoltage"/>.
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Turns synchronous rectification on or off (*true* or *false*).
    ///  
    ///  With synchronous rectification on, the decay can be changed
    ///  (see <see cref="BrickStepper.TBrickStepper.SetDecay"/>). Without synchronous rectification fast
    ///  decay is used.
    ///  
    ///  For an explanation of synchronous rectification see 
    ///  `here &lt;http://en.wikipedia.org/wiki/Active_rectification&gt;`__.
    ///  
    ///  <note type="caution">
    ///   If you want to use high speeds (&gt; 10000 steps/s) for a large 
    ///   stepper motor with a large inductivity we strongly
    ///   suggest that you disable synchronous rectification. Otherwise the
    ///   Brick may not be able to cope with the load and overheat.
    ///  </note>
    ///  
    ///  The default value is *false*.
    /// </summary>
    procedure SetSyncRect(const syncRect: boolean); virtual;

    /// <summary>
    ///  Returns *true* if synchronous rectification is enabled, *false* otherwise.
    /// </summary>
    function IsSyncRect: boolean; virtual;

    /// <summary>
    ///  Sets the time base of the velocity and the acceleration of the stepper brick
    ///  (in seconds).
    ///  
    ///  For example, if you want to make one step every 1.5 seconds, you can set 
    ///  the time base to 15 and the velocity to 10. Now the velocity is 
    ///  10steps/15s = 1steps/1.5s.
    ///  
    ///  The default value is 1.
    /// </summary>
    procedure SetTimeBase(const timeBase: longword); virtual;

    /// <summary>
    ///  Returns the time base as set by <see cref="BrickStepper.TBrickStepper.SetTimeBase"/>.
    /// </summary>
    function GetTimeBase: longword; virtual;

    /// <summary>
    ///  Returns the following parameters: The current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    ///  
    ///  There is also a callback for this function, see <see cref="BrickStepper.TBrickStepper.AllData"/>.
    /// </summary>
    procedure GetAllData(out currentVelocity: word; out currentPosition: longint; out remainingSteps: longint; out stackVoltage: word; out externalVoltage: word; out currentConsumption: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickStepper.TBrickStepper.AllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickStepper.TBrickStepper.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

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
    ///  <see cref="BrickStepper.TBrickStepper.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickStepperNotifyUnderVoltage read underVoltageCallback write underVoltageCallback;

    /// <summary>
    ///  This callback is triggered when a position set by <see cref="BrickStepper.TBrickStepper.SetSteps"/> or
    ///  <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> is reached.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the stepper motor, this only works if the
    ///   acceleration (see <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>) is set smaller or equal to the
    ///   maximum acceleration of the motor. Otherwise the motor will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnPositionReached: TBrickStepperNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickStepper.TBrickStepper.SetAllDataPeriod"/>. The parameters are: the current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    /// </summary>
    property OnAllData: TBrickStepperNotifyAllData read allDataCallback write allDataCallback;

    /// <summary>
    ///  This callback is triggered whenever the Stepper Brick enters a new state. 
    ///  It returns the new state as well as the previous state.
    ///  
    ///  Possible states are:
    ///  
    ///  * 1 = Stop
    ///  * 2 = Acceleration
    ///  * 3 = Run
    ///  * 4 = Deacceleration
    ///  * 5 = Direction change to forward
    ///  * 6 = Direction change to backward
    /// </summary>
    property OnNewState: TBrickStepperNotifyNewState read newStateCallback write newStateCallback;
  end;

implementation

constructor TBrickStepper.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICK_STEPPER_FUNCTION_SET_MAX_VELOCITY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_MAX_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_SPEED_RAMPING] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_SPEED_RAMPING] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_FULL_BRAKE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_CURRENT_POSITION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_TARGET_POSITION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_TARGET_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_STEPS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_STEPS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_REMAINING_STEPS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_STEP_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_STEP_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_DRIVE_FORWARD] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_DRIVE_BACKWARD] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_STOP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_CONSUMPTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_MOTOR_CURRENT] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_MOTOR_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_ENABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_DISABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_IS_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_DECAY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_DECAY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_CALLBACK_UNDER_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_STEPPER_CALLBACK_POSITION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_SYNC_RECT] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_IS_SYNC_RECT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_TIME_BASE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_TIME_BASE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_CALLBACK_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_STEPPER_CALLBACK_NEW_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_STEPPER_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_STEPPER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_STEPPER_CALLBACK_UNDER_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  callbackWrappers[BRICK_STEPPER_CALLBACK_POSITION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  callbackWrappers[BRICK_STEPPER_CALLBACK_ALL_DATA] := {$ifdef FPC}@{$endif}CallbackWrapperAllData;
  callbackWrappers[BRICK_STEPPER_CALLBACK_NEW_STATE] := {$ifdef FPC}@{$endif}CallbackWrapperNewState;
end;

procedure TBrickStepper.SetMaxVelocity(const velocity: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MAX_VELOCITY, 10);
  LEConvertUInt16To(velocity, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetMaxVelocity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MAX_VELOCITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickStepper.GetCurrentVelocity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_VELOCITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickStepper.SetSpeedRamping(const acceleration: word; const deacceleration: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SPEED_RAMPING, 12);
  LEConvertUInt16To(acceleration, 8, request);
  LEConvertUInt16To(deacceleration, 10, request);
  SendRequest(request);
end;

procedure TBrickStepper.GetSpeedRamping(out acceleration: word; out deacceleration: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SPEED_RAMPING, 8);
  response := SendRequest(request);
  acceleration := LEConvertUInt16From(8, response);
  deacceleration := LEConvertUInt16From(10, response);
end;

procedure TBrickStepper.FullBrake;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_FULL_BRAKE, 8);
  SendRequest(request);
end;

procedure TBrickStepper.SetCurrentPosition(const position: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_CURRENT_POSITION, 12);
  LEConvertInt32To(position, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetCurrentPosition: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_POSITION, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickStepper.SetTargetPosition(const position: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_TARGET_POSITION, 12);
  LEConvertInt32To(position, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetTargetPosition: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_TARGET_POSITION, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickStepper.SetSteps(const steps: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_STEPS, 12);
  LEConvertInt32To(steps, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetSteps: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STEPS, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

function TBrickStepper.GetRemainingSteps: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_REMAINING_STEPS, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickStepper.SetStepMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_STEP_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetStepMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STEP_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickStepper.DriveForward;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DRIVE_FORWARD, 8);
  SendRequest(request);
end;

procedure TBrickStepper.DriveBackward;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DRIVE_BACKWARD, 8);
  SendRequest(request);
end;

procedure TBrickStepper.Stop;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_STOP, 8);
  SendRequest(request);
end;

function TBrickStepper.GetStackInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickStepper.GetExternalInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickStepper.GetCurrentConsumption: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_CONSUMPTION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickStepper.SetMotorCurrent(const current: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MOTOR_CURRENT, 10);
  LEConvertUInt16To(current, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetMotorCurrent: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MOTOR_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickStepper.Enable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_ENABLE, 8);
  SendRequest(request);
end;

procedure TBrickStepper.Disable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DISABLE, 8);
  SendRequest(request);
end;

function TBrickStepper.IsEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_IS_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickStepper.SetDecay(const decay: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_DECAY, 10);
  LEConvertUInt16To(decay, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetDecay: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_DECAY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickStepper.SetMinimumVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetMinimumVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickStepper.SetSyncRect(const syncRect: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SYNC_RECT, 9);
  LEConvertBooleanTo(syncRect, 8, request);
  SendRequest(request);
end;

function TBrickStepper.IsSyncRect: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_IS_SYNC_RECT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickStepper.SetTimeBase(const timeBase: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_TIME_BASE, 12);
  LEConvertUInt32To(timeBase, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetTimeBase: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_TIME_BASE, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickStepper.GetAllData(out currentVelocity: word; out currentPosition: longint; out remainingSteps: longint; out stackVoltage: word; out externalVoltage: word; out currentConsumption: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_ALL_DATA, 8);
  response := SendRequest(request);
  currentVelocity := LEConvertUInt16From(8, response);
  currentPosition := LEConvertInt32From(10, response);
  remainingSteps := LEConvertInt32From(14, response);
  stackVoltage := LEConvertUInt16From(18, response);
  externalVoltage := LEConvertUInt16From(20, response);
  currentConsumption := LEConvertUInt16From(22, response);
end;

procedure TBrickStepper.SetAllDataPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickStepper.GetAllDataPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickStepper.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickStepper.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickStepper.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickStepper.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickStepper.CallbackWrapperUnderVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(underVoltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    underVoltageCallback(self, voltage);
  end;
end;

procedure TBrickStepper.CallbackWrapperPositionReached(const packet: TByteArray);
var position: longint;
begin
  if (Assigned(positionReachedCallback)) then begin
    position := LEConvertInt32From(8, packet);
    positionReachedCallback(self, position);
  end;
end;

procedure TBrickStepper.CallbackWrapperAllData(const packet: TByteArray);
var currentVelocity: word; currentPosition: longint; remainingSteps: longint; stackVoltage: word; externalVoltage: word; currentConsumption: word;
begin
  if (Assigned(allDataCallback)) then begin
    currentVelocity := LEConvertUInt16From(8, packet);
    currentPosition := LEConvertInt32From(10, packet);
    remainingSteps := LEConvertInt32From(14, packet);
    stackVoltage := LEConvertUInt16From(18, packet);
    externalVoltage := LEConvertUInt16From(20, packet);
    currentConsumption := LEConvertUInt16From(22, packet);
    allDataCallback(self, currentVelocity, currentPosition, remainingSteps, stackVoltage, externalVoltage, currentConsumption);
  end;
end;

procedure TBrickStepper.CallbackWrapperNewState(const packet: TByteArray);
var stateNew: byte; statePrevious: byte;
begin
  if (Assigned(newStateCallback)) then begin
    stateNew := LEConvertUInt8From(8, packet);
    statePrevious := LEConvertUInt8From(9, packet);
    newStateCallback(self, stateNew, statePrevious);
  end;
end;

end.
