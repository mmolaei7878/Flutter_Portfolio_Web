import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbarbloc_event.dart';
part 'navbarbloc_state.dart';

class NavbarblocBloc extends Bloc<NavbarblocEvent, NavbarblocState> {
  NavbarblocBloc() : super(NavbarblocStateShowAboutMe());

  @override
  Stream<NavbarblocState> mapEventToState(
    NavbarblocEvent event,
  ) async* {
    if (event is NavabarblocEvent1) {
      yield NavbarblocState1();
    } else if (event is NavabarblocEvent2) {
      yield NavbarblocState2();
    } else if (event is NavabarblocEvent3) {
      yield NavbarblocState3();
    } else if (event is NavabarblocEvent4) {
      yield NavbarblocState4();
    } else if (event is NavabarblocEventShowAboutMe) {
      yield NavbarblocStateShowAboutMe();
    }
  }
}
