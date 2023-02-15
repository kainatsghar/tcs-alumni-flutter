import 'dart:io';

import 'package:iobm/local_db/tables/business_spotlight_table.dart';
import 'package:iobm/local_db/tables/chapter_details_member_table.dart';
import 'package:iobm/local_db/tables/chapter_details_result_table.dart';
import 'package:iobm/local_db/tables/chapter_details_table.dart';
import 'package:iobm/local_db/tables/tabble_timeline_post.dart';
import 'package:iobm/local_db/tables/table_about_us.dart';
import 'package:iobm/local_db/tables/table_allusers.dart';
import 'package:iobm/local_db/tables/table_attendess.dart';
import 'package:iobm/local_db/tables/table_branches.dart';
import 'package:iobm/local_db/tables/table_chat_invitation.dart';
import 'package:iobm/local_db/tables/table_cities.dart';
import 'package:iobm/local_db/tables/table_comment_replies.dart';
import 'package:iobm/local_db/tables/table_comments.dart';
import 'package:iobm/local_db/tables/table_companies.dart';
import 'package:iobm/local_db/tables/table_connections.dart';
import 'package:iobm/local_db/tables/table_contact_us.dart';
import 'package:iobm/local_db/tables/table_countries.dart';
import 'package:iobm/local_db/tables/table_csr.dart';
import 'package:iobm/local_db/tables/table_degrees.dart';
import 'package:iobm/local_db/tables/table_designations.dart';
import 'package:iobm/local_db/tables/table_discounts.dart';
import 'package:iobm/local_db/tables/table_education.dart';
import 'package:iobm/local_db/tables/table_events.dart';
import 'package:iobm/local_db/tables/table_experience.dart';
import 'package:iobm/local_db/tables/table_faqs.dart';
import 'package:iobm/local_db/tables/table_galleris.dart';
import 'package:iobm/local_db/tables/table_gallery_images.dart';
import 'package:iobm/local_db/tables/table_industries.dart';
import 'package:iobm/local_db/tables/table_jobs.dart';
import 'package:iobm/local_db/tables/table_montors.dart';
import 'package:iobm/local_db/tables/table_new_stories.dart';
import 'package:iobm/local_db/tables/table_notifications.dart';
import 'package:iobm/local_db/tables/table_one_user.dart';
import 'package:iobm/local_db/tables/table_post_images.dart';
import 'package:iobm/local_db/tables/table_post_tags.dart';
import 'package:iobm/local_db/tables/table_report_types.dart';
import 'package:iobm/local_db/tables/table_seen_story.dart';
import 'package:iobm/local_db/tables/table_spotlight_alumini.dart';
import 'package:iobm/local_db/tables/table_stories.dart';
import 'package:iobm/local_db/tables/table_work_order.dart';
import 'package:iobm/local_db/tables/tables_interests.dart';
import 'package:iobm/local_db/tables/table_product_categories.dart';
import 'package:iobm/local_db/tables/table_product_images.dart';
import 'package:iobm/local_db/tables/table_products.dart';
import 'package:iobm/local_db/tables/tle_spotlight_table.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'local_db.g.dart';

MyDatabase database = MyDatabase();

LazyDatabase _openConnection() {
  return LazyDatabase(
        () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db_alumni.sqlite'));
      return VmDatabase(file, logStatements: false);
    },
  );
}
//flutter pub run build_runner build

