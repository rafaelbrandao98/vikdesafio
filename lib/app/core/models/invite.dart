class Invite {
  final String uuid;
  final String name;
  final String kind;
  final String email;
  final String? code;
  final String? cpf;
  final bool active;
  final String companyName;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Construtor
  Invite({
    required this.uuid,
    required this.name,
    required this.kind,
    required this.email,
    this.code,
    this.cpf,
    required this.active,
    required this.companyName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Invite.fromMap(Map<String, dynamic> data) {
    print(data);
    return Invite(
      uuid: data['uuid'],
      name: data['name'],
      kind: data['kind'],
      email: data['email'] ?? '',
      code: data['code'] ?? '',
      cpf: data['cpf'],
      active: data['active'],
      companyName: data['company_name'],
      createdAt: DateTime.parse(data['created_at']),
      updatedAt: DateTime.parse(data['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'kind': kind,
      'email': email,
      'code': code,
      'cpf': cpf,
      'active': active,
      'company_name': companyName,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
