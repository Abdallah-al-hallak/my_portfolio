import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/home/view/landing_page.dart';

var selectedBarProvider = StateProvider<SelectedBar>((ref) => SelectedBar.home);
