{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletMotionDetector;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_MOTION_DETECTOR_DEVICE_IDENTIFIER = 233;

  BRICKLET_MOTION_DETECTOR_FUNCTION_GET_MOTION_DETECTED = 1;
  BRICKLET_MOTION_DETECTOR_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_MOTION_DETECTOR_CALLBACK_MOTION_DETECTED = 2;
  BRICKLET_MOTION_DETECTOR_CALLBACK_DETECTION_CYCLE_ENDED = 3;

  BRICKLET_MOTION_DETECTOR_MOTION_NOT_DETECTED = 0;
  BRICKLET_MOTION_DETECTOR_MOTION_DETECTED = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMotionDetector = class;
  TBrickletMotionDetectorNotifyMotionDetected = procedure(sender: TBrickletMotionDetector) of object;
  TBrickletMotionDetectorNotifyDetectionCycleEnded = procedure(sender: TBrickletMotionDetector) of object;

  /// <summary>
  ///  Device that reads out PIR motion detector
  /// </summary>
  TBrickletMotionDetector = class(TDevice)
  private
    motionDetectedCallback: TBrickletMotionDetectorNotifyMotionDetected;
    detectionCycleEndedCallback: TBrickletMotionDetectorNotifyDetectionCycleEnded;
  protected
    procedure CallbackWrapperMotionDetected(const packet: TByteArray); virtual;
    procedure CallbackWrapperDetectionCycleEnded(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns 1 if a motion was detected. How long this returns 1 after a motion
    ///  was detected can be adjusted with one of the small potentiometers on the
    ///  Motion Detector Bricklet, see :ref:`here
    ///  &lt;motion_detector_bricklet_sensitivity_delay_block_time&gt;`.
    ///  
    ///  There is also a blue LED on the Bricklet that is on as long as the Bricklet is
    ///  in the "motion detected" state.
    /// </summary>
    function GetMotionDetected: byte; virtual;

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
    ///  This callback is called after a motion was detected.
    /// </summary>
    property OnMotionDetected: TBrickletMotionDetectorNotifyMotionDetected read motionDetectedCallback write motionDetectedCallback;

    /// <summary>
    ///  This callback is called when the detection cycle ended. When this
    ///  callback is called, a new motion can be detected again after approximately 2
    ///  seconds.
    /// </summary>
    property OnDetectionCycleEnded: TBrickletMotionDetectorNotifyDetectionCycleEnded read detectionCycleEndedCallback write detectionCycleEndedCallback;
  end;

implementation

constructor TBrickletMotionDetector.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_GET_MOTION_DETECTED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_MOTION_DETECTOR_CALLBACK_MOTION_DETECTED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_MOTION_DETECTOR_CALLBACK_DETECTION_CYCLE_ENDED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_MOTION_DETECTOR_CALLBACK_MOTION_DETECTED] := {$ifdef FPC}@{$endif}CallbackWrapperMotionDetected;
  callbackWrappers[BRICKLET_MOTION_DETECTOR_CALLBACK_DETECTION_CYCLE_ENDED] := {$ifdef FPC}@{$endif}CallbackWrapperDetectionCycleEnded;
end;

function TBrickletMotionDetector.GetMotionDetected: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_GET_MOTION_DETECTED, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletMotionDetector.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletMotionDetector.CallbackWrapperMotionDetected(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(motionDetectedCallback)) then begin
    motionDetectedCallback(self);
  end;
end;

procedure TBrickletMotionDetector.CallbackWrapperDetectionCycleEnded(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(detectionCycleEndedCallback)) then begin
    detectionCycleEndedCallback(self);
  end;
end;

end.
