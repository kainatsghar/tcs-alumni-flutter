
Create POST and GET APIs to handle Quoridor game results and leaderboard data.

## Proposed API Structures

### 1. Save Match Result (POST)
**Endpoint:** `api/save_quoridor_match`

**Request Body:**
```json
{
  "user_id": "11556",
  "winner": "player1",
  "game_mode": "singlePlayer",
  "p1_wins": 2,
  "p2_wins": 1,
  "series_length": 3
}
```

**Response Body:**
```json
{
  "success": 1,
  "message": "Match result saved successfully"
}
```

### 2. Get Leaderboard (GET/POST)
**Endpoint:** `api/get_quoridor_leaderboard`

**Request Body (if POST) or Query Params:**
```json
{
  "user_id": "11556"
}
```

**Response Body:**
```json
{
  "success": 1,
  "message": "Leaderboard fetched successfully",
  "result": {
    "current_user_stats": {
      "user_id": "11556",
      "name": "YOU",
      "wins": 115,
      "losses": 42,
      "rank": 42
    },
    "top_players": [
      {
        "user_id": "123",
        "name": "Zaid Khan",
        "wins": 150,
        "losses": 32,
        "rank": 1
      },
      {
        "user_id": "456",
        "name": "Ali Ahmed",
        "wins": 142,
        "losses": 12,
        "rank": 2
      }
    ],
    
  }
}
```

## Proposed Changes

### Network Layer

#### [api_path.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_path.dart)
- Add new endpoints:
    - `apiSaveQuoridorMatch`: `'api/save_quoridor_match'`
    - `apiGetQuoridorLeaderboard`: `'api/get_quoridor_leaderboard'`

#### [api_params.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_params.dart)
- Add new parameter keys for Quoridor:
    - `QUORIDOR_WINNER`: `'winner'`
    - `QUORIDOR_GAME_MODE`: `'game_mode'`
    - `QUORIDOR_P1_WINS`: `'p1_wins'`
    - `QUORIDOR_P2_WINS`: `'p2_wins'`
    - `QUORIDOR_SERIES_LENGTH`: `'series_length'`

#### [NEW] [quoridor_leaderboard_entity.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/response_models/quoridor_leaderboard_entity.dart)
- Create a model to handle the leaderboard data response.

#### [NEW] [quoridor_match_result_entity.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/response_models/quoridor_match_result_entity.dart)
- Create a model to handle the POST request response (success/message).

#### [api_calls.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/networkcalls/api_calls.dart)
- Add `saveQuoridorMatch` static method.
- Add `getQuoridorLeaderboard` static method.

### Game Integration

#### [quoridor_game_view.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_game_view.dart)
- Update `_handleRoundEnd` to call the POST API when a match completes.
- Ensure `user_id` is passed correctly from preferences or session.

#### [quoridor_leaderboard.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_leaderboard.dart)
- Convert `QuoridorLeaderboard` to a `StatefulWidget` to fetch data from the GET API.
- Replace mock data with real data from the API.

---

## Verification Plan

### Automated Tests
- I will verify the new models by ensuring they can be instantiated and mapped correctly (simulated).
- I will check the `ApiCalls` methods for correct parameter mapping.

### Manual Verification
- I will verify that the new API paths and parameters are correctly added to the existing constant files.
- I will provide a summary of the code changes and how they connect the game to the backend.