@UseMoor(
  tables: [
    DBEducations,
    DBExperieces,
    DBInterests,
    DBAllUsers,
    DBBranches,
    DBIndustries,
    DBDegrees,
    DBCities,
    DBCountries,
    DBOneUsers,
    DBCompanies,
    DBDesignations,
    DBJobs,
    DBSpotlightAlumis,
    DBEvents,
    DBAttendies,
    DBComments,
    DBMentors,
    DBConnections,
    DBDiscounts,
    DBNotifications,
    DBGalleries,
    DBGalleryImages,
    DBTimeLinePosts,
    DBPostImages,
    DBPostTags,
    DBChatStatuss,
    DBCSRs,
    DBAbouts,
    DBFaqs,
    DBContacts,
    DBWorkOrders,
    DBChapterDetailResults,
    DBChapterDetails,
    DBChapterDetailMembers,
    DBReportTypes,
    DBProductCategories,
    DBProductImages,
    DBProducts,
    DBBusinessSpotlights,
    DBTleSpotlights,
    DBCommentReplies,
    DBStories,
    DBStorySeens,
    DbNewStories

  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 29;

  @override
  MigrationStrategy get migration => destructiveFallback;

  // // // // // / / // / / Education
  // Future<List<DBEducation>> getUserEducation(int userId) =>
  //     (select(dBEducations)..where((e) => (e.userId.equals(userId)))).get();

  Future<List<DBEducation>> getUserEducation(int userId) {
    final _select = select(dBEducations);
    _select.where((tbl) => tbl.userId.equals(userId));
    _select.orderBy(
        [(t) => OrderingTerm(expression: t.endDate, mode: OrderingMode.desc)]);

    return _select.get();
  }

  Future insertEducation(DBEducation education) =>
      into(dBEducations).insertOnConflictUpdate(education);

  Future deleteEducation(int userid) =>
      (delete(dBEducations)..where((e) => (e.userId.equals(userid)))).go();

  Future deleteUserEducation(int id) =>
      (delete(dBEducations)..where((e) => (e.id.equals(id)))).go();

  Future deleteAllEducations() => delete(dBEducations).go();

  /////
  ///// *********** Experience
  /////

  Future<List<DBExperiece>> getUserExperience(int userId) {
    final _select = select(dBExperieces);
    _select.where((tbl) => tbl.userId.equals(userId));
    _select.orderBy(
      [
            (t) => OrderingTerm(expression: t.endDate, mode: OrderingMode.asc),
      ],
    );
    return _select.get();
  }

  // Future<List<DBEducation>> getUserEducation() => select(dBEducations).get();

  Future insertExperience(DBExperiece experience) =>
      into(dBExperieces).insertOnConflictUpdate(experience);

  Future deleteExperience(int userid) =>
      (delete(dBExperieces)..where((e) => (e.userId.equals(userid)))).go();

  Future deleteUserExperience(int id) =>
      (delete(dBExperieces)..where((e) => (e.id.equals(id)))).go();

  Future deleteAllExperiences() => delete(dBExperieces).go();

  ///
  /// //
  ///
  ///
  ///
  Future<List<DBInterest>> getUserInterests(int userId) =>
      (select(dBInterests)..where((e) => (e.userId.equals(userId)))).get();

  // Future<List<DBEducation>> getUserEducation() => select(dBEducations).get();

  Future insertInterests(DBInterest interest) =>
      into(dBInterests).insertOnConflictUpdate(interest);

  Future deleteInterest(int userid) =>
      (delete(dBInterests)..where((e) => (e.userId.equals(userid)))).go();

  Future deleteUserInterest(int id) =>
      (delete(dBInterests)..where((e) => (e.id.equals(id)))).go();

  Future deleteAllInterests() => delete(dBInterests).go();

  ///*************************************************************************************
  /// //All Users
  ///
  Future<List<DBAllUser>> getAllUsers() => select(dBAllUsers).get();

  Future<List<DBAllUser>> getSpecificUsers({
    String? company,
    String? isConnected,
    String? connectionStatus,
    String? isMentor,
    String? graduationYear,
    String? country,
    String? city,
    String? industry,
    String? name,
    String? branch,
  }) {
    final _select = select(dBAllUsers);
    if (company != '') {
      _select.where((tbl) => tbl.companyId.equals(company));
    }
    if (isConnected != '') {
      _select.where((tbl) => tbl.isConnected.equals(isConnected));
    }
    if (isMentor != '') {
      _select.where((tbl) => tbl.isMentor.equals(isMentor));
    }
    if (name != '') {
      _select.where((tbl) => tbl.firstName.like(name! + "%"));
    }
    if (graduationYear != '') {
      _select.where((tbl) => tbl.graduationYear.equals(graduationYear));
    }
    if (branch != '') {
      _select.where((tbl) => tbl.branchId.equals(branch));
    }
    if (industry != '') {
      _select.where((tbl) => tbl.industryName.equals(industry));
    }
    if (city != '') {
      _select.where((tbl) => tbl.currentCityName.equals(city));
    }
    if (country != '') {
      _select.where((tbl) => tbl.countryId.equals(country));
    }
    if (branch != '') {
      _select.where((tbl) => tbl.branchId.equals(branch));
    }

    return _select.get();
  }

  Future<List<DBAllUser>> getCompanyUsers(String company) => (select(dBAllUsers)
    ..where((tbl) => (tbl.organizationName.equals(company))))
      .get();

  Future deleteAllUsers() => delete(dBAllUsers).go();

  Future deleteSpecificUser(
      String company,
      String isConnected,
      String isMentor,
      String graduationYear,
      String country,
      String city,
      String industry,
      String name,
      String branch,
      ) {
    final _delete = delete(dBAllUsers);
    if (company != '') {
      _delete.where((tbl) => tbl.companyId.equals(company));
    }
    if (isConnected != '') {
      _delete.where((tbl) => tbl.isConnected.equals(isConnected));
    }
    if (isMentor != '') {
      _delete.where((tbl) => tbl.isMentor.equals(isMentor));
    }
    if (name != '') {
      _delete.where((tbl) => tbl.firstName.equals(name));
    }
    if (graduationYear != '') {
      _delete.where((tbl) => tbl.graduationYear.equals(graduationYear));
    }
    if (branch != '') {
      _delete.where((tbl) => tbl.branchId.equals(branch));
    }
    if (industry != '') {
      _delete.where((tbl) => tbl.industryName.equals(industry));
    }
    if (city != '') {
      _delete.where((tbl) => tbl.currentCityName.equals(city));
    }
    if (country != '') {
      _delete.where((tbl) => tbl.countryId.equals(country));
    }

    return _delete.go();
  }

  Future insertUser(DBAllUser allUser) =>
      into(dBAllUsers).insertOnConflictUpdate(allUser);

  Future updateUser(DBAllUser allUser) => update(dBAllUsers).replace(allUser);

  Future<DBAllUser> getSingleUser(String id) =>
      (select(dBAllUsers)..where((tbl) => tbl.userId.equals(id))).getSingle();

  Future deleteSingleUser(String id) =>
      (delete(dBAllUsers)..where((tbl) => tbl.userId.equals(id))).go();

  Future insertAllUsers(List<DBAllUser> allUsers) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBAllUsers, allUsers);
    });
  }

  Future<List<DBAllUser>> getNetworkUsers({String? status}) {
    final _select = select(dBAllUsers);
    _select.where((tbl) => tbl.sharingLoc.equals(status));

    return _select.get();
  }

  Future<List<DBAllUser>> getConnected({String? connected, String? status}) {
    final _select = select(dBAllUsers);
    _select.where((tbl) => tbl.isConnected.equals(connected));
    _select.where((tbl) => tbl.connectionStatus.equals(status));
    return _select.get();
  }

  Future<List<DBAllUser>> getConnections({String? connected}) {
    final _select = select(dBAllUsers);
    _select.where((tbl) => tbl.isConnected.equals(connected));
    return _select.get();
  }

  Future editMentorUsers(String userId, String isMentor) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        isMentor: isMentor,
      ),
    );
  }

  Future editIndustry(String userId, String industry) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        industryName: industry,
      ),
    );
  }

  Future editLinkedinUrl(String userId, String url) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        linkedinUrl: url,
      ),
    );
  }

  Future editFacebookUrl(String userId, String url) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        facebookUrl: url,
      ),
    );
  }

  Future editConnectUsers(String userId, String status) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        connectionStatus: status,
      ),
    );
  }

  Future editDescriptionUser(String userId, String description) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        description: description,
      ),
    );
  }

  Future editSharingLoc(String userId, String sharing) {
    return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
      DBAllUser(
        sharingLoc: sharing,
      ),
    );
  }
  //*********************************************************************************
  //cities
  //
  //

  Future<List<DBCitie>> getAllCities() => select(dBCities).get();
  Future insertAllCities(List<DBCitie> cities) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBCities, cities);
    });
  }

  Future deleteAllCities() => delete(dBCities).go();

  Future deleteCities(String countryId) {
    final _delete = delete(dBCities);
    _delete.where((tbl) => tbl.countryId.equals(countryId));
    return _delete.go();
  }

  Future<List<DBCitie>> getCities(String countryId) {
    final _select = select(dBCities);
    _select.where((tbl) => tbl.countryId.equals(countryId));
    return _select.get();
  }

  ///countries
  //+++++++++++++++++
  Future<List<DBCountrie>> getAllCountries() => select(dBCountries).get();
  Future deleteAllCountries() => delete(dBCountries).go();
  Future insertAllCountries(List<DBCountrie> countries) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBCountries, countries);
    });
  }

  /// degrees
  Future<List<DBDegree>> getAllDegrees() => select(dBDegrees).get();
  Future deleteAllDegrees() => delete(dBDegrees).go();
  Future insertAllDegrees(List<DBDegree> degrees) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBDegrees, degrees);
    });
  }

  /// Report Types
  Future<List<DBReportType>> getAllReportTypes() => select(dBReportTypes).get();
  Future deleteAllReportTypes() => delete(dBReportTypes).go();
  Future insertAllReportTypes(List<DBReportType> reports) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBReportTypes, reports);
    });
  }

  //industries
  Future<List<DBIndustrie>> getAllIndustries() => select(dBIndustries).get();
  Future deleteAllIndustries() => delete(dBIndustries).go();
  Future insertAllIndustries(List<DBIndustrie> industries) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBIndustries, industries);
    });
  }

  //Branches
  Future deleteAllBranches() => delete(dBBranches).go();

  Future<List<DBBranche>> getAllBranches() => select(dBBranches).get();
  Future insertAllBranches(List<DBBranche> branches) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBBranches, branches);
    });
  }

  //One User

  Future<List<DBOneUser>> getOneUser(String userId) =>
      (select(dBOneUsers)..where((e) => (e.userId.equals(userId)))).get();

  Future insertOneUser(DBOneUser oneUser) =>
      into(dBOneUsers).insertOnConflictUpdate(oneUser);

  Future editDescription(String userId, String description) {
    return (update(dBOneUsers)..where((t) => t.userId.equals(userId))).write(
      DBOneUser(
        description: description,
      ),
    );
  }

  Future editMentorStatus(String userId, String isMentor) {
    return (update(dBOneUsers)..where((t) => t.userId.equals(userId))).write(
      DBOneUser(
        isMentor: isMentor,
      ),
    );
  }

  Future editConnectStatus(String userId, String status) {
    return (update(dBOneUsers)..where((t) => t.userId.equals(userId))).write(
      DBOneUser(
        connectionStatus: status,
      ),
    );
  }

  ///////
