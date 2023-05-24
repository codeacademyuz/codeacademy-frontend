class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String? codeWars;
  final String gitHub;
  final String phone;
  final String? email;
  final String? tgUsername;
  String? startDate;
  String? endDate;

  Student({
    required this.id,
    required this.firstName,
    required this.email,
    required this.gitHub,
    required this.lastName,
    required this.phone,
    required this.codeWars,
    required this.tgUsername,
    required this.startDate,
    required this.endDate,
  });

  factory Student.getStudent(Map data) {
    return Student(
      id: data['id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      gitHub: data['github'],
      email: data['email'],
      phone: data['phone'],
      codeWars: data['codewars'],
      tgUsername: data['tg_username'],
      startDate: data['date_created'],
      endDate: data['date_updated'],
    );
  }
}
