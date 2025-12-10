import 'package:flutter_riverpod/flutter_riverpod.dart';

//this auth has no email verification or email formatter
//  check only fill the details and login or signup


final authProvider = StateProvider<bool>((ref) => false);
