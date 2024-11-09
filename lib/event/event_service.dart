import 'package:event_manager/event/event_mode.dart';
import 'package:localstore/localstore.dart';

class EventService {
  final db = Localstore.getInstance(useSupportDir: true);

  final path = 'events';
// Hàm lấy danh sách dữ liệu từ localstore
  Future<List<EventMode>> getAllEvents() async {
    final eventsMap = await db.collection(path).get();
    if (eventsMap != null) {
      return eventsMap.entries.map((entry) {
        final eventData = entry.value as Map<String, dynamic>;
        if (!eventData.containsKey('id')) {
          eventData['id'] = entry.key.split('/').last;
        }
        return EventMode.fromMap(eventData);
      }).toList();
    }
    return [];
  }

  // hàm lưu một sự kiện vào localstore
  Future<void> saveEvent(EventMode event) async {
    event.id ??= db.collection(path).doc().id;
    await db.collection(path).doc(event.id).set(event.toMap());
  }

  // hàm xóa một sự kiện khỏi localstore
  Future<void> deleteEvent(EventMode event) async {
    await db.collection(path).doc(event.id).delete();
  }
}
