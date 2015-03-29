{
  This file was automatically generated on 2014-12-29.

  Bindings Version 2.1.5

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickRED;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_RED_DEVICE_IDENTIFIER = 17;

  BRICK_RED_FUNCTION_CREATE_SESSION = 1;
  BRICK_RED_FUNCTION_EXPIRE_SESSION = 2;
  BRICK_RED_FUNCTION_EXPIRE_SESSION_UNCHECKED = 3;
  BRICK_RED_FUNCTION_KEEP_SESSION_ALIVE = 4;
  BRICK_RED_FUNCTION_RELEASE_OBJECT = 5;
  BRICK_RED_FUNCTION_RELEASE_OBJECT_UNCHECKED = 6;
  BRICK_RED_FUNCTION_ALLOCATE_STRING = 7;
  BRICK_RED_FUNCTION_TRUNCATE_STRING = 8;
  BRICK_RED_FUNCTION_GET_STRING_LENGTH = 9;
  BRICK_RED_FUNCTION_SET_STRING_CHUNK = 10;
  BRICK_RED_FUNCTION_GET_STRING_CHUNK = 11;
  BRICK_RED_FUNCTION_ALLOCATE_LIST = 12;
  BRICK_RED_FUNCTION_GET_LIST_LENGTH = 13;
  BRICK_RED_FUNCTION_GET_LIST_ITEM = 14;
  BRICK_RED_FUNCTION_APPEND_TO_LIST = 15;
  BRICK_RED_FUNCTION_REMOVE_FROM_LIST = 16;
  BRICK_RED_FUNCTION_OPEN_FILE = 17;
  BRICK_RED_FUNCTION_CREATE_PIPE = 18;
  BRICK_RED_FUNCTION_GET_FILE_INFO = 19;
  BRICK_RED_FUNCTION_READ_FILE = 20;
  BRICK_RED_FUNCTION_READ_FILE_ASYNC = 21;
  BRICK_RED_FUNCTION_ABORT_ASYNC_FILE_READ = 22;
  BRICK_RED_FUNCTION_WRITE_FILE = 23;
  BRICK_RED_FUNCTION_WRITE_FILE_UNCHECKED = 24;
  BRICK_RED_FUNCTION_WRITE_FILE_ASYNC = 25;
  BRICK_RED_FUNCTION_SET_FILE_POSITION = 26;
  BRICK_RED_FUNCTION_GET_FILE_POSITION = 27;
  BRICK_RED_FUNCTION_SET_FILE_EVENTS = 28;
  BRICK_RED_FUNCTION_GET_FILE_EVENTS = 29;
  BRICK_RED_FUNCTION_OPEN_DIRECTORY = 33;
  BRICK_RED_FUNCTION_GET_DIRECTORY_NAME = 34;
  BRICK_RED_FUNCTION_GET_NEXT_DIRECTORY_ENTRY = 35;
  BRICK_RED_FUNCTION_REWIND_DIRECTORY = 36;
  BRICK_RED_FUNCTION_CREATE_DIRECTORY = 37;
  BRICK_RED_FUNCTION_GET_PROCESSES = 38;
  BRICK_RED_FUNCTION_SPAWN_PROCESS = 39;
  BRICK_RED_FUNCTION_KILL_PROCESS = 40;
  BRICK_RED_FUNCTION_GET_PROCESS_COMMAND = 41;
  BRICK_RED_FUNCTION_GET_PROCESS_IDENTITY = 42;
  BRICK_RED_FUNCTION_GET_PROCESS_STDIO = 43;
  BRICK_RED_FUNCTION_GET_PROCESS_STATE = 44;
  BRICK_RED_FUNCTION_GET_PROGRAMS = 46;
  BRICK_RED_FUNCTION_DEFINE_PROGRAM = 47;
  BRICK_RED_FUNCTION_PURGE_PROGRAM = 48;
  BRICK_RED_FUNCTION_GET_PROGRAM_IDENTIFIER = 49;
  BRICK_RED_FUNCTION_GET_PROGRAM_ROOT_DIRECTORY = 50;
  BRICK_RED_FUNCTION_SET_PROGRAM_COMMAND = 51;
  BRICK_RED_FUNCTION_GET_PROGRAM_COMMAND = 52;
  BRICK_RED_FUNCTION_SET_PROGRAM_STDIO_REDIRECTION = 53;
  BRICK_RED_FUNCTION_GET_PROGRAM_STDIO_REDIRECTION = 54;
  BRICK_RED_FUNCTION_SET_PROGRAM_SCHEDULE = 55;
  BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULE = 56;
  BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULER_STATE = 57;
  BRICK_RED_FUNCTION_CONTINUE_PROGRAM_SCHEDULE = 58;
  BRICK_RED_FUNCTION_START_PROGRAM = 59;
  BRICK_RED_FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS = 60;
  BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES = 61;
  BRICK_RED_FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE = 62;
  BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE = 63;
  BRICK_RED_FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION = 64;
  BRICK_RED_FUNCTION_GET_IDENTITY = 255;

  BRICK_RED_CALLBACK_ASYNC_FILE_READ = 30;
  BRICK_RED_CALLBACK_ASYNC_FILE_WRITE = 31;
  BRICK_RED_CALLBACK_FILE_EVENTS_OCCURRED = 32;
  BRICK_RED_CALLBACK_PROCESS_STATE_CHANGED = 45;
  BRICK_RED_CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED = 65;
  BRICK_RED_CALLBACK_PROGRAM_PROCESS_SPAWNED = 66;

  BRICK_RED_OBJECT_TYPE_STRING = 0;
  BRICK_RED_OBJECT_TYPE_LIST = 1;
  BRICK_RED_OBJECT_TYPE_FILE = 2;
  BRICK_RED_OBJECT_TYPE_DIRECTORY = 3;
  BRICK_RED_OBJECT_TYPE_PROCESS = 4;
  BRICK_RED_OBJECT_TYPE_PROGRAM = 5;
  BRICK_RED_FILE_FLAG_READ_ONLY = 1;
  BRICK_RED_FILE_FLAG_WRITE_ONLY = 2;
  BRICK_RED_FILE_FLAG_READ_WRITE = 4;
  BRICK_RED_FILE_FLAG_APPEND = 8;
  BRICK_RED_FILE_FLAG_CREATE = 16;
  BRICK_RED_FILE_FLAG_EXCLUSIVE = 32;
  BRICK_RED_FILE_FLAG_NON_BLOCKING = 64;
  BRICK_RED_FILE_FLAG_TRUNCATE = 128;
  BRICK_RED_FILE_FLAG_TEMPORARY = 256;
  BRICK_RED_FILE_FLAG_REPLACE = 512;
  BRICK_RED_FILE_PERMISSION_USER_ALL = 448;
  BRICK_RED_FILE_PERMISSION_USER_READ = 256;
  BRICK_RED_FILE_PERMISSION_USER_WRITE = 128;
  BRICK_RED_FILE_PERMISSION_USER_EXECUTE = 64;
  BRICK_RED_FILE_PERMISSION_GROUP_ALL = 56;
  BRICK_RED_FILE_PERMISSION_GROUP_READ = 32;
  BRICK_RED_FILE_PERMISSION_GROUP_WRITE = 16;
  BRICK_RED_FILE_PERMISSION_GROUP_EXECUTE = 8;
  BRICK_RED_FILE_PERMISSION_OTHERS_ALL = 7;
  BRICK_RED_FILE_PERMISSION_OTHERS_READ = 4;
  BRICK_RED_FILE_PERMISSION_OTHERS_WRITE = 2;
  BRICK_RED_FILE_PERMISSION_OTHERS_EXECUTE = 1;
  BRICK_RED_PIPE_FLAG_NON_BLOCKING_READ = 1;
  BRICK_RED_PIPE_FLAG_NON_BLOCKING_WRITE = 2;
  BRICK_RED_FILE_TYPE_UNKNOWN = 0;
  BRICK_RED_FILE_TYPE_REGULAR = 1;
  BRICK_RED_FILE_TYPE_DIRECTORY = 2;
  BRICK_RED_FILE_TYPE_CHARACTER = 3;
  BRICK_RED_FILE_TYPE_BLOCK = 4;
  BRICK_RED_FILE_TYPE_FIFO = 5;
  BRICK_RED_FILE_TYPE_SYMLINK = 6;
  BRICK_RED_FILE_TYPE_SOCKET = 7;
  BRICK_RED_FILE_TYPE_PIPE = 8;
  BRICK_RED_FILE_ORIGIN_BEGINNING = 0;
  BRICK_RED_FILE_ORIGIN_CURRENT = 1;
  BRICK_RED_FILE_ORIGIN_END = 2;
  BRICK_RED_FILE_EVENT_READABLE = 1;
  BRICK_RED_FILE_EVENT_WRITABLE = 2;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_UNKNOWN = 0;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_REGULAR = 1;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_DIRECTORY = 2;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_CHARACTER = 3;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_BLOCK = 4;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_FIFO = 5;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_SYMLINK = 6;
  BRICK_RED_DIRECTORY_ENTRY_TYPE_SOCKET = 7;
  BRICK_RED_DIRECTORY_FLAG_RECURSIVE = 1;
  BRICK_RED_DIRECTORY_FLAG_EXCLUSIVE = 2;
  BRICK_RED_PROCESS_SIGNAL_INTERRUPT = 2;
  BRICK_RED_PROCESS_SIGNAL_QUIT = 3;
  BRICK_RED_PROCESS_SIGNAL_ABORT = 6;
  BRICK_RED_PROCESS_SIGNAL_KILL = 9;
  BRICK_RED_PROCESS_SIGNAL_USER1 = 10;
  BRICK_RED_PROCESS_SIGNAL_USER2 = 12;
  BRICK_RED_PROCESS_SIGNAL_TERMINATE = 15;
  BRICK_RED_PROCESS_SIGNAL_CONTINUE = 18;
  BRICK_RED_PROCESS_SIGNAL_STOP = 19;
  BRICK_RED_PROCESS_STATE_UNKNOWN = 0;
  BRICK_RED_PROCESS_STATE_RUNNING = 1;
  BRICK_RED_PROCESS_STATE_ERROR = 2;
  BRICK_RED_PROCESS_STATE_EXITED = 3;
  BRICK_RED_PROCESS_STATE_KILLED = 4;
  BRICK_RED_PROCESS_STATE_STOPPED = 5;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_DEV_NULL = 0;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_PIPE = 1;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_FILE = 2;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_INDIVIDUAL_LOG = 3;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_CONTINUOUS_LOG = 4;
  BRICK_RED_PROGRAM_STDIO_REDIRECTION_STDOUT = 5;
  BRICK_RED_PROGRAM_START_MODE_NEVER = 0;
  BRICK_RED_PROGRAM_START_MODE_ALWAYS = 1;
  BRICK_RED_PROGRAM_START_MODE_INTERVAL = 2;
  BRICK_RED_PROGRAM_START_MODE_CRON = 3;
  BRICK_RED_PROGRAM_SCHEDULER_STATE_STOPPED = 0;
  BRICK_RED_PROGRAM_SCHEDULER_STATE_RUNNING = 1;

type
  TArray0To61OfUInt8 = array [0..61] of byte;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To60OfUInt8 = array [0..60] of byte;

  TBrickRED = class;
  TBrickREDNotifyAsyncFileRead = procedure(sender: TBrickRED; const fileId: word; const errorCode: byte; const buffer: TArray0To59OfUInt8; const lengthRead: byte) of object;
  TBrickREDNotifyAsyncFileWrite = procedure(sender: TBrickRED; const fileId: word; const errorCode: byte; const lengthWritten: byte) of object;
  TBrickREDNotifyFileEventsOccurred = procedure(sender: TBrickRED; const fileId: word; const events: word) of object;
  TBrickREDNotifyProcessStateChanged = procedure(sender: TBrickRED; const processId: word; const state: byte; const timestamp: uint64; const exitCode: byte) of object;
  TBrickREDNotifyProgramSchedulerStateChanged = procedure(sender: TBrickRED; const programId: word) of object;
  TBrickREDNotifyProgramProcessSpawned = procedure(sender: TBrickRED; const programId: word) of object;

  /// <summary>
  ///  Device for executing user programs standalone
  /// </summary>
  TBrickRED = class(TDevice)
  private
    asyncFileReadCallback: TBrickREDNotifyAsyncFileRead;
    asyncFileWriteCallback: TBrickREDNotifyAsyncFileWrite;
    fileEventsOccurredCallback: TBrickREDNotifyFileEventsOccurred;
    processStateChangedCallback: TBrickREDNotifyProcessStateChanged;
    programSchedulerStateChangedCallback: TBrickREDNotifyProgramSchedulerStateChanged;
    programProcessSpawnedCallback: TBrickREDNotifyProgramProcessSpawned;
  protected
    procedure CallbackWrapperAsyncFileRead(const packet: TByteArray); virtual;
    procedure CallbackWrapperAsyncFileWrite(const packet: TByteArray); virtual;
    procedure CallbackWrapperFileEventsOccurred(const packet: TByteArray); virtual;
    procedure CallbackWrapperProcessStateChanged(const packet: TByteArray); virtual;
    procedure CallbackWrapperProgramSchedulerStateChanged(const packet: TByteArray); virtual;
    procedure CallbackWrapperProgramProcessSpawned(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  
    /// </summary>
    procedure CreateSession(const lifetime: longword; out errorCode: byte; out sessionId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function ExpireSession(const sessionId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure ExpireSessionUnchecked(const sessionId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function KeepSessionAlive(const sessionId: word; const lifetime: longword): byte; virtual;

    /// <summary>
    ///  Decreases the reference count of an object by one and returns the resulting
    ///  error code. If the reference count reaches zero the object gets destroyed.
    /// </summary>
    function ReleaseObject(const objectId: word; const sessionId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure ReleaseObjectUnchecked(const objectId: word; const sessionId: word); virtual;

    /// <summary>
    ///  Allocates a new string object, reserves ``length_to_reserve`` bytes memory
    ///  for it and sets up to the first 60 bytes. Set ``length_to_reserve`` to the
    ///  length of the string that should be stored in the string object.
    ///  
    ///  Returns the object ID of the new string object and the resulting error code.
    /// </summary>
    procedure AllocateString(const lengthToReserve: longword; const buffer: string; const sessionId: word; out errorCode: byte; out stringId: word); virtual;

    /// <summary>
    ///  Truncates a string object to ``length`` bytes and returns the resulting
    ///  error code.
    /// </summary>
    function TruncateString(const stringId: word; const length2: longword): byte; virtual;

    /// <summary>
    ///  Returns the length of a string object in bytes and the resulting error code.
    /// </summary>
    procedure GetStringLength(const stringId: word; out errorCode: byte; out length2: longword); virtual;

    /// <summary>
    ///  Sets a chunk of up to 58 bytes in a string object beginning at ``offset``.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function SetStringChunk(const stringId: word; const offset: longword; const buffer: string): byte; virtual;

    /// <summary>
    ///  Returns a chunk up to 63 bytes from a string object beginning at ``offset`` and
    ///  returns the resulting error code.
    /// </summary>
    procedure GetStringChunk(const stringId: word; const offset: longword; out errorCode: byte; out buffer: string); virtual;

    /// <summary>
    ///  Allocates a new list object and reserves memory for ``length_to_reserve``
    ///  items. Set ``length_to_reserve`` to the number of items that should be stored
    ///  in the list object.
    ///  
    ///  Returns the object ID of the new list object and the resulting error code.
    ///  
    ///  When a list object gets destroyed then the reference count of each object in
    ///  the list object is decreased by one.
    /// </summary>
    procedure AllocateList(const lengthToReserve: word; const sessionId: word; out errorCode: byte; out listId: word); virtual;

    /// <summary>
    ///  Returns the length of a list object in items and the resulting error code.
    /// </summary>
    procedure GetListLength(const listId: word; out errorCode: byte; out length2: word); virtual;

    /// <summary>
    ///  Returns the object ID and type of the object stored at ``index`` in a list
    ///  object and returns the resulting error code.
    ///  
    ///  Possible object types are:
    ///  
    ///  * String = 0
    ///  * List = 1
    ///  * File = 2
    ///  * Directory = 3
    ///  * Process = 4
    ///  * Program = 5
    /// </summary>
    procedure GetListItem(const listId: word; const index: word; const sessionId: word; out errorCode: byte; out itemObjectId: word; out objectType: byte); virtual;

    /// <summary>
    ///  Appends an object to a list object and increases the reference count of the
    ///  appended object by one.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function AppendToList(const listId: word; const itemObjectId: word): byte; virtual;

    /// <summary>
    ///  Removes the object stored at ``index`` from a list object and decreases the
    ///  reference count of the removed object by one.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function RemoveFromList(const listId: word; const index: word): byte; virtual;

    /// <summary>
    ///  Opens an existing file or creates a new file and allocates a new file object
    ///  for it.
    ///  
    ///  FIXME: name has to be absolute
    ///  
    ///  The reference count of the name string object is increased by one. When the
    ///  file object gets destroyed then the reference count of the name string object is
    ///  decreased by one. Also the name string object is locked and cannot be modified
    ///  while the file object holds a reference to it.
    ///  
    ///  The ``flags`` parameter takes a ORed combination of the following possible file
    ///  flags (in hexadecimal notation):
    ///  
    ///  * ReadOnly = 0x0001 (O_RDONLY)
    ///  * WriteOnly = 0x0002 (O_WRONLY)
    ///  * ReadWrite = 0x0004 (O_RDWR)
    ///  * Append = 0x0008 (O_APPEND)
    ///  * Create = 0x0010 (O_CREAT)
    ///  * Exclusive = 0x0020 (O_EXCL)
    ///  * NonBlocking = 0x0040 (O_NONBLOCK)
    ///  * Truncate = 0x0080 (O_TRUNC)
    ///  * Temporary = 0x0100
    ///  * Replace = 0x0200
    ///  
    ///  FIXME: explain *Temporary* and *Replace* flag
    ///  
    ///  The ``permissions`` parameter takes a ORed combination of the following
    ///  possible file permissions (in octal notation) that match the common UNIX
    ///  permission bits:
    ///  
    ///  * UserRead = 00400
    ///  * UserWrite = 00200
    ///  * UserExecute = 00100
    ///  * GroupRead = 00040
    ///  * GroupWrite = 00020
    ///  * GroupExecute = 00010
    ///  * OthersRead = 00004
    ///  * OthersWrite = 00002
    ///  * OthersExecute = 00001
    ///  
    ///  Returns the object ID of the new file object and the resulting error code.
    /// </summary>
    procedure OpenFile(const nameStringId: word; const flags: longword; const permissions: word; const uid: longword; const gid: longword; const sessionId: word; out errorCode: byte; out fileId: word); virtual;

    /// <summary>
    ///  Creates a new pipe and allocates a new file object for it.
    ///  
    ///  The ``flags`` parameter takes a ORed combination of the following possible
    ///  pipe flags (in hexadecimal notation):
    ///  
    ///  * NonBlockingRead = 0x0001
    ///  * NonBlockingWrite = 0x0002
    ///  
    ///  The length of the pipe buffer can be specified with the ``length`` parameter
    ///  in bytes. If length is set to zero, then the default pipe buffer length is used.
    ///  
    ///  Returns the object ID of the new file object and the resulting error code.
    /// </summary>
    procedure CreatePipe(const flags: longword; const length2: uint64; const sessionId: word; out errorCode: byte; out fileId: word); virtual;

    /// <summary>
    ///  Returns various information about a file and the resulting error code.
    ///  
    ///  Possible file types are:
    ///  
    ///  * Unknown = 0
    ///  * Regular = 1
    ///  * Directory = 2
    ///  * Character = 3
    ///  * Block = 4
    ///  * FIFO = 5
    ///  * Symlink = 6
    ///  * Socket = 7
    ///  * Pipe = 8
    ///  
    ///  If the file type is *Pipe* then the returned name string object is invalid,
    ///  because a pipe has no name. Otherwise the returned name string object was used
    ///  to open or create the file object, as passed to <see cref="BrickRED.TBrickRED.OpenFile"/>.
    ///  
    ///  The returned flags were used to open or create the file object, as passed to
    ///  <see cref="BrickRED.TBrickRED.OpenFile"/> or <see cref="BrickRED.TBrickRED.CreatePipe"/>. See the respective function for a list
    ///  of possible file and pipe flags.
    ///  
    ///  FIXME: everything except flags and length is invalid if file type is *Pipe*
    /// </summary>
    procedure GetFileInfo(const fileId: word; const sessionId: word; out errorCode: byte; out fileType: byte; out nameStringId: word; out flags: longword; out permissions: word; out uid: longword; out gid: longword; out length2: uint64; out accessTimestamp: uint64; out modificationTimestamp: uint64; out statusChangeTimestamp: uint64); virtual;

    /// <summary>
    ///  Reads up to 62 bytes from a file object.
    ///  
    ///  Returns the bytes read, the actual number of bytes read and the resulting
    ///  error code.
    ///  
    ///  If there is not data to be read, either because the file position reached
    ///  end-of-file or because there is not data in the pipe, then zero bytes are
    ///  returned.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingRead* flag then the
    ///  error code *NotSupported* is returned.
    /// </summary>
    procedure ReadFile(const fileId: word; const lengthToRead: byte; out errorCode: byte; out buffer: TArray0To61OfUInt8; out lengthRead: byte); virtual;

    /// <summary>
    ///  Reads up to 2\ :sup:`63`\  - 1 bytes from a file object asynchronously.
    ///  
    ///  Reports the bytes read (in 60 byte chunks), the actual number of bytes read and
    ///  the resulting error code via the <see cref="BrickRED.TBrickRED.AsyncFileRead"/> callback.
    ///  
    ///  If there is not data to be read, either because the file position reached
    ///  end-of-file or because there is not data in the pipe, then zero bytes are
    ///  reported.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingRead* flag then the error
    ///  code *NotSupported* is reported via the <see cref="BrickRED.TBrickRED.AsyncFileRead"/> callback.
    /// </summary>
    procedure ReadFileAsync(const fileId: word; const lengthToRead: uint64); virtual;

    /// <summary>
    ///  Aborts a <see cref="BrickRED.TBrickRED.ReadFileAsync"/> operation in progress.
    ///  
    ///  Returns the resulting error code.
    ///  
    ///  On success the <see cref="BrickRED.TBrickRED.AsyncFileRead"/> callback will report *OperationAborted*.
    /// </summary>
    function AbortAsyncFileRead(const fileId: word): byte; virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Returns the actual number of bytes written and the resulting error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  error code *NotSupported* is returned.
    /// </summary>
    procedure WriteFile(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte; out errorCode: byte; out lengthWritten: byte); virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Does neither report the actual number of bytes written nor the resulting error
    ///  code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  write operation will fail silently.
    /// </summary>
    procedure WriteFileUnchecked(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte); virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Reports the actual number of bytes written and the resulting error code via the
    ///  <see cref="BrickRED.TBrickRED.AsyncFileWrite"/> callback.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  error code *NotSupported* is reported via the <see cref="BrickRED.TBrickRED.AsyncFileWrite"/> callback.
    /// </summary>
    procedure WriteFileAsync(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte); virtual;

    /// <summary>
    ///  Set the current seek position of a file object in bytes relative to ``origin``.
    ///  
    ///  Possible file origins are:
    ///  
    ///  * Beginning = 0
    ///  * Current = 1
    ///  * End = 2
    ///  
    ///  Returns the resulting absolute seek position and error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.CreatePipe"/> then it has no seek
    ///  position and the error code *InvalidSeek* is returned.
    /// </summary>
    procedure SetFilePosition(const fileId: word; const offset: int64; const origin: byte; out errorCode: byte; out position: uint64); virtual;

    /// <summary>
    ///  Returns the current seek position of a file object in bytes and returns the
    ///  resulting error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.CreatePipe"/> then it has no seek
    ///  position and the error code *InvalidSeek* is returned.
    /// </summary>
    procedure GetFilePosition(const fileId: word; out errorCode: byte; out position: uint64); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetFileEvents(const fileId: word; const events: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetFileEvents(const fileId: word; out errorCode: byte; out events: word); virtual;

    /// <summary>
    ///  Opens an existing directory and allocates a new directory object for it.
    ///  
    ///  FIXME: name has to be absolute
    ///  
    ///  The reference count of the name string object is increased by one. When the
    ///  directory object is destroyed then the reference count of the name string
    ///  object is decreased by one. Also the name string object is locked and cannot be
    ///  modified while the directory object holds a reference to it.
    ///  
    ///  Returns the object ID of the new directory object and the resulting error code.
    /// </summary>
    procedure OpenDirectory(const nameStringId: word; const sessionId: word; out errorCode: byte; out directoryId: word); virtual;

    /// <summary>
    ///  Returns the name of a directory object, as passed to <see cref="BrickRED.TBrickRED.OpenDirectory"/>, and
    ///  the resulting error code.
    /// </summary>
    procedure GetDirectoryName(const directoryId: word; const sessionId: word; out errorCode: byte; out nameStringId: word); virtual;

    /// <summary>
    ///  Returns the next entry in a directory object and the resulting error code.
    ///  
    ///  If there is not next entry then error code *NoMoreData* is returned. To rewind
    ///  a directory object call <see cref="BrickRED.TBrickRED.RewindDirectory"/>.
    ///  
    ///  Possible directory entry types are:
    ///  
    ///  * Unknown = 0
    ///  * Regular = 1
    ///  * Directory = 2
    ///  * Character = 3
    ///  * Block = 4
    ///  * FIFO = 5
    ///  * Symlink = 6
    ///  * Socket = 7
    /// </summary>
    procedure GetNextDirectoryEntry(const directoryId: word; const sessionId: word; out errorCode: byte; out nameStringId: word; out directoryEntryType: byte); virtual;

    /// <summary>
    ///  Rewinds a directory object and returns the resulting error code.
    /// </summary>
    function RewindDirectory(const directoryId: word): byte; virtual;

    /// <summary>
    ///  FIXME: name has to be absolute
    /// </summary>
    function CreateDirectory(const nameStringId: word; const flags: longword; const permissions: word; const uid: longword; const gid: longword): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProcesses(const sessionId: word; out errorCode: byte; out processesListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure SpawnProcess(const executableStringId: word; const argumentsListId: word; const environmentListId: word; const workingDirectoryStringId: word; const uid: longword; const gid: longword; const stdinFileId: word; const stdoutFileId: word; const stderrFileId: word; const sessionId: word; out errorCode: byte; out processId: word); virtual;

    /// <summary>
    ///  Sends a UNIX signal to a process object and returns the resulting error code.
    ///  
    ///  Possible UNIX signals are:
    ///  
    ///  * Interrupt = 2
    ///  * Quit = 3
    ///  * Abort = 6
    ///  * Kill = 9
    ///  * User1 = 10
    ///  * User2 = 12
    ///  * Terminate = 15
    ///  * Continue =  18
    ///  * Stop = 19
    /// </summary>
    function KillProcess(const processId: word; const signal: byte): byte; virtual;

    /// <summary>
    ///  Returns the executable, arguments, environment and working directory used to
    ///  spawn a process object, as passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting
    ///  error code.
    /// </summary>
    procedure GetProcessCommand(const processId: word; const sessionId: word; out errorCode: byte; out executableStringId: word; out argumentsListId: word; out environmentListId: word; out workingDirectoryStringId: word); virtual;

    /// <summary>
    ///  Returns the process ID and the user and group ID used to spawn a process object,
    ///  as passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting error code.
    ///  
    ///  The process ID is only valid if the state is *Running* or *Stopped*, see
    ///  <see cref="BrickRED.TBrickRED.GetProcessState"/>.
    /// </summary>
    procedure GetProcessIdentity(const processId: word; out errorCode: byte; out pid: longword; out uid: longword; out gid: longword); virtual;

    /// <summary>
    ///  Returns the stdin, stdout and stderr files used to spawn a process object, as
    ///  passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting error code.
    /// </summary>
    procedure GetProcessStdio(const processId: word; const sessionId: word; out errorCode: byte; out stdinFileId: word; out stdoutFileId: word; out stderrFileId: word); virtual;

    /// <summary>
    ///  Returns the current state, timestamp and exit code of a process object, and
    ///  the resulting error code.
    ///  
    ///  Possible process states are:
    ///  
    ///  * Unknown = 0
    ///  * Running = 1
    ///  * Error = 2
    ///  * Exited = 3
    ///  * Killed = 4
    ///  * Stopped = 5
    ///  
    ///  The timestamp represents the UNIX time since when the process is in its current
    ///  state.
    ///  
    ///  The exit code is only valid if the state is *Error*, *Exited*, *Killed* or
    ///  *Stopped* and has different meanings depending on the state:
    ///  
    ///  * Error: error code for error occurred while spawning the process (see below)
    ///  * Exited: exit status of the process
    ///  * Killed: UNIX signal number used to kill the process
    ///  * Stopped: UNIX signal number used to stop the process
    ///  
    ///  Possible exit/error codes in *Error* state are:
    ///  
    ///  * InternalError = 125
    ///  * CannotExecute = 126
    ///  * DoesNotExist = 127
    ///  
    ///  The *CannotExecute* error can be caused by the executable being opened for
    ///  writing.
    /// </summary>
    procedure GetProcessState(const processId: word; out errorCode: byte; out state: byte; out timestamp: uint64; out exitCode: byte); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetPrograms(const sessionId: word; out errorCode: byte; out programsListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure DefineProgram(const identifierStringId: word; const sessionId: word; out errorCode: byte; out programId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function PurgeProgram(const programId: word; const cookie: longword): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProgramIdentifier(const programId: word; const sessionId: word; out errorCode: byte; out identifierStringId: word); virtual;

    /// <summary>
    ///  FIXME: root directory is absolute: &lt;home&gt;/programs/&lt;identifier&gt;
    /// </summary>
    procedure GetProgramRootDirectory(const programId: word; const sessionId: word; out errorCode: byte; out rootDirectoryStringId: word); virtual;

    /// <summary>
    ///  FIXME: working directory is relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    function SetProgramCommand(const programId: word; const executableStringId: word; const argumentsListId: word; const environmentListId: word; const workingDirectoryStringId: word): byte; virtual;

    /// <summary>
    ///  FIXME: working directory is relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    procedure GetProgramCommand(const programId: word; const sessionId: word; out errorCode: byte; out executableStringId: word; out argumentsListId: word; out environmentListId: word; out workingDirectoryStringId: word); virtual;

    /// <summary>
    ///  FIXME: stdio file names are relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    function SetProgramStdioRedirection(const programId: word; const stdinRedirection: byte; const stdinFileNameStringId: word; const stdoutRedirection: byte; const stdoutFileNameStringId: word; const stderrRedirection: byte; const stderrFileNameStringId: word): byte; virtual;

    /// <summary>
    ///  FIXME: stdio file names are relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    procedure GetProgramStdioRedirection(const programId: word; const sessionId: word; out errorCode: byte; out stdinRedirection: byte; out stdinFileNameStringId: word; out stdoutRedirection: byte; out stdoutFileNameStringId: word; out stderrRedirection: byte; out stderrFileNameStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetProgramSchedule(const programId: word; const startMode: byte; const continueAfterError: boolean; const startInterval: longword; const startFieldsStringId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProgramSchedule(const programId: word; const sessionId: word; out errorCode: byte; out startMode: byte; out continueAfterError: boolean; out startInterval: longword; out startFieldsStringId: word); virtual;

    /// <summary>
    ///  FIXME: message is currently vaild in error-occurred state only
    /// </summary>
    procedure GetProgramSchedulerState(const programId: word; const sessionId: word; out errorCode: byte; out state: byte; out timestamp: uint64; out messageStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function ContinueProgramSchedule(const programId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    function StartProgram(const programId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetLastSpawnedProgramProcess(const programId: word; const sessionId: word; out errorCode: byte; out processId: word; out timestamp: uint64); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetCustomProgramOptionNames(const programId: word; const sessionId: word; out errorCode: byte; out namesListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetCustomProgramOptionValue(const programId: word; const nameStringId: word; const valueStringId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetCustomProgramOptionValue(const programId: word; const nameStringId: word; const sessionId: word; out errorCode: byte; out valueStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function RemoveCustomProgramOption(const programId: word; const nameStringId: word): byte; virtual;

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
    ///  This callback reports the result of a call to the <see cref="BrickRED.TBrickRED.ReadFileAsync"/>
    ///  function.
    /// </summary>
    property OnAsyncFileRead: TBrickREDNotifyAsyncFileRead read asyncFileReadCallback write asyncFileReadCallback;

    /// <summary>
    ///  This callback reports the result of a call to the <see cref="BrickRED.TBrickRED.WriteFileAsync"/>
    ///  function.
    /// </summary>
    property OnAsyncFileWrite: TBrickREDNotifyAsyncFileWrite read asyncFileWriteCallback write asyncFileWriteCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnFileEventsOccurred: TBrickREDNotifyFileEventsOccurred read fileEventsOccurredCallback write fileEventsOccurredCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProcessStateChanged: TBrickREDNotifyProcessStateChanged read processStateChangedCallback write processStateChangedCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProgramSchedulerStateChanged: TBrickREDNotifyProgramSchedulerStateChanged read programSchedulerStateChangedCallback write programSchedulerStateChangedCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProgramProcessSpawned: TBrickREDNotifyProgramProcessSpawned read programProcessSpawnedCallback write programProcessSpawnedCallback;
  end;

implementation

constructor TBrickRED.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICK_RED_FUNCTION_CREATE_SESSION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_EXPIRE_SESSION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_EXPIRE_SESSION_UNCHECKED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_RED_FUNCTION_KEEP_SESSION_ALIVE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_RELEASE_OBJECT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_RELEASE_OBJECT_UNCHECKED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_RED_FUNCTION_ALLOCATE_STRING] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_TRUNCATE_STRING] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_STRING_LENGTH] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_STRING_CHUNK] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_STRING_CHUNK] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_ALLOCATE_LIST] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_LIST_LENGTH] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_LIST_ITEM] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_APPEND_TO_LIST] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_REMOVE_FROM_LIST] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_OPEN_FILE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_CREATE_PIPE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_FILE_INFO] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_READ_FILE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_READ_FILE_ASYNC] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_RED_FUNCTION_ABORT_ASYNC_FILE_READ] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_WRITE_FILE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_WRITE_FILE_UNCHECKED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_RED_FUNCTION_WRITE_FILE_ASYNC] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_RED_FUNCTION_SET_FILE_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_FILE_POSITION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_FILE_EVENTS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_FILE_EVENTS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_CALLBACK_ASYNC_FILE_READ] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_CALLBACK_ASYNC_FILE_WRITE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_CALLBACK_FILE_EVENTS_OCCURRED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_FUNCTION_OPEN_DIRECTORY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_DIRECTORY_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_NEXT_DIRECTORY_ENTRY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_REWIND_DIRECTORY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_CREATE_DIRECTORY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROCESSES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SPAWN_PROCESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_KILL_PROCESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROCESS_COMMAND] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROCESS_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROCESS_STDIO] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROCESS_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_CALLBACK_PROCESS_STATE_CHANGED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAMS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_DEFINE_PROGRAM] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_PURGE_PROGRAM] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_IDENTIFIER] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_ROOT_DIRECTORY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_COMMAND] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_COMMAND] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_STDIO_REDIRECTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_STDIO_REDIRECTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_SCHEDULE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULER_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_CONTINUE_PROGRAM_SCHEDULE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_START_PROGRAM] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_RED_CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_CALLBACK_PROGRAM_PROCESS_SPAWNED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_RED_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_RED_CALLBACK_ASYNC_FILE_READ] := {$ifdef FPC}@{$endif}CallbackWrapperAsyncFileRead;
  callbackWrappers[BRICK_RED_CALLBACK_ASYNC_FILE_WRITE] := {$ifdef FPC}@{$endif}CallbackWrapperAsyncFileWrite;
  callbackWrappers[BRICK_RED_CALLBACK_FILE_EVENTS_OCCURRED] := {$ifdef FPC}@{$endif}CallbackWrapperFileEventsOccurred;
  callbackWrappers[BRICK_RED_CALLBACK_PROCESS_STATE_CHANGED] := {$ifdef FPC}@{$endif}CallbackWrapperProcessStateChanged;
  callbackWrappers[BRICK_RED_CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED] := {$ifdef FPC}@{$endif}CallbackWrapperProgramSchedulerStateChanged;
  callbackWrappers[BRICK_RED_CALLBACK_PROGRAM_PROCESS_SPAWNED] := {$ifdef FPC}@{$endif}CallbackWrapperProgramProcessSpawned;
