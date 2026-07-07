import 'package:equatable/equatable.dart';
import '../../../../../core/entities/send_answers_entity.dart';



class SendParams extends Equatable {
  const SendParams({required this.answers});

  final SendAnswers answers;

  @override
  List<Object?> get props => <Object?>[answers];
}
