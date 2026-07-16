# Quoridor Game Enhancements

This plan covers:
1. Movement logic fix (Already implemented).
2. Reset confirmation dialog (Already implemented).
3. Leaderboard API integration (Already implemented).
4. Save Match API integration (New).

## User Review Required

> [!IMPORTANT]
> - The match result will be saved **only** for "Play vs System" (singlePlayer) mode.
> - The API will be called once a series or a single match is completed.

## Proposed Changes

### Network Layer

#### [api_path.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_path.dart)
- Add `const String apiSaveQuoridorMatch = 'api/save_quoridor_match';`

#### [api_calls.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_calls.dart)
- Add `static saveQuoridorMatch({userId, winner, gameMode, p1Wins, p2Wins, seriesLength})` method using `postWebCall`.

---

### Quoridor Game View

#### [quoridor_game_view.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_game_view.dart)

- Update `_handleRoundEnd` logic:
    - Call `_saveMatchResultToApi()` inside `_handleRoundEnd` before showing the popup.
    - Create `_saveMatchResultToApi(PlayerType roundWinner, bool seriesEnded, PlayerType? seriesWinner)` to prepare parameters and call the API.

```dart
  void _saveMatchResultToApi(PlayerType roundWinner, bool seriesEnded, PlayerType? seriesWinner) async {
    final state = _state;
    if (state == null || state.gameMode != GameMode.singlePlayer) return;

    // For single match: winner is roundWinner
    // For series match: winner is seriesWinner (if ended) or roundWinner (if tracking match by match)
    // Based on requirement: "jese hi winner ka popup aye to api call ho jaye"

    String winnerStr = "";
    if (seriesEnded) {
       winnerStr = seriesWinner == PlayerType.player1 ? 'player1' : 'player2';
    } else {
       winnerStr = roundWinner == PlayerType.player1 ? 'player1' : 'player2';
    }

    try {
      await ApiCalls.saveQuoridorMatch(
        userId: AppConstants.myId,
        winner: winnerStr,
        gameMode: 'singlePlayer',
        p1Wins: state.p1Wins,
        p2Wins: state.p2Wins,
        seriesLength: state.seriesLength ?? 1,
      );
    } catch (e) {
      print("Error saving match result: $e");
    }
  }
```

## Verification Plan

### Automated Tests
- Run `analyze_file` on modified files.

### Manual Verification
- Play a "Single Match" vs System -> Complete the match -> Verify `save_quoridor_match` is called in logs.
- Play a "3 Match Series" vs System -> Complete the series -> Verify `save_quoridor_match` is called.
- Play "Two Players" mode -> Complete the match -> Verify API is **NOT** called.
