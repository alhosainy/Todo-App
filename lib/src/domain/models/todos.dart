import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/src/domain/models/todo.dart';

part 'todos.freezed.dart';

part 'todos.g.dart';

@freezed
class Todos with _$Todos {
  factory Todos({
    @Default([]) List<Todo> todos,
  }) = _Todo;

  const Todos._();

  List<Todo> get completed {
    return todos.where((todo) => todo.completed).toList();
  }

  List<Todo> get unCompleted {
    return todos.where((todo) => !todo.completed).toList();
  }

  factory Todos.fromJson(Map<String, Object?> json) => _$TodosFromJson(json);
}