//////////
/////////
//////// Designations
  Future insertAllDesignations(List<DBDesignation> designation) async {
    await batch((b) {
      b.insertAll(dBDesignations, designation);
    });
  }

  Future deleteDesignations() => delete(dBDesignations).go();

  Future<List<DBDesignation>> getDesignations() => select(dBDesignations).get();

  //////
//////////
/////////
////// Comapnies
  Future insertAllCompanies(List<DBCompanie> company) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBCompanies, company);
    });
  }

  Future deleteCompanies() => delete(dBCompanies).go();

  Future insertCompanies(DBCompanie companie) =>
      into(dBCompanies).insertOnConflictUpdate(companie);

  Future<List<DBCompanie>> getCompanies() => select(dBCompanies).get();

  ///
  /// /************************************************
  /// /
  /// Jobs
  Future insertAllJobs(List<DBJob> jobs) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBJobs, jobs);
    });
  }

  Future updateJobs(
      String id,
      String designation,
      String company,
      String jobLink,
      String dueDate,
      ) {
    return (update(dBJobs)..where((t) => t.id.equals(id))).write(
      DBJob(
        designation: designation,
        companyName: company,
        joblink: jobLink,
        duaDate: dueDate,
      ),
    );
  }

  Future updateJob(DBJob job) => update(dBJobs).replace(job);

  Future insertJob(DBJob job) => into(dBJobs).insertOnConflictUpdate(job);

  Future<List<DBJob>> getJobs() => select(dBJobs).get();

  // Future<List<DBJob>> getJobs(String userId) =>
  //     (select(dBJobs)..where((e) => (e.postedBy.equals(userId)))).get();

  Future<List<DBJob>> getMyJobs(String userId) =>
      (select(dBJobs)..where((e) => (e.postedBy.equals(userId)))).get();

  Future deleteUserJobs() => delete(dBJobs).go();

  ///
  /// /
  //// *******************************************
  /// Work Orders
  Future insertAllWorkOrders(List<DBWorkOrder> work) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBWorkOrders, work);
    });
  }

  Future updateSingleWorkOrder(
      String id,
      String designation,
      String company,
      String document,
      String dueDate,
      ) {
    return (update(dBWorkOrders)..where((t) => t.id.equals(id))).write(
      DBWorkOrder(
        designation: designation,
        companyName: company,
        document: document,
        duaDate: dueDate,
      ),
    );
  }

  Future updateWorkOrder(DBWorkOrder workOrder) =>
      update(dBWorkOrders).replace(workOrder);

  Future insertWorkOrder(DBWorkOrder workOrder) =>
      into(dBWorkOrders).insertOnConflictUpdate(workOrder);

  Future<List<DBWorkOrder>> getWorkOrders() => select(dBWorkOrders).get();

  // Future<List<DBJob>> getJobs(String userId) =>
  //     (select(dBJobs)..where((e) => (e.postedBy.equals(userId)))).get();

  Future<List<DBWorkOrder>> getMyWorkOrders(String userId) =>
      (select(dBWorkOrders)..where((e) => (e.postedBy.equals(userId)))).get();

  Future deleteWorkOrders() => delete(dBWorkOrders).go();

  ////
