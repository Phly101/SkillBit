class EmailModel {
  const EmailModel({required this.email});
  final String email;

  Map<String,dynamic> toJson() => <String, dynamic>{
    'email':email
  };
}

