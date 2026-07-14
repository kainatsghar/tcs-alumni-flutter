 import 'dart:collection';
import 'quoridor_models.dart';

class QuoridorEngine {
  static const int boardSize = 9;

  static bool isMoveValid(QuoridorState state, Point from, Point to) {
    // 1. Check if 'to' is within board bounds
    if (to.x < 0 || to.x >= boardSize || to.y < 0 || to.y >= boardSize) return false;

    // 2. Check if 'to' is occupied by opponent (only if jumping)
    final opponentPos = state.turn == PlayerType.player1 ? state.p2Pos : state.p1Pos;
    
    // Direct neighbors
    final dx = (to.x - from.x).abs();
    final dy = (to.y - from.y).abs();

    if (dx + dy == 1) {
      if (to == opponentPos) return false; // Cannot land on opponent
      return !isWallBetween(state.walls, from, to);
    }

    // Jumping over opponent
    if (dx + dy == 2) {
      // Straight jump
      if (dx == 2 || dy == 2) {
        final mid = Point((from.x + to.x) ~/ 2, (from.y + to.y) ~/ 2);
        if (mid != opponentPos) return false;
        return !isWallBetween(state.walls, from, mid) && !isWallBetween(state.walls, mid, to);
      }
      // Diagonal jump (opponent at board edge or behind wall)
      if (dx == 1 && dy == 1) {
         // This is complex, but let's simplify for now: check if there's an opponent adjacent
         // and if they are blocked from moving forward.
         final adjX = Point(to.x, from.y);
         final adjY = Point(from.x, to.y);

         if (adjX == opponentPos) {
           // Can jump diagonally if opponent is at board edge or blocked by wall
           final beyondOpponent = Point(opponentPos.x + (opponentPos.x - from.x), opponentPos.y);
           bool blocked = beyondOpponent.x < 0 || beyondOpponent.x >= boardSize || isWallBetween(state.walls, opponentPos, beyondOpponent);
           if (blocked) {
             return !isWallBetween(state.walls, from, opponentPos) && !isWallBetween(state.walls, opponentPos, to);
           }
         }
         if (adjY == opponentPos) {
           final beyondOpponent = Point(opponentPos.x, opponentPos.y + (opponentPos.y - from.y));
           bool blocked = beyondOpponent.y < 0 || beyondOpponent.y >= boardSize || isWallBetween(state.walls, opponentPos, beyondOpponent);
           if (blocked) {
             return !isWallBetween(state.walls, from, opponentPos) && !isWallBetween(state.walls, opponentPos, to);
           }
         }
      }
    }

    return false;
  }