//////
/////
//////SpotlightAlumini

  Future insertAlumini(DBSpotlightAlumi alumini) =>
      into(dBSpotlightAlumis).insertOnConflictUpdate(alumini);

  Future deleteAlumini() => delete(dBSpotlightAlumis).go();

  Future<List<DBSpotlightAlumi>> getSportLightAlumini() =>
      select(dBSpotlightAlumis).get();

  /////
/////
///////
///// Events
  Future insertAllEvents(List<DBEvent> event) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBEvents, event);
    });
  }

  Future insertSingleEvent(DBEvent event) =>
      into(dBEvents).insertOnConflictUpdate(event);

  Future deleteSingleEvent(String eventId) {
    final _delete = delete(dBEvents);
    _delete.where((tbl) => tbl.id.equals(eventId));
    return _delete.go();
  }

  Future deleteEvents() => delete(dBEvents).go();

  Future<List<DBEvent>> getEvents() => select(dBEvents).get();

  Future<DBEvent> getSingleEvent(String id) =>
      (select(dBEvents)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<DBEvent> getEventDetails(String id) =>
      (select(dBEvents)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future editInterestedStatus(String id, String isInterested) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        isInterested: isInterested,
      ),
    );
  }

  Future editGoingStatus(String id, String isGoing) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        isGoing: isGoing,
      ),
    );
  }

  Future editTotalInterested(String id, String totalInterested) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        totalInterested: totalInterested,
      ),
    );
  }

  Future editTotalGoing(String id, String isGoing) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        totalGoing: isGoing,
      ),
    );
  }

  Future editLikeStatus(String id, String isLike) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        isLike: isLike,
      ),
    );
  }

  Future editTotalLikes(String id, String likes) {
    return (update(dBEvents)..where((t) => t.id.equals(id))).write(
      DBEvent(
        totalLike: likes,
      ),
    );
  }

  ////
  //////**********************************************************
  ////
  //////Attendies
  Future insertAllAttendies(List<DBAttendie> attendie) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBAttendies, attendie);
    });
  }

  Future insertAttendie(DBAttendie attendie) =>
      into(dBAttendies).insertOnConflictUpdate(attendie);

  Future<List<DBAttendie>> getAttendies() => select(dBAttendies).get();

  Future deleteAttendies() => delete(dBAttendies).go();

  ////
  //////****************************************************************
  ////
  ///Comments
  Future insertAllComments(List<DBComment> comment) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBComments, comment);
    });
  }

  Future insertComment(DBComment comment) =>
      into(dBComments).insertOnConflictUpdate(comment);

  Future<List<DBComment>> getAllComments() => select(dBComments).get();

  Future deleteAllComments() => delete(dBComments).go();

  Future deleteEventComments(String type, String postID) {
    final _delete = delete(dBComments);
    _delete.where((tbl) => tbl.type.equals(type));
    _delete.where((tbl) => tbl.postId.equals(postID));

    return _delete.go();
  }

  Future<List<DBComment>> getEventComments(String type, String postID) {
    final _select = select(dBComments);
    _select.where((tbl) => tbl.type.equals(type));
    _select.where((tbl) => tbl.postId.equals(postID));

    return _select.get();
  }
