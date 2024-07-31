import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';

part 'delete_book_state.dart';
part 'delete_book_cubit.freezed.dart';

class DeleteBookCubit extends Cubit<DeleteBookState> {
  final BookRepository bookRepository;
  DeleteBookCubit({required this.bookRepository})
      : super(const DeleteBookState.initial());

  deleteBook(String id) {
    emit(const DeleteBookState.loading());
    bookRepository.deleteBook(id).then((value) {
      emit(const DeleteBookState.success());
    }).catchError((e) {
      emit(DeleteBookState.fail(e.toString()));
    });
  }
}
