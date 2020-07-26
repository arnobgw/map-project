import 'rest_service.dart';
import '../models/journal_model.dart';

class JournalDataService {
  static final JournalDataService _instance = JournalDataService._constructor();
  factory JournalDataService() {
    return _instance;
  }

  JournalDataService._constructor();
  final rest = RestService();

  Future<List<Journal>> getAllJournals() async {
    final listJson = await rest.get('journal');

    return (listJson as List)
        .map((itemJson) => Journal.fromJson(itemJson))
        .toList();
  }

  Future deleteJournal({String id}) async {
    await rest.delete('journal/$id');
  }

  Future<Journal> createJournal({Journal journal}) async {
    final json = await rest.post('journal', data: journal);
    return Journal.fromJson(json);
  }

  Future<Journal> updateJournal({String id, Journal journal}) async {
    final json = await rest.patch('journal/$id', data: journal);
    return Journal.fromJson(json);
  }
}