////
  //////****************************************************************
  ////
  ///Comment Replies

  Future insertCommentReply(DBCommentReplie comment) =>
      into(dBCommentReplies).insertOnConflictUpdate(comment);

  //Future deleteAllComments() => delete(dBComments).go();

  // Future deleteEventComments(String type, String postID) {
  //   final _delete = delete(dBComments);
  //   _delete.where((tbl) => tbl.type.equals(type));
  //   _delete.where((tbl) => tbl.postId.equals(postID));
  //
  //   return _delete.go();
  // }
  Future<List<DBCommentReplie>> getAllReplies() =>
      select(dBCommentReplies).get();

  Future<List<DBCommentReplie>> getCommentReplies(String commentId) {
    final _select = select(dBCommentReplies);
    _select.where((tbl) => tbl.commentId.equals(commentId));
    return _select.get();
  }

  Future editReplyLikeStatus(
      String id, String likes, String reaction, String status) {
    return (update(dBCommentReplies)..where((t) => t.id.equals(id))).write(
      DBCommentReplie(
        likeCount: likes,
        reaction: reaction,
        isLike: status,
      ),
    );
  }

  ///
  /// ***********************************
  /// Mentor
  ///
  Future<List<DBMentor>> getAllMentors() => select(dBMentors).get();

  // Future<List<DBAllUser>> getCompanyUsers(String company) => (select(dBAllUsers)
  //   ..where((tbl) => (tbl.organizationName.equals(company))))
  //     .get();

  Future deleteMentors() => delete(dBMentors).go();

  Future insertAllMentors(List<DBMentor> mentors) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBMentors, mentors);
    });
  }

  // Future editMentorUsers(String userId, String isMentor) {
  //   return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
  //     DBAllUser(
  //       isMentor: isMentor,
  //     ),
  //   );
  // }

  // Future editConnectUsers(String userId, String status) {
  //   return (update(dBAllUsers)..where((t) => t.userId.equals(userId))).write(
  //     DBAllUser(
  //       connectionStatus: status,
  //     ),
  //   );
  // }

  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// Discounts Partners
  Future insertAllDiscounts(List<DBDiscount> discount) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBDiscounts, discount);
    });
  }

  Future deleteDiscounts() => delete(dBDiscounts).go();

  Future<List<DBDiscount>> getDiscounts() => select(dBDiscounts).get();

  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBNotifications
  Future insertAllNotifications(List<DBNotification> notification) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBNotifications, notification);
    });
  }

  Future insertNotification(DBNotification notification) =>
      into(dBNotifications).insertOnConflictUpdate(notification);

  Future deleteNotifications() => delete(dBNotifications).go();

  Future<List<DBNotification>> getNotifications() =>
      select(dBNotifications).get();

  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBGalleries
  Future insertAllGalleries(List<DBGallerie> gallery) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBGalleries, gallery);
    });
  }

  Future insertGallery(DBGallerie gallery) =>
      into(dBGalleries).insertOnConflictUpdate(gallery);

  Future deleteGalleries() => delete(dBGalleries).go();

  Future<List<DBGallerie>> getGalleries() => select(dBGalleries).get();
  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBGalleryImages
  Future insertAllGalleryImages(List<DBGalleryImage> image) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBGalleryImages, image);
    });
  }

  Future insertGalleryImage(DBGalleryImage image) =>
      into(dBGalleryImages).insertOnConflictUpdate(image);

  Future deleteGalleryImages() => delete(dBGalleryImages).go();

  Future<List<DBGalleryImage>> getGalleryImages(String galleryId) {
    final _select = select(dBGalleryImages);
    _select.where((tbl) => tbl.title.equals(galleryId));
    return _select.get();
  }

  Future deleteImages(String galleryId) {
    final _delete = delete(dBGalleryImages);

    _delete.where((tbl) => tbl.title.equals(galleryId));

    return _delete.go();
  }

  /////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBTimeLinePosts
  Future insertAllTimeLinePosts(List<DBTimeLinePost> post) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBTimeLinePosts, post);
    });
  }

  Future insertPost(DBTimeLinePost post) =>
      into(dBTimeLinePosts).insertOnConflictUpdate(post);

  Future deleteTimeLinePosts() => delete(dBTimeLinePosts).go();

  Future<List<DBTimeLinePost>> getTimeLinePosts() =>
      select(dBTimeLinePosts).get();

  Future editPostLikes(String id, String likes) {
    return (update(dBTimeLinePosts)..where((t) => t.id.equals(id))).write(
      DBTimeLinePost(
        totalLikes: likes,
      ),
    );
  }

  Future deleteSinglePost(String postId) {
    final _delete = delete(dBTimeLinePosts);
    _delete.where((tbl) => tbl.id.equals(postId));
    return _delete.go();
  }

  Future editPostLikeStatus(String id, String like) {
    return (update(dBTimeLinePosts)..where((t) => t.id.equals(id))).write(
      DBTimeLinePost(
        isLike: like,
      ),
    );
  }

  /////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBTimeLinePostsImages
  Future insertAllTimeLinePostsImages(List<DBPostImage> postImage) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBPostImages, postImage);
    });
  }

  Future insertPostImage(DBPostImage postImage) =>
      into(dBPostImages).insertOnConflictUpdate(postImage);

  Future deleteTimeLinePostImages() => delete(dBPostImages).go();

  Future<List<DBPostImage>> getTimeLinePostImages() =>
      select(dBPostImages).get();

  Future<List<DBPostImage>> getPostImages(String postId) {
    final _select = select(dBPostImages);
    _select.where((tbl) => tbl.postId.equals(postId));
    return _select.get();
  }

  /////// ++++++++++++++++++++++++++++++++++++++++++++++++
  ///// DBTimeLinePostTags
  /////
  Future insertAllTimeLinePostsTags(List<DBPostTag> postTag) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBPostTags, postTag);
    });
  }

  Future insertPostTag(DBPostTag postTag) =>
      into(dBPostTags).insertOnConflictUpdate(postTag);

  Future deleteTimeLinePostTags() => delete(dBPostTags).go();

  Future<List<DBPostTag>> getTimeLinePostTags() => select(dBPostTags).get();

  Future<List<DBPostTag>> getPostTags(String postId) {
    final _select = select(dBPostTags);
    _select.where((tbl) => tbl.postId.equals(postId));
    return _select.get();
  }

  ///// DBChatStatus
  // Future insertAllChatStatus(List<DBChatStatus> postImage) async {
  //   await batch((b) {
  //     b.insertAllOnConflictUpdate(dBPostImages, postImage);
  //   });
  // }

  Future insertChatStatus(DBChatStatus chatStatus) =>
      into(dBChatStatuss).insert(chatStatus);

  Future deleteAllChatStatus() => delete(dBChatStatuss).go();

  Future<List<DBChatStatus>> getAllChatStatus() => select(dBChatStatuss).get();

  Future deleteChatStatus(String senderId, String receiverId) {
    final _delete = delete(dBChatStatuss);
    _delete.where((tbl) => tbl.senderId.equals(senderId));
    _delete.where((tbl) => tbl.receiverId.equals(receiverId));
    return _delete.go();
  }

  Future<DBChatStatus> getChatStatus(String senderId, String receiverId) {
    final _select = select(dBChatStatuss);
    _select.where((tbl) => tbl.senderId.equals(senderId));
    _select.where((tbl) => tbl.receiverId.equals(receiverId));
    return _select.getSingle();
  }

  Future editChatStatus(String senderId, String receiverId, String status) {
    final _update = update(dBChatStatuss);
    _update.where((tbl) => tbl.senderId.equals(senderId));
    _update.where((tbl) => tbl.receiverId.equals(receiverId));

    return _update.write(DBChatStatus(status: status));
  }

  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBCSRs
  Future insertAllCSR(List<DBCSR> csr) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBCSRs, csr);
    });
  }

  Future insertCSR(DBCSR csr) => into(dBCSRs).insertOnConflictUpdate(csr);

  Future deleteCSR() => delete(dBCSRs).go();

  Future<List<DBCSR>> getCSR() => select(dBCSRs).get();

  Future editCSRInterest(String csrId, int interested) {
    return (update(dBCSRs)..where((t) => t.csrId.equals(csrId))).write(
      DBCSR(
        isInterested: interested,
      ),
    );
  }

  /////
