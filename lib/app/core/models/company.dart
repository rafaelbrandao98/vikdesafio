class Company {
  final String uuid;
  final String name;
  final String address;
  final String site;
  final bool active;

  Company(
      {required this.uuid,
      required this.name,
      required this.address,
      required this.active,
      required this.site});

  factory Company.fromMap(Map<String, dynamic> data) {
    return Company(
      uuid: data['uuid'],
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      site: data['site'] ?? '',
      active: data['active'] ?? false, // Adicionando valor padrão para `active`
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'site': site,
    };
  }
}
