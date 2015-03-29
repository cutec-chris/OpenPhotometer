{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletNFCRFID;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_NFC_RFID_DEVICE_IDENTIFIER = 246;

  BRICKLET_NFC_RFID_FUNCTION_REQUEST_TAG_ID = 1;
  BRICKLET_NFC_RFID_FUNCTION_GET_TAG_ID = 2;
  BRICKLET_NFC_RFID_FUNCTION_GET_STATE = 3;
  BRICKLET_NFC_RFID_FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE = 4;
  BRICKLET_NFC_RFID_FUNCTION_WRITE_PAGE = 5;
  BRICKLET_NFC_RFID_FUNCTION_REQUEST_PAGE = 6;
  BRICKLET_NFC_RFID_FUNCTION_GET_PAGE = 7;
  BRICKLET_NFC_RFID_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_NFC_RFID_CALLBACK_STATE_CHANGED = 8;

  BRICKLET_NFC_RFID_TAG_TYPE_MIFARE_CLASSIC = 0;
  BRICKLET_NFC_RFID_TAG_TYPE_TYPE1 = 1;
  BRICKLET_NFC_RFID_TAG_TYPE_TYPE2 = 2;
  BRICKLET_NFC_RFID_STATE_INITIALIZATION = 0;
  BRICKLET_NFC_RFID_STATE_IDLE = 128;
  BRICKLET_NFC_RFID_STATE_ERROR = 192;
  BRICKLET_NFC_RFID_STATE_REQUEST_TAG_ID = 2;
  BRICKLET_NFC_RFID_STATE_REQUEST_TAG_ID_READY = 130;
  BRICKLET_NFC_RFID_STATE_REQUEST_TAG_ID_ERROR = 194;
  BRICKLET_NFC_RFID_STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE = 3;
  BRICKLET_NFC_RFID_STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE_READY = 131;
  BRICKLET_NFC_RFID_STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE_ERROR = 195;
  BRICKLET_NFC_RFID_STATE_WRITE_PAGE = 4;
  BRICKLET_NFC_RFID_STATE_WRITE_PAGE_READY = 132;
  BRICKLET_NFC_RFID_STATE_WRITE_PAGE_ERROR = 196;
  BRICKLET_NFC_RFID_STATE_REQUEST_PAGE = 5;
  BRICKLET_NFC_RFID_STATE_REQUEST_PAGE_READY = 133;
  BRICKLET_NFC_RFID_STATE_REQUEST_PAGE_ERROR = 197;
  BRICKLET_NFC_RFID_KEY_A = 0;
  BRICKLET_NFC_RFID_KEY_B = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To6OfUInt8 = array [0..6] of byte;
  TArray0To5OfUInt8 = array [0..5] of byte;
  TArray0To15OfUInt8 = array [0..15] of byte;

  TBrickletNFCRFID = class;
  TBrickletNFCRFIDNotifyStateChanged = procedure(sender: TBrickletNFCRFID; const state: byte; const idle: boolean) of object;

  /// <summary>
  ///  Device that can read and write NFC and RFID tags
  /// </summary>
  TBrickletNFCRFID = class(TDevice)
  private
    stateChangedCallback: TBrickletNFCRFIDNotifyStateChanged;
  protected
    procedure CallbackWrapperStateChanged(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  To read or write a tag that is in proximity of the NFC/RFID Bricklet you 
    ///  first have to call this function with the expected tag type as parameter.
    ///  It is no problem if you don't know the tag type. You can cycle through 
    ///  the available tag types until the tag gives an answer to the request.
    ///  
    ///  Current the following tag types are supported:
    ///  
    ///  * Mifare Classic (``tag_type`` = 0)
    ///  * NFC Forum Type 1 (``tag_type`` = 1)
    ///  * NFC Forum Type 2 (``tag_type`` = 2)
    ///  
    ///  After you call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/> the NFC/RFID Bricklet will try to read 
    ///  the tag ID from the tag. After this process is done the state will change.
    ///  You can either register the <see cref="BrickletNFCRFID.TBrickletNFCRFID.StateChanged"/> callback or you can poll
    ///  <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> to find out about the state change.
    ///  
    ///  If the state changes to *RequestTagIDError* it means that either there was 
    ///  no tag present or that the tag is of an incompatible type. If the state 
    ///  changes to *RequestTagIDReady* it means that a compatible tag was found 
    ///  and that the tag ID could be read out. You can now get the tag ID by
    ///  calling <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/>.
    ///  
    ///  If two tags are in the proximity of the NFC/RFID Bricklet, this
    ///  function will cycle through the tags. To select a specific tag you have
    ///  to call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/> until the correct tag id is found.
    ///  
    ///  In case of any *Error* state the selection is lost and you have to
    ///  start again by calling <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>.
    /// </summary>
    procedure RequestTagID(const tagType: byte); virtual;

    /// <summary>
    ///  Returns the tag type, tag ID and the length of the tag ID 
    ///  (4 or 7 bytes are possible length). This function can only be called if the
    ///  NFC/RFID is currently in one of the *Ready* states. The returned ID
    ///  is the ID that was saved through the last call of <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>.
    ///  
    ///  To get the tag ID of a tag the approach is as follows:
    ///  
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>
    ///  * Wait for state to change to *RequestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or <see cref="BrickletNFCRFID.TBrickletNFCRFID.StateChanged"/>)
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/>
    /// </summary>
    procedure GetTagID(out tagType: byte; out tidLength: byte; out tid: TArray0To6OfUInt8); virtual;

    /// <summary>
    ///  Returns the current state of the NFC/RFID Bricklet.
    ///  
    ///  On startup the Bricklet will be in the *Initialization* state. The
    ///  initialization will only take about 20ms. After that it changes to *Idle*.
    ///  
    ///  The functions of this Bricklet can be called in the *Idle* state and all of
    ///  the *Ready* and *Error* states.
    ///  
    ///  Example: If you call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestPage"/>, the state will change to 
    ///  *RequestPage* until the reading of the page is finished. Then it will change
    ///  to either *RequestPageReady* if it worked or to *RequestPageError* if it
    ///  didn't. If the request worked you can get the page by calling <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/>.
    ///  
    ///  The same approach is used analogously for the other API functions.
    ///  
    ///  Possible states are:
    ///  
    ///  * Initialization = 0
    ///  * Idle = 128
    ///  * Error = 192
    ///  * RequestTagID = 2
    ///  * RequestTagIDReady = 130
    ///  * RequestTagIDError = 194
    ///  * AuthenticatingMifareClassicPage = 3
    ///  * AuthenticatingMifareClassicPageReady = 131
    ///  * AuthenticatingMifareClassicPageError = 195
    ///  * WritePage = 4
    ///  * WritePageReady = 132
    ///  * WritePageError = 196
    ///  * RequestPage = 5
    ///  * RequestPageReady = 133
    ///  * RequestPageError = 197
    /// </summary>
    procedure GetState(out state: byte; out idle: boolean); virtual;

    /// <summary>
    ///  Mifare Classic tags use authentication. If you want to read from or write to
    ///  a Mifare Classic page you have to authenticate it beforehand.
    ///  Each page can be authenticated with two keys: A (``key_number`` = 0) and B
    ///  (``key_number`` = 1). A new Mifare Classic
    ///  tag that has not yet been written to can can be accessed with key A
    ///  and the default key ``[0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]``.
    ///  
    ///  The approach to read or write a Mifare Classic page is as follows:
    ///  
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>
    ///  * Wait for state to change to *RequestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/>
    ///    or <see cref="BrickletNFCRFID.TBrickletNFCRFID.StateChanged"/>)
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if tag ID is correct
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/> with page and key for the page
    ///  * Wait for state to change to *AuthenticatingMifareClassicPageReady*
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestPage"/> or :func`WritePage` to read/write page
    /// </summary>
    procedure AuthenticateMifareClassicPage(const page: word; const keyNumber: byte; const key: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  Writes 16 bytes starting from the given page. How many pages are written
    ///  depends on the tag type. The page sizes are as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte (one page is written)
    ///  * NFC Forum Type 1 page size: 8 byte (two pages are written)
    ///  * NFC Forum Type 2 page size: 4 byte (four pages are written)
    ///  
    ///  The general approach for writing to a tag is as follows:
    ///  
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>
    ///  * Wait for state to change to *RequestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or <see cref="BrickletNFCRFID.TBrickletNFCRFID.StateChanged"/>)
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if tag ID is correct
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.WritePage"/> with page number and data
    ///  * Wait for state to change to *WritePageReady*
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can write to it. See <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/>.
    /// </summary>
    procedure WritePage(const page: word; const data: TArray0To15OfUInt8); virtual;

    /// <summary>
    ///  Reads 16 bytes starting from the given page and stores them into a buffer. 
    ///  The buffer can then be read out with <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/>.
    ///  How many pages are read depends on the tag type. The page sizes are 
    ///  as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte (one page is read)
    ///  * NFC Forum Type 1 page size: 8 byte (two pages are read)
    ///  * NFC Forum Type 2 page size: 4 byte (four pages are read)
    ///  
    ///  The general approach for reading a tag is as follows:
    ///  
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestTagID"/>
    ///  * Wait for state to change to *RequestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or <see cref="BrickletNFCRFID.TBrickletNFCRFID.StateChanged"/>)
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if tag ID is correct
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestPage"/> with page number
    ///  * Wait for state to change to *RequestPageReady*
    ///  * Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/> to retrieve the page from the buffer
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can read it. See <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/>.
    /// </summary>
    procedure RequestPage(const page: word); virtual;

    /// <summary>
    ///  Returns 16 bytes of data from an internal buffer. To fill the buffer
    ///  with specific pages you have to call <see cref="BrickletNFCRFID.TBrickletNFCRFID.RequestPage"/> beforehand.
    /// </summary>
    function GetPage: TArray0To15OfUInt8; virtual;

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
    ///  This callback is called if the state of the NFC/RFID Bricklet changes.
    ///  See <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> for more information about the possible states.
    /// </summary>
    property OnStateChanged: TBrickletNFCRFIDNotifyStateChanged read stateChangedCallback write stateChangedCallback;
  end;

implementation

constructor TBrickletNFCRFID.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_NFC_RFID_FUNCTION_REQUEST_TAG_ID] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_TAG_ID] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_WRITE_PAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_REQUEST_PAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_PAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_NFC_RFID_CALLBACK_STATE_CHANGED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_NFC_RFID_CALLBACK_STATE_CHANGED] := {$ifdef FPC}@{$endif}CallbackWrapperStateChanged;
end;