/////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBAbout
//   Future insertAllCSR(List<DBCSR> csr) async {
//     await batch((b) {
//       b.insertAllOnConflictUpdate(dBCSRs, csr);
//     });
//   }

  Future insertAbout(DBAbout about) => into(dBAbouts).insert(about);

  Future deleteAbout() => delete(dBAbouts).go();

  Future<List<DBAbout>> getAbouts() => select(dBAbouts).get();

  Future<DBAbout> getAbout() => select(dBAbouts).getSingle();

  /////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBContact

  Future insertContact(DBContact contact) => into(dBContacts).insert(contact);

  Future deleteContact() => delete(dBContacts).go();

  Future<List<DBContact>> getContacts() => select(dBContacts).get();

  Future<DBContact> getContact() => select(dBContacts).getSingle();

  /////
/////// ++++++++++++++++++++++++++++++++++++++++++++++++
///// DBFAQs

  Future insertAllFaqs(List<DBFaq> faq) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBFaqs, faq);
    });
  }

  Future insertFaq(DBFaq faq) => into(dBFaqs).insert(faq);

  Future deleteFaqs() => delete(dBFaqs).go();

  Future<List<DBFaq>> getFaqs() => select(dBFaqs).get();

  //////////////
//////////////// chapter details

  Future insertChapResult(DBChapterDetailResult dbChapterDetailResult) =>
      into(dBChapterDetailResults).insert(dbChapterDetailResult);

  Future deleteChapResult() => delete(dBChapterDetailResults).go();

  Future<List<DBChapterDetailResult>> getChapResult() =>
      select(dBChapterDetailResults).get();

