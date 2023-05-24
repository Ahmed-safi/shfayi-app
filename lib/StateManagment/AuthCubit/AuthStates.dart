abstract class AuthStates {}

class AuthStatesInitialState extends AuthStates {}

class StatesModeState extends AuthStates {}

class StatesNavigationState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String? error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends AuthStates {}

class CreateUserErrorState extends AuthStates {
  final String? error;

  CreateUserErrorState(this.error);
}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final isDoctor;

  LoginSuccessState(this.isDoctor);
}

class LoginErrorState extends AuthStates {
  final String? error;

  LoginErrorState(this.error);
}

class GetUserDataLoadingState extends AuthStates {}

class GetUserDataSuccessState extends AuthStates {}

class GetUserDataErrorState extends AuthStates {}

class IsCheckedState extends AuthStates {}

class IsVisibleState extends AuthStates {}

class SignOutSuccess extends AuthStates {}

class GetUserDataSuccess extends AuthStates {}

class GetLandsLoadingState extends AuthStates {}

class GetLandsSuccessState extends AuthStates {}

class GetLandsErrorState extends AuthStates {}

class PickImagesLoadingState extends AuthStates {}

class PickImagesSuccessState extends AuthStates {}

class PickImagesErrorState extends AuthStates {}

class AddLandLoadingState extends AuthStates {}

class AddLandSuccessState extends AuthStates {}

class AddLandErrorState extends AuthStates {}

class ResetPasswordSuccessState extends AuthStates {}

class ResetPasswordErrorState extends AuthStates {}

class UpdateUserLoadingState extends AuthStates {}

class UpdateUserSuccessState extends AuthStates {}

class UpdateUserErrorState extends AuthStates {}

class GetMyLandsLoadingState extends AuthStates {}

class GetMyLandsSuccessState extends AuthStates {}

class GetMyLandsErrorState extends AuthStates {}

class RemoveLandSuccess extends AuthStates {}
