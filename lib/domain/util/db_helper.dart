import 'package:ayursh/domain/model/response/notification_model.dart';
import 'package:sqflite/sqflite.dart';

final String tableNotification = 'notification';
final String columnTimestamp = 'timestamp';
final String columnTitle = 'title';
final String columnBody = 'body';
final String columnIsRead = 'isRead';
final String columnBookingId = 'booking_id';

class DbHelper {
  late Database db;

  Future open() async {
    db = await openDatabase('ayursh_user.db', version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableNotification ( 
  $columnTimestamp text primary key, 
  $columnTitle text not null,
  $columnBody text not null,
  $columnBookingId text not null,
  $columnIsRead integer not null)
''');
    });
  }

  Future<NotificationModel> insert(NotificationModel notification) async {
    await db.insert(tableNotification, notification.toJson());
    return notification;
  }

  Future<List<NotificationModel>> getNotifications() async {
    List<Map> maps = await db.query(tableNotification,
        columns: null, where: null, whereArgs: null);
    if (maps.length > 0) {
      var notifications = maps
          .map((data) =>
              NotificationModel.fromJson(data as Map<String, dynamic>))
          .toList();
      return notifications;
    }
    return [];
  }

  // Future<int> delete(int id) async {
  //   return await db.delete(tableNotification, where: '$columnId = ?', whereArgs: [id]);
  // }

  Future<int> update(NotificationModel notification) async {
    return await db.update(tableNotification, notification.toJson(),
        where: '$columnTimestamp = ?', whereArgs: [notification.timestamp]);
  }

  Future close() async => db.close();
}
