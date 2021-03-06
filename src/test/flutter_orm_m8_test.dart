import 'package:test/test.dart';
import 'package:flutter_orm_m8/flutter_orm_m8.dart';

import 'base_implementations/accountrelated/a01_entity.dart';
import 'base_implementations/independent/i01_entity.dart';
import 'base_implementations/user_account.dart';

void main() {
  test('column metadata alteration', () {
    expect(ColumnMetadata.Ignore, 1);
    expect(ColumnMetadata.PrimaryKey, 2);
    expect(ColumnMetadata.Unique, 4);
    expect(ColumnMetadata.NotNull, 8);
    expect(ColumnMetadata.AutoIncrement, 16);
    expect(ColumnMetadata.Indexed, 32);
    expect(
        ColumnMetadata.PrimaryKey |
            ColumnMetadata.Unique |
            ColumnMetadata.AutoIncrement,
        22);
  });

  test('table metadata alteration', () {
    expect(TableMetadata.SoftDeletable, 1);
    expect(TableMetadata.TrackCreate, 2);
    expect(TableMetadata.TrackUpdate, 4);
  });

  group('base classes definitions', () {
    test('simple entity', () {
      DbEntity dbEntity = I01Entity(1552003055, "New entry");
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
    });
    test('account', () {
      DbAccountEntity dbEntity =
          UserAccount('John Doe', 'john.ross@the.dev', 'JR');
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
      expect(dbEntity.userName, 'John Doe');
      expect(dbEntity.email, 'john.ross@the.dev');
      expect(dbEntity.abbreviation, 'JR');
    });
    test('account related', () {
      DbAccountRelatedEntity dbEntity = A01Entity(1552003055, 2, "Other entry");
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
      expect(dbEntity.accountId, 2);
    });
  });
}
