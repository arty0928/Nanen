class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        print('invalid-email');
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');

      case 'user-disabled':
        print('user-disabled');
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');

      case 'user-not-found':
        print('user-not-found');
        return const LogInWithEmailAndPasswordFailure(
            'No user found with this email address');

      case 'wrong-password':
        print('wrong-password');
        return const LogInWithEmailAndPasswordFailure(
            'Incorrect password. Please try again');

      default:
        print(code);
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
