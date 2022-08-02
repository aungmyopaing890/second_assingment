class Token {
  final String accessToken;
  Token(this.accessToken);
  Token.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'];
}
