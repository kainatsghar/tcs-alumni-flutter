class QuoridorLeaderboardEntity {
  int? success;
  String? message;
  QuoridorLeaderboardResult? result;

  QuoridorLeaderboardEntity({this.success, this.message, this.result});

  factory QuoridorLeaderboardEntity.fromJson(Map<String, dynamic> json) {
    return QuoridorLeaderboardEntity(
      success: json['success'],
      message: json['message'],
      result: json['result'] != null
          ? QuoridorLeaderboardResult.fromJson(json['result'])
          : null,
    );
  }
}

class QuoridorLeaderboardResult {
  CurrentUserStats? currentUserStats;
  List<QuoridorPlayer>? topPlayers;

  QuoridorLeaderboardResult({this.currentUserStats, this.topPlayers});

  factory QuoridorLeaderboardResult.fromJson(Map<String, dynamic> json) {
    return QuoridorLeaderboardResult(
      currentUserStats: json['current_user_stats'] != null
          ? CurrentUserStats.fromJson(json['current_user_stats'])
          : null,
      topPlayers: json['top_players'] != null
          ? (json['top_players'] as List).map((i) => QuoridorPlayer.fromJson(i)).toList()
          : null,
    );
  }
}

class QuoridorPlayer {
  String? userId;
  String? name;
  int? wins;
  int? losses;
  int? rank;

  QuoridorPlayer({this.userId, this.name, this.wins, this.losses, this.rank});

  factory QuoridorPlayer.fromJson(Map<String, dynamic> json) {
    return QuoridorPlayer(
      userId: json['user_id']?.toString(),
      name: json['name'],
      wins: json['wins'],
      losses: json['losses'],
      rank: json['rank'] is String ? int.tryParse(json['rank']) : json['rank'],
    );
  }
}

class CurrentUserStats {
  String? userId;
  String? name;
  int? wins;
  int? losses;
  int? rank;

  CurrentUserStats({this.userId, this.name, this.wins, this.losses, this.rank});

  factory CurrentUserStats.fromJson(Map<String, dynamic> json) {
    return CurrentUserStats(
      userId: json['user_id']?.toString(),
      name: json['name'],
      wins: json['wins'],
      losses: json['losses'],
      rank: json['rank'] is String ? int.tryParse(json['rank']) : json['rank'],
    );
  }
}
