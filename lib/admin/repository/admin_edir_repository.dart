import 'package:edir/admin/data_provider/admin_edir_data_provider.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/models/event.dart';

class AdminEdirRepository {
  final AdminEdirDataProvider edirDataProvider = AdminEdirDataProvider();

  AdminEdirRepository();

  Future<String> createEdir(Edir edir) async {
    return await this.edirDataProvider.createEdir(edir);
  }

  Future<String> updateEdir(int edirId, Edir edir) async {
    return await this.edirDataProvider.updateEdir(edirId, edir);
  }

  Future<Edir> getCurrentEdir() async {
    return this.edirDataProvider.getCurrentEdir();
  }

  Future<String> updateEvent(int edirId, Edir edir) async {
    return this.edirDataProvider.updateEdir(edirId, edir);
  }
}
