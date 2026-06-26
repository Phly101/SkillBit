import 'package:equatable/equatable.dart';

class UploadParams extends Equatable {
  const UploadParams({required this.imageUrl});

  final String imageUrl;

  @override
  List<Object?> get props => <Object?>[imageUrl];
}
