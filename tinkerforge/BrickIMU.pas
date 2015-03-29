{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickIMU;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_IMU_DEVICE_IDENTIFIER = 16;

  BRICK_IMU_FUNCTION_GET_ACCELERATION = 1;
  BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD = 2;
  BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY = 3;
  BRICK_IMU_FUNCTION_GET_ALL_DATA = 4;
  BRICK_IMU_FUNCTION_GET_ORIENTATION = 5;
  BRICK_IMU_FUNCTION_GET_QUATERNION = 6;
  BRICK_IMU_FUNCTION_GET_IMU_TEMPERATURE = 7;
  BRICK_IMU_FUNCTION_LEDS_ON = 8;
  BRICK_IMU_FUNCTION_LEDS_OFF = 9;
  BRICK_IMU_FUNCTION_ARE_LEDS_ON = 10;
  BRICK_IMU_FUNCTION_SET_ACCELERATION_RANGE = 11;
  BRICK_IMU_FUNCTION_GET_ACCELERATION_RANGE = 12;
  BRICK_IMU_FUNCTION_SET_MAGNETOMETER_RANGE = 13;
  BRICK_IMU_FUNCTION_GET_MAGNETOMETER_RANGE = 14;
  BRICK_IMU_FUNCTION_SET_CONVERGENCE_SPEED = 15;
  BRICK_IMU_FUNCTION_GET_CONVERGENCE_SPEED = 16;
  BRICK_IMU_FUNCTION_SET_CALIBRATION = 17;
  BRICK_IMU_FUNCTION_GET_CALIBRATION = 18;
  BRICK_IMU_FUNCTION_SET_ACCELERATION_PERIOD = 19;
  BRICK_IMU_FUNCTION_GET_ACCELERATION_PERIOD = 20;
  BRICK_IMU_FUNCTION_SET_MAGNETIC_FIELD_PERIOD = 21;
  BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD_PERIOD = 22;
  BRICK_IMU_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD = 23;
  BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD = 24;
  BRICK_IMU_FUNCTION_SET_ALL_DATA_PERIOD = 25;
  BRICK_IMU_FUNCTION_GET_ALL_DATA_PERIOD = 26;
  BRICK_IMU_FUNCTION_SET_ORIENTATION_PERIOD = 27;
  BRICK_IMU_FUNCTION_GET_ORIENTATION_PERIOD = 28;
  BRICK_IMU_FUNCTION_SET_QUATERNION_PERIOD = 29;
  BRICK_IMU_FUNCTION_GET_QUATERNION_PERIOD = 30;
  BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_ON = 37;
  BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_OFF = 38;
  BRICK_IMU_FUNCTION_IS_ORIENTATION_CALCULATION_ON = 39;
  BRICK_IMU_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_IMU_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_IMU_FUNCTION_RESET = 243;
  BRICK_IMU_FUNCTION_GET_IDENTITY = 255;

  BRICK_IMU_CALLBACK_ACCELERATION = 31;
  BRICK_IMU_CALLBACK_MAGNETIC_FIELD = 32;
  BRICK_IMU_CALLBACK_ANGULAR_VELOCITY = 33;
  BRICK_IMU_CALLBACK_ALL_DATA = 34;
  BRICK_IMU_CALLBACK_ORIENTATION = 35;
  BRICK_IMU_CALLBACK_QUATERNION = 36;

  BRICK_IMU_CALIBRATION_TYPE_ACCELEROMETER_GAIN = 0;
  BRICK_IMU_CALIBRATION_TYPE_ACCELEROMETER_BIAS = 1;
  BRICK_IMU_CALIBRATION_TYPE_MAGNETOMETER_GAIN = 2;
  BRICK_IMU_CALIBRATION_TYPE_MAGNETOMETER_BIAS = 3;
  BRICK_IMU_CALIBRATION_TYPE_GYROSCOPE_GAIN = 4;
  BRICK_IMU_CALIBRATION_TYPE_GYROSCOPE_BIAS = 5;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To9OfInt16 = array [0..9] of smallint;

  TBrickIMU = class;
  TBrickIMUNotifyAcceleration = procedure(sender: TBrickIMU; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUNotifyMagneticField = procedure(sender: TBrickIMU; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUNotifyAngularVelocity = procedure(sender: TBrickIMU; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUNotifyAllData = procedure(sender: TBrickIMU; const accX: smallint; const accY: smallint; const accZ: smallint; const magX: smallint; const magY: smallint; const magZ: smallint; const angX: smallint; const angY: smallint; const angZ: smallint; const temperature: smallint) of object;
  TBrickIMUNotifyOrientation = procedure(sender: TBrickIMU; const roll: smallint; const pitch: smallint; const yaw: smallint) of object;
  TBrickIMUNotifyQuaternion = procedure(sender: TBrickIMU; const x: single; const y: single; const z: single; const w: single) of object;

  /// <summary>
  ///  Device for sensing acceleration, magnetic field and angular velocity
  /// </summary>
  TBrickIMU = class(TDevice)
  private
    accelerationCallback: TBrickIMUNotifyAcceleration;
    magneticFieldCallback: TBrickIMUNotifyMagneticField;
    angularVelocityCallback: TBrickIMUNotifyAngularVelocity;
    allDataCallback: TBrickIMUNotifyAllData;
    orientationCallback: TBrickIMUNotifyOrientation;
    quaternionCallback: TBrickIMUNotifyQuaternion;
  protected
    procedure CallbackWrapperAcceleration(const packet: TByteArray); virtual;
    procedure CallbackWrapperMagneticField(const packet: TByteArray); virtual;
    procedure CallbackWrapperAngularVelocity(const packet: TByteArray); virtual;
    procedure CallbackWrapperAllData(const packet: TByteArray); virtual;
    procedure CallbackWrapperOrientation(const packet: TByteArray); virtual;
    procedure CallbackWrapperQuaternion(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the calibrated acceleration from the accelerometer for the 
    ///  x, y and z axis in mG (G/1000, 1G = 9.80605m/s²).
    ///  
    ///  If you want to get the acceleration periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.Acceleration"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated magnetic field from the magnetometer for the 
    ///  x, y and z axis in mG (Milligauss or Nanotesla).
    ///  
    ///  If you want to get the magnetic field periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.MagneticField"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>.
    /// </summary>
    procedure GetMagneticField(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated angular velocity from the gyroscope for the 
    ///  x, y and z axis in °/14.375s (you have to divide by 14.375 to
    ///  get the value in °/s).
    ///  
    ///  If you want to get the angular velocity periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.AngularVelocity"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>.
    /// </summary>
    procedure GetAngularVelocity(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the data from <see cref="BrickIMU.TBrickIMU.GetAcceleration"/>, <see cref="BrickIMU.TBrickIMU.GetMagneticField"/> 
    ///  and <see cref="BrickIMU.TBrickIMU.GetAngularVelocity"/> as well as the temperature of the IMU Brick.
    ///  
    ///  The temperature is given in °C/100.
    ///  
    ///  If you want to get the data periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.AllData"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>.
    /// </summary>
    procedure GetAllData(out accX: smallint; out accY: smallint; out accZ: smallint; out magX: smallint; out magY: smallint; out magZ: smallint; out angX: smallint; out angY: smallint; out angZ: smallint; out temperature: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (roll, pitch, yaw) of the IMU Brick as Euler
    ///  angles in one-hundredth degree. Note that Euler angles always experience a
    ///  `gimbal lock &lt;http://en.wikipedia.org/wiki/Gimbal_lock&gt;`__.
    ///  
    ///  We recommend that you use quaternions instead.
    ///  
    ///  The order to sequence in which the orientation values should be applied is 
    ///  roll, yaw, pitch. 
    ///  
    ///  If you want to get the orientation periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.Orientation"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>.
    /// </summary>
    procedure GetOrientation(out roll: smallint; out pitch: smallint; out yaw: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (x, y, z, w) of the IMU as 
    ///  `quaternions &lt;http://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation&gt;`__.
    ///  
    ///  You can go from quaternions to Euler angles with the following formula::
    ///  
    ///   xAngle = atan2(2*y*w - 2*x*z, 1 - 2*y*y - 2*z*z)
    ///   yAngle = atan2(2*x*w - 2*y*z, 1 - 2*x*x - 2*z*z)
    ///   zAngle =  asin(2*x*y + 2*z*w)
    ///  
    ///  This process is not reversible, because of the 
    ///  `gimbal lock &lt;http://en.wikipedia.org/wiki/Gimbal_lock&gt;`__.
    ///  
    ///  It is also possible to calculate independent angles. You can calculate 
    ///  yaw, pitch and roll in a right-handed vehicle coordinate system according to DIN70000
    ///  with::
    ///  
    ///   yaw   =  atan2(2*x*y + 2*w*z, w*w + x*x - y*y - z*z)
    ///   pitch = -asin(2*w*y - 2*x*z)
    ///   roll  = -atan2(2*y*z + 2*w*x, -w*w + x*x + y*y - z*z))
    ///  
    ///  Converting the quaternions to an OpenGL transformation matrix is
    ///  possible with the following formula::
    ///  
    ///   matrix = [[1 - 2*(y*y + z*z),     2*(x*y - w*z),     2*(x*z + w*y), 0],
    ///             [    2*(x*y + w*z), 1 - 2*(x*x + z*z),     2*(y*z - w*x), 0],
    ///             [    2*(x*z - w*y),     2*(y*z + w*x), 1 - 2*(x*x + y*y), 0],
    ///             [                0,                 0,                 0, 1]]
    ///  
    ///  If you want to get the quaternions periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMU.TBrickIMU.Quaternion"/> and set the period with 
    ///  <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>.
    /// </summary>
    procedure GetQuaternion(out x: single; out y: single; out z: single; out w: single); virtual;

    /// <summary>
    ///  Returns the temperature of the IMU Brick. The temperature is given in 
    ///  °C/100.
    /// </summary>
    function GetIMUTemperature: smallint; virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick on.
    /// </summary>
    procedure LedsOn; virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick off.
    /// </summary>
    procedure LedsOff; virtual;

    /// <summary>
    ///  Returns *true* if the orientation and direction LEDs of the IMU Brick
    ///  are on, *false* otherwise.
    /// </summary>
    function AreLedsOn: boolean; virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    procedure SetAccelerationRange(const range: byte); virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    function GetAccelerationRange: byte; virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    procedure SetMagnetometerRange(const range: byte); virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    function GetMagnetometerRange: byte; virtual;

    /// <summary>
    ///  Sets the convergence speed of the IMU Brick in °/s. The convergence speed 
    ///  determines how the different sensor measurements are fused.
    ///  
    ///  If the orientation of the IMU Brick is off by 10° and the convergence speed is 
    ///  set to 20°/s, it will take 0.5s until the orientation is corrected. However,
    ///  if the correct orientation is reached and the convergence speed is too high,
    ///  the orientation will fluctuate with the fluctuations of the accelerometer and
    ///  the magnetometer.
    ///  
    ///  If you set the convergence speed to 0, practically only the gyroscope is used
    ///  to calculate the orientation. This gives very smooth movements, but errors of the
    ///  gyroscope will not be corrected. If you set the convergence speed to something
    ///  above 500, practically only the magnetometer and the accelerometer are used to
    ///  calculate the orientation. In this case the movements are abrupt and the values
    ///  will fluctuate, but there won't be any errors that accumulate over time.
    ///  
    ///  In an application with high angular velocities, we recommend a high convergence
    ///  speed, so the errors of the gyroscope can be corrected fast. In applications with
    ///  only slow movements we recommend a low convergence speed. You can change the
    ///  convergence speed on the fly. So it is possible (and recommended) to increase 
    ///  the convergence speed before an abrupt movement and decrease it afterwards 
    ///  again.
    ///  
    ///  You might want to play around with the convergence speed in the Brick Viewer to
    ///  get a feeling for a good value for your application.
    ///  
    ///  The default value is 30.
    /// </summary>
    procedure SetConvergenceSpeed(const speed: word); virtual;

    /// <summary>
    ///  Returns the convergence speed as set by <see cref="BrickIMU.TBrickIMU.SetConvergenceSpeed"/>.
    /// </summary>
    function GetConvergenceSpeed: word; virtual;

    /// <summary>
    ///  There are several different types that can be calibrated:
    ///  
    ///  <code>
    ///   "Type", "Description", "Values"
    ///  
    ///   "0",    "Accelerometer Gain", "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "1",    "Accelerometer Bias", "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
    ///   "2",    "Magnetometer Gain",  "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "3",    "Magnetometer Bias",  "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
    ///   "4",    "Gyroscope Gain",     "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "5",    "Gyroscope Bias",     "``[bias xl, bias yl, bias zl, temp l, bias xh, bias yh, bias zh, temp h, 0, 0]``"
    ///  </code>
    ///  
    ///  The calibration via gain and bias is done with the following formula::
    ///  
    ///   new_value = (bias + orig_value) * gain_mul / gain_div
    ///  
    ///  If you really want to write your own calibration software, please keep
    ///  in mind that you first have to undo the old calibration (set bias to 0 and
    ///  gain to 1/1) and that you have to average over several thousand values
    ///  to obtain a usable result in the end.
    ///  
    ///  The gyroscope bias is highly dependent on the temperature, so you have to
    ///  calibrate the bias two times with different temperatures. The values ``xl``,
    ///  ``yl``, ``zl`` and ``temp l`` are the bias for ``x``, ``y``, ``z`` and the
    ///  corresponding temperature for a low temperature. The values ``xh``, ``yh``,
    ///  ``zh`` and ``temp h`` are the same for a high temperatures. The temperature
    ///  difference should be at least 5°C. If you have a temperature where the
    ///  IMU Brick is mostly used, you should use this temperature for one of the
    ///  sampling points.
    ///  
    ///  <note>
    ///   We highly recommend that you use the Brick Viewer to calibrate your
    ///   IMU Brick.
    ///  </note>
    /// </summary>
    procedure SetCalibration(const typ: byte; const data: TArray0To9OfInt16); virtual;

    /// <summary>
    ///  Returns the calibration for a given type as set by <see cref="BrickIMU.TBrickIMU.SetCalibration"/>.
    /// </summary>
    function GetCalibration(const typ: byte): TArray0To9OfInt16; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.Acceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAccelerationPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>.
    /// </summary>
    function GetAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.MagneticField"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetMagneticFieldPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>.
    /// </summary>
    function GetMagneticFieldPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.AngularVelocity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAngularVelocityPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>.
    /// </summary>
    function GetAngularVelocityPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.AllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.Orientation"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetOrientationPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>.
    /// </summary>
    function GetOrientationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMU.TBrickIMU.Quaternion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetQuaternionPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>.
    /// </summary>
    function GetQuaternionPeriod: longword; virtual;

    /// <summary>
    ///  Turns the orientation calculation of the IMU Brick on.
    ///  
    ///  As default the calculation is on.
    ///  
    ///  .. versionadded:: 2.0.2~(Firmware)
    /// </summary>
    procedure OrientationCalculationOn; virtual;

    /// <summary>
    ///  Turns the orientation calculation of the IMU Brick off.
    ///  
    ///  If the calculation is off, <see cref="BrickIMU.TBrickIMU.GetOrientation"/> will return
    ///  the last calculated value until the calculation is turned on again.
    ///  
    ///  The trigonometric functions that are needed to calculate the orientation 
    ///  are very expensive. We recommend to turn the orientation calculation
    ///  off if the orientation is not needed, to free calculation time for the
    ///  sensor fusion algorithm.
    ///  
    ///  As default the calculation is on.
    ///  
    ///  .. versionadded:: 2.0.2~(Firmware)
    /// </summary>
    procedure OrientationCalculationOff; virtual;

    /// <summary>
    ///  Returns *true* if the orientation calculation of the IMU Brick
    ///  is on, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.2~(Firmware)
    /// </summary>
    function IsOrientationCalculationOn: boolean; virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>. The parameters are the acceleration
    ///  for the x, y and z axis.
    /// </summary>
    property OnAcceleration: TBrickIMUNotifyAcceleration read accelerationCallback write accelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>. The parameters are the magnetic field
    ///  for the x, y and z axis.
    /// </summary>
    property OnMagneticField: TBrickIMUNotifyMagneticField read magneticFieldCallback write magneticFieldCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>. The parameters are the angular velocity
    ///  for the x, y and z axis.
    /// </summary>
    property OnAngularVelocity: TBrickIMUNotifyAngularVelocity read angularVelocityCallback write angularVelocityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>. The parameters are the acceleration,
    ///  the magnetic field and the angular velocity for the x, y and z axis as
    ///  well as the temperature of the IMU Brick.
    /// </summary>
    property OnAllData: TBrickIMUNotifyAllData read allDataCallback write allDataCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>. The parameters are the orientation
    ///  (roll, pitch and yaw) of the IMU Brick in Euler angles. See
    ///  <see cref="BrickIMU.TBrickIMU.GetOrientation"/> for details.
    /// </summary>
    property OnOrientation: TBrickIMUNotifyOrientation read orientationCallback write orientationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>. The parameters are the orientation
    ///  (x, y, z, w) of the IMU Brick in quaternions. See <see cref="BrickIMU.TBrickIMU.GetQuaternion"/>
    ///  for details.
    /// </summary>
    property OnQuaternion: TBrickIMUNotifyQuaternion read quaternionCallback write quaternionCallback;
  end;

implementation

constructor TBrickIMU.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ORIENTATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_QUATERNION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_IMU_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_LEDS_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_LEDS_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_ARE_LEDS_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_ACCELERATION_RANGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION_RANGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_MAGNETOMETER_RANGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_GET_MAGNETOMETER_RANGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_CONVERGENCE_SPEED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_GET_CONVERGENCE_SPEED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_GET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_MAGNETIC_FIELD_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_ORIENTATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_ORIENTATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_SET_QUATERNION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_QUATERNION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_CALLBACK_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_CALLBACK_MAGNETIC_FIELD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_CALLBACK_ANGULAR_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_CALLBACK_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_CALLBACK_ORIENTATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_CALLBACK_QUATERNION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_IS_ORIENTATION_CALCULATION_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_IMU_CALLBACK_ACCELERATION] := {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  callbackWrappers[BRICK_IMU_CALLBACK_MAGNETIC_FIELD] := {$ifdef FPC}@{$endif}CallbackWrapperMagneticField;
  callbackWrappers[BRICK_IMU_CALLBACK_ANGULAR_VELOCITY] := {$ifdef FPC}@{$endif}CallbackWrapperAngularVelocity;
  callbackWrappers[BRICK_IMU_CALLBACK_ALL_DATA] := {$ifdef FPC}@{$endif}CallbackWrapperAllData;
  callbackWrappers[BRICK_IMU_CALLBACK_ORIENTATION] := {$ifdef FPC}@{$endif}CallbackWrapperOrientation;
  callbackWrappers[BRICK_IMU_CALLBACK_QUATERNION] := {$ifdef FPC}@{$endif}CallbackWrapperQuaternion;
end;

procedure TBrickIMU.GetAcceleration(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMU.GetMagneticField(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMU.GetAngularVelocity(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMU.GetAllData(out accX: smallint; out accY: smallint; out accZ: smallint; out magX: smallint; out magY: smallint; out magZ: smallint; out angX: smallint; out angY: smallint; out angZ: smallint; out temperature: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ALL_DATA, 8);
  response := SendRequest(request);
  accX := LEConvertInt16From(8, response);
  accY := LEConvertInt16From(10, response);
  accZ := LEConvertInt16From(12, response);
  magX := LEConvertInt16From(14, response);
  magY := LEConvertInt16From(16, response);
  magZ := LEConvertInt16From(18, response);
  angX := LEConvertInt16From(20, response);
  angY := LEConvertInt16From(22, response);
  angZ := LEConvertInt16From(24, response);
  temperature := LEConvertInt16From(26, response);
end;

procedure TBrickIMU.GetOrientation(out roll: smallint; out pitch: smallint; out yaw: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ORIENTATION, 8);
  response := SendRequest(request);
  roll := LEConvertInt16From(8, response);
  pitch := LEConvertInt16From(10, response);
  yaw := LEConvertInt16From(12, response);
end;

procedure TBrickIMU.GetQuaternion(out x: single; out y: single; out z: single; out w: single);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_QUATERNION, 8);
  response := SendRequest(request);
  x := LEConvertFloatFrom(8, response);
  y := LEConvertFloatFrom(12, response);
  z := LEConvertFloatFrom(16, response);
  w := LEConvertFloatFrom(20, response);
end;

function TBrickIMU.GetIMUTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_IMU_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickIMU.LedsOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_LEDS_ON, 8);
  SendRequest(request);
end;

procedure TBrickIMU.LedsOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_LEDS_OFF, 8);
  SendRequest(request);
end;

function TBrickIMU.AreLedsOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_ARE_LEDS_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickIMU.SetAccelerationRange(const range: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ACCELERATION_RANGE, 9);
  LEConvertUInt8To(range, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetAccelerationRange: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION_RANGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickIMU.SetMagnetometerRange(const range: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_MAGNETOMETER_RANGE, 9);
  LEConvertUInt8To(range, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetMagnetometerRange: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETOMETER_RANGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickIMU.SetConvergenceSpeed(const speed: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_CONVERGENCE_SPEED, 10);
  LEConvertUInt16To(speed, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetConvergenceSpeed: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CONVERGENCE_SPEED, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickIMU.SetCalibration(const typ: byte; const data: TArray0To9OfInt16);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_CALIBRATION, 29);
  LEConvertUInt8To(typ, 8, request);
  for i := 0 to Length(data) - 1 do LEConvertInt16To(data[i], 9 + (i * 2), request);
  SendRequest(request);
end;

function TBrickIMU.GetCalibration(const typ: byte): TArray0To9OfInt16;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CALIBRATION, 9);
  LEConvertUInt8To(typ, 8, request);
  response := SendRequest(request);
  for i := 0 to 9 do result[i] := LEConvertInt16From(8 + (i * 2), response);
end;

procedure TBrickIMU.SetAccelerationPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetAccelerationPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.SetMagneticFieldPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_MAGNETIC_FIELD_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetMagneticFieldPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.SetAngularVelocityPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetAngularVelocityPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.SetAllDataPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetAllDataPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.SetOrientationPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ORIENTATION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetOrientationPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ORIENTATION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.SetQuaternionPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_QUATERNION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMU.GetQuaternionPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_QUATERNION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMU.OrientationCalculationOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_ON, 8);
  SendRequest(request);
end;

procedure TBrickIMU.OrientationCalculationOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_OFF, 8);
  SendRequest(request);
end;

function TBrickIMU.IsOrientationCalculationOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_IS_ORIENTATION_CALCULATION_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickIMU.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickIMU.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickIMU.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickIMU.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickIMU.CallbackWrapperAcceleration(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(accelerationCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    accelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperMagneticField(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(magneticFieldCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    magneticFieldCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperAngularVelocity(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(angularVelocityCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    angularVelocityCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperAllData(const packet: TByteArray);
var accX: smallint; accY: smallint; accZ: smallint; magX: smallint; magY: smallint; magZ: smallint; angX: smallint; angY: smallint; angZ: smallint; temperature: smallint;
begin
  if (Assigned(allDataCallback)) then begin
    accX := LEConvertInt16From(8, packet);
    accY := LEConvertInt16From(10, packet);
    accZ := LEConvertInt16From(12, packet);
    magX := LEConvertInt16From(14, packet);
    magY := LEConvertInt16From(16, packet);
    magZ := LEConvertInt16From(18, packet);
    angX := LEConvertInt16From(20, packet);
    angY := LEConvertInt16From(22, packet);
    angZ := LEConvertInt16From(24, packet);
    temperature := LEConvertInt16From(26, packet);
    allDataCallback(self, accX, accY, accZ, magX, magY, magZ, angX, angY, angZ, temperature);
  end;
end;

procedure TBrickIMU.CallbackWrapperOrientation(const packet: TByteArray);
var roll: smallint; pitch: smallint; yaw: smallint;
begin
  if (Assigned(orientationCallback)) then begin
    roll := LEConvertInt16From(8, packet);
    pitch := LEConvertInt16From(10, packet);
    yaw := LEConvertInt16From(12, packet);
    orientationCallback(self, roll, pitch, yaw);
  end;
end;

procedure TBrickIMU.CallbackWrapperQuaternion(const packet: TByteArray);
var x: single; y: single; z: single; w: single;
begin
  if (Assigned(quaternionCallback)) then begin
    x := LEConvertFloatFrom(8, packet);
    y := LEConvertFloatFrom(12, packet);
    z := LEConvertFloatFrom(16, packet);
    w := LEConvertFloatFrom(20, packet);
    quaternionCallback(self, x, y, z, w);
  end;
end;

end.
