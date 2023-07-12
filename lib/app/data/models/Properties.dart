class Properties {
  DateTime serverDateTime = DateTime.utc(2023, 07, 12);

  Properties({serverDateTime});

  Properties.fromJson(Map<String, dynamic> json) {
    serverDateTime = json['serverDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['serverDateTime'] = serverDateTime;

    return json;
  }
}