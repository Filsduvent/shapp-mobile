import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapp/models/userProfile.dart';

class ApiService {}

final userProfile = Provider<UserProfile>((ref) => UserProfile());
