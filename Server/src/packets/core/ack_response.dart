import '../../utils/binary_data.dart';
import 'ack_packet.dart';

/// Response with ack
class AckResponse extends AckPacket {
  /// Ok response
  static const OK_RESPONSE = 1;

  /// Error response
  static const INTERNAL_ERROR_RESPONSE = 2;

  /// Player already exists
  static const PLAYER_EXISTS = 3;

  /// Player bad name
  static const PLAYER_BAD_NAME = 4;

  /// Room not found error
  static const ROOM_NOT_FOUND = 4;

  /// Player not found error
  static const PLAYER_NOT_FOUND = 5;

  /// Response code UInt8
  int code = OK_RESPONSE;

  /// Constructor with code
  AckResponse.withCode(int packetId, int sequence, int code)
      : super(packetId) {
    this.sequence = sequence;
  }

  /// Constructor
  AckResponse(int packetId) : super(packetId);

  /// Base ok response
  AckResponse baseOk(int sequence) {
    this.sequence = sequence;    
    code = OK_RESPONSE;
    return new AckResponse.withCode(packetId, sequence, OK_RESPONSE);
  }

  /// Internal error
  AckResponse internalError(int sequence) {
    this.sequence = sequence;
    code = INTERNAL_ERROR_RESPONSE;
    return new AckResponse.withCode(packetId, sequence, INTERNAL_ERROR_RESPONSE);
  }

  /// Player exists
  AckResponse playerExists(int sequence) {
    this.sequence = sequence;
    code = PLAYER_EXISTS;
    return new AckResponse.withCode(packetId, sequence, PLAYER_EXISTS);
  }

  /// Player bad name
  AckResponse playerBadName(int sequence) {
    this.sequence = sequence;
    code = PLAYER_BAD_NAME;
    return new AckResponse.withCode(packetId, sequence, PLAYER_BAD_NAME);
  }

  /// Room not found
  AckResponse roomNotFound(int sequence) {
    this.sequence = sequence;
    code = ROOM_NOT_FOUND;
    return new AckResponse.withCode(packetId, sequence, ROOM_NOT_FOUND);
  }

  /// Player not found
  AckResponse playerNotFound(int sequence) {
    this.sequence = sequence;
    code = PLAYER_NOT_FOUND;
    return new AckResponse.withCode(packetId, sequence, PLAYER_NOT_FOUND);
  }

  /// Pack to data
  @override
  BinaryData pack() {
    var res = super.pack();
    res.addUInt8(code);
    return res;
  }
}
