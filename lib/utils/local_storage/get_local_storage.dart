
// class BLocalStorage {
//   static final BLocalStorage _instance = BLocalStorage._internal();

//   factory BLocalStorage() => _instance;

//   BLocalStorage._internal();

//   final _storage = GetStorage();

//   // Read from memory
//   T? readData<T>(String key) => _storage.read(key);

//   // Clear all memory data
//   Future<void> clearAll<T>() async => await _storage.erase();

//   // Remove data
//   Future<void> removeData<T>(String key) async => await _storage.remove(key);

//   // Save data
//   Future<void> saveData<T>(String key, T value) async => await _storage.write(key, value);
// }
