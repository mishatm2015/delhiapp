import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> signIn(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock authentication logic
    if (email == 'demo@example.com' && password == 'password') {
      _currentUser = User(
        id: '1',
        name: 'Demo User',
        email: 'demo@example.com',
        createdAt: DateTime(2024, 1, 1),
      );
      _isAuthenticated = true;
      return true;
    }
    
    return false;
  }

  Future<void> signOut() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _currentUser = null;
    _isAuthenticated = false;
  }

  Future<bool> signUp(String name, String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock registration logic
    _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );
    _isAuthenticated = true;
    
    return true;
  }

  Future<void> updateProfile(String name, String? profileImage) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(
        name: name,
        profileImage: profileImage,
      );
    }
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock password change logic
    return true;
  }
}
