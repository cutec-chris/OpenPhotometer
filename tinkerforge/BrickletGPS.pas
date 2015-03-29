{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletGPS;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_GPS_DEVICE_IDENTIFIER = 222;

  BRICKLET_GPS_FUNCTION_GET_COORDINATES = 1;
  BRICKLET_GPS_FUNCTION_GET_STATUS = 2;
  BRICKLET_GPS_FUNCTION_GET_ALTITUDE = 3;
  BRICKLET_GPS_FUNCTION_GET_MOTION = 4;
  BRICKLET_GPS_FUNCTION_GET_DATE_TIME = 5;
  BRICKLET_GPS_FUNCTION_RESTART = 6;
  BRICKLET_GPS_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD = 7;
  BRICKLET_GPS_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD = 8;
  BRICKLET_GPS_FUNCTION_SET_STATUS_CALLBACK_PERIOD = 9;
  BRICKLET_GPS_FUNCTION_GET_STATUS_CALLBACK_PERIOD = 10;
  BRICKLET_GPS_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD = 11;
  BRICKLET_GPS_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD = 12;
  BRICKLET_GPS_FUNCTION_SET_MOTION_CALLBACK_PERIOD = 13;
  BRICKLET_GPS_FUNCTION_GET_MOTION_CALLBACK_PERIOD = 14;
  BRICKLET_GPS_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD = 15;
  BRICKLET_GPS_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD = 16;
  BRICKLET_GPS_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_GPS_CALLBACK_COORDINATES = 17;
  BRICKLET_GPS_CALLBACK_STATUS = 18;
  BRICKLET_GPS_CALLBACK_ALTITUDE = 19;
  BRICKLET_GPS_CALLBACK_MOTION = 20;
  BRICKLET_GPS_CALLBACK_DATE_TIME = 21;

  BRICKLET_GPS_FIX_NO_FIX = 1;
  BRICKLET_GPS_FIX_2D_FIX = 2;
  BRICKLET_GPS_FIX_3D_FIX = 3;
  BRICKLET_GPS_RESTART_TYPE_HOT_START = 0;
  BRICKLET_GPS_RESTART_TYPE_WARM_START = 1;
  BRICKLET_GPS_RESTART_TYPE_COLD_START = 2;
  BRICKLET_GPS_RESTART_TYPE_FACTORY_RESET = 3;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletGPS = class;
  TBrickletGPSNotifyCoordinates = procedure(sender: TBrickletGPS; const latitude: longword; const ns: char; const longitude: longword; const ew: char; const pdop: word; const hdop: word; const vdop: word; const epe: word) of object;
  TBrickletGPSNotifyStatus = procedure(sender: TBrickletGPS; const fix: byte; const satellitesView: byte; const satellitesUsed: byte) of object;
  TBrickletGPSNotifyAltitude = procedure(sender: TBrickletGPS; const altitude: longword; const geoidalSeparation: longword) of object;
  TBrickletGPSNotifyMotion = procedure(sender: TBrickletGPS; const course: longword; const speed: longword) of object;
  TBrickletGPSNotifyDateTime = procedure(sender: TBrickletGPS; const date: longword; const time: longword) of object;

  /// <summary>
  ///  Device for receiving GPS position
  /// </summary>
  TBrickletGPS = class(TDevice)
  private
    coordinatesCallback: TBrickletGPSNotifyCoordinates;
    statusCallback: TBrickletGPSNotifyStatus;
    altitudeCallback: TBrickletGPSNotifyAltitude;
    motionCallback: TBrickletGPSNotifyMotion;
    dateTimeCallback: TBrickletGPSNotifyDateTime;
  protected
    procedure CallbackWrapperCoordinates(const packet: TByteArray); virtual;
    procedure CallbackWrapperStatus(const packet: TByteArray); virtual;
    procedure CallbackWrapperAltitude(const packet: TByteArray); virtual;
    procedure CallbackWrapperMotion(const packet: TByteArray); virtual;
    procedure CallbackWrapperDateTime(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the GPS coordinates. Latitude and longitude are given in the
    ///  ``DD.dddddd°`` format, the value 57123468 means 57.123468°.
    ///  The parameter ``ns`` and ``ew`` are the cardinal directions for
    ///  latitude and longitude. Possible values for ``ns`` and ``ew`` are 'N', 'S', 'E'
    ///  and 'W' (north, south, east and west).
    ///  
    ///  PDOP, HDOP and VDOP are the dilution of precision (DOP) values. They specify
    ///  the additional multiplicative effect of GPS satellite geometry on GPS 
    ///  precision. See 
    ///  `here &lt;http://en.wikipedia.org/wiki/Dilution_of_precision_(GPS)&gt;`__
    ///  for more information. The values are give in hundredths.
    ///  
    ///  EPE is the "Estimated Position Error". The EPE is given in cm. This is not the
    ///  absolute maximum error, it is the error with a specific confidence. See
    ///  `here &lt;http://www.nps.gov/gis/gps/WhatisEPE.html&gt;`__ for more information.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    procedure GetCoordinates(out latitude: longword; out ns: char; out longitude: longword; out ew: char; out pdop: word; out hdop: word; out vdop: word; out epe: word); virtual;

    /// <summary>
    ///  Returns the current fix status, the number of satellites that are in view and
    ///  the number of satellites that are currently used.
    ///  
    ///  Possible fix status values can be:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "1", "No Fix, <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/> and <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/> return invalid data"
    ///   "2", "2D Fix, only <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/> returns valid data"
    ///   "3", "3D Fix, <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/> and <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/> return valid data"
    ///  </code>
    ///  
    ///  There is also a :ref:`blue LED &lt;gps_bricklet_fix_led&gt;` on the Bricklet that
    ///  indicates the fix status.
    /// </summary>
    procedure GetStatus(out fix: byte; out satellitesView: byte; out satellitesUsed: byte); virtual;

    /// <summary>
    ///  Returns the current altitude and corresponding geoidal separation.
    ///  
    ///  Both values are given in cm.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    procedure GetAltitude(out altitude: longword; out geoidalSeparation: longword); virtual;

    /// <summary>
    ///  Returns the current course and speed. Course is given in hundredths degree
    ///  and speed is given in hundredths km/h. A course of 0° means the Bricklet is
    ///  traveling north bound and 90° means it is traveling east bound.
    ///  
    ///  Please note that this only returns useful values if an actual movement
    ///  is present.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    procedure GetMotion(out course: longword; out speed: longword); virtual;

    /// <summary>
    ///  Returns the current date and time. The date is
    ///  given in the format ``ddmmyy`` and the time is given
    ///  in the format ``hhmmss.sss``. For example, 140713 means
    ///  14.05.13 as date and 195923568 means 19:59:23.568 as time.
    /// </summary>
    procedure GetDateTime(out date: longword; out time: longword); virtual;

    /// <summary>
    ///  Restarts the GPS Bricklet, the following restart types are available:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "Hot start (use all available data in the NV store)"
    ///   "1", "Warm start (don't use ephemeris at restart)"
    ///   "2", "Cold start (don't use time, position, almanacs and ephemeris at restart)"
    ///   "3", "Factory reset (clear all system/user configurations at restart)"
    ///  </code>
    /// </summary>
    procedure Restart(const restartType: byte); virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletGPS.TBrickletGPS.Coordinates"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Coordinates"/> is only triggered if the coordinates changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCoordinatesCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetCoordinatesCallbackPeriod"/>.
    /// </summary>
    function GetCoordinatesCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletGPS.TBrickletGPS.Status"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Status"/> is only triggered if the status changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetStatusCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetStatusCallbackPeriod"/>.
    /// </summary>
    function GetStatusCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletGPS.TBrickletGPS.Altitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Altitude"/> is only triggered if the altitude changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAltitudeCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitudeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletGPS.TBrickletGPS.Motion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Motion"/> is only triggered if the motion changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetMotionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetMotionCallbackPeriod"/>.
    /// </summary>
    function GetMotionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletGPS.TBrickletGPS.DateTime"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.DateTime"/> is only triggered if the date or time changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetDateTimeCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetDateTimeCallbackPeriod"/>.
    /// </summary>
    function GetDateTimeCallbackPeriod: longword; virtual;

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
    ///  <see cref="BrickletGPS.TBrickletGPS.SetCoordinatesCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/>.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Coordinates"/> is only triggered if the coordinates changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnCoordinates: TBrickletGPSNotifyCoordinates read coordinatesCallback write coordinatesCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetStatusCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Status"/> is only triggered if the status changed since the
    ///  last triggering.
    /// </summary>
    property OnStatus: TBrickletGPSNotifyStatus read statusCallback write statusCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetAltitudeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/>.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Altitude"/> is only triggered if the altitude changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnAltitude: TBrickletGPSNotifyAltitude read altitudeCallback write altitudeCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetMotionCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetMotion"/>.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.Motion"/> is only triggered if the motion changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnMotion: TBrickletGPSNotifyMotion read motionCallback write motionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetDateTimeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetDateTime"/>.
    ///  
    ///  <see cref="BrickletGPS.TBrickletGPS.DateTime"/> is only triggered if the date or time changed since the
    ///  last triggering.
    /// </summary>
    property OnDateTime: TBrickletGPSNotifyDateTime read dateTimeCallback write dateTimeCallback;
  end;

implementation

constructor TBrickletGPS.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_GPS_FUNCTION_GET_COORDINATES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_STATUS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_ALTITUDE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_MOTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_DATE_TIME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_RESTART] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_GPS_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_SET_STATUS_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_STATUS_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_SET_MOTION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_MOTION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_GPS_CALLBACK_COORDINATES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_GPS_CALLBACK_STATUS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_GPS_CALLBACK_ALTITUDE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_GPS_CALLBACK_MOTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_GPS_CALLBACK_DATE_TIME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_GPS_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_GPS_CALLBACK_COORDINATES] := {$ifdef FPC}@{$endif}CallbackWrapperCoordinates;
  callbackWrappers[BRICKLET_GPS_CALLBACK_STATUS] := {$ifdef FPC}@{$endif}CallbackWrapperStatus;
  callbackWrappers[BRICKLET_GPS_CALLBACK_ALTITUDE] := {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  callbackWrappers[BRICKLET_GPS_CALLBACK_MOTION] := {$ifdef FPC}@{$endif}CallbackWrapperMotion;
  callbackWrappers[BRICKLET_GPS_CALLBACK_DATE_TIME] := {$ifdef FPC}@{$endif}CallbackWrapperDateTime;
end;

procedure TBrickletGPS.GetCoordinates(out latitude: longword; out ns: char; out longitude: longword; out ew: char; out pdop: word; out hdop: word; out vdop: word; out epe: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_COORDINATES, 8);
  response := SendRequest(request);
  latitude := LEConvertUInt32From(8, response);
  ns := LEConvertCharFrom(12, response);
  longitude := LEConvertUInt32From(13, response);
  ew := LEConvertCharFrom(17, response);
  pdop := LEConvertUInt16From(18, response);
  hdop := LEConvertUInt16From(20, response);
  vdop := LEConvertUInt16From(22, response);
  epe := LEConvertUInt16From(24, response);
end;

procedure TBrickletGPS.GetStatus(out fix: byte; out satellitesView: byte; out satellitesUsed: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_STATUS, 8);
  response := SendRequest(request);
  fix := LEConvertUInt8From(8, response);
  satellitesView := LEConvertUInt8From(9, response);
  satellitesUsed := LEConvertUInt8From(10, response);
end;

procedure TBrickletGPS.GetAltitude(out altitude: longword; out geoidalSeparation: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_ALTITUDE, 8);
  response := SendRequest(request);
  altitude := LEConvertUInt32From(8, response);
  geoidalSeparation := LEConvertUInt32From(12, response);
end;

procedure TBrickletGPS.GetMotion(out course: longword; out speed: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_MOTION, 8);
  response := SendRequest(request);
  course := LEConvertUInt32From(8, response);
  speed := LEConvertUInt32From(12, response);
end;

procedure TBrickletGPS.GetDateTime(out date: longword; out time: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_DATE_TIME, 8);
  response := SendRequest(request);
  date := LEConvertUInt32From(8, response);
  time := LEConvertUInt32From(12, response);
end;

procedure TBrickletGPS.Restart(const restartType: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_RESTART, 9);
  LEConvertUInt8To(restartType, 8, request);
  SendRequest(request);
end;

procedure TBrickletGPS.SetCoordinatesCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletGPS.GetCoordinatesCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletGPS.SetStatusCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_STATUS_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletGPS.GetStatusCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_STATUS_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletGPS.SetAltitudeCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletGPS.GetAltitudeCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletGPS.SetMotionCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_MOTION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletGPS.GetMotionCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_MOTION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletGPS.SetDateTimeCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletGPS.GetDateTimeCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletGPS.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletGPS.CallbackWrapperCoordinates(const packet: TByteArray);
var latitude: longword; ns: char; longitude: longword; ew: char; pdop: word; hdop: word; vdop: word; epe: word;
begin
  if (Assigned(coordinatesCallback)) then begin
    latitude := LEConvertUInt32From(8, packet);
    ns := LEConvertCharFrom(12, packet);
    longitude := LEConvertUInt32From(13, packet);
    ew := LEConvertCharFrom(17, packet);
    pdop := LEConvertUInt16From(18, packet);
    hdop := LEConvertUInt16From(20, packet);
    vdop := LEConvertUInt16From(22, packet);
    epe := LEConvertUInt16From(24, packet);
    coordinatesCallback(self, latitude, ns, longitude, ew, pdop, hdop, vdop, epe);
  end;
end;

procedure TBrickletGPS.CallbackWrapperStatus(const packet: TByteArray);
var fix: byte; satellitesView: byte; satellitesUsed: byte;
begin
  if (Assigned(statusCallback)) then begin
    fix := LEConvertUInt8From(8, packet);
    satellitesView := LEConvertUInt8From(9, packet);
    satellitesUsed := LEConvertUInt8From(10, packet);
    statusCallback(self, fix, satellitesView, satellitesUsed);
  end;
end;

procedure TBrickletGPS.CallbackWrapperAltitude(const packet: TByteArray);
var altitude: longword; geoidalSeparation: longword;
begin
  if (Assigned(altitudeCallback)) then begin
    altitude := LEConvertUInt32From(8, packet);
    geoidalSeparation := LEConvertUInt32From(12, packet);
    altitudeCallback(self, altitude, geoidalSeparation);
  end;
end;

procedure TBrickletGPS.CallbackWrapperMotion(const packet: TByteArray);
var course: longword; speed: longword;
begin
  if (Assigned(motionCallback)) then begin
    course := LEConvertUInt32From(8, packet);
    speed := LEConvertUInt32From(12, packet);
    motionCallback(self, course, speed);
  end;
end;

procedure TBrickletGPS.CallbackWrapperDateTime(const packet: TByteArray);
var date: longword; time: longword;
begin
  if (Assigned(dateTimeCallback)) then begin
    date := LEConvertUInt32From(8, packet);
    time := LEConvertUInt32From(12, packet);
    dateTimeCallback(self, date, time);
  end;
end;

end.
