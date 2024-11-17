// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTemplateItemCollection on Isar {
  IsarCollection<TemplateItem> get templateItems => this.collection();
}

const TemplateItemSchema = CollectionSchema(
  name: r'TemplateItem',
  id: 3492042616796161138,
  properties: {
    r'ambarTime': PropertySchema(
      id: 0,
      name: r'ambarTime',
      type: IsarType.long,
    ),
    r'greenTime': PropertySchema(
      id: 1,
      name: r'greenTime',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'orderNumber': PropertySchema(
      id: 3,
      name: r'orderNumber',
      type: IsarType.long,
    ),
    r'redTime': PropertySchema(
      id: 4,
      name: r'redTime',
      type: IsarType.long,
    ),
    r'role': PropertySchema(
      id: 5,
      name: r'role',
      type: IsarType.string,
    ),
    r'roleType': PropertySchema(
      id: 6,
      name: r'roleType',
      type: IsarType.byte,
      enumMap: _TemplateItemroleTypeEnumValueMap,
    ),
    r'scheduledStartTime': PropertySchema(
      id: 7,
      name: r'scheduledStartTime',
      type: IsarType.dateTime,
    ),
    r'templateId': PropertySchema(
      id: 8,
      name: r'templateId',
      type: IsarType.long,
    )
  },
  estimateSize: _templateItemEstimateSize,
  serialize: _templateItemSerialize,
  deserialize: _templateItemDeserialize,
  deserializeProp: _templateItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _templateItemGetId,
  getLinks: _templateItemGetLinks,
  attach: _templateItemAttach,
  version: '3.1.0+1',
);

int _templateItemEstimateSize(
  TemplateItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.role.length * 3;
  return bytesCount;
}

void _templateItemSerialize(
  TemplateItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ambarTime);
  writer.writeLong(offsets[1], object.greenTime);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.orderNumber);
  writer.writeLong(offsets[4], object.redTime);
  writer.writeString(offsets[5], object.role);
  writer.writeByte(offsets[6], object.roleType.index);
  writer.writeDateTime(offsets[7], object.scheduledStartTime);
  writer.writeLong(offsets[8], object.templateId);
}

TemplateItem _templateItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TemplateItem(
    ambarTime: reader.readLongOrNull(offsets[0]),
    greenTime: reader.readLongOrNull(offsets[1]),
    id: id,
    name: reader.readString(offsets[2]),
    orderNumber: reader.readLong(offsets[3]),
    redTime: reader.readLong(offsets[4]),
    role: reader.readString(offsets[5]),
    roleType:
        _TemplateItemroleTypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
            RoleType.speaker,
    scheduledStartTime: reader.readDateTime(offsets[7]),
    templateId: reader.readLong(offsets[8]),
  );
  return object;
}

P _templateItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_TemplateItemroleTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RoleType.speaker) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TemplateItemroleTypeEnumValueMap = {
  'speaker': 0,
  'nonSpeaker': 1,
};
const _TemplateItemroleTypeValueEnumMap = {
  0: RoleType.speaker,
  1: RoleType.nonSpeaker,
};

Id _templateItemGetId(TemplateItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _templateItemGetLinks(TemplateItem object) {
  return [];
}

void _templateItemAttach(
    IsarCollection<dynamic> col, Id id, TemplateItem object) {
  object.id = id;
}

extension TemplateItemQueryWhereSort
    on QueryBuilder<TemplateItem, TemplateItem, QWhere> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TemplateItemQueryWhere
    on QueryBuilder<TemplateItem, TemplateItem, QWhereClause> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TemplateItemQueryFilter
    on QueryBuilder<TemplateItem, TemplateItem, QFilterCondition> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ambarTime',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ambarTime',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ambarTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ambarTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ambarTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      ambarTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ambarTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'greenTime',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'greenTime',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'greenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'greenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'greenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      greenTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'greenTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      orderNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      orderNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      orderNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      orderNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      redTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'redTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      redTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'redTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      redTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'redTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      redTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'redTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> roleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleTypeEqualTo(RoleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleType',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleTypeGreaterThan(
    RoleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roleType',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleTypeLessThan(
    RoleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roleType',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      roleTypeBetween(
    RoleType lower,
    RoleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      scheduledStartTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      scheduledStartTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      scheduledStartTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      scheduledStartTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledStartTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      templateIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateId',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      templateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'templateId',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      templateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'templateId',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      templateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'templateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TemplateItemQueryObject
    on QueryBuilder<TemplateItem, TemplateItem, QFilterCondition> {}

extension TemplateItemQueryLinks
    on QueryBuilder<TemplateItem, TemplateItem, QFilterCondition> {}

extension TemplateItemQuerySortBy
    on QueryBuilder<TemplateItem, TemplateItem, QSortBy> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByAmbarTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByGreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      sortByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByRoleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      sortByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      sortByScheduledStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> sortByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      sortByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }
}

extension TemplateItemQuerySortThenBy
    on QueryBuilder<TemplateItem, TemplateItem, QSortThenBy> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByAmbarTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByGreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      thenByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByRoleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      thenByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      thenByScheduledStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.desc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy> thenByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterSortBy>
      thenByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }
}

extension TemplateItemQueryWhereDistinct
    on QueryBuilder<TemplateItem, TemplateItem, QDistinct> {
  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ambarTime');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'greenTime');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderNumber');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'redTime');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleType');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct>
      distinctByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledStartTime');
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QDistinct> distinctByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'templateId');
    });
  }
}

extension TemplateItemQueryProperty
    on QueryBuilder<TemplateItem, TemplateItem, QQueryProperty> {
  QueryBuilder<TemplateItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TemplateItem, int?, QQueryOperations> ambarTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ambarTime');
    });
  }

  QueryBuilder<TemplateItem, int?, QQueryOperations> greenTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'greenTime');
    });
  }

  QueryBuilder<TemplateItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TemplateItem, int, QQueryOperations> orderNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderNumber');
    });
  }

  QueryBuilder<TemplateItem, int, QQueryOperations> redTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'redTime');
    });
  }

  QueryBuilder<TemplateItem, String, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<TemplateItem, RoleType, QQueryOperations> roleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleType');
    });
  }

  QueryBuilder<TemplateItem, DateTime, QQueryOperations>
      scheduledStartTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledStartTime');
    });
  }

  QueryBuilder<TemplateItem, int, QQueryOperations> templateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'templateId');
    });
  }
}
