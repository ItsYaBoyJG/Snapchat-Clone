import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapchat_clone/models/enums/data_type.dart';

final selectedProfileImageDataProvider = StateProvider((ref) => DataType.snaps);
