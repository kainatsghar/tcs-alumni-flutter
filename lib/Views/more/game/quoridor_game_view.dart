import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_color.dart';
import '../../../utils/text_styles.dart';
import 'quoridor_models.dart';
import 'quoridor_engine.dart';

class QuoridorGameView extends StatefulWidget {
  const QuoridorGameView({Key? key}) : super(key: key);

  @override
  _QuoridorGameViewState createState() => _QuoridorGameViewState();
}

class _QuoridorGameViewState extends State<QuoridorGameView> {
  QuoridorState? _state;
  bool _isPlayerTurn = true;
  bool? _placingHorizontal; // Null means no wall type selected yet
  int _totalSeriesWins = 0;
  int _totalSeriesLosses = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
    _initializeState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showSeriesSelection());
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

  void _initializeState() {
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
    );
  }

  void _resetGame({int? seriesLength, bool keepWins = false}) {
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
      );
      _isPlayerTurn = true;
    });
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
    if (state == null || !_isPlayerTurn || state.winner != null) return;

    if (QuoridorEngine.isMoveValid(state, state.p1Pos, p)) {
      _processMove(p1Pos: p);
    }
  }

  void _handleWallTap(Point intersection, WallOrientation orientation) {
    final state = _state;
    if (state == null || !_isPlayerTurn || state.winner != null) return;

    // Must select wall type first
    if (_placingHorizontal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select wall type first!'), duration: Duration(seconds: 1)),
      );
      return;
    }

    final newWall = Wall(intersection, orientation, PlayerType.player1);
    if (QuoridorEngine.isWallValid(state, newWall)) {
      setState(() {
        _state = state.copyWith(
          walls: List.from(state.walls)..add(newWall),
          p1WallsLeft: state.p1WallsLeft - 1,
          turn: PlayerType.player2,
        );
        _isPlayerTurn = false;
        _placingHorizontal = null; // Reset selection after placement
      });
      _triggerAIMove();
    }
  }

  void _processMove({Point? p1Pos, Point? p2Pos}) {
    final state = _state;
    if (state == null) return;

    setState(() {
      if (p1Pos != null) _state = state.copyWith(p1Pos: p1Pos, turn: PlayerType.player2);
      if (p2Pos != null) _state = state.copyWith(p2Pos: p2Pos, turn: PlayerType.player1);

      final roundWinner = QuoridorEngine.checkWinner(_state!);
      if (roundWinner != null) {
        _handleRoundEnd(roundWinner);
      } else if (p1Pos != null) {
        _isPlayerTurn = false;
        _triggerAIMove();
      } else {
        _isPlayerTurn = true;
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
          _totalSeriesWins++;
          seriesWinner = PlayerType.player1;
        } else if (p2Wins >= winThreshold) {
          _totalSeriesLosses++;
          seriesWinner = PlayerType.player2;
        }
        _saveStats();
      }
    }

    _showWinPopup(roundWinner, seriesEnded, seriesWinner);
  }

  void _showWinPopup(PlayerType roundWinner, bool seriesEnded, PlayerType? seriesWinner) {
    String title = seriesEnded ? 'SERIES CHAMPION!' : 'MATCH WINNER!';
    String message = '';
    
    if (seriesEnded) {
      message = seriesWinner == PlayerType.player1 ? 'CONGRATULATIONS! YOU WON THE SERIES!' : 'SYSTEM WON THE SERIES! BETTER LUCK NEXT TIME.';
    } else {
      message = roundWinner == PlayerType.player1 ? 'YOU WON THIS MATCH!' : 'SYSTEM WON THIS MATCH!';
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
                Icon(seriesEnded ? Icons.emoji_events : Icons.stars,
                    color: Colors.yellow, size: 80.w),
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
                      _showSeriesSelection();
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

  void _triggerAIMove() async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted || _state == null) return;

    final action = QuoridorEngine.getAIMove(_state!);
    if (action is Point) {
      _processMove(p2Pos: action);
    } else if (action is Wall) {
      setState(() {
        _state = _state!.copyWith(
          walls: List.from(_state!.walls)..add(action),
          p2WallsLeft: _state!.p2WallsLeft - 1,
          turn: PlayerType.player1,
        );
        _isPlayerTurn = true;
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
        title: Text('Quoridor Series', style: CustomTextStyles.text16SemiBoldW600.copyWith(color: Colors.white)),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSeriesScore(state),
          _buildScoreBoard(state),
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
          _buildControls(),
        ],
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
              _playerCard('YOU', state.p1WallsLeft, Colors.cyanAccent, state.turn == PlayerType.player1),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('VS', style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor)),
              ),
              _playerCard('SYSTEM', state.p2WallsLeft, Colors.orangeAccent, state.turn == PlayerType.player2),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Lifetime Series Wins: $_totalSeriesWins | Losses: $_totalSeriesLosses',
            style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey[600]),
          ),
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
                    child: SizedBox(width: cellSize, height: cellSize),
                  ),
                ),

            if (_isPlayerTurn && state.winner == null)
              for (int y = 0; y < 9; y++)
                for (int x = 0; x < 9; x++)
                  if (QuoridorEngine.isMoveValid(state, state.p1Pos, Point(x, y)))
                    Positioned(
                      left: x * (cellSize + wallSize) + cellSize / 3,
                      top: y * (cellSize + wallSize) + cellSize / 3,
                      child: IgnorePointer(
                        child: Container(
                          width: cellSize / 3,
                          height: cellSize / 3,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

            if (_isPlayerTurn && state.winner == null)
              for (int y = 0; y < 8; y++)
                for (int x = 0; x < 8; x++)
                  _buildIntersectionDot(Point(x, y), state, cellSize, wallSize),

            if (_isPlayerTurn && state.winner == null && _placingHorizontal != null)
              for (int y = 0; y < 8; y++)
                for (int x = 0; x < 8; x++)
                  if (QuoridorEngine.isWallValid(state, Wall(Point(x, y), _placingHorizontal! ? WallOrientation.horizontal : WallOrientation.vertical, PlayerType.player1)))
                    _buildWallHint(Point(x, y), cellSize, wallSize),

            for (final wall in state.walls) _buildPlacedWall(wall, cellSize, wallSize),

            _buildAnimatedPawn(state.p1Pos, cellSize, wallSize, Colors.cyanAccent, Icons.person),
            _buildAnimatedPawn(state.p2Pos, cellSize, wallSize, Colors.orangeAccent, Icons.computer),
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
    Color wallColor = wall.owner == PlayerType.player1 ? Colors.cyanAccent : Colors.orangeAccent;
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
    if (_placingHorizontal == null) return const SizedBox.shrink();

    bool canPlaceHor = QuoridorEngine.isWallValid(state, Wall(p, WallOrientation.horizontal, PlayerType.player1));
    bool canPlaceVer = QuoridorEngine.isWallValid(state, Wall(p, WallOrientation.vertical, PlayerType.player1));

    bool currentValid = _placingHorizontal! ? canPlaceHor : canPlaceVer;
    if (!currentValid) return const SizedBox.shrink();

    return Positioned(
      left: p.x * (cellSize + wallSize) + cellSize - 2.w,
      top: p.y * (cellSize + wallSize) + cellSize - 2.w,
      child: GestureDetector(
        onTap: () => _handleWallTap(p, _placingHorizontal! ? WallOrientation.horizontal : WallOrientation.vertical),
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
    if (_placingHorizontal == null) return const SizedBox.shrink();
    bool isHor = _placingHorizontal!;
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

  Widget _buildControls() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _wallTypeButton('Horizontal', true),
              SizedBox(width: 10.w),
              _wallTypeButton('Vertical', false),
            ],
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () {
              _resetGame();
              _showSeriesSelection();
            },
            child: Text('Reset Series', style: TextStyle(color: Colors.grey[600])),
          ),
        ],
      ),
    );
  }

  Widget _wallTypeButton(String label, bool isHorizontal) {
    bool isSelected = _placingHorizontal == isHorizontal;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _placingHorizontal = null; // Unselect if already selected
          } else {
            _placingHorizontal = isHorizontal; // Select new type
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.primaryColor, width: 2),
          boxShadow: isSelected ? [BoxShadow(color: AppColor.primaryColor.withOpacity(0.3), blurRadius: 4)] : null,
        ),
        child: Text(
          label,
          style: CustomTextStyles.text14SemiBoldW600.copyWith(color: isSelected ? Colors.white : AppColor.primaryColor),
        ),
      ),
    );
  }
}
