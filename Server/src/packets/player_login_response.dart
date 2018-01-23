import '../utils/binary_data.dart';
import 'core/ack_response.dart';
import 'packet_ids.dart';

class PlayerLoginResponse extends AckResponse {
  /// Constructor
  PlayerLoginResponse() : super(PacketIds.PLAYER_LOGIN_RESPONSE);

  /// Constructor
  PlayerLoginResponse.ok(int sequence)
      : super.withCode(PacketIds.PLAYER_LOGIN_RESPONSE, sequence,
            AckResponse.OK_RESPONSE);
}