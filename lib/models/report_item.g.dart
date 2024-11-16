// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReportItemCollection on Isar {
  IsarCollection<ReportItem> get reportItems => this.collection();
}

const ReportItemSchema = CollectionSchema(
  name: r'ReportItem',
  id: 6145334452177861496,
  properties: {
    r'iActualTime': PropertySchema(
      id: 0,
      name: r'iActualTime',
      type: IsarType.long,
    ),
    r'iMaxTime': PropertySchema(
      id: 1,
      name: r'iMaxTime',
      type: IsarType.long,
    ),
    r'iMinTime': PropertySchema(
      id: 2,
      name: r'iMinTime',
      type: IsarType.long,
    ),
    r'meetingItemId': PropertySchema(
      id: 3,
      name: r'meetingItemId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'orderNumber': PropertySchema(
      id: 5,
      name: r'orderNumber',
      type: IsarType.long,
    ),
    r'reportId': PropertySchema(
      id: 6,
      name: r'reportId',
      type: IsarType.long,
    ),
    r'role': PropertySchema(
      id: 7,
      name: r'role',
      type: IsarType.string,
    ),
    r'roleType': PropertySchema(
      id: 8,
      name: r'roleType',
      type: IsarType.byte,
      enumMap: _ReportItemroleTypeEnumValueMap,
    )
  },
  estimateSize: _reportItemEstimateSize,
  serialize: _reportItemSerialize,
  deserialize: _reportItemDeserialize,
  deserializeProp: _reportItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reportItemGetId,
  getLinks: _reportItemGetLinks,
  attach: _reportItemAttach,
  version: '3.1.0+1',
);

int _reportItemEstimateSize(
  ReportItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.role.length * 3;
  return bytesCount;
}

void _reportItemSerialize(
  ReportItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.iActualTime);
  writer.writeLong(offsets[1], object.iMaxTime);
  writer.writeLong(offsets[2], object.iMinTime);
  writer.writeLong(offsets[3], object.meetingItemId);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.orderNumber);
  writer.writeLong(offsets[6], object.reportId);
  writer.writeString(offsets[7], object.role);
  writer.writeByte(offsets[8], object.roleType.index);
}

ReportItem _reportItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportItem(
    iActualTime: reader.readLong(offsets[0]),
    iMaxTime: reader.readLong(offsets[1]),
    iMinTime: reader.readLong(offsets[2]),
    id: id,
    meetingItemId: reader.readLong(offsets[3]),
    name: reader.readString(offsets[4]),
    orderNumber: reader.readLong(offsets[5]),
    reportId: reader.readLong(offsets[6]),
    role: reader.readString(offsets[7]),
    roleType:
        _ReportItemroleTypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
            RoleType.speaker,
  );
  return object;
}

P _reportItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_ReportItemroleTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          RoleType.speaker) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReportItemroleTypeEnumValueMap = {
  'speaker': 0,
  'nonSpeaker': 1,
};
const _ReportItemroleTypeValueEnumMap = {
  0: RoleType.speaker,
  1: RoleType.nonSpeaker,
};

Id _reportItemGetId(ReportItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reportItemGetLinks(ReportItem object) {
  return [];
}

void _reportItemAttach(IsarCollection<dynamic> col, Id id, ReportItem object) {
  object.id = id;
}

extension ReportItemQueryWhereSort
    on QueryBuilder<ReportItem, ReportItem, QWhere> {
  QueryBuilder<ReportItem, ReportItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReportItemQueryWhere
    on QueryBuilder<ReportItem, ReportItem, QWhereClause> {
  QueryBuilder<ReportItem, ReportItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ReportItem, ReportItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterWhereClause> idBetween(
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

extension ReportItemQueryFilter
    on QueryBuilder<ReportItem, ReportItem, QFilterCondition> {
  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iActualTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iActualTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iActualTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iActualTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iActualTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iActualTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iActualTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iActualTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMaxTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iMaxTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iMaxTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iMaxTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMaxTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iMaxTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMaxTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iMaxTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMinTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iMinTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      iMinTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iMinTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMinTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iMinTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> iMinTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iMinTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      meetingItemIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetingItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      meetingItemIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meetingItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      meetingItemIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meetingItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      meetingItemIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meetingItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameContains(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      orderNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> reportIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
      reportIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> reportIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> reportIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleEqualTo(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleGreaterThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleLessThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleBetween(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleStartsWith(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleEndsWith(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleContains(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleMatches(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleTypeEqualTo(
      RoleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleType',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition>
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleTypeLessThan(
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

  QueryBuilder<ReportItem, ReportItem, QAfterFilterCondition> roleTypeBetween(
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
}

extension ReportItemQueryObject
    on QueryBuilder<ReportItem, ReportItem, QFilterCondition> {}

extension ReportItemQueryLinks
    on QueryBuilder<ReportItem, ReportItem, QFilterCondition> {}

extension ReportItemQuerySortBy
    on QueryBuilder<ReportItem, ReportItem, QSortBy> {
  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIActualTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iActualTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIActualTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iActualTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIMaxTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMaxTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIMaxTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMaxTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIMinTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMinTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByIMinTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMinTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByMeetingItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingItemId', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByMeetingItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingItemId', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByReportId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByReportIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> sortByRoleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.desc);
    });
  }
}

extension ReportItemQuerySortThenBy
    on QueryBuilder<ReportItem, ReportItem, QSortThenBy> {
  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIActualTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iActualTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIActualTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iActualTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIMaxTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMaxTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIMaxTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMaxTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIMinTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMinTime', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIMinTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iMinTime', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByMeetingItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingItemId', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByMeetingItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingItemId', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByReportId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByReportIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportId', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.asc);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QAfterSortBy> thenByRoleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleType', Sort.desc);
    });
  }
}

extension ReportItemQueryWhereDistinct
    on QueryBuilder<ReportItem, ReportItem, QDistinct> {
  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByIActualTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iActualTime');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByIMaxTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iMaxTime');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByIMinTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iMinTime');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByMeetingItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetingItemId');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderNumber');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByReportId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportId');
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportItem, ReportItem, QDistinct> distinctByRoleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleType');
    });
  }
}

extension ReportItemQueryProperty
    on QueryBuilder<ReportItem, ReportItem, QQueryProperty> {
  QueryBuilder<ReportItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> iActualTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iActualTime');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> iMaxTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iMaxTime');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> iMinTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iMinTime');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> meetingItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetingItemId');
    });
  }

  QueryBuilder<ReportItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> orderNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderNumber');
    });
  }

  QueryBuilder<ReportItem, int, QQueryOperations> reportIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportId');
    });
  }

  QueryBuilder<ReportItem, String, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<ReportItem, RoleType, QQueryOperations> roleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleType');
    });
  }
}