procedure TBrickletNFCRFID.RequestTagID(const tagType: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_REQUEST_TAG_ID, 9);
  LEConvertUInt8To(tagType, 8, request);
  SendRequest(request);
end;

procedure TBrickletNFCRFID.GetTagID(out tagType: byte; out tidLength: byte; out tid: TArray0To6OfUInt8);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_TAG_ID, 8);
  response := SendRequest(request);
  tagType := LEConvertUInt8From(8, response);
  tidLength := LEConvertUInt8From(9, response);
  for i := 0 to 6 do tid[i] := LEConvertUInt8From(10 + (i * 1), response);
end;

procedure TBrickletNFCRFID.GetState(out state: byte; out idle: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_STATE, 8);
  response := SendRequest(request);
  state := LEConvertUInt8From(8, response);
  idle := LEConvertBooleanFrom(9, response);
end;

procedure TBrickletNFCRFID.AuthenticateMifareClassicPage(const page: word; const keyNumber: byte; const key: TArray0To5OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE, 17);
  LEConvertUInt16To(page, 8, request);
  LEConvertUInt8To(keyNumber, 10, request);
  for i := 0 to Length(key) - 1 do LEConvertUInt8To(key[i], 11 + (i * 1), request);
  SendRequest(request);
end;

procedure TBrickletNFCRFID.WritePage(const page: word; const data: TArray0To15OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_WRITE_PAGE, 26);
  LEConvertUInt16To(page, 8, request);
  for i := 0 to Length(data) - 1 do LEConvertUInt8To(data[i], 10 + (i * 1), request);
  SendRequest(request);
end;

procedure TBrickletNFCRFID.RequestPage(const page: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_REQUEST_PAGE, 10);
  LEConvertUInt16To(page, 8, request);
  SendRequest(request);
end;

function TBrickletNFCRFID.GetPage: TArray0To15OfUInt8;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_PAGE, 8);
  response := SendRequest(request);
  for i := 0 to 15 do result[i] := LEConvertUInt8From(8 + (i * 1), response);
end;

procedure TBrickletNFCRFID.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletNFCRFID.CallbackWrapperStateChanged(const packet: TByteArray);
var state: byte; idle: boolean;
begin
  if (Assigned(stateChangedCallback)) then begin
    state := LEConvertUInt8From(8, packet);
    idle := LEConvertBooleanFrom(9, packet);
    stateChangedCallback(self, state, idle);
  end;
end;

end.
