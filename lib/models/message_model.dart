class MessageModel {
  final String title;
  final String body;
  final Map<String, dynamic> data;

  const MessageModel({
    required this.title,
    required this.body,
    required this.data,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        title: json['title'] as String,
        body: json['body'] as String,
        data: json['data'] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'body': body,
        'data': data,
      };
}
