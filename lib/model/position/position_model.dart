import 'dart:convert';
import 'dart:ffi';

class Position {
  String positionName;
  String positionID;

  Position({
    required this.positionName,
    required this.positionID,
  });

  Position copyWith({
    String? positionName,
    String? positionID,
  }) {
    return Position(
      positionName: positionName ?? this.positionName,
      positionID: positionID ?? this.positionID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'positionName': positionName,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
        positionName: map['positionName'], positionID: map['positionID']);
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) =>
      Position.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Position(positionName: $positionName,positionID:$positionID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Position &&
        other.positionName == positionName &&
        other.positionID == positionID;
    // mapEquals(other.price, price) &&
    // mapEquals(other.timing, timing);
  }

  @override
  int get hashCode {
    return positionName.hashCode ^ positionID.hashCode;
  }
}
