import 'package:training_acedamy/core/routing/routes.dart';

enum UserType {
  employee,
  client;

  String get databaseName {
    switch (this) {
      case UserType.employee:
        return 'Employee';
      case UserType.client:
        return 'Client';
    }
  }

  String get route {
    switch (this) {
      case UserType.employee:
        return Routes.employeeHome;
      case UserType.client:
        return Routes.clientHome;
    }
  }
}
