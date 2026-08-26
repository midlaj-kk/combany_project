import 'package:flutter_test/flutter_test.dart';

import 'package:auto_care_app/features/admin/data/models/user_model.dart';

void main() {
  group('UserCreateRequest serialization', () {
    for (final role in UserRole.values) {
      test('role ${role.name}: status is never null in JSON payload', () {
        final request = UserCreateRequest(
          email: 'staff_${role.name}@autocare.com',
          name: 'Test Staff',
          phone: '+15550000000',
          role: role,
          specialization: role == UserRole.mechanic ? 'Engine' : null,
          password: 'Str0ngPass!123',
        );

        final json = request.toJson();

        expect(json['status'], isNotNull,
            reason: 'status must never be serialized as null');
        expect(json['status'], anyOf('active', 'inactive'));
      });
    }

    test('defaults to active when not specified', () {
      final request = UserCreateRequest(
        email: 'mechanic@autocare.com',
        name: 'Mechanic',
        phone: '+15550000001',
        role: UserRole.mechanic,
        password: 'Str0ngPass!123',
      );
      expect(request.status, 'active');
    });

    test('explicit inactive overrides default', () {
      final request = UserCreateRequest(
        email: 'x@autocare.com',
        name: 'X',
        phone: '+15550000002',
        role: UserRole.admin,
        status: 'inactive',
        password: 'pw',
      );
      expect(request.status, 'inactive');
    });
  });
}
