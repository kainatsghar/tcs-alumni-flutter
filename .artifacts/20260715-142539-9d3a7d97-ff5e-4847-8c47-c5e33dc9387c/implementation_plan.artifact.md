# Add Confirmation Dialog for Game Reset

This plan adds a confirmation popup when the user clicks "Reset Game / Change Mode" during an active match. If the game hasn't started yet, it will proceed directly to mode selection.

## User Review Required

> [!NOTE]
> I am defining "game started" as either pawn being moved from its starting position or any walls being placed. This prevents unnecessary popups if the user just opened the game and immediately wanted to change modes.

## Proposed Changes

### Quoridor Game View

#### [quoridor_game_view.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/more/game/quoridor_game_view.dart)

- Add `_showResetConfirmation()` method to display an `AlertDialog`.
- Update the "Reset Game / Change Mode" `TextButton` to call this new method.
- The confirmation will only show if the game state is "dirty" (pawn moved or walls placed).

```dart
  void _showResetConfirmation() {
    final state = _state;
    if (state == null) return;

    // Check if game has actually started
    bool hasStarted = state.walls.isNotEmpty ||
                      state.p1Pos != const Point(4, 8) ||
                      state.p2Pos != const Point(4, 0);

    if (!hasStarted) {
      _resetGame();
      _showModeSelection();
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Reset Game?', style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        content: Text('Are you sure you want to reset the current game and change mode?',
                     style: CustomTextStyles.text14RegularW400.copyWith(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[400])),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
              _showModeSelection();
            },
            child: const Text('Reset', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
```

```diff
          TextButton(
-           onPressed: () {
-             _resetGame();
-             _showModeSelection();
-           },
+           onPressed: _showResetConfirmation,
            child: Text('Reset Game / Change Mode', style: TextStyle(color: Colors.grey[600])),
          ),
```

## Verification Plan

### Automated Tests
- Run `analyze_file` to ensure no syntax errors in the new method.

### Manual Verification
1. Click the button when game just started (no moves) -> Should go to mode selection directly.
2. Move a pawn or place a wall, then click the button -> Should show confirmation popup.
3. Click "Cancel" -> Game should continue.
4. Click "Reset" -> Game should reset and show mode selection.
