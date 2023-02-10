class Leave {
  final String? id;
  final String? leaveType;
  final String? fromDate;
  final String? fromDateType;
  final String? toDate;
  final String? toDateType;
  final String? description;
  final String? userId;
  final String? createDate;
  final String? status;

  Leave(
      this.id,
      this.leaveType,
      this.fromDate,
      this.fromDateType,
      this.toDate,
      this.toDateType,
      this.description,
      this.userId,
      this.createDate,
      this.status);

  factory Leave.fromMap(Map<dynamic, dynamic> map) {
    return Leave(
      map['id'],
      map['timeOffType'],
      map['fromDate'],
      map['fromDateType'],
      map['toDate'],
      map['toDateType'],
      map['description'],
      map['userId'],
      map['createDate'],
      map['status'],
    );
  }
}
