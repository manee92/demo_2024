import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';
import '../repositories/chat_repository.dart';

final chatProvider = Provider(
  (ref) => ChatRepository(),
);

final authProvider = Provider(
  (ref) => AuthRepository(),
);
