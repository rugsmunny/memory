import 'package:app/services/preferences_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';
import '../db_service/db.dart';

class UserService {
  User? _currentUser;
  final DatabaseHandler _dbh = DatabaseHandler();
  final SharedPreferencesHelper _sph = SharedPreferencesHelper();

  static final UserService _instance = UserService._internal();

  UserService._internal();

  factory UserService.getInstance() {
    return _instance;
  }

  User? get user => _currentUser;

  Future<bool> isUserAvailable(String name) async {
    return await getUser(name)
        .then((value) => value != null && value.exists ? false : true);
  }

  Future<bool> addUser(String name, String psw) async {
    final User userToAdd = User(name, psw);
    final success =
        await _dbh.insertData(User, userToAdd.username, userToAdd.toDb());

    if (success) {
      _currentUser = userToAdd;
    }

    return success;
  }

  Future<bool> login(String username, String password) async {
    final userData = await getUser(username);

    if (userData != null &&
        userData.exists &&
        userData.get('username') == username &&
        userData.get('password') == password) {
      _currentUser = User(username, password);
    } else {
      _currentUser = null;
    }
    return _currentUser != null;
  }

  void logout() {
    _currentUser = null;
  }

  Future<DocumentSnapshot?> getUser(String name) async {
    return await _dbh.getDoc(User, name)?.get();
  }

  Future<void> saveLoginStatus() async {
    await _sph.setPreference('loggedInUser', user.toString());
  }

  Future<void> removeLoginStatus() async {
    await _sph.setPreference('loggedInUser', null);
  }

  Future<bool> getLoginStatus() async {
    apa();
    apa(x: 'sldkfhlkf');
    apa(age: 80);
    apa(oskuld: false);

    apa(x: 'erik', oskuld: true);

    apa(user: null);
    return await _sph.getPreference<bool>('loggedInUser') ?? false;
  }

  String apa({String x = '', int age = 0, bool oskuld = true, User? user, Function? blo}) {
    return 'asldhjl';
  }
}
