# Quoridor Game Enhancements

This plan covers:
1. Movement logic fix (Already implemented).
2. Reset confirmation dialog.
3. Leaderboard API integration using real data structure.

## User Review Required

> [!IMPORTANT]
> - The leaderboard will now fetch live data from the API using `AppConstants.myId` as the `user_id`.
> - The UI will be updated to display `wins`, `losses`, and `rank` from the API response.

## Proposed Changes

### [NEW] Quoridor Leaderboard Model

#### [NEW] [quoridor_leaderboard_entity.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/response_models/quoridor_leaderboard_entity.dart)

- Define `QuoridorLeaderboardEntity` to match the actual API structure.

```dart
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
      rank: json['rank'],
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
      rank: json['rank'],
    );
  }
}
```

---

### Network Layer

#### [api_path.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_path.dart)
- Add `const String apiGetQuoridorLeaderboard = 'api/get_quoridor_leaderboard';`

#### [api_calls.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_calls.dart)
- Add `static getQuoridorLeaderboard({userId})` method.

---

### Quoridor Game View

#### [quoridor_game_view.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_game_view.dart)

- Implement `_showResetConfirmation()` to block immediate resets.
- Pass `AppConstants.myId` to the leaderboard.

#### [quoridor_leaderboard.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_leaderboard.dart)

- Convert to `StatefulWidget` to fetch data on `initState`.
- Call `ApiCalls.getQuoridorLeaderboard` and display data.

## Verification Plan

### Automated Tests
- Run `analyze_file` on all modified files.

### Manual Verification
- Test reset confirmation: Move pawn -> click reset -> confirm popup appears.
- Test leaderboard: Click leaderboard icon -> loader shows -> real data from API appears.
