import 'package:flutter/material.dart';

enum PlayerType { player1, player2 } // Player1 is human, Player2 is system

enum WallOrientation { horizontal, vertical }

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}

class Wall {
  final Point position; // Top-left corner of the 2x2 intersection where the wall starts
  final WallOrientation orientation;
  final PlayerType owner;

  const Wall(this.position, this.orientation, this.owner);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wall &&
          runtimeType == other.runtimeType &&
          position == other.position &&
          orientation == other.orientation &&
          owner == other.owner;

  @override
  int get hashCode => position.hashCode ^ orientation.hashCode ^ owner.hashCode;
}

enum GameMode { singlePlayer, twoPlayers }

class QuoridorState {
  final Point p1Pos;
  final Point p2Pos;
  final List<Wall> walls;
  final int p1WallsLeft;
  final int p2WallsLeft;
  final PlayerType turn;
  final PlayerType? winner;
  final int? seriesLength;
  final int p1Wins;
  final int p2Wins;
  final GameMode gameMode;

  QuoridorState({
    required this.p1Pos,
    required this.p2Pos,
    required this.walls,
    required this.p1WallsLeft,
    required this.p2WallsLeft,
    required this.turn,
    this.winner,
    this.seriesLength,
    this.p1Wins = 0,
    this.p2Wins = 0,
    required this.gameMode,
  });

  QuoridorState copyWith({
    Point? p1Pos,
    Point? p2Pos,
    List<Wall>? walls,
    int? p1WallsLeft,
    int? p2WallsLeft,
    PlayerType? turn,
    PlayerType? winner,
    int? seriesLength,
    int? p1Wins,
    int? p2Wins,
    GameMode? gameMode,
  }) {
    return QuoridorState(
      p1Pos: p1Pos ?? this.p1Pos,
      p2Pos: p2Pos ?? this.p2Pos,
      walls: walls ?? this.walls,
      p1WallsLeft: p1WallsLeft ?? this.p1WallsLeft,
      p2WallsLeft: p2WallsLeft ?? this.p2WallsLeft,
      turn: turn ?? this.turn,
      winner: winner ?? this.winner,
      seriesLength: seriesLength ?? this.seriesLength,
      p1Wins: p1Wins ?? this.p1Wins,
      p2Wins: p2Wins ?? this.p2Wins,
      gameMode: gameMode ?? this.gameMode,
    );
  }
}