  static bool isWallBetween(List<Wall> walls, Point p1, Point p2) {
    if (p1.x == p2.x) {
      // Vertical movement, check horizontal walls
      final minY = p1.y < p2.y ? p1.y : p2.y;
      for (final wall in walls) {
        if (wall.orientation == WallOrientation.horizontal) {
          if (wall.position.y == minY && (wall.position.x == p1.x || wall.position.x == p1.x - 1)) {
            return true;
          }
        }
      }
    } else if (p1.y == p2.y) {
      // Horizontal movement, check vertical walls
      final minX = p1.x < p2.x ? p1.x : p2.x;
      for (final wall in walls) {
        if (wall.orientation == WallOrientation.vertical) {
          if (wall.position.x == minX && (wall.position.y == p1.y || wall.position.y == p1.y - 1)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static bool isWallValid(QuoridorState state, Wall newWall) {
    // 1. Bounds check (Wall position is 0 to 7)
    if (newWall.position.x < 0 || newWall.position.x >= boardSize - 1 ||
        newWall.position.y < 0 || newWall.position.y >= boardSize - 1) return false;

    // 2. Check if player has walls left
    if (state.turn == PlayerType.player1 && state.p1WallsLeft <= 0) return false;
    if (state.turn == PlayerType.player2 && state.p2WallsLeft <= 0) return false;

    // 3. Overlap check
    for (final wall in state.walls) {
      if (wall.position == newWall.position) return false; // Crosses same intersection
      if (wall.orientation == newWall.orientation) {
        if (wall.orientation == WallOrientation.horizontal) {
          if (wall.position.y == newWall.position.y && (wall.position.x - newWall.position.x).abs() < 2) return false;
        } else {
          if (wall.position.x == newWall.position.x && (wall.position.y - newWall.position.y).abs() < 2) return false;
        }
      }
    }

    // 4. Pathfinding check (Do not block all paths)
    final nextWalls = List<Wall>.from(state.walls)..add(newWall);
    if (getShortestPathLength(state.p1Pos, 0, nextWalls) == 999 || 
        getShortestPathLength(state.p2Pos, boardSize - 1, nextWalls) == 999) {
      return false;
    }

    return true;
  }

  static int getShortestPathLength(Point start, int goalY, List<Wall> walls) {
    final visited = <Point, int>{};
    final queue = Queue<Point>();
    queue.add(start);
    visited[start] = 0;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      final dist = visited[current]!;
      if (current.y == goalY) return dist;

      final neighbors = [
        Point(current.x, current.y - 1),
        Point(current.x, current.y + 1),
        Point(current.x - 1, current.y),
        Point(current.x + 1, current.y),
      ];

      for (final neighbor in neighbors) {
        if (neighbor.x >= 0 && neighbor.x < boardSize && neighbor.y >= 0 && neighbor.y < boardSize) {
          if (!visited.containsKey(neighbor) && !isWallBetween(walls, current, neighbor)) {
            visited[neighbor] = dist + 1;
            queue.add(neighbor);
          }
        }
      }
    }
    return 999; // No path found
  }

  static dynamic getAIMove(QuoridorState state) {
    // 1. Check current distances
    int aiDist = getShortestPathLength(state.p2Pos, boardSize - 1, state.walls);
    int playerDist = getShortestPathLength(state.p1Pos, 0, state.walls);

    // 2. Decide: Move or Place Wall?
    // If player is ahead or AI has walls left and player is close to winning
    if (state.p2WallsLeft > 0 && (playerDist <= aiDist || playerDist < 3)) {
      // Try to place a wall that increases player's path significantly
      Wall? bestWall;
      int maxIncrease = 0;

      // Sample some strategic wall positions near the player
      for (int y = state.p1Pos.y - 1; y <= state.p1Pos.y + 1; y++) {
        for (int x = state.p1Pos.x - 1; x <= state.p1Pos.x + 1; x++) {
          for (var orientation in WallOrientation.values) {
            final testWall = Wall(Point(x, y), orientation, PlayerType.player2);
            if (isWallValid(state, testWall)) {
              final nextWalls = List<Wall>.from(state.walls)..add(testWall);
              int newPlayerDist = getShortestPathLength(state.p1Pos, 0, nextWalls);
              int newAIDist = getShortestPathLength(state.p2Pos, boardSize - 1, nextWalls);
              
              // Only place if it helps AI more than it hurts AI
              if (newPlayerDist > playerDist && (newPlayerDist - playerDist) > (newAIDist - aiDist)) {
                int increase = newPlayerDist - playerDist;
                if (increase > maxIncrease) {
                  maxIncrease = increase;
                  bestWall = testWall;
                }
              }
            }
          }
        }
      }

      if (bestWall != null && maxIncrease > 0) {
        return bestWall;
      }
    }

    // 3. If not placing wall, move to the best neighbor
    Point? bestMove;
    int minNextDist = 999;

    // Check all valid moves (including jumps)
    for (int dy = -2; dy <= 2; dy++) {
      for (int dx = -2; dx <= 2; dx++) {
        if (dx == 0 && dy == 0) continue;
        final target = Point(state.p2Pos.x + dx, state.p2Pos.y + dy);
        if (isMoveValid(state, state.p2Pos, target)) {
          int d = getShortestPathLength(target, boardSize - 1, state.walls);
          if (d < minNextDist) {
            minNextDist = d;
            bestMove = target;
          }
        }
      }
    }

    return bestMove;
  }

  static PlayerType? checkWinner(QuoridorState state) {
    if (state.p1Pos.y == 0) return PlayerType.player1;
    if (state.p2Pos.y == boardSize - 1) return PlayerType.player2;
    return null;
  }
}