end;

procedure TBrickRED.CreateSession(const lifetime: longword; out errorCode: byte; out sessionId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_SESSION, 12);
  LEConvertUInt32To(lifetime, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  sessionId := LEConvertUInt16From(9, response);
end;

function TBrickRED.ExpireSession(const sessionId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_EXPIRE_SESSION, 10);
  LEConvertUInt16To(sessionId, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.ExpireSessionUnchecked(const sessionId: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_EXPIRE_SESSION_UNCHECKED, 10);
  LEConvertUInt16To(sessionId, 8, request);
  SendRequest(request);
end;

function TBrickRED.KeepSessionAlive(const sessionId: word; const lifetime: longword): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_KEEP_SESSION_ALIVE, 14);
  LEConvertUInt16To(sessionId, 8, request);
  LEConvertUInt32To(lifetime, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickRED.ReleaseObject(const objectId: word; const sessionId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_RELEASE_OBJECT, 12);
  LEConvertUInt16To(objectId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.ReleaseObjectUnchecked(const objectId: word; const sessionId: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_RELEASE_OBJECT_UNCHECKED, 12);
  LEConvertUInt16To(objectId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  SendRequest(request);
end;

procedure TBrickRED.AllocateString(const lengthToReserve: longword; const buffer: string; const sessionId: word; out errorCode: byte; out stringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_ALLOCATE_STRING, 72);
  LEConvertUInt32To(lengthToReserve, 8, request);
  LEConvertStringTo(buffer, 12, 58, request);
  LEConvertUInt16To(sessionId, 70, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  stringId := LEConvertUInt16From(9, response);
end;

function TBrickRED.TruncateString(const stringId: word; const length2: longword): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_TRUNCATE_STRING, 14);
  LEConvertUInt16To(stringId, 8, request);
  LEConvertUInt32To(length2, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetStringLength(const stringId: word; out errorCode: byte; out length2: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_STRING_LENGTH, 10);
  LEConvertUInt16To(stringId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  length2 := LEConvertUInt32From(9, response);
end;

function TBrickRED.SetStringChunk(const stringId: word; const offset: longword; const buffer: string): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_STRING_CHUNK, 72);
  LEConvertUInt16To(stringId, 8, request);
  LEConvertUInt32To(offset, 10, request);
  LEConvertStringTo(buffer, 14, 58, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetStringChunk(const stringId: word; const offset: longword; out errorCode: byte; out buffer: string);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_STRING_CHUNK, 14);
  LEConvertUInt16To(stringId, 8, request);
  LEConvertUInt32To(offset, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  buffer := LEConvertStringFrom(9, 63, response);
end;

procedure TBrickRED.AllocateList(const lengthToReserve: word; const sessionId: word; out errorCode: byte; out listId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_ALLOCATE_LIST, 12);
  LEConvertUInt16To(lengthToReserve, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  listId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetListLength(const listId: word; out errorCode: byte; out length2: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LIST_LENGTH, 10);
  LEConvertUInt16To(listId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  length2 := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetListItem(const listId: word; const index: word; const sessionId: word; out errorCode: byte; out itemObjectId: word; out objectType: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LIST_ITEM, 14);
  LEConvertUInt16To(listId, 8, request);
  LEConvertUInt16To(index, 10, request);
  LEConvertUInt16To(sessionId, 12, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  itemObjectId := LEConvertUInt16From(9, response);
  objectType := LEConvertUInt8From(11, response);
end;

function TBrickRED.AppendToList(const listId: word; const itemObjectId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_APPEND_TO_LIST, 12);
  LEConvertUInt16To(listId, 8, request);
  LEConvertUInt16To(itemObjectId, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickRED.RemoveFromList(const listId: word; const index: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_REMOVE_FROM_LIST, 12);
  LEConvertUInt16To(listId, 8, request);
  LEConvertUInt16To(index, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.OpenFile(const nameStringId: word; const flags: longword; const permissions: word; const uid: longword; const gid: longword; const sessionId: word; out errorCode: byte; out fileId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_OPEN_FILE, 26);
  LEConvertUInt16To(nameStringId, 8, request);
  LEConvertUInt32To(flags, 10, request);
  LEConvertUInt16To(permissions, 14, request);
  LEConvertUInt32To(uid, 16, request);
  LEConvertUInt32To(gid, 20, request);
  LEConvertUInt16To(sessionId, 24, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  fileId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.CreatePipe(const flags: longword; const length2: uint64; const sessionId: word; out errorCode: byte; out fileId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_PIPE, 22);
  LEConvertUInt32To(flags, 8, request);
  LEConvertUInt64To(length2, 12, request);
  LEConvertUInt16To(sessionId, 20, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  fileId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetFileInfo(const fileId: word; const sessionId: word; out errorCode: byte; out fileType: byte; out nameStringId: word; out flags: longword; out permissions: word; out uid: longword; out gid: longword; out length2: uint64; out accessTimestamp: uint64; out modificationTimestamp: uint64; out statusChangeTimestamp: uint64);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_INFO, 12);
  LEConvertUInt16To(fileId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  fileType := LEConvertUInt8From(9, response);
  nameStringId := LEConvertUInt16From(10, response);
  flags := LEConvertUInt32From(12, response);
  permissions := LEConvertUInt16From(16, response);
  uid := LEConvertUInt32From(18, response);
  gid := LEConvertUInt32From(22, response);
  length2 := LEConvertUInt64From(26, response);
  accessTimestamp := LEConvertUInt64From(34, response);
  modificationTimestamp := LEConvertUInt64From(42, response);
  statusChangeTimestamp := LEConvertUInt64From(50, response);
end;

procedure TBrickRED.ReadFile(const fileId: word; const lengthToRead: byte; out errorCode: byte; out buffer: TArray0To61OfUInt8; out lengthRead: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_READ_FILE, 11);
  LEConvertUInt16To(fileId, 8, request);
  LEConvertUInt8To(lengthToRead, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  for i := 0 to 61 do buffer[i] := LEConvertUInt8From(9 + (i * 1), response);
  lengthRead := LEConvertUInt8From(71, response);
end;

procedure TBrickRED.ReadFileAsync(const fileId: word; const lengthToRead: uint64);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_READ_FILE_ASYNC, 18);
  LEConvertUInt16To(fileId, 8, request);
  LEConvertUInt64To(lengthToRead, 10, request);
  SendRequest(request);
end;

function TBrickRED.AbortAsyncFileRead(const fileId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_ABORT_ASYNC_FILE_READ, 10);
  LEConvertUInt16To(fileId, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.WriteFile(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte; out errorCode: byte; out lengthWritten: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE, 72);
  LEConvertUInt16To(fileId, 8, request);
  for i := 0 to Length(buffer) - 1 do LEConvertUInt8To(buffer[i], 10 + (i * 1), request);
  LEConvertUInt8To(lengthToWrite, 71, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  lengthWritten := LEConvertUInt8From(9, response);
end;

procedure TBrickRED.WriteFileUnchecked(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE_UNCHECKED, 72);
  LEConvertUInt16To(fileId, 8, request);
  for i := 0 to Length(buffer) - 1 do LEConvertUInt8To(buffer[i], 10 + (i * 1), request);
  LEConvertUInt8To(lengthToWrite, 71, request);
  SendRequest(request);
end;

procedure TBrickRED.WriteFileAsync(const fileId: word; const buffer: TArray0To60OfUInt8; const lengthToWrite: byte);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE_ASYNC, 72);
  LEConvertUInt16To(fileId, 8, request);
  for i := 0 to Length(buffer) - 1 do LEConvertUInt8To(buffer[i], 10 + (i * 1), request);
  LEConvertUInt8To(lengthToWrite, 71, request);
  SendRequest(request);
end;

procedure TBrickRED.SetFilePosition(const fileId: word; const offset: int64; const origin: byte; out errorCode: byte; out position: uint64);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_FILE_POSITION, 19);
  LEConvertUInt16To(fileId, 8, request);
  LEConvertInt64To(offset, 10, request);
  LEConvertUInt8To(origin, 18, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  position := LEConvertUInt64From(9, response);
end;

procedure TBrickRED.GetFilePosition(const fileId: word; out errorCode: byte; out position: uint64);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_POSITION, 10);
  LEConvertUInt16To(fileId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  position := LEConvertUInt64From(9, response);
end;

function TBrickRED.SetFileEvents(const fileId: word; const events: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_FILE_EVENTS, 12);
  LEConvertUInt16To(fileId, 8, request);
  LEConvertUInt16To(events, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetFileEvents(const fileId: word; out errorCode: byte; out events: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_EVENTS, 10);
  LEConvertUInt16To(fileId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  events := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.OpenDirectory(const nameStringId: word; const sessionId: word; out errorCode: byte; out directoryId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_OPEN_DIRECTORY, 12);
  LEConvertUInt16To(nameStringId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  directoryId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetDirectoryName(const directoryId: word; const sessionId: word; out errorCode: byte; out nameStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_DIRECTORY_NAME, 12);
  LEConvertUInt16To(directoryId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  nameStringId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetNextDirectoryEntry(const directoryId: word; const sessionId: word; out errorCode: byte; out nameStringId: word; out directoryEntryType: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_NEXT_DIRECTORY_ENTRY, 12);
  LEConvertUInt16To(directoryId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  nameStringId := LEConvertUInt16From(9, response);
  directoryEntryType := LEConvertUInt8From(11, response);
end;

function TBrickRED.RewindDirectory(const directoryId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_REWIND_DIRECTORY, 10);
  LEConvertUInt16To(directoryId, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickRED.CreateDirectory(const nameStringId: word; const flags: longword; const permissions: word; const uid: longword; const gid: longword): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_DIRECTORY, 24);
  LEConvertUInt16To(nameStringId, 8, request);
  LEConvertUInt32To(flags, 10, request);
  LEConvertUInt16To(permissions, 14, request);
  LEConvertUInt32To(uid, 16, request);
  LEConvertUInt32To(gid, 20, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProcesses(const sessionId: word; out errorCode: byte; out processesListId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESSES, 10);
  LEConvertUInt16To(sessionId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  processesListId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.SpawnProcess(const executableStringId: word; const argumentsListId: word; const environmentListId: word; const workingDirectoryStringId: word; const uid: longword; const gid: longword; const stdinFileId: word; const stdoutFileId: word; const stderrFileId: word; const sessionId: word; out errorCode: byte; out processId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SPAWN_PROCESS, 32);
  LEConvertUInt16To(executableStringId, 8, request);
  LEConvertUInt16To(argumentsListId, 10, request);
  LEConvertUInt16To(environmentListId, 12, request);
  LEConvertUInt16To(workingDirectoryStringId, 14, request);
  LEConvertUInt32To(uid, 16, request);
  LEConvertUInt32To(gid, 20, request);
  LEConvertUInt16To(stdinFileId, 24, request);
  LEConvertUInt16To(stdoutFileId, 26, request);
  LEConvertUInt16To(stderrFileId, 28, request);
  LEConvertUInt16To(sessionId, 30, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  processId := LEConvertUInt16From(9, response);
end;

function TBrickRED.KillProcess(const processId: word; const signal: byte): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_KILL_PROCESS, 11);
  LEConvertUInt16To(processId, 8, request);
  LEConvertUInt8To(signal, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProcessCommand(const processId: word; const sessionId: word; out errorCode: byte; out executableStringId: word; out argumentsListId: word; out environmentListId: word; out workingDirectoryStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_COMMAND, 12);
  LEConvertUInt16To(processId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  executableStringId := LEConvertUInt16From(9, response);
  argumentsListId := LEConvertUInt16From(11, response);
  environmentListId := LEConvertUInt16From(13, response);
  workingDirectoryStringId := LEConvertUInt16From(15, response);
end;

procedure TBrickRED.GetProcessIdentity(const processId: word; out errorCode: byte; out pid: longword; out uid: longword; out gid: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_IDENTITY, 10);
  LEConvertUInt16To(processId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  pid := LEConvertUInt32From(9, response);
  uid := LEConvertUInt32From(13, response);
  gid := LEConvertUInt32From(17, response);
end;

procedure TBrickRED.GetProcessStdio(const processId: word; const sessionId: word; out errorCode: byte; out stdinFileId: word; out stdoutFileId: word; out stderrFileId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_STDIO, 12);
  LEConvertUInt16To(processId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  stdinFileId := LEConvertUInt16From(9, response);
  stdoutFileId := LEConvertUInt16From(11, response);
  stderrFileId := LEConvertUInt16From(13, response);
end;

procedure TBrickRED.GetProcessState(const processId: word; out errorCode: byte; out state: byte; out timestamp: uint64; out exitCode: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_STATE, 10);
  LEConvertUInt16To(processId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  state := LEConvertUInt8From(9, response);
  timestamp := LEConvertUInt64From(10, response);
  exitCode := LEConvertUInt8From(18, response);
end;

procedure TBrickRED.GetPrograms(const sessionId: word; out errorCode: byte; out programsListId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAMS, 10);
  LEConvertUInt16To(sessionId, 8, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  programsListId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.DefineProgram(const identifierStringId: word; const sessionId: word; out errorCode: byte; out programId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_DEFINE_PROGRAM, 12);
  LEConvertUInt16To(identifierStringId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  programId := LEConvertUInt16From(9, response);
end;

function TBrickRED.PurgeProgram(const programId: word; const cookie: longword): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_PURGE_PROGRAM, 14);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt32To(cookie, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProgramIdentifier(const programId: word; const sessionId: word; out errorCode: byte; out identifierStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_IDENTIFIER, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  identifierStringId := LEConvertUInt16From(9, response);
end;

procedure TBrickRED.GetProgramRootDirectory(const programId: word; const sessionId: word; out errorCode: byte; out rootDirectoryStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_ROOT_DIRECTORY, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  rootDirectoryStringId := LEConvertUInt16From(9, response);
end;

function TBrickRED.SetProgramCommand(const programId: word; const executableStringId: word; const argumentsListId: word; const environmentListId: word; const workingDirectoryStringId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_COMMAND, 18);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(executableStringId, 10, request);
  LEConvertUInt16To(argumentsListId, 12, request);
  LEConvertUInt16To(environmentListId, 14, request);
  LEConvertUInt16To(workingDirectoryStringId, 16, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProgramCommand(const programId: word; const sessionId: word; out errorCode: byte; out executableStringId: word; out argumentsListId: word; out environmentListId: word; out workingDirectoryStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_COMMAND, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  executableStringId := LEConvertUInt16From(9, response);
  argumentsListId := LEConvertUInt16From(11, response);
  environmentListId := LEConvertUInt16From(13, response);
  workingDirectoryStringId := LEConvertUInt16From(15, response);
end;

function TBrickRED.SetProgramStdioRedirection(const programId: word; const stdinRedirection: byte; const stdinFileNameStringId: word; const stdoutRedirection: byte; const stdoutFileNameStringId: word; const stderrRedirection: byte; const stderrFileNameStringId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_STDIO_REDIRECTION, 19);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt8To(stdinRedirection, 10, request);
  LEConvertUInt16To(stdinFileNameStringId, 11, request);
  LEConvertUInt8To(stdoutRedirection, 13, request);
  LEConvertUInt16To(stdoutFileNameStringId, 14, request);
  LEConvertUInt8To(stderrRedirection, 16, request);
  LEConvertUInt16To(stderrFileNameStringId, 17, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProgramStdioRedirection(const programId: word; const sessionId: word; out errorCode: byte; out stdinRedirection: byte; out stdinFileNameStringId: word; out stdoutRedirection: byte; out stdoutFileNameStringId: word; out stderrRedirection: byte; out stderrFileNameStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_STDIO_REDIRECTION, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  stdinRedirection := LEConvertUInt8From(9, response);
  stdinFileNameStringId := LEConvertUInt16From(10, response);
  stdoutRedirection := LEConvertUInt8From(12, response);
  stdoutFileNameStringId := LEConvertUInt16From(13, response);
  stderrRedirection := LEConvertUInt8From(15, response);
  stderrFileNameStringId := LEConvertUInt16From(16, response);
end;

function TBrickRED.SetProgramSchedule(const programId: word; const startMode: byte; const continueAfterError: boolean; const startInterval: longword; const startFieldsStringId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_SCHEDULE, 18);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt8To(startMode, 10, request);
  LEConvertBooleanTo(continueAfterError, 11, request);
  LEConvertUInt32To(startInterval, 12, request);
  LEConvertUInt16To(startFieldsStringId, 16, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetProgramSchedule(const programId: word; const sessionId: word; out errorCode: byte; out startMode: byte; out continueAfterError: boolean; out startInterval: longword; out startFieldsStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULE, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  startMode := LEConvertUInt8From(9, response);
  continueAfterError := LEConvertBooleanFrom(10, response);
  startInterval := LEConvertUInt32From(11, response);
  startFieldsStringId := LEConvertUInt16From(15, response);
end;

procedure TBrickRED.GetProgramSchedulerState(const programId: word; const sessionId: word; out errorCode: byte; out state: byte; out timestamp: uint64; out messageStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULER_STATE, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  state := LEConvertUInt8From(9, response);
  timestamp := LEConvertUInt64From(10, response);
  messageStringId := LEConvertUInt16From(18, response);
end;

function TBrickRED.ContinueProgramSchedule(const programId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_CONTINUE_PROGRAM_SCHEDULE, 10);
  LEConvertUInt16To(programId, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

function TBrickRED.StartProgram(const programId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_START_PROGRAM, 10);
  LEConvertUInt16To(programId, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetLastSpawnedProgramProcess(const programId: word; const sessionId: word; out errorCode: byte; out processId: word; out timestamp: uint64);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  processId := LEConvertUInt16From(9, response);
  timestamp := LEConvertUInt64From(11, response);
end;

procedure TBrickRED.GetCustomProgramOptionNames(const programId: word; const sessionId: word; out errorCode: byte; out namesListId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(sessionId, 10, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  namesListId := LEConvertUInt16From(9, response);
end;

function TBrickRED.SetCustomProgramOptionValue(const programId: word; const nameStringId: word; const valueStringId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE, 14);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(nameStringId, 10, request);
  LEConvertUInt16To(valueStringId, 12, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetCustomProgramOptionValue(const programId: word; const nameStringId: word; const sessionId: word; out errorCode: byte; out valueStringId: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE, 14);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(nameStringId, 10, request);
  LEConvertUInt16To(sessionId, 12, request);
  response := SendRequest(request);
  errorCode := LEConvertUInt8From(8, response);
  valueStringId := LEConvertUInt16From(9, response);
end;

function TBrickRED.RemoveCustomProgramOption(const programId: word; const nameStringId: word): byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION, 12);
  LEConvertUInt16To(programId, 8, request);
  LEConvertUInt16To(nameStringId, 10, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickRED.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickRED.CallbackWrapperAsyncFileRead(const packet: TByteArray);
var fileId: word; errorCode: byte; buffer: TArray0To59OfUInt8; lengthRead: byte; i: longint;
begin
  if (Assigned(asyncFileReadCallback)) then begin
    fileId := LEConvertUInt16From(8, packet);
    errorCode := LEConvertUInt8From(10, packet);
    for i := 0 to 59 do buffer[i] := LEConvertUInt8From(11 + (i * 1), packet);
    lengthRead := LEConvertUInt8From(71, packet);
    asyncFileReadCallback(self, fileId, errorCode, buffer, lengthRead);
  end;
end;

procedure TBrickRED.CallbackWrapperAsyncFileWrite(const packet: TByteArray);
var fileId: word; errorCode: byte; lengthWritten: byte;
begin
  if (Assigned(asyncFileWriteCallback)) then begin
    fileId := LEConvertUInt16From(8, packet);
    errorCode := LEConvertUInt8From(10, packet);
    lengthWritten := LEConvertUInt8From(11, packet);
    asyncFileWriteCallback(self, fileId, errorCode, lengthWritten);
  end;
end;

procedure TBrickRED.CallbackWrapperFileEventsOccurred(const packet: TByteArray);
var fileId: word; events: word;
begin
  if (Assigned(fileEventsOccurredCallback)) then begin
    fileId := LEConvertUInt16From(8, packet);
    events := LEConvertUInt16From(10, packet);
    fileEventsOccurredCallback(self, fileId, events);
  end;
end;

procedure TBrickRED.CallbackWrapperProcessStateChanged(const packet: TByteArray);
var processId: word; state: byte; timestamp: uint64; exitCode: byte;
begin
  if (Assigned(processStateChangedCallback)) then begin
    processId := LEConvertUInt16From(8, packet);
    state := LEConvertUInt8From(10, packet);
    timestamp := LEConvertUInt64From(11, packet);
    exitCode := LEConvertUInt8From(19, packet);
    processStateChangedCallback(self, processId, state, timestamp, exitCode);
  end;
end;

procedure TBrickRED.CallbackWrapperProgramSchedulerStateChanged(const packet: TByteArray);
var programId: word;
begin
  if (Assigned(programSchedulerStateChangedCallback)) then begin
    programId := LEConvertUInt16From(8, packet);
    programSchedulerStateChangedCallback(self, programId);
  end;
end;

procedure TBrickRED.CallbackWrapperProgramProcessSpawned(const packet: TByteArray);
var programId: word;
begin
  if (Assigned(programProcessSpawnedCallback)) then begin
    programId := LEConvertUInt16From(8, packet);
    programProcessSpawnedCallback(self, programId);
  end;
end;

end.
