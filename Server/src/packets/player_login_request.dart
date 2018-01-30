import 'dart:async';

import '../client.dart';
import '../game_server.dart';
import '../utils/binary_data.dart';
import '../world/world.dart';
import 'core/ack_request.dart';
import 'core/base_packet.dart';
import 'packet_ids.dart';
import 'player_login_response.dart';

/// Create room request
class PlayerLoginRequest extends AckRequest {
  /// Id of player
  int playerId;

  /// Create packet
  static BasePacket create() => new PlayerLoginRequest();

  /// Constructor
  PlayerLoginRequest() : super(PacketIds.PLAYER_LOGIN_REQUEST);

  /// Unpack
  @override
  void unpack(BinaryData data) {
    super.unpack(data);
    playerId = data.readUInt32();
  }

  /// Process request
  @override
  Future process(Client client) async {
    try {
      World.instance.loginPlayerById(playerId, client);
      await GameServer.instance
          .sendPacket(client, new PlayerLoginResponse.ok(sequence));
    } catch (e) {
      await GameServer.instance.sendPacket(
          client, new PlayerLoginResponse()..playerNotFound(sequence));
    }
  }
}
