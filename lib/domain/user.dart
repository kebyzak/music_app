class User {
  final String uid;
  final String email;
  final String name;

  User({required this.uid, required this.email, required this.name});

  factory User.fromFirebaseUser(User user) {
    return User(
      uid: user.uid,
      email: user.email,
      name: user.name,
    );
  }
}
