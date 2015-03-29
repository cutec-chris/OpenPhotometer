{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickMaster;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_MASTER_DEVICE_IDENTIFIER = 13;

  BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE = 1;
  BRICK_MASTER_FUNCTION_GET_STACK_CURRENT = 2;
  BRICK_MASTER_FUNCTION_SET_EXTENSION_TYPE = 3;
  BRICK_MASTER_FUNCTION_GET_EXTENSION_TYPE = 4;
  BRICK_MASTER_FUNCTION_IS_CHIBI_PRESENT = 5;
  BRICK_MASTER_FUNCTION_SET_CHIBI_ADDRESS = 6;
  BRICK_MASTER_FUNCTION_GET_CHIBI_ADDRESS = 7;
  BRICK_MASTER_FUNCTION_SET_CHIBI_MASTER_ADDRESS = 8;
  BRICK_MASTER_FUNCTION_GET_CHIBI_MASTER_ADDRESS = 9;
  BRICK_MASTER_FUNCTION_SET_CHIBI_SLAVE_ADDRESS = 10;
  BRICK_MASTER_FUNCTION_GET_CHIBI_SLAVE_ADDRESS = 11;
  BRICK_MASTER_FUNCTION_GET_CHIBI_SIGNAL_STRENGTH = 12;
  BRICK_MASTER_FUNCTION_GET_CHIBI_ERROR_LOG = 13;
  BRICK_MASTER_FUNCTION_SET_CHIBI_FREQUENCY = 14;
  BRICK_MASTER_FUNCTION_GET_CHIBI_FREQUENCY = 15;
  BRICK_MASTER_FUNCTION_SET_CHIBI_CHANNEL = 16;
  BRICK_MASTER_FUNCTION_GET_CHIBI_CHANNEL = 17;
  BRICK_MASTER_FUNCTION_IS_RS485_PRESENT = 18;
  BRICK_MASTER_FUNCTION_SET_RS485_ADDRESS = 19;
  BRICK_MASTER_FUNCTION_GET_RS485_ADDRESS = 20;
  BRICK_MASTER_FUNCTION_SET_RS485_SLAVE_ADDRESS = 21;
  BRICK_MASTER_FUNCTION_GET_RS485_SLAVE_ADDRESS = 22;
  BRICK_MASTER_FUNCTION_GET_RS485_ERROR_LOG = 23;
  BRICK_MASTER_FUNCTION_SET_RS485_CONFIGURATION = 24;
  BRICK_MASTER_FUNCTION_GET_RS485_CONFIGURATION = 25;
  BRICK_MASTER_FUNCTION_IS_WIFI_PRESENT = 26;
  BRICK_MASTER_FUNCTION_SET_WIFI_CONFIGURATION = 27;
  BRICK_MASTER_FUNCTION_GET_WIFI_CONFIGURATION = 28;
  BRICK_MASTER_FUNCTION_SET_WIFI_ENCRYPTION = 29;
  BRICK_MASTER_FUNCTION_GET_WIFI_ENCRYPTION = 30;
  BRICK_MASTER_FUNCTION_GET_WIFI_STATUS = 31;
  BRICK_MASTER_FUNCTION_REFRESH_WIFI_STATUS = 32;
  BRICK_MASTER_FUNCTION_SET_WIFI_CERTIFICATE = 33;
  BRICK_MASTER_FUNCTION_GET_WIFI_CERTIFICATE = 34;
  BRICK_MASTER_FUNCTION_SET_WIFI_POWER_MODE = 35;
  BRICK_MASTER_FUNCTION_GET_WIFI_POWER_MODE = 36;
  BRICK_MASTER_FUNCTION_GET_WIFI_BUFFER_INFO = 37;
  BRICK_MASTER_FUNCTION_SET_WIFI_REGULATORY_DOMAIN = 38;
  BRICK_MASTER_FUNCTION_GET_WIFI_REGULATORY_DOMAIN = 39;
  BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE = 40;
  BRICK_MASTER_FUNCTION_SET_LONG_WIFI_KEY = 41;
  BRICK_MASTER_FUNCTION_GET_LONG_WIFI_KEY = 42;
  BRICK_MASTER_FUNCTION_SET_WIFI_HOSTNAME = 43;
  BRICK_MASTER_FUNCTION_GET_WIFI_HOSTNAME = 44;
  BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD = 45;
  BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD = 46;
  BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD = 47;
  BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD = 48;
  BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD = 49;
  BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD = 50;
  BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD = 51;
  BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD = 52;
  BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD = 53;
  BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD = 54;
  BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD = 55;
  BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD = 56;
  BRICK_MASTER_FUNCTION_SET_DEBOUNCE_PERIOD = 57;
  BRICK_MASTER_FUNCTION_GET_DEBOUNCE_PERIOD = 58;
  BRICK_MASTER_FUNCTION_IS_ETHERNET_PRESENT = 65;
  BRICK_MASTER_FUNCTION_SET_ETHERNET_CONFIGURATION = 66;
  BRICK_MASTER_FUNCTION_GET_ETHERNET_CONFIGURATION = 67;
  BRICK_MASTER_FUNCTION_GET_ETHERNET_STATUS = 68;
  BRICK_MASTER_FUNCTION_SET_ETHERNET_HOSTNAME = 69;
  BRICK_MASTER_FUNCTION_SET_ETHERNET_MAC_ADDRESS = 70;
  BRICK_MASTER_FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION = 71;
  BRICK_MASTER_FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION = 72;
  BRICK_MASTER_FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET = 73;
  BRICK_MASTER_FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET = 74;
  BRICK_MASTER_FUNCTION_SET_WIFI_AUTHENTICATION_SECRET = 75;
  BRICK_MASTER_FUNCTION_GET_WIFI_AUTHENTICATION_SECRET = 76;
  BRICK_MASTER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_MASTER_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_MASTER_FUNCTION_RESET = 243;
  BRICK_MASTER_FUNCTION_GET_IDENTITY = 255;

  BRICK_MASTER_CALLBACK_STACK_CURRENT = 59;
  BRICK_MASTER_CALLBACK_STACK_VOLTAGE = 60;
  BRICK_MASTER_CALLBACK_USB_VOLTAGE = 61;
  BRICK_MASTER_CALLBACK_STACK_CURRENT_REACHED = 62;
  BRICK_MASTER_CALLBACK_STACK_VOLTAGE_REACHED = 63;
  BRICK_MASTER_CALLBACK_USB_VOLTAGE_REACHED = 64;

  BRICK_MASTER_EXTENSION_TYPE_CHIBI = 1;
  BRICK_MASTER_EXTENSION_TYPE_RS485 = 2;
  BRICK_MASTER_EXTENSION_TYPE_WIFI = 3;
  BRICK_MASTER_EXTENSION_TYPE_ETHERNET = 4;
  BRICK_MASTER_CHIBI_FREQUENCY_OQPSK_868_MHZ = 0;
  BRICK_MASTER_CHIBI_FREQUENCY_OQPSK_915_MHZ = 1;
  BRICK_MASTER_CHIBI_FREQUENCY_OQPSK_780_MHZ = 2;
  BRICK_MASTER_CHIBI_FREQUENCY_BPSK40_915_MHZ = 3;
  BRICK_MASTER_RS485_PARITY_NONE = 'n';
  BRICK_MASTER_RS485_PARITY_EVEN = 'e';
  BRICK_MASTER_RS485_PARITY_ODD = 'o';
  BRICK_MASTER_WIFI_CONNECTION_DHCP = 0;
  BRICK_MASTER_WIFI_CONNECTION_STATIC_IP = 1;
  BRICK_MASTER_WIFI_CONNECTION_ACCESS_POINT_DHCP = 2;
  BRICK_MASTER_WIFI_CONNECTION_ACCESS_POINT_STATIC_IP = 3;
  BRICK_MASTER_WIFI_CONNECTION_AD_HOC_DHCP = 4;
  BRICK_MASTER_WIFI_CONNECTION_AD_HOC_STATIC_IP = 5;
  BRICK_MASTER_WIFI_ENCRYPTION_WPA_WPA2 = 0;
  BRICK_MASTER_WIFI_ENCRYPTION_WPA_ENTERPRISE = 1;
  BRICK_MASTER_WIFI_ENCRYPTION_WEP = 2;
  BRICK_MASTER_WIFI_ENCRYPTION_NO_ENCRYPTION = 3;
  BRICK_MASTER_WIFI_EAP_OPTION_OUTER_AUTH_EAP_FAST = 0;
  BRICK_MASTER_WIFI_EAP_OPTION_OUTER_AUTH_EAP_TLS = 1;
  BRICK_MASTER_WIFI_EAP_OPTION_OUTER_AUTH_EAP_TTLS = 2;
  BRICK_MASTER_WIFI_EAP_OPTION_OUTER_AUTH_EAP_PEAP = 3;
  BRICK_MASTER_WIFI_EAP_OPTION_INNER_AUTH_EAP_MSCHAP = 0;
  BRICK_MASTER_WIFI_EAP_OPTION_INNER_AUTH_EAP_GTC = 4;
  BRICK_MASTER_WIFI_EAP_OPTION_CERT_TYPE_CA_CERT = 0;
  BRICK_MASTER_WIFI_EAP_OPTION_CERT_TYPE_CLIENT_CERT = 8;
  BRICK_MASTER_WIFI_EAP_OPTION_CERT_TYPE_PRIVATE_KEY = 16;
  BRICK_MASTER_WIFI_STATE_DISASSOCIATED = 0;
  BRICK_MASTER_WIFI_STATE_ASSOCIATED = 1;
  BRICK_MASTER_WIFI_STATE_ASSOCIATING = 2;
  BRICK_MASTER_WIFI_STATE_ERROR = 3;
  BRICK_MASTER_WIFI_STATE_NOT_INITIALIZED_YET = 255;
  BRICK_MASTER_WIFI_POWER_MODE_FULL_SPEED = 0;
  BRICK_MASTER_WIFI_POWER_MODE_LOW_POWER = 1;
  BRICK_MASTER_WIFI_DOMAIN_CHANNEL_1TO11 = 0;
  BRICK_MASTER_WIFI_DOMAIN_CHANNEL_1TO13 = 1;
  BRICK_MASTER_WIFI_DOMAIN_CHANNEL_1TO14 = 2;
  BRICK_MASTER_THRESHOLD_OPTION_OFF = 'x';
  BRICK_MASTER_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICK_MASTER_THRESHOLD_OPTION_INSIDE = 'i';
  BRICK_MASTER_THRESHOLD_OPTION_SMALLER = '<';
  BRICK_MASTER_THRESHOLD_OPTION_GREATER = '>';
  BRICK_MASTER_ETHERNET_CONNECTION_DHCP = 0;
  BRICK_MASTER_ETHERNET_CONNECTION_STATIC_IP = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To31OfUInt8 = array [0..31] of byte;
  TArray0To5OfUInt8 = array [0..5] of byte;
  TArray0To3OfUInt8 = array [0..3] of byte;

  TBrickMaster = class;
  TBrickMasterNotifyStackCurrent = procedure(sender: TBrickMaster; const current: word) of object;
  TBrickMasterNotifyStackVoltage = procedure(sender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyUSBVoltage = procedure(sender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyStackCurrentReached = procedure(sender: TBrickMaster; const current: word) of object;
  TBrickMasterNotifyStackVoltageReached = procedure(sender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyUSBVoltageReached = procedure(sender: TBrickMaster; const voltage: word) of object;

  /// <summary>
  ///  Device for controlling Stacks and four Bricklets
  /// </summary>
  TBrickMaster = class(TDevice)
  private
    stackCurrentCallback: TBrickMasterNotifyStackCurrent;
    stackVoltageCallback: TBrickMasterNotifyStackVoltage;
    usbVoltageCallback: TBrickMasterNotifyUSBVoltage;
    stackCurrentReachedCallback: TBrickMasterNotifyStackCurrentReached;
    stackVoltageReachedCallback: TBrickMasterNotifyStackVoltageReached;
    usbVoltageReachedCallback: TBrickMasterNotifyUSBVoltageReached;
  protected
    procedure CallbackWrapperStackCurrent(const packet: TByteArray); virtual;
    procedure CallbackWrapperStackVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperUSBVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperStackCurrentReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperStackVoltageReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperUSBVoltageReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the stack voltage in mV. The stack voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a 
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackVoltage: word; virtual;

    /// <summary>
    ///  Returns the stack current in mA. The stack current is the
    ///  current that is drawn via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackCurrent: word; virtual;

    /// <summary>
    ///  Writes the extension type to the EEPROM of a specified extension. 
    ///  The extension is either 0 or 1 (0 is the on the bottom, 1 is the on on top, 
    ///  if only one extension is present use 0).
    ///  
    ///  Possible extension types:
    ///  
    ///  <code>
    ///   "Type", "Description"
    ///  
    ///   "1",    "Chibi"
    ///   "2",    "RS485"
    ///   "3",    "WIFI"
    ///   "4",    "Ethernet"
    ///  </code>
    ///  
    ///  The extension type is already set when bought and it can be set with the 
    ///  Brick Viewer, it is unlikely that you need this function.
    /// </summary>
    procedure SetExtensionType(const extension: byte; const exttype: longword); virtual;

    /// <summary>
    ///  Returns the type for a given extension as set by <see cref="BrickMaster.TBrickMaster.SetExtensionType"/>.
    /// </summary>
    function GetExtensionType(const extension: byte): longword; virtual;

    /// <summary>
    ///  Returns *true* if a Chibi Extension is available to be used by the Master Brick.
    /// </summary>
    function IsChibiPresent: boolean; virtual;

    /// <summary>
    ///  Sets the address (1-255) belonging to the Chibi Extension.
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be 
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiAddress(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetChibiAddress"/>.
    /// </summary>
    function GetChibiAddress: byte; virtual;

    /// <summary>
    ///  Sets the address (1-255) of the Chibi Master. This address is used if the
    ///  Chibi Extension is used as slave (i.e. it does not have a USB connection).
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be 
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiMasterAddress(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetChibiMasterAddress"/>.
    /// </summary>
    function GetChibiMasterAddress: byte; virtual;

    /// <summary>
    ///  Sets up to 254 slave addresses. Valid addresses are in range 1-255. 0 has a
    ///  special meaning, it is used as list terminator and not allowed as normal slave
    ///  address. The address numeration (via num parameter) has to be used
    ///  ascending from 0. For example: If you use the Chibi Extension in Master mode
    ///  (i.e. the stack has an USB connection) and you want to talk to three other
    ///  Chibi stacks with the slave addresses 17, 23, and 42, you should call with
    ///  ``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
    ///  ``(3, 0)`` is a list terminator and indicates that the Chibi slave address
    ///  list contains 3 addresses in this case.
    ///  
    ///  It is possible to set the addresses with the Brick Viewer, that will take care
    ///  of correct address numeration and list termination.
    ///  
    ///  The slave addresses will be saved in the EEPROM of the Chibi Extension, they
    ///  don't have to be set on every startup.
    /// </summary>
    procedure SetChibiSlaveAddress(const num: byte; const address: byte); virtual;

    /// <summary>
    ///  Returns the slave address for a given num as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetChibiSlaveAddress"/>.
    /// </summary>
    function GetChibiSlaveAddress(const num: byte): byte; virtual;

    /// <summary>
    ///  Returns the signal strength in dBm. The signal strength updates every time a
    ///  packet is received.
    /// </summary>
    function GetChibiSignalStrength: byte; virtual;

    /// <summary>
    ///  Returns underrun, CRC error, no ACK and overflow error counts of the Chibi
    ///  communication. If these errors start rising, it is likely that either the
    ///  distance between two Chibi stacks is becoming too big or there are
    ///  interferences.
    /// </summary>
    procedure GetChibiErrorLog(out underrun: word; out crcError: word; out noAck: word; out overflow: word); virtual;

    /// <summary>
    ///  Sets the Chibi frequency range for the Chibi Extension. Possible values are:
    ///  
    ///  <code>
    ///   "Type", "Description"
    ///  
    ///   "0",    "OQPSK 868MHz (Europe)"
    ///   "1",    "OQPSK 915MHz (US)"
    ///   "2",    "OQPSK 780MHz (China)"
    ///   "3",    "BPSK40 915MHz"
    ///  </code>
    ///  
    ///  It is possible to set the frequency with the Brick Viewer and it will be 
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiFrequency(const frequency: byte); virtual;

    /// <summary>
    ///  Returns the frequency value as set by <see cref="BrickMaster.TBrickMaster.SetChibiFrequency"/>.
    /// </summary>
    function GetChibiFrequency: byte; virtual;

    /// <summary>
    ///  Sets the channel used by the Chibi Extension. Possible channels are
    ///  different for different frequencies:
    ///  
    ///  <code>
    ///   "Frequency",             "Possible Channels"
    ///  
    ///   "OQPSK 868MHz (Europe)", "0"
    ///   "OQPSK 915MHz (US)",     "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    ///   "OQPSK 780MHz (China)",  "0, 1, 2, 3"
    ///   "BPSK40 915MHz",         "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    ///  </code>
    ///  
    ///  It is possible to set the channel with the Brick Viewer and it will be 
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiChannel(const channel: byte); virtual;

    /// <summary>
    ///  Returns the channel as set by <see cref="BrickMaster.TBrickMaster.SetChibiChannel"/>.
    /// </summary>
    function GetChibiChannel: byte; virtual;

    /// <summary>
    ///  Returns *true* if a RS485 Extension is available to be used by the Master Brick.
    /// </summary>
    function IsRS485Present: boolean; virtual;

    /// <summary>
    ///  Sets the address (0-255) belonging to the RS485 Extension.
    ///  
    ///  Set to 0 if the RS485 Extension should be the RS485 Master (i.e.
    ///  connected to a PC via USB).
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be 
    ///  saved in the EEPROM of the RS485 Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetRS485Address(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetRS485Address"/>.
    /// </summary>
    function GetRS485Address: byte; virtual;

    /// <summary>
    ///  Sets up to 255 slave addresses. Valid addresses are in range 1-255. 0 has a
    ///  special meaning, it is used as list terminator and not allowed as normal slave
    ///  address. The address numeration (via ``num`` parameter) has to be used
    ///  ascending from 0. For example: If you use the RS485 Extension in Master mode
    ///  (i.e. the stack has an USB connection) and you want to talk to three other
    ///  RS485 stacks with the addresses 17, 23, and 42, you should call with
    ///  ``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
    ///  ``(3, 0)`` is a list terminator and indicates that the RS485 slave address list
    ///  contains 3 addresses in this case.
    ///  
    ///  It is possible to set the addresses with the Brick Viewer, that will take care
    ///  of correct address numeration and list termination.
    ///  
    ///  The slave addresses will be saved in the EEPROM of the Chibi Extension, they
    ///  don't have to be set on every startup.
    /// </summary>
    procedure SetRS485SlaveAddress(const num: byte; const address: byte); virtual;

    /// <summary>
    ///  Returns the slave address for a given ``num`` as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetRS485SlaveAddress"/>.
    /// </summary>
    function GetRS485SlaveAddress(const num: byte): byte; virtual;

    /// <summary>
    ///  Returns CRC error counts of the RS485 communication.
    ///  If this counter starts rising, it is likely that the distance
    ///  between the RS485 nodes is too big or there is some kind of
    ///  interference.
    /// </summary>
    function GetRS485ErrorLog: word; virtual;

    /// <summary>
    ///  Sets the configuration of the RS485 Extension. Speed is given in baud. The
    ///  Master Brick will try to match the given baud rate as exactly as possible.
    ///  The maximum recommended baud rate is 2000000 (2Mbit/s).
    ///  Possible values for parity are 'n' (none), 'e' (even) and 'o' (odd).
    ///  Possible values for stop bits are 1 and 2.
    ///  
    ///  If your RS485 is unstable (lost messages etc.), the first thing you should
    ///  try is to decrease the speed. On very large bus (e.g. 1km), you probably
    ///  should use a value in the range of 100000 (100kbit/s).
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    /// </summary>
    procedure SetRS485Configuration(const speed: longword; const parity: char; const stopbits: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetRS485Configuration"/>.
    /// </summary>
    procedure GetRS485Configuration(out speed: longword; out parity: char; out stopbits: byte); virtual;

    /// <summary>
    ///  Returns *true* if a WIFI Extension is available to be used by the Master Brick.
    /// </summary>
    function IsWifiPresent: boolean; virtual;

    /// <summary>
    ///  Sets the configuration of the WIFI Extension. The ``ssid`` can have a max length
    ///  of 32 characters. Possible values for ``connection`` are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "DHCP"
    ///   "1", "Static IP"
    ///   "2", "Access Point: DHCP"
    ///   "3", "Access Point: Static IP"
    ///   "4", "Ad Hoc: DHCP"
    ///   "5", "Ad Hoc: Static IP"
    ///  </code>
    ///  
    ///  If you set ``connection`` to one of the static IP options then you have to
    ///  supply ``ip``, ``subnet_mask`` and ``gateway`` as an array of size 4 (first
    ///  element of the array is the least significant byte of the address). If
    ///  ``connection`` is set to one of the DHCP options then ``ip``, ``subnet_mask``
    ///  and ``gateway`` are ignored, you can set them to 0.
    ///  
    ///  The last parameter is the port that your program will connect to. The
    ///  default port, that is used by brickd, is 4223.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the WIFI configuration.
    /// </summary>
    procedure SetWifiConfiguration(const ssid: string; const connection: byte; const ip: TArray0To3OfUInt8; const subnetMask: TArray0To3OfUInt8; const gateway: TArray0To3OfUInt8; const port: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifiConfiguration"/>.
    /// </summary>
    procedure GetWifiConfiguration(out ssid: string; out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word); virtual;

    /// <summary>
    ///  Sets the encryption of the WIFI Extension. The first parameter is the
    ///  type of the encryption. Possible values are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "WPA/WPA2"
    ///   "1", "WPA Enterprise (EAP-FAST, EAP-TLS, EAP-TTLS, PEAP)"
    ///   "2", "WEP"
    ///   "3", "No Encryption"
    ///  </code>
    ///  
    ///  The ``key`` has a max length of 50 characters and is used if ``encryption``
    ///  is set to 0 or 2 (WPA/WPA2 or WEP). Otherwise the value is ignored.
    ///  
    ///  For WPA/WPA2 the key has to be at least 8 characters long. If you want to set
    ///  a key with more than 50 characters, see <see cref="BrickMaster.TBrickMaster.SetLongWifiKey"/>.
    ///  
    ///  For WEP the key has to be either 10 or 26 hexadecimal digits long. It is
    ///  possible to set the WEP ``key_index`` (1-4). If you don't know your
    ///  ``key_index``, it is likely 1.
    ///  
    ///  If you choose WPA Enterprise as encryption, you have to set ``eap_options`` and
    ///  the length of the certificates (for other encryption types these parameters
    ///  are ignored). The certificate length are given in byte and the certificates
    ///  themselves can be set with <see cref="BrickMaster.TBrickMaster.SetWifiCertificate"/>. ``eap_options`` consist
    ///  of the outer authentication (bits 1-2), inner authentication (bit 3) and
    ///  certificate type (bits 4-5):
    ///  
    ///  <code>
    ///   "Option", "Bits", "Description"
    ///  
    ///   "outer authentication", "1-2", "0=EAP-FAST, 1=EAP-TLS, 2=EAP-TTLS, 3=EAP-PEAP"
    ///   "inner authentication", "3", "0=EAP-MSCHAP, 1=EAP-GTC"
    ///   "certificate type", "4-5", "0=CA Certificate, 1=Client Certificate, 2=Private Key"
    ///  </code>
    ///  
    ///  Example for EAP-TTLS + EAP-GTC + Private Key: ``option = 2 | (1 &lt;&lt; 2) | (2 &lt;&lt; 3)``.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the WIFI encryption.
    /// </summary>
    procedure SetWifiEncryption(const encryption: byte; const key: string; const keyIndex: byte; const eapOptions: byte; const caCertificateLength: word; const clientCertificateLength: word; const privateKeyLength: word); virtual;

    /// <summary>
    ///  Returns the encryption as set by <see cref="BrickMaster.TBrickMaster.SetWifiEncryption"/>.
    /// </summary>
    procedure GetWifiEncryption(out encryption: byte; out key: string; out keyIndex: byte; out eapOptions: byte; out caCertificateLength: word; out clientCertificateLength: word; out privateKeyLength: word); virtual;

    /// <summary>
    ///  Returns the status of the WIFI Extension. The ``state`` is updated automatically,
    ///  all of the other parameters are updated on startup and every time
    ///  <see cref="BrickMaster.TBrickMaster.RefreshWifiStatus"/> is called.
    ///  
    ///  Possible states are:
    ///  
    ///  <code>
    ///   "State", "Description"
    ///  
    ///   "0", "Disassociated"
    ///   "1", "Associated"
    ///   "2", "Associating"
    ///   "3", "Error"
    ///   "255", "Not initialized yet"
    ///  </code>
    /// </summary>
    procedure GetWifiStatus(out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8; out channel: byte; out rssi: smallint; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out state: byte); virtual;

    /// <summary>
    ///  Refreshes the WIFI status (see <see cref="BrickMaster.TBrickMaster.GetWifiStatus"/>). To read the status
    ///  of the WIFI module, the Master Brick has to change from data mode to
    ///  command mode and back. This transaction and the readout itself is
    ///  unfortunately time consuming. This means, that it might take some ms
    ///  until the stack with attached WIFI Extension reacts again after this
    ///  function is called.
    /// </summary>
    procedure RefreshWifiStatus; virtual;

    /// <summary>
    ///  This function is used to set the certificate as well as password and username
    ///  for WPA Enterprise. To set the username use index 0xFFFF,
    ///  to set the password use index 0xFFFE. The max length of username and 
    ///  password is 32.
    ///  
    ///  The certificate is written in chunks of size 32 and the index is used as
    ///  the index of the chunk. ``data_length`` should nearly always be 32. Only
    ///  the last chunk can have a length that is not equal to 32.
    ///  
    ///  The starting index of the CA Certificate is 0, of the Client Certificate
    ///  10000 and for the Private Key 20000. Maximum sizes are 1312, 1312 and
    ///  4320 byte respectively.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after uploading the certificate.
    ///  
    ///  It is recommended to use the Brick Viewer to set the certificate, username
    ///  and password.
    /// </summary>
    procedure SetWifiCertificate(const index: word; const data: TArray0To31OfUInt8; const dataLength: byte); virtual;

    /// <summary>
    ///  Returns the certificate for a given index as set by <see cref="BrickMaster.TBrickMaster.SetWifiCertificate"/>.
    /// </summary>
    procedure GetWifiCertificate(const index: word; out data: TArray0To31OfUInt8; out dataLength: byte); virtual;

    /// <summary>
    ///  Sets the power mode of the WIFI Extension. Possible modes are:
    ///  
    ///  <code>
    ///   "Mode", "Description"
    ///  
    ///   "0", "Full Speed (high power consumption, high throughput)"
    ///   "1", "Low Power (low power consumption, low throughput)"
    ///  </code>
    ///  
    ///  The default value is 0 (Full Speed).
    /// </summary>
    procedure SetWifiPowerMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the power mode as set by <see cref="BrickMaster.TBrickMaster.SetWifiPowerMode"/>.
    /// </summary>
    function GetWifiPowerMode: byte; virtual;

    /// <summary>
    ///  Returns informations about the WIFI receive buffer. The WIFI
    ///  receive buffer has a max size of 1500 byte and if data is transfered
    ///  too fast, it might overflow.
    ///  
    ///  The return values are the number of overflows, the low watermark 
    ///  (i.e. the smallest number of bytes that were free in the buffer) and
    ///  the bytes that are currently used.
    ///  
    ///  You should always try to keep the buffer empty, otherwise you will
    ///  have a permanent latency. A good rule of thumb is, that you can transfer
    ///  1000 messages per second without problems.
    ///  
    ///  Try to not send more then 50 messages at a time without any kind of
    ///  break between them.
    /// </summary>
    procedure GetWifiBufferInfo(out overflow: longword; out lowWatermark: word; out used: word); virtual;

    /// <summary>
    ///  Sets the regulatory domain of the WIFI Extension. Possible domains are:
    ///  
    ///  <code>
    ///   "Domain", "Description"
    ///  
    ///   "0", "FCC: Channel 1-11 (N/S America, Australia, New Zealand)"
    ///   "1", "ETSI: Channel 1-13 (Europe, Middle East, Africa)"
    ///   "2", "TELEC: Channel 1-14 (Japan)"
    ///  </code>
    ///  
    ///  The default value is 1 (ETSI).
    /// </summary>
    procedure SetWifiRegulatoryDomain(const domain: byte); virtual;

    /// <summary>
    ///  Returns the regulatory domain as set by <see cref="BrickMaster.TBrickMaster.SetWifiRegulatoryDomain"/>.
    /// </summary>
    function GetWifiRegulatoryDomain: byte; virtual;

    /// <summary>
    ///  Returns the USB voltage in mV.
    /// </summary>
    function GetUSBVoltage: word; virtual;

    /// <summary>
    ///  Sets a long WIFI key (up to 63 chars, at least 8 chars) for WPA encryption.
    ///  This key will be used
    ///  if the key in <see cref="BrickMaster.TBrickMaster.SetWifiEncryption"/> is set to "-". In the old protocol,
    ///  a payload of size 63 was not possible, so the maximum key length was 50 chars.
    ///  
    ///  With the new protocol this is possible, since we didn't want to break API,
    ///  this function was added additionally.
    ///  
    ///  .. versionadded:: 2.0.2~(Firmware)
    /// </summary>
    procedure SetLongWifiKey(const key: string); virtual;

    /// <summary>
    ///  Returns the encryption key as set by <see cref="BrickMaster.TBrickMaster.SetLongWifiKey"/>.
    ///  
    ///  .. versionadded:: 2.0.2~(Firmware)
    /// </summary>
    function GetLongWifiKey: string; virtual;

    /// <summary>
    ///  Sets the hostname of the WIFI Extension. The hostname will be displayed 
    ///  by access points as the hostname in the DHCP clients table.
    ///  
    ///  Setting an empty String will restore the default hostname.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetWifiHostname(const hostname: string); virtual;

    /// <summary>
    ///  Returns the hostname as set by <see cref="BrickMaster.TBrickMaster.GetWifiHostname"/>.
    ///  
    ///  An empty String means, that the default hostname is used.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    function GetWifiHostname: string; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickMaster.TBrickMaster.StackCurrent"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.StackCurrent"/> is only triggered if the current has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetStackCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by :func:`SetCurrentCallbackPeriod`.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    function GetStackCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickMaster.TBrickMaster.StackVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.StackVoltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetStackVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    function GetStackVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickMaster.TBrickMaster.USBVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.USBVoltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetUSBVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    function GetUSBVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickMaster.TBrickMaster.StackCurrentReached"/> callback. 
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
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetStackCurrentCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure GetStackCurrentCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the :func:`StackStackVoltageReached` callback. 
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
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetStackVoltageCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure GetStackVoltageCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickMaster.TBrickMaster.USBVoltageReached"/> callback. 
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
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetUSBVoltageCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure GetUSBVoltageCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickMaster.TBrickMaster.StackCurrentReached"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.StackVoltageReached"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.USBVoltageReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns *true* if a Ethernet Extension is available to be used by the Master
    ///  Brick.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    function IsEthernetPresent: boolean; virtual;

    /// <summary>
    ///  Sets the configuration of the Ethernet Extension. Possible values for
    ///  ``connection`` are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "DHCP"
    ///   "1", "Static IP"
    ///  </code>
    ///  
    ///  If you set ``connection`` to static IP options then you have to supply ``ip``,
    ///  ``subnet_mask`` and ``gateway`` as an array of size 4 (first element of the
    ///  array is the least significant byte of the address). If ``connection`` is set
    ///  to the DHCP options then ``ip``, ``subnet_mask`` and ``gateway`` are ignored,
    ///  you can set them to 0.
    ///  
    ///  The last parameter is the port that your program will connect to. The
    ///  default port, that is used by brickd, is 4223.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet configuration.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    procedure SetEthernetConfiguration(const connection: byte; const ip: TArray0To3OfUInt8; const subnetMask: TArray0To3OfUInt8; const gateway: TArray0To3OfUInt8; const port: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetEthernetConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    procedure GetEthernetConfiguration(out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word); virtual;

    /// <summary>
    ///  Returns the status of the Ethernet Extension.
    ///  
    ///  ``mac_address``, ``ip``, ``subnet_mask`` and ``gateway`` are given as an array.
    ///  The first element of the array is the least significant byte of the address.
    ///  
    ///  ``rx_count`` and ``tx_count`` are the number of bytes that have been
    ///  received/send since last restart.
    ///  
    ///  ``hostname`` is the currently used hostname.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    procedure GetEthernetStatus(out macAddress: TArray0To5OfUInt8; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out hostname: string); virtual;

    /// <summary>
    ///  Sets the hostname of the Ethernet Extension. The hostname will be displayed 
    ///  by access points as the hostname in the DHCP clients table.
    ///  
    ///  Setting an empty String will restore the default hostname.
    ///  
    ///  The current hostname can be discovered with <see cref="BrickMaster.TBrickMaster.GetEthernetStatus"/>.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    procedure SetEthernetHostname(const hostname: string); virtual;

    /// <summary>
    ///  Sets the MAC address of the Ethernet Extension. The Ethernet Extension should
    ///  come configured with a valid MAC address, that is also written on a
    ///  sticker of the extension itself.
    ///  
    ///  The MAC address can be read out again with <see cref="BrickMaster.TBrickMaster.GetEthernetStatus"/>.
    ///  
    ///  .. versionadded:: 2.1.0~(Firmware)
    /// </summary>
    procedure SetEthernetMACAddress(const macAddress: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  Sets the Ethernet WebSocket configuration. The first parameter sets the number of socket
    ///  connections that are reserved for WebSockets. The range is 0-7. The connections
    ///  are shared with the plain sockets. Example: If you set the connections to 3,
    ///  there will be 3 WebSocket and 4 plain socket connections available.
    ///  
    ///  The second parameter is the port for the WebSocket connections. The port can
    ///  not be the same as the port for the plain socket connections.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet configuration.
    ///  
    ///  The default values are 3 for the socket connections and 4280 for the port.
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    procedure SetEthernetWebsocketConfiguration(const sockets: byte; const port: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetEthernetConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    procedure GetEthernetWebsocketConfiguration(out sockets: byte; out port: word); virtual;

    /// <summary>
    ///  Sets the Ethernet authentication secret. The secret can be a string of up to 64
    ///  characters. An empty string disables the authentication.
    ///  
    ///  See the :ref:`authentication tutorial &lt;tutorial_authentication&gt;` for more
    ///  information.
    ///  
    ///  The secret is stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet authentication secret.
    ///  
    ///  The default value is an empty string (authentication disabled).
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    procedure SetEthernetAuthenticationSecret(const secret: string); virtual;

    /// <summary>
    ///  Returns the authentication secret as set by <see cref="BrickMaster.TBrickMaster.SetEthernetAuthenticationSecret"/>.
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    function GetEthernetAuthenticationSecret: string; virtual;

    /// <summary>
    ///  Sets the WIFI authentication secret. The secret can be a string of up to 64
    ///  characters. An empty string disables the authentication.
    ///  
    ///  See the :ref:`authentication tutorial &lt;tutorial_authentication&gt;` for more
    ///  information.
    ///  
    ///  The secret is stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the WIFI authentication secret.
    ///  
    ///  The default value is an empty string (authentication disabled).
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    procedure SetWifiAuthenticationSecret(const secret: string); virtual;

    /// <summary>
    ///  Returns the authentication secret as set by <see cref="BrickMaster.TBrickMaster.SetWifiAuthenticationSecret"/>.
    ///  
    ///  .. versionadded:: 2.2.0~(Firmware)
    /// </summary>
    function GetWifiAuthenticationSecret: string; virtual;

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
    ///  <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.StackCurrent"/> is only triggered if the current has changed since the
    ///  last triggering.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnStackCurrent: TBrickMasterNotifyStackCurrent read stackCurrentCallback write stackCurrentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.StackVoltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnStackVoltage: TBrickMasterNotifyStackVoltage read stackVoltageCallback write stackVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackPeriod"/>. The parameter is the USB voltage
    ///  in mV.
    ///  
    ///  <see cref="BrickMaster.TBrickMaster.USBVoltage"/> is only triggered if the USB voltage has changed since the
    ///  last triggering.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnUSBVoltage: TBrickMasterNotifyUSBVoltage read usbVoltageCallback write usbVoltageCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the stack current in mA.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnStackCurrentReached: TBrickMasterNotifyStackCurrentReached read stackCurrentReachedCallback write stackCurrentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the stack voltage in mV.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnStackVoltageReached: TBrickMasterNotifyStackVoltageReached read stackVoltageReachedCallback write stackVoltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5~(Firmware)
    /// </summary>
    property OnUSBVoltageReached: TBrickMasterNotifyUSBVoltageReached read usbVoltageReachedCallback write usbVoltageReachedCallback;
  end;

implementation

constructor TBrickMaster.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 3;

  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_EXTENSION_TYPE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_EXTENSION_TYPE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_IS_CHIBI_PRESENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_ADDRESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_MASTER_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_MASTER_ADDRESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_SLAVE_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_SLAVE_ADDRESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_SIGNAL_STRENGTH] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_ERROR_LOG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_FREQUENCY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_CHANNEL] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_CHANNEL] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_IS_RS485_PRESENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_RS485_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_RS485_ADDRESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_RS485_SLAVE_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_RS485_SLAVE_ADDRESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_RS485_ERROR_LOG] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_RS485_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_RS485_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_IS_WIFI_PRESENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_ENCRYPTION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_ENCRYPTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_STATUS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_REFRESH_WIFI_STATUS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_CERTIFICATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_CERTIFICATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_POWER_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_POWER_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_BUFFER_INFO] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_REGULATORY_DOMAIN] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_REGULATORY_DOMAIN] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_LONG_WIFI_KEY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_LONG_WIFI_KEY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_HOSTNAME] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_HOSTNAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_CALLBACK_STACK_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_CALLBACK_STACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_CALLBACK_USB_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_CALLBACK_STACK_CURRENT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_CALLBACK_STACK_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_CALLBACK_USB_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_IS_ETHERNET_PRESENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_STATUS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_HOSTNAME] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_MAC_ADDRESS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_AUTHENTICATION_SECRET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_AUTHENTICATION_SECRET] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_MASTER_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_MASTER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_MASTER_CALLBACK_STACK_CURRENT] := {$ifdef FPC}@{$endif}CallbackWrapperStackCurrent;
  callbackWrappers[BRICK_MASTER_CALLBACK_STACK_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperStackVoltage;
  callbackWrappers[BRICK_MASTER_CALLBACK_USB_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperUSBVoltage;
  callbackWrappers[BRICK_MASTER_CALLBACK_STACK_CURRENT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperStackCurrentReached;
  callbackWrappers[BRICK_MASTER_CALLBACK_STACK_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperStackVoltageReached;
  callbackWrappers[BRICK_MASTER_CALLBACK_USB_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperUSBVoltageReached;
end;

function TBrickMaster.GetStackVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickMaster.GetStackCurrent: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickMaster.SetExtensionType(const extension: byte; const exttype: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_EXTENSION_TYPE, 13);
  LEConvertUInt8To(extension, 8, request);
  LEConvertUInt32To(exttype, 9, request);
  SendRequest(request);
end;

function TBrickMaster.GetExtensionType(const extension: byte): longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_EXTENSION_TYPE, 9);
  LEConvertUInt8To(extension, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

function TBrickMaster.IsChibiPresent: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_CHIBI_PRESENT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickMaster.SetChibiAddress(const address: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_ADDRESS, 9);
  LEConvertUInt8To(address, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetChibiAddress: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_ADDRESS, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.SetChibiMasterAddress(const address: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_MASTER_ADDRESS, 9);
  LEConvertUInt8To(address, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetChibiMasterAddress: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_MASTER_ADDRESS, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.SetChibiSlaveAddress(const num: byte; const address: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_SLAVE_ADDRESS, 10);
  LEConvertUInt8To(num, 8, request);
  LEConvertUInt8To(address, 9, request);
  SendRequest(request);
end;

function TBrickMaster.GetChibiSlaveAddress(const num: byte): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_SLAVE_ADDRESS, 9);
  LEConvertUInt8To(num, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickMaster.GetChibiSignalStrength: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_SIGNAL_STRENGTH, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.GetChibiErrorLog(out underrun: word; out crcError: word; out noAck: word; out overflow: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_ERROR_LOG, 8);
  response := SendRequest(request);
  underrun := LEConvertUInt16From(8, response);
  crcError := LEConvertUInt16From(10, response);
  noAck := LEConvertUInt16From(12, response);
  overflow := LEConvertUInt16From(14, response);
end;

procedure TBrickMaster.SetChibiFrequency(const frequency: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_FREQUENCY, 9);
  LEConvertUInt8To(frequency, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetChibiFrequency: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_FREQUENCY, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.SetChibiChannel(const channel: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_CHANNEL, 9);
  LEConvertUInt8To(channel, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetChibiChannel: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_CHANNEL, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickMaster.IsRS485Present: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_RS485_PRESENT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickMaster.SetRS485Address(const address: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_ADDRESS, 9);
  LEConvertUInt8To(address, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetRS485Address: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_ADDRESS, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.SetRS485SlaveAddress(const num: byte; const address: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_SLAVE_ADDRESS, 10);
  LEConvertUInt8To(num, 8, request);
  LEConvertUInt8To(address, 9, request);
  SendRequest(request);
end;

function TBrickMaster.GetRS485SlaveAddress(const num: byte): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_SLAVE_ADDRESS, 9);
  LEConvertUInt8To(num, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickMaster.GetRS485ErrorLog: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_ERROR_LOG, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickMaster.SetRS485Configuration(const speed: longword; const parity: char; const stopbits: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_CONFIGURATION, 14);
  LEConvertUInt32To(speed, 8, request);
  LEConvertCharTo(parity, 12, request);
  LEConvertUInt8To(stopbits, 13, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetRS485Configuration(out speed: longword; out parity: char; out stopbits: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_CONFIGURATION, 8);
  response := SendRequest(request);
  speed := LEConvertUInt32From(8, response);
  parity := LEConvertCharFrom(12, response);
  stopbits := LEConvertUInt8From(13, response);
end;

function TBrickMaster.IsWifiPresent: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_WIFI_PRESENT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickMaster.SetWifiConfiguration(const ssid: string; const connection: byte; const ip: TArray0To3OfUInt8; const subnetMask: TArray0To3OfUInt8; const gateway: TArray0To3OfUInt8; const port: word);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_CONFIGURATION, 55);
  LEConvertStringTo(ssid, 8, 32, request);
  LEConvertUInt8To(connection, 40, request);
  for i := 0 to Length(ip) - 1 do LEConvertUInt8To(ip[i], 41 + (i * 1), request);
  for i := 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[i], 45 + (i * 1), request);
  for i := 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[i], 49 + (i * 1), request);
  LEConvertUInt16To(port, 53, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetWifiConfiguration(out ssid: string; out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_CONFIGURATION, 8);
  response := SendRequest(request);
  ssid := LEConvertStringFrom(8, 32, response);
  connection := LEConvertUInt8From(40, response);
  for i := 0 to 3 do ip[i] := LEConvertUInt8From(41 + (i * 1), response);
  for i := 0 to 3 do subnetMask[i] := LEConvertUInt8From(45 + (i * 1), response);
  for i := 0 to 3 do gateway[i] := LEConvertUInt8From(49 + (i * 1), response);
  port := LEConvertUInt16From(53, response);
end;

procedure TBrickMaster.SetWifiEncryption(const encryption: byte; const key: string; const keyIndex: byte; const eapOptions: byte; const caCertificateLength: word; const clientCertificateLength: word; const privateKeyLength: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_ENCRYPTION, 67);
  LEConvertUInt8To(encryption, 8, request);
  LEConvertStringTo(key, 9, 50, request);
  LEConvertUInt8To(keyIndex, 59, request);
  LEConvertUInt8To(eapOptions, 60, request);
  LEConvertUInt16To(caCertificateLength, 61, request);
  LEConvertUInt16To(clientCertificateLength, 63, request);
  LEConvertUInt16To(privateKeyLength, 65, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetWifiEncryption(out encryption: byte; out key: string; out keyIndex: byte; out eapOptions: byte; out caCertificateLength: word; out clientCertificateLength: word; out privateKeyLength: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_ENCRYPTION, 8);
  response := SendRequest(request);
  encryption := LEConvertUInt8From(8, response);
  key := LEConvertStringFrom(9, 50, response);
  keyIndex := LEConvertUInt8From(59, response);
  eapOptions := LEConvertUInt8From(60, response);
  caCertificateLength := LEConvertUInt16From(61, response);
  clientCertificateLength := LEConvertUInt16From(63, response);
  privateKeyLength := LEConvertUInt16From(65, response);
end;

procedure TBrickMaster.GetWifiStatus(out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8; out channel: byte; out rssi: smallint; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out state: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_STATUS, 8);
  response := SendRequest(request);
  for i := 0 to 5 do macAddress[i] := LEConvertUInt8From(8 + (i * 1), response);
  for i := 0 to 5 do bssid[i] := LEConvertUInt8From(14 + (i * 1), response);
  channel := LEConvertUInt8From(20, response);
  rssi := LEConvertInt16From(21, response);
  for i := 0 to 3 do ip[i] := LEConvertUInt8From(23 + (i * 1), response);
  for i := 0 to 3 do subnetMask[i] := LEConvertUInt8From(27 + (i * 1), response);
  for i := 0 to 3 do gateway[i] := LEConvertUInt8From(31 + (i * 1), response);
  rxCount := LEConvertUInt32From(35, response);
  txCount := LEConvertUInt32From(39, response);
  state := LEConvertUInt8From(43, response);
end;

procedure TBrickMaster.RefreshWifiStatus;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_REFRESH_WIFI_STATUS, 8);
  SendRequest(request);
end;

procedure TBrickMaster.SetWifiCertificate(const index: word; const data: TArray0To31OfUInt8; const dataLength: byte);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_CERTIFICATE, 43);
  LEConvertUInt16To(index, 8, request);
  for i := 0 to Length(data) - 1 do LEConvertUInt8To(data[i], 10 + (i * 1), request);
  LEConvertUInt8To(dataLength, 42, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetWifiCertificate(const index: word; out data: TArray0To31OfUInt8; out dataLength: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_CERTIFICATE, 10);
  LEConvertUInt16To(index, 8, request);
  response := SendRequest(request);
  for i := 0 to 31 do data[i] := LEConvertUInt8From(8 + (i * 1), response);
  dataLength := LEConvertUInt8From(40, response);
end;

procedure TBrickMaster.SetWifiPowerMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_POWER_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetWifiPowerMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_POWER_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickMaster.GetWifiBufferInfo(out overflow: longword; out lowWatermark: word; out used: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_BUFFER_INFO, 8);
  response := SendRequest(request);
  overflow := LEConvertUInt32From(8, response);
  lowWatermark := LEConvertUInt16From(12, response);
  used := LEConvertUInt16From(14, response);
end;

procedure TBrickMaster.SetWifiRegulatoryDomain(const domain: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_REGULATORY_DOMAIN, 9);
  LEConvertUInt8To(domain, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetWifiRegulatoryDomain: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_REGULATORY_DOMAIN, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickMaster.GetUSBVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickMaster.SetLongWifiKey(const key: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_LONG_WIFI_KEY, 72);
  LEConvertStringTo(key, 8, 64, request);
  SendRequest(request);
end;

function TBrickMaster.GetLongWifiKey: string;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_LONG_WIFI_KEY, 8);
  response := SendRequest(request);
  result := LEConvertStringFrom(8, 64, response);
end;

procedure TBrickMaster.SetWifiHostname(const hostname: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_HOSTNAME, 24);
  LEConvertStringTo(hostname, 8, 16, request);
  SendRequest(request);
end;

function TBrickMaster.GetWifiHostname: string;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_HOSTNAME, 8);
  response := SendRequest(request);
  result := LEConvertStringFrom(8, 16, response);
end;

procedure TBrickMaster.SetStackCurrentCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetStackCurrentCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickMaster.SetStackVoltageCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetStackVoltageCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickMaster.SetUSBVoltageCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetUSBVoltageCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickMaster.SetStackCurrentCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetStackCurrentCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickMaster.SetStackVoltageCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetStackVoltageCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickMaster.SetUSBVoltageCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetUSBVoltageCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickMaster.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickMaster.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

function TBrickMaster.IsEthernetPresent: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_ETHERNET_PRESENT, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickMaster.SetEthernetConfiguration(const connection: byte; const ip: TArray0To3OfUInt8; const subnetMask: TArray0To3OfUInt8; const gateway: TArray0To3OfUInt8; const port: word);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_CONFIGURATION, 23);
  LEConvertUInt8To(connection, 8, request);
  for i := 0 to Length(ip) - 1 do LEConvertUInt8To(ip[i], 9 + (i * 1), request);
  for i := 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[i], 13 + (i * 1), request);
  for i := 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[i], 17 + (i * 1), request);
  LEConvertUInt16To(port, 21, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetEthernetConfiguration(out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_CONFIGURATION, 8);
  response := SendRequest(request);
  connection := LEConvertUInt8From(8, response);
  for i := 0 to 3 do ip[i] := LEConvertUInt8From(9 + (i * 1), response);
  for i := 0 to 3 do subnetMask[i] := LEConvertUInt8From(13 + (i * 1), response);
  for i := 0 to 3 do gateway[i] := LEConvertUInt8From(17 + (i * 1), response);
  port := LEConvertUInt16From(21, response);
end;

procedure TBrickMaster.GetEthernetStatus(out macAddress: TArray0To5OfUInt8; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out hostname: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_STATUS, 8);
  response := SendRequest(request);
  for i := 0 to 5 do macAddress[i] := LEConvertUInt8From(8 + (i * 1), response);
  for i := 0 to 3 do ip[i] := LEConvertUInt8From(14 + (i * 1), response);
  for i := 0 to 3 do subnetMask[i] := LEConvertUInt8From(18 + (i * 1), response);
  for i := 0 to 3 do gateway[i] := LEConvertUInt8From(22 + (i * 1), response);
  rxCount := LEConvertUInt32From(26, response);
  txCount := LEConvertUInt32From(30, response);
  hostname := LEConvertStringFrom(34, 32, response);
end;

procedure TBrickMaster.SetEthernetHostname(const hostname: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_HOSTNAME, 40);
  LEConvertStringTo(hostname, 8, 32, request);
  SendRequest(request);
end;

procedure TBrickMaster.SetEthernetMACAddress(const macAddress: TArray0To5OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_MAC_ADDRESS, 14);
  for i := 0 to Length(macAddress) - 1 do LEConvertUInt8To(macAddress[i], 8 + (i * 1), request);
  SendRequest(request);
end;

procedure TBrickMaster.SetEthernetWebsocketConfiguration(const sockets: byte; const port: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION, 11);
  LEConvertUInt8To(sockets, 8, request);
  LEConvertUInt16To(port, 9, request);
  SendRequest(request);
end;

procedure TBrickMaster.GetEthernetWebsocketConfiguration(out sockets: byte; out port: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION, 8);
  response := SendRequest(request);
  sockets := LEConvertUInt8From(8, response);
  port := LEConvertUInt16From(9, response);
end;

procedure TBrickMaster.SetEthernetAuthenticationSecret(const secret: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET, 72);
  LEConvertStringTo(secret, 8, 64, request);
  SendRequest(request);
end;

function TBrickMaster.GetEthernetAuthenticationSecret: string;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET, 8);
  response := SendRequest(request);
  result := LEConvertStringFrom(8, 64, response);
end;

procedure TBrickMaster.SetWifiAuthenticationSecret(const secret: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_AUTHENTICATION_SECRET, 72);
  LEConvertStringTo(secret, 8, 64, request);
  SendRequest(request);
end;

function TBrickMaster.GetWifiAuthenticationSecret: string;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_AUTHENTICATION_SECRET, 8);
  response := SendRequest(request);
  result := LEConvertStringFrom(8, 64, response);
end;

procedure TBrickMaster.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickMaster.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickMaster.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickMaster.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickMaster.CallbackWrapperStackCurrent(const packet: TByteArray);
var current: word;
begin
  if (Assigned(stackCurrentCallback)) then begin
    current := LEConvertUInt16From(8, packet);
    stackCurrentCallback(self, current);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(stackVoltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    stackVoltageCallback(self, voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperUSBVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(usbVoltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    usbVoltageCallback(self, voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackCurrentReached(const packet: TByteArray);
var current: word;
begin
  if (Assigned(stackCurrentReachedCallback)) then begin
    current := LEConvertUInt16From(8, packet);
    stackCurrentReachedCallback(self, current);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackVoltageReached(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(stackVoltageReachedCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    stackVoltageReachedCallback(self, voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperUSBVoltageReached(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(usbVoltageReachedCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    usbVoltageReachedCallback(self, voltage);
  end;
end;

end.
