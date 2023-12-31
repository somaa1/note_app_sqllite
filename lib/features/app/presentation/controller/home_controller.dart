import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../core/storage/local/database/controller/note_database_controller.dart';
import '../../../../core/storage/local/database/model/note.dart';

class HomeController extends GetxController {
  List<Note> notes = [];
  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  Future<void> read() async {
    notes = await _noteDatabaseController.read();
    update();
  }

  Future<bool> create({required Note note}) async {
    int id = await _noteDatabaseController.create(note);
    if (id != 0) {
      note.id = id;
      notes.add(note);
      update();
    }

    return id != 0;
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
