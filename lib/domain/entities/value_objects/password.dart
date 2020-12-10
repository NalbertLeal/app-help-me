class Password {
  final String password;

  Password(this.password);

  bool get isValid {
    return password.length > 7 &&
     password.length < 21 &&
     RegExp('[0-9a-zA-Z ]+').hasMatch(password);
  }
}