//////====/////

  Future insertChapDetails(DBChapterDetail dbChapterDetail) =>
      into(dBChapterDetails).insert(dbChapterDetail);

  Future deleteChapDetails() => delete(dBChapterDetails).go();

  Future<List<DBChapterDetail>> getChapDetails() =>
      select(dBChapterDetails).get();

  //////====/////
  Future insertChapMembers(DBChapterDetailMember dbChapterDetailMember) =>
      into(dBChapterDetailMembers).insert(dbChapterDetailMember);

  Future deleteChapMembers() => delete(dBChapterDetailMembers).go();

  Future<List<DBChapterDetailMember>> getChapMembers() =>
      select(dBChapterDetailMembers).get();

  /// TLE PRODUCTS BUY AND SELL
  /// ***********************************************************
  /// Products
  Future insertAllProducts(List<DBProduct> product) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBProducts, product);
    });
  }

  Future<List<DBProduct>> getUserProduct(int userId) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.addedBy.equals(userId));
    _select.orderBy(
        [(t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc)]);
    _select.limit(3);

    return _select.get();
  }

  //
  Future<List<DBProduct>> getMyProducts(String catId, int userId) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.category.equals(catId));
    _select.where((tbl) => tbl.addedBy.equals(userId));
    return _select.get();
  }

  //
  Future<List<DBProduct>> getCatProducts(String catName) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.category.equals(catName));
    _select.where((tbl) => tbl.isPremium.equals('N'));
    _select.orderBy(
        [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]);
    return _select.get();
  }

  Future<List<DBProduct>> getMyCatProducts(String catId, int id) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.category.equals(catId));
    _select.where((tbl) => tbl.addedBy.equals(id));
    return _select.get();
  }

  Future<List<DBProduct>> getPremiumCatProducts(String catId) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.category.equals(catId));
    _select.where((tbl) => tbl.isPremium.equals('Y'));

    return _select.get();
  }

  Future<DBProduct> getSingleProduct(int productId) {
    final _select = select(dBProducts);
    _select.where((tbl) => tbl.id.equals(productId));
    return _select.getSingle();
  }

  Future editFavProduct({required int productId, required String status}) {
    return (update(dBProducts)..where((t) => t.id.equals(productId))).write(
      DBProduct(
        isFavourite: status,
        id: productId,
      ),
    );
  }

  Future insertProduct(DBProduct product) =>
      into(dBProducts).insertOnConflictUpdate(product);

  Future deleteProduct(int userid) =>
      (delete(dBProducts)..where((e) => (e.addedBy.equals(userid)))).go();

  Future deleteAllProducts() => delete(dBProducts).go();

  Future deleteSingleProduct(int productId) =>
      (delete(dBProducts)..where((e) => (e.id.equals(productId)))).go();

  Future<List<DBProduct>> getAllProducts() => select(dBProducts).get();

  /// *******************************
  /// Product Images
  Future insertAllProductImages(List<DBProductImage> image) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBProductImages, image);
    });
  }

  Future insertProductImage(DBProductImage image) =>
      into(dBProductImages).insert(image);

  Future deleteAllProductImages() => delete(dBProductImages).go();
  Future<List<DBProductImage>> getAllProductImages() =>
      select(dBProductImages).get();

  Future<List<DBProductImage>> getSingleProductImages(int productId) {
    final _select = select(dBProductImages);
    _select.where((tbl) => tbl.productId.equals(productId));
    return _select.get();
  }

  Future deleteSingleProductImages(int productId) =>
      (delete(dBProductImages)..where((e) => (e.productId.equals(productId))))
          .go();

  Future<List<DBProductImage>> getProductImages(int postId) {
    final _select = select(dBProductImages);
    _select.where((tbl) => tbl.productId.equals(postId));
    return _select.get();
  }

  /// Product Categories
  Future insertAllCategories(List<DBProductCategorie> category) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(dBProductCategories, category);
    });
  }

  Future insertCategory(DBProductCategorie category) =>
      into(dBProductCategories).insert(category);

  Future deleteAllCategories() => delete(dBProductCategories).go();

  Future<List<DBProductCategorie>> getAllCategories() =>
      select(dBProductCategories).get();
  //////////////////
