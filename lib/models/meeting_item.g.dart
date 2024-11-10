// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeetingItemCollection on Isar {
  IsarCollection<MeetingItem> get meetingItems => this.collection();
}

const MeetingItemSchema = CollectionSchema(
  name: r'MeetingItem',
  id: 75026568398038165,
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
    r'iduration': PropertySchema(
      id: 2,
      name: r'iduration',
      type: IsarType.long,
    ),
    r'meetingId': PropertySchema(
      id: 3,
      name: r'meetingId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'redTime': PropertySchema(
      id: 5,
      name: r'redTime',
      type: IsarType.long,
    ),
    r'role': PropertySchema(
      id: 6,
      name: r'role',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _meetingItemEstimateSize,
  serialize: _meetingItemSerialize,
  deserialize: _meetingItemDeserialize,
  deserializeProp: _meetingItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _meetingItemGetId,
  getLinks: _meetingItemGetLinks,
  attach: _meetingItemAttach,
  version: '3.1.0+1',
);

int _meetingItemEstimateSize(
  MeetingItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.role.length * 3;
  return bytesCount;
}

void _meetingItemSerialize(
  MeetingItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ambarTime);
  writer.writeLong(offsets[1], object.greenTime);
  writer.writeLong(offsets[2], object.iduration);
  writer.writeLong(offsets[3], object.meetingId);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.redTime);
  writer.writeString(offsets[6], object.role);
  writer.writeDateTime(offsets[7], object.startTime);
}

MeetingItem _meetingItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeetingItem(
    ambarTime: reader.readLongOrNull(offsets[0]),
    greenTime: reader.readLongOrNull(offsets[1]),
    id: id,
    iduration: reader.readLong(offsets[2]),
    meetingId: reader.readLong(offsets[3]),
    name: reader.readString(offsets[4]),
    redTime: reader.readLong(offsets[5]),
    role: reader.readString(offsets[6]),
    startTime: reader.readDateTime(offsets[7]),
  );
  return object;
}

P _meetingItemDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _meetingItemGetId(MeetingItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _meetingItemGetLinks(MeetingItem object) {
  return [];
}

void _meetingItemAttach(
    IsarCollection<dynamic> col, Id id, MeetingItem object) {
  object.id = id;
}

extension MeetingItemQueryWhereSort
    on QueryBuilder<MeetingItem, MeetingItem, QWhere> {
  QueryBuilder<MeetingItem, MeetingItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeetingItemQueryWhere
    on QueryBuilder<MeetingItem, MeetingItem, QWhereClause> {
  QueryBuilder<MeetingItem, MeetingItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterWhereClause> idBetween(
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

extension MeetingItemQueryFilter
    on QueryBuilder<MeetingItem, MeetingItem, QFilterCondition> {
  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      ambarTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ambarTime',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      ambarTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ambarTime',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      ambarTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ambarTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      greenTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'greenTime',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      greenTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'greenTime',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      greenTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'greenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      idurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iduration',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      idurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iduration',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      idurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iduration',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      idurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iduration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      meetingIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetingId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      meetingIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meetingId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      meetingIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meetingId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      meetingIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meetingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> redTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'redTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> redTimeLessThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> redTimeBetween(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleEqualTo(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleGreaterThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleLessThan(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleBetween(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleStartsWith(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleEndsWith(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleContains(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleMatches(
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

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MeetingItemQueryObject
    on QueryBuilder<MeetingItem, MeetingItem, QFilterCondition> {}

extension MeetingItemQueryLinks
    on QueryBuilder<MeetingItem, MeetingItem, QFilterCondition> {}

extension MeetingItemQuerySortBy
    on QueryBuilder<MeetingItem, MeetingItem, QSortBy> {
  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByAmbarTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByGreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByIduration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iduration', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByIdurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iduration', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByMeetingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByRedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension MeetingItemQuerySortThenBy
    on QueryBuilder<MeetingItem, MeetingItem, QSortThenBy> {
  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByAmbarTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambarTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByGreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'greenTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByIduration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iduration', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByIdurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iduration', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByMeetingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByRedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redTime', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension MeetingItemQueryWhereDistinct
    on QueryBuilder<MeetingItem, MeetingItem, QDistinct> {
  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByAmbarTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ambarTime');
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByGreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'greenTime');
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByIduration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iduration');
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetingId');
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByRedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'redTime');
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeetingItem, MeetingItem, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }
}

extension MeetingItemQueryProperty
    on QueryBuilder<MeetingItem, MeetingItem, QQueryProperty> {
  QueryBuilder<MeetingItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeetingItem, int?, QQueryOperations> ambarTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ambarTime');
    });
  }

  QueryBuilder<MeetingItem, int?, QQueryOperations> greenTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'greenTime');
    });
  }

  QueryBuilder<MeetingItem, int, QQueryOperations> idurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iduration');
    });
  }

  QueryBuilder<MeetingItem, int, QQueryOperations> meetingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetingId');
    });
  }

  QueryBuilder<MeetingItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MeetingItem, int, QQueryOperations> redTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'redTime');
    });
  }

  QueryBuilder<MeetingItem, String, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<MeetingItem, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }
}
