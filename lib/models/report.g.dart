// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReportCollection on Isar {
  IsarCollection<Report> get reports => this.collection();
}

const ReportSchema = CollectionSchema(
  name: r'Report',
  id: 4107730612455750309,
  properties: {
    r'actualReportTime': PropertySchema(
      id: 0,
      name: r'actualReportTime',
      type: IsarType.dateTime,
    ),
    r'actualStartTime': PropertySchema(
      id: 1,
      name: r'actualStartTime',
      type: IsarType.dateTime,
    ),
    r'meetingId': PropertySchema(
      id: 2,
      name: r'meetingId',
      type: IsarType.long,
    ),
    r'scheduledReportTime': PropertySchema(
      id: 3,
      name: r'scheduledReportTime',
      type: IsarType.dateTime,
    ),
    r'scheduledStartTime': PropertySchema(
      id: 4,
      name: r'scheduledStartTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _reportEstimateSize,
  serialize: _reportSerialize,
  deserialize: _reportDeserialize,
  deserializeProp: _reportDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reportGetId,
  getLinks: _reportGetLinks,
  attach: _reportAttach,
  version: '3.1.0+1',
);

int _reportEstimateSize(
  Report object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _reportSerialize(
  Report object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualReportTime);
  writer.writeDateTime(offsets[1], object.actualStartTime);
  writer.writeLong(offsets[2], object.meetingId);
  writer.writeDateTime(offsets[3], object.scheduledReportTime);
  writer.writeDateTime(offsets[4], object.scheduledStartTime);
}

Report _reportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Report(
    actualReportTime: reader.readDateTime(offsets[0]),
    actualStartTime: reader.readDateTime(offsets[1]),
    id: id,
    meetingId: reader.readLong(offsets[2]),
    scheduledReportTime: reader.readDateTime(offsets[3]),
    scheduledStartTime: reader.readDateTime(offsets[4]),
  );
  return object;
}

P _reportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportGetId(Report object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reportGetLinks(Report object) {
  return [];
}

void _reportAttach(IsarCollection<dynamic> col, Id id, Report object) {
  object.id = id;
}

extension ReportQueryWhereSort on QueryBuilder<Report, Report, QWhere> {
  QueryBuilder<Report, Report, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReportQueryWhere on QueryBuilder<Report, Report, QWhereClause> {
  QueryBuilder<Report, Report, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Report, Report, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idBetween(
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

extension ReportQueryFilter on QueryBuilder<Report, Report, QFilterCondition> {
  QueryBuilder<Report, Report, QAfterFilterCondition> actualReportTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      actualReportTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> actualReportTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> actualReportTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualReportTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> actualStartTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      actualStartTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> actualStartTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> actualStartTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualStartTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> meetingIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetingId',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> meetingIdGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> meetingIdLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> meetingIdBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      scheduledReportTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      scheduledReportTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      scheduledReportTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledReportTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      scheduledReportTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledReportTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> scheduledStartTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
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

  QueryBuilder<Report, Report, QAfterFilterCondition> scheduledStartTimeBetween(
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
}

extension ReportQueryObject on QueryBuilder<Report, Report, QFilterCondition> {}

extension ReportQueryLinks on QueryBuilder<Report, Report, QFilterCondition> {}

extension ReportQuerySortBy on QueryBuilder<Report, Report, QSortBy> {
  QueryBuilder<Report, Report, QAfterSortBy> sortByActualReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReportTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByActualReportTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReportTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByActualStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByActualStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMeetingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByScheduledReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledReportTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByScheduledReportTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledReportTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByScheduledStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.desc);
    });
  }
}

extension ReportQuerySortThenBy on QueryBuilder<Report, Report, QSortThenBy> {
  QueryBuilder<Report, Report, QAfterSortBy> thenByActualReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReportTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByActualReportTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReportTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByActualStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByActualStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMeetingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingId', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByScheduledReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledReportTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByScheduledReportTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledReportTime', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByScheduledStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledStartTime', Sort.desc);
    });
  }
}

extension ReportQueryWhereDistinct on QueryBuilder<Report, Report, QDistinct> {
  QueryBuilder<Report, Report, QDistinct> distinctByActualReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualReportTime');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByActualStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualStartTime');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByMeetingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetingId');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByScheduledReportTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledReportTime');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByScheduledStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledStartTime');
    });
  }
}

extension ReportQueryProperty on QueryBuilder<Report, Report, QQueryProperty> {
  QueryBuilder<Report, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations> actualReportTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualReportTime');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations> actualStartTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualStartTime');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> meetingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetingId');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations>
      scheduledReportTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledReportTime');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations>
      scheduledStartTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledStartTime');
    });
  }
}
