// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeetingCollection on Isar {
  IsarCollection<Meeting> get meetings => this.collection();
}

const MeetingSchema = CollectionSchema(
  name: r'Meeting',
  id: -5591494224190015019,
  properties: {
    r'current': PropertySchema(
      id: 0,
      name: r'current',
      type: IsarType.bool,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'startingTime': PropertySchema(
      id: 2,
      name: r'startingTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _meetingEstimateSize,
  serialize: _meetingSerialize,
  deserialize: _meetingDeserialize,
  deserializeProp: _meetingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _meetingGetId,
  getLinks: _meetingGetLinks,
  attach: _meetingAttach,
  version: '3.1.0+1',
);

int _meetingEstimateSize(
  Meeting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _meetingSerialize(
  Meeting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.current);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDateTime(offsets[2], object.startingTime);
}

Meeting _meetingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Meeting(
    current: reader.readBoolOrNull(offsets[0]) ?? true,
    date: reader.readDateTime(offsets[1]),
    id: id,
    startingTime: reader.readDateTimeOrNull(offsets[2]),
  );
  return object;
}

P _meetingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _meetingGetId(Meeting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _meetingGetLinks(Meeting object) {
  return [];
}

void _meetingAttach(IsarCollection<dynamic> col, Id id, Meeting object) {
  object.id = id;
}

extension MeetingQueryWhereSort on QueryBuilder<Meeting, Meeting, QWhere> {
  QueryBuilder<Meeting, Meeting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeetingQueryWhere on QueryBuilder<Meeting, Meeting, QWhereClause> {
  QueryBuilder<Meeting, Meeting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Meeting, Meeting, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterWhereClause> idBetween(
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

extension MeetingQueryFilter
    on QueryBuilder<Meeting, Meeting, QFilterCondition> {
  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> currentEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'current',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> startingTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startingTime',
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition>
      startingTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startingTime',
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> startingTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> startingTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> startingTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterFilterCondition> startingTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MeetingQueryObject
    on QueryBuilder<Meeting, Meeting, QFilterCondition> {}

extension MeetingQueryLinks
    on QueryBuilder<Meeting, Meeting, QFilterCondition> {}

extension MeetingQuerySortBy on QueryBuilder<Meeting, Meeting, QSortBy> {
  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByCurrentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current', Sort.desc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByStartingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingTime', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> sortByStartingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingTime', Sort.desc);
    });
  }
}

extension MeetingQuerySortThenBy
    on QueryBuilder<Meeting, Meeting, QSortThenBy> {
  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByCurrentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current', Sort.desc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByStartingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingTime', Sort.asc);
    });
  }

  QueryBuilder<Meeting, Meeting, QAfterSortBy> thenByStartingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingTime', Sort.desc);
    });
  }
}

extension MeetingQueryWhereDistinct
    on QueryBuilder<Meeting, Meeting, QDistinct> {
  QueryBuilder<Meeting, Meeting, QDistinct> distinctByCurrent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'current');
    });
  }

  QueryBuilder<Meeting, Meeting, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Meeting, Meeting, QDistinct> distinctByStartingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startingTime');
    });
  }
}

extension MeetingQueryProperty
    on QueryBuilder<Meeting, Meeting, QQueryProperty> {
  QueryBuilder<Meeting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Meeting, bool, QQueryOperations> currentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'current');
    });
  }

  QueryBuilder<Meeting, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Meeting, DateTime?, QQueryOperations> startingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startingTime');
    });
  }
}
