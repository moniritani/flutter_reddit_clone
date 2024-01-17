import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/data/models/models.dart';
import 'package:reddit_clone/data/utils/mock_data_util.dart';

final postProvider = StateProvider<Post>((ref) => MockDataUtil.getMockPost());