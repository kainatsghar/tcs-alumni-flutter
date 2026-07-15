import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_color.dart';
import '../../../utils/text_styles.dart';
import 'quoridor_models.dart';
import 'quoridor_engine.dart';
import 'quoridor_leaderboard.dart';

class QuoridorGameView extends StatefulWidget {
  const QuoridorGameView({Key? key}) : super(key: key);

  @override
  _QuoridorGameViewState createState() => _QuoridorGameViewState();
}

class _QuoridorGameViewState extends State<QuoridorGameView> {
  QuoridorState? _state;
  bool _placingHorizontal = false; // Changed to bool to avoid null issues, handled by UI logic
  bool _isWallTypeSelected = false;
  int _totalSeriesWins = 0;
  int _totalSeriesLosses = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
    _initializeState(GameMode.singlePlayer); // Default, will be updated by selection
    WidgetsBinding.instance.addPostFrameCallback((_) => _showModeSelection());
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _totalSeriesWins = prefs.getInt('quoridor_series_wins') ?? 0;
      _totalSeriesLosses = prefs.getInt('quoridor_series_losses') ?? 0;
    });
  }

  Future<void> _saveStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quoridor_series_wins', _totalSeriesWins);
    await prefs.setInt('quoridor_series_losses', _totalSeriesLosses);
  }

  void _initializeState(GameMode mode) {
    _state = QuoridorState(
      p1Pos: const Point(4, 8),
      p2Pos: const Point(4, 0),
      walls: [],
      p1WallsLeft: 10,
      p2WallsLeft: 10,
      turn: PlayerType.player1,
      seriesLength: null,
      p1Wins: 0,
      p2Wins: 0,
      gameMode: mode,
    );
  }

  void _resetGame({int? seriesLength, bool keepWins = false, GameMode? mode}) {
    setState(() {
      _state = QuoridorState(
        p1Pos: const Point(4, 8),
        p2Pos: const Point(4, 0),
        walls: [],
        p1WallsLeft: 10,
        p2WallsLeft: 10,
        turn: PlayerType.player1,
        seriesLength: seriesLength ?? _state?.seriesLength,
        p1Wins: keepWins ? (_state?.p1Wins ?? 0) : 0,
        p2Wins: keepWins ? (_state?.p2Wins ?? 0) : 0,
        gameMode: mode ?? _state?.gameMode ?? GameMode.singlePlayer,
      );
      _isWallTypeSelected = false;
    });
  }

  void _showModeSelection() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Select Game Mode',
            textAlign: TextAlign.center, style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _modeOption(GameMode.singlePlayer, 'Play vs System'),
            _modeOption(GameMode.twoPlayers, 'Two Players'),
          ],
        ),
      ),
    );
  }

  Widget _modeOption(GameMode mode, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          minimumSize: Size(double.infinity, 45.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.pop(context);
          _initializeState(mode);
          _showSeriesSelection();
        },
        child: Text(label, style: CustomTextStyles.text14SemiBoldW600.copyWith(color: Colors.white)),
      ),
    );
  }

  void _showSeriesSelection() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Select Match Series Mode',
            textAlign: TextAlign.center, style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _seriesOption(1, 'Single Match'),
            _seriesOption(3, '3 Match Series'),
            _seriesOption(5, '5 Match of Series'),
          ],
        ),
      ),
    );
  }

  Widget _seriesOption(int count, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          minimumSize: Size(double.infinity, 45.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.pop(context);
          _resetGame(seriesLength: count);
        },
        child: Text(label, style: CustomTextStyles.text14SemiBoldW600.copyWith(color: Colors.white)),
      ),
    );
  }

  void _handleCellTap(Point p) {
    final state = _state;
    if (state == null || state.winner != null) return;

    // In two player mode, anyone can click if it's their turn
    // In single player mode, only P1 (human) can click on their turn
    if (state.gameMode == GameMode.singlePlayer && state.turn != PlayerType.player1) return;

    if (_isWallTypeSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please deselect wall type to move!'), duration: Duration(milliseconds: 500)),
      );
      return;
    }

    final currentPos = state.turn == PlayerType.player1 ? state.p1Pos : state.p2Pos;
    if (QuoridorEngine.isMoveValid(state, currentPos, p)) {
      _processMove(targetPos: p);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid move!'), duration: Duration(milliseconds: 500)),
      );
    }
  }

  void _handleWallTap(Point intersection, WallOrientation orientation) {
    final state = _state;
    if (state == null || state.winner != null) return;
    if (state.gameMode == GameMode.singlePlayer && state.turn != PlayerType.player1) return;

    if (!_isWallTypeSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select wall type first!'), duration: Duration(milliseconds: 500)),
      );
      return;
    }

    final newWall = Wall(intersection, orientation, state.turn);
    if (QuoridorEngine.isWallValid(state, newWall)) {
      setState(() {
        final wallsLeft = state.turn == PlayerType.player1 ? state.p1WallsLeft - 1 : state.p2WallsLeft - 1;
        _state = state.copyWith(
          walls: List.from(state.walls)..add(newWall),
          p1WallsLeft: state.turn == PlayerType.player1 ? wallsLeft : state.p1WallsLeft,
          p2WallsLeft: state.turn == PlayerType.player2 ? wallsLeft : state.p2WallsLeft,
          turn: state.turn == PlayerType.player1 ? PlayerType.player2 : PlayerType.player1,
        );
        _isWallTypeSelected = false;
      });
      
      if (_state!.gameMode == GameMode.singlePlayer && _state!.turn == PlayerType.player2) {
        _triggerAIMove();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid wall placement!'), duration: Duration(milliseconds: 500)),
      );
    }
  }

  void _processMove({required Point targetPos}) {
    final state = _state;
    if (state == null) return;

    setState(() {
      _state = state.copyWith(
        p1Pos: state.turn == PlayerType.player1 ? targetPos : state.p1Pos,
        p2Pos: state.turn == PlayerType.player2 ? targetPos : state.p2Pos,
        turn: state.turn == PlayerType.player1 ? PlayerType.player2 : PlayerType.player1,
      );

      final roundWinner = QuoridorEngine.checkWinner(_state!);
      if (roundWinner != null) {
        _handleRoundEnd(roundWinner);
      } else if (_state!.gameMode == GameMode.singlePlayer && _state!.turn == PlayerType.player2) {
        _triggerAIMove();
      }
    });
  }

  void _handleRoundEnd(PlayerType roundWinner) {
    final state = _state;
    if (state == null) return;

    int p1Wins = state.p1Wins + (roundWinner == PlayerType.player1 ? 1 : 0);
    int p2Wins = state.p2Wins + (roundWinner == PlayerType.player2 ? 1 : 0);

    setState(() {
      _state = state.copyWith(p1Wins: p1Wins, p2Wins: p2Wins, winner: roundWinner);
    });

    bool seriesEnded = false;
    PlayerType? seriesWinner;

    if (_state!.seriesLength != null) {
      if (p1Wins + p2Wins >= _state!.seriesLength!) {
        seriesEnded = true;
        int winThreshold = (_state!.seriesLength! / 2).ceil();
        if (p1Wins >= winThreshold) {
          if (state.gameMode == GameMode.singlePlayer) _totalSeriesWins++;
          seriesWinner = PlayerType.player1;
        } else if (p2Wins >= winThreshold) {
          if (state.gameMode == GameMode.singlePlayer) _totalSeriesLosses++;
          seriesWinner = PlayerType.player2;
        }
        _saveStats();
      }
    }

    _showWinPopup(roundWinner, seriesEnded, seriesWinner);
  }

  void _showWinPopup(PlayerType roundWinner, bool seriesEnded, PlayerType? seriesWinner) {
    String p1Name = _state?.gameMode == GameMode.singlePlayer ? 'YOU' : 'PLAYER 1';
    String p2Name = _state?.gameMode == GameMode.singlePlayer ? 'SYSTEM' : 'PLAYER 2';

    String title = seriesEnded ? 'SERIES CHAMPION!' : 'MATCH WINNER!';
    String message = '';
    
    if (seriesEnded) {
      message = seriesWinner == PlayerType.player1 ? 'CONGRATULATIONS! $p1Name WON THE SERIES!' : '$p2Name WON THE SERIES!';
    } else {
      message = roundWinner == PlayerType.player1 ? '$p1Name WON THIS MATCH!' : '$p2Name WON THIS MATCH!';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TweenAnimationBuilder(
        duration: const Duration(milliseconds: 600),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, double value, child) => Transform.scale(
          scale: value,
          child: AlertDialog(
            backgroundColor: const Color(0xFF2C3E50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(seriesEnded ?'assets/images/champion.png':'assets/images/winner.png', height: 120.h, width: 120.w),
                // Icon(seriesEnded ? Icons.emoji_events : Icons.stars,
                //     color: Colors.yellow, size: 80.w),
                SizedBox(height: 16.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.yellow),
                ),
                SizedBox(height: 12.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.text14SemiBoldW600.copyWith(color: Colors.white),
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    minimumSize: Size(120.w, 40.h),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    if (seriesEnded) {
                      _resetGame();
                      _showModeSelection();
                    } else {
                      _resetGame(keepWins: true);
                    }
                  },
                  child: Text(seriesEnded ? 'New Series' : 'Next Match',
                      style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLeaderboard() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const QuoridorLeaderboard(),
    );
  }

  void _triggerAIMove() async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted || _state == null) return;

    final action = QuoridorEngine.getAIMove(_state!);
    if (action is Point) {
      _processMove(targetPos: action);
    } else if (action is Wall) {
      setState(() {
        _state = _state!.copyWith(
          walls: List.from(_state!.walls)..add(action),
          p2WallsLeft: _state!.p2WallsLeft - 1,
          turn: PlayerType.player1,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF2C3E50),
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }
    final state = _state!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text('Quoridor Strategy', style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard_rounded, color: Colors.yellow),
            onPressed: () => _showLeaderboard(),
          ),
        ],
      ),
      body: Column(
        children: [

          _buildSeriesScore(state),
          _buildScoreBoard(state),
          if (state.gameMode == GameMode.twoPlayers) _buildTopControls(state),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF5F6FA), Color(0xFFDCDDE1)],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(child: _buildBoard(state)),
              ),
            ),
          ),
          _buildBottomControls(state),
        ],
      ),
    );
  }

  Widget _buildTopControls(QuoridorState state) {
    return Transform.rotate(
      angle: 3.14159, // Rotate for the player on the opposite side
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _wallTypeButton('Horizontal', true, PlayerType.player2),
            SizedBox(width: 10.w),
            _wallTypeButton('Vertical', false, PlayerType.player2),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls(QuoridorState state) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _wallTypeButton('Horizontal', true, PlayerType.player1),
              SizedBox(width: 10.w),
              _wallTypeButton('Vertical', false, PlayerType.player1),
            ],
          ),
          // SizedBox(height: 10.h),
          TextButton(
            onPressed: _showResetConfirmation,
            child: Text('Reset Game / Change Mode', style: TextStyle(color: Colors.grey[600])),
          ),
        ],
      ),
    );
  }

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
        title: Text('Reset Game?',
            style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        content: Text('Are you sure you want to reset the current game and change mode?',
            style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.white70)),
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

  Widget _wallTypeButton(String label, bool isHorizontal, PlayerType playerSide) {
    final state = _state!;
    bool isCurrentTurn = state.turn == playerSide;
    bool isSelected = _isWallTypeSelected && _placingHorizontal == isHorizontal && state.turn == playerSide;

    return Opacity(
      opacity: isCurrentTurn ? 1.0 : 0.5,
      child: GestureDetector(
        onTap: () {
          if (!isCurrentTurn) return;
          setState(() {
            if (isSelected) {
              _isWallTypeSelected = false;
            } else {
              _isWallTypeSelected = true;
              _placingHorizontal = isHorizontal;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? (playerSide == PlayerType.player1 ? AppColor.primaryColor : Colors.orangeAccent) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: playerSide == PlayerType.player1 ? AppColor.primaryColor : Colors.orangeAccent,
              width: 2,
            ),
          ),
          child: Text(
            label,
            style: CustomTextStyles.text14SemiBoldW600.copyWith(
              color: isSelected ? Colors.white : (playerSide == PlayerType.player1 ? AppColor.primaryColor : Colors.orangeAccent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeriesScore(QuoridorState state) {
    if (state.seriesLength == null) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      color: const Color(0xFF2C3E50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, color: Colors.yellow, size: 20.w),
          SizedBox(width: 8.w),
          Text(
            'SERIES: ${state.p1Wins} - ${state.p2Wins} (Best of ${state.seriesLength})',
            style: CustomTextStyles.text12SemiBoldW600.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBoard(QuoridorState state) {
    String p1Name = state.gameMode == GameMode.singlePlayer ? 'YOU' : 'PLAYER 1';
    String p2Name = state.gameMode == GameMode.singlePlayer ? 'SYSTEM' : 'PLAYER 2';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _playerCard(p1Name, state.p1WallsLeft, Colors.cyan, state.turn == PlayerType.player1),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('VS', style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor)),
              ),
              _playerCard(p2Name, state.p2WallsLeft, Colors.orangeAccent, state.turn == PlayerType.player2),
            ],
          ),
          if (state.gameMode == GameMode.singlePlayer) ...[
            SizedBox(height: 10.h),
            Text(
              'Lifetime Series Wins: $_totalSeriesWins | Losses: $_totalSeriesLosses',
              style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey[600]),
            ),
          ]
        ],
      ),
    );
  }

  Widget _playerCard(String name, int walls, Color color, bool isTurn) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: isTurn ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isTurn ? color : Colors.transparent, width: 2),
      ),
      child: Column(
        children: [
          Text(name, style: CustomTextStyles.text14SemiBoldW600.copyWith(color: isTurn ? color : Colors.grey[600])),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.layers, size: 14.w, color: Colors.brown),
              SizedBox(width: 4.w),
              Text('$walls', style: CustomTextStyles.text12SemiBoldW600),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(QuoridorState state) {
    double cellSize = 32.w;
    double wallSize = 6.w;
    double totalSize = (cellSize * 9) + (wallSize * 8);

    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15, spreadRadius: 2),
        ],
      ),
      child: Container(
        width: totalSize,
        height: totalSize,
        decoration: BoxDecoration(
          color: const Color(0xFF34495E),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            for (int y = 0; y < 9; y++)
              for (int x = 0; x < 9; x++)
                Positioned(
                  left: x * (cellSize + wallSize),
                  top: y * (cellSize + wallSize),
                  child: Container(
                    width: cellSize,
                    height: cellSize,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECF0F1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

            for (int y = 0; y < 9; y++)
              for (int x = 0; x < 9; x++)
                Positioned(
                  left: x * (cellSize + wallSize),
                  top: y * (cellSize + wallSize),
                  child: GestureDetector(
                    onTap: () => _handleCellTap(Point(x, y)),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: cellSize,
                      height: cellSize,
                      color: Colors.transparent,
                    ),
                  ),
                ),

            // Movement Hints for Current Player
            if (state.winner == null && (state.gameMode == GameMode.twoPlayers || state.turn == PlayerType.player1))
              for (int y = 0; y < 9; y++)
                for (int x = 0; x < 9; x++)
                  if (QuoridorEngine.isMoveValid(state, state.turn == PlayerType.player1 ? state.p1Pos : state.p2Pos, Point(x, y)))
                    Positioned(
                      left: x * (cellSize + wallSize) + cellSize / 3,
                      top: y * (cellSize + wallSize) + cellSize / 3,
                      child: IgnorePointer(
                        child: Container(
                          width: cellSize / 3,
                          height: cellSize / 3,
                          decoration: BoxDecoration(
                            color: (state.turn == PlayerType.player1 ? Colors.cyan : Colors.orangeAccent).withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

            for (int y = 0; y < 8; y++)
              for (int x = 0; x < 8; x++)
                _buildIntersectionDot(Point(x, y), state, cellSize, wallSize),

            if (state.winner == null && _isWallTypeSelected && (state.gameMode == GameMode.twoPlayers || state.turn == PlayerType.player1))
              for (int y = 0; y < 8; y++)
                for (int x = 0; x < 8; x++)
                  if (QuoridorEngine.isWallValid(state, Wall(Point(x, y), _placingHorizontal ? WallOrientation.horizontal : WallOrientation.vertical, state.turn)))
                    _buildWallHint(Point(x, y), cellSize, wallSize),

            for (final wall in state.walls) _buildPlacedWall(wall, cellSize, wallSize),

            _buildAnimatedPawn(state.p1Pos, cellSize, wallSize, Colors.cyan, Icons.person),
            _buildAnimatedPawn(state.p2Pos, cellSize, wallSize, Colors.orangeAccent, state.gameMode == GameMode.singlePlayer ? Icons.computer : Icons.person),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedPawn(Point pos, double cellSize, double wallSize, Color color, IconData icon) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: pos.x * (cellSize + wallSize),
      top: pos.y * (cellSize + wallSize),
      child: SizedBox(
        width: cellSize,
        height: cellSize,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)],
            ),
            child: Icon(icon, color: Colors.white, size: 20.w),
          ),
        ),
      ),
    );
  }

  Widget _buildPlacedWall(Wall wall, double cellSize, double wallSize) {
    bool isHor = wall.orientation == WallOrientation.horizontal;
    Color wallColor = wall.owner == PlayerType.player1 ? Colors.cyan : Colors.orangeAccent;
    return Positioned(
      left: wall.position.x * (cellSize + wallSize) + (isHor ? 0 : cellSize),
      top: wall.position.y * (cellSize + wallSize) + (isHor ? cellSize : 0),
      child: Container(
        width: isHor ? (cellSize * 2 + wallSize) : wallSize,
        height: isHor ? wallSize : (cellSize * 2 + wallSize),
        decoration: BoxDecoration(
          color: wallColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2, offset: const Offset(1, 1))],
        ),
      ),
    );
  }

  Widget _buildIntersectionDot(Point p, QuoridorState state, double cellSize, double wallSize) {
    if (!_isWallTypeSelected) return const SizedBox.shrink();
    if (state.gameMode == GameMode.singlePlayer && state.turn != PlayerType.player1) return const SizedBox.shrink();

    bool canPlaceHor = QuoridorEngine.isWallValid(state, Wall(p, WallOrientation.horizontal, state.turn));
    bool canPlaceVer = QuoridorEngine.isWallValid(state, Wall(p, WallOrientation.vertical, state.turn));

    bool currentValid = _placingHorizontal ? canPlaceHor : canPlaceVer;
    if (!currentValid) return const SizedBox.shrink();

    return Positioned(
      left: p.x * (cellSize + wallSize) + cellSize - 2.w,
      top: p.y * (cellSize + wallSize) + cellSize - 2.w,
      child: GestureDetector(
        onTap: () => _handleWallTap(p, _placingHorizontal ? WallOrientation.horizontal : WallOrientation.vertical),
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: wallSize + 4.w,
          height: wallSize + 4.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 4.w,
              height: 4.w,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWallHint(Point p, double cellSize, double wallSize) {
    bool isHor = _placingHorizontal;
    return Positioned(
      left: p.x * (cellSize + wallSize) + (isHor ? 0 : cellSize),
      top: p.y * (cellSize + wallSize) + (isHor ? cellSize : 0),
      child: IgnorePointer(
        child: Container(
          width: isHor ? (cellSize * 2 + wallSize) : wallSize,
          height: isHor ? wallSize : (cellSize * 2 + wallSize),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
