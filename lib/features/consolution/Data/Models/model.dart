class Message {
  final String name;
  final String message;
  final String time;

  Message({required this.name, required this.message, required this.time});

  // تحويل JSON إلى نموذج البيانات
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      name: json['name'],
      message: json['message'],
      time: json['time'],
    );
  }
}
