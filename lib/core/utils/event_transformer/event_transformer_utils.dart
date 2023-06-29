import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

class EventTransformerUtils {
  EventTransformerUtils._();

  EventTransformer<Event> debounce<Event>([Duration duration = const Duration(seconds: 2)]) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  static EventTransformer<Event> throttle<Event>([Duration duration = const Duration(seconds: 3)]) {
    return (events, mapper) => events.throttle(duration).switchMap(mapper);
  }
}
