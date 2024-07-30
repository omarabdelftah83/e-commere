part of 'sing_in_bloc.dart';

@immutable
sealed class SingInEvent {}
class ButtonEventEmailAndPassword extends SingInEvent{
  final BuildContext context;

  ButtonEventEmailAndPassword(this.context);
}
class ButtonEventWithGoogle extends SingInEvent{
  final BuildContext context;
  ButtonEventWithGoogle(this.context);


}
