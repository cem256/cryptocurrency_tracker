import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

class EventTransformerUtils {
  EventTransformerUtils._();

  static EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  static EventTransformer<Event> throttle<Event>(Duration duration) {
    return (events, mapper) => events.throttle(duration).switchMap(mapper);
  }
}
