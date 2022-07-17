class Setting {
  final int id, price_for_k;
  final String? phone_2, fb_url, tw_url;
  final String appName,
      appVersion,
      phone,
      email,
      address,
      policy;

  Setting(
      {required this.id,
      required this.appName,
      required this.appVersion,
      required this.phone,
      required this.phone_2,
      required this.email,
      required this.address,
      required this.fb_url,
      required this.tw_url,
      required this.price_for_k,
      required this.policy});

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
        id: json['id'],
        appName: json['appName'],
        appVersion: json["appVersion"],
        email: json["email"],
        phone: json["phone"],
        phone_2: json["phone_2"],
        address: json["address"],
        fb_url: json["fb_url"],
        tw_url: json["tw_url"],
        price_for_k: json["price_for_k"],
        policy: json["policy"]);
  }
}