//////////////////
//////////////////  business spotlight

  Future insertBusiSpotlight(DBBusinessSpotlight dbBusinessSpotlight) =>
      into(dBBusinessSpotlights).insert(dbBusinessSpotlight);

  Future deleteBusiSpotlight() => delete(dBBusinessSpotlights).go();

  Future<List<DBBusinessSpotlight>> getBusiSpotlight() =>
      select(dBBusinessSpotlights).get();

  //////////////////
//////////////////
//////////////////  TLE spotlight

  Future insertTleSpotlight(DBTleSpotlight dbTleSpotlight) =>
      into(dBTleSpotlights).insert(dbTleSpotlight);

  Future deleteTleSpotlight() => delete(dBTleSpotlights).go();

  Future<List<DBTleSpotlight>> getTleSpotlight() =>
      select(dBTleSpotlights).get();

  /// *******************************
  /// TimeLine Stories
  Future insertAllTimeLineStories(DBStorie story) =>
      into(dBStories).insert(story);

  Future deleteAllTimeLineStories() => delete(dBStories).go();
  Future<List<DBStorie>> getAllTimeLineStories() => select(dBStories).get();

  Future<List<DBStorie>> getSingleTimeLineStory(int id) {
    final _select = select(dBStories);
    _select.where((tbl) => tbl.addedBy.equals(id));
    return _select.get();
  }

  Future deleteSingleStory(int storyId) =>
      (delete(dBStories)..where((e) => (e.addedBy.equals(storyId)))).go();


  Future insertAllStories(DbNewStorie story) => into(dbNewStories).insert(story);
  Future deleteAllStories() => delete(dbNewStories).go();

  Future<List<DbNewStorie>> getAllStories() => select(dbNewStories).get();

  Future<List<DbNewStorie>> getSingleStory(int id) {
    final _select = select(dbNewStories);
    _select.where((tbl) => tbl.updatedDate.equals(id.toString()));
    return _select.get();
  }

  Future deleteStory(int storyId) =>
      (delete(dbNewStories)..where((e) => (e.storyId.equals(storyId)))).go();

  Future deleteSingleComment(String commentId) {
    final _delete = delete(dBComments);
    _delete.where((tbl) => tbl.id.equals(commentId));
    return _delete.go();
  }

  //Future deleteAllComments() => delete(dBComments).go();

  Future deleteCommentReply(String id) {
    final _delete = delete(dBCommentReplies);
    _delete.where((tbl) => tbl.id.equals(id));

    return _delete.go();
  }



}
