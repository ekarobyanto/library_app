import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/dto/create_book.dto.dart';

part 'create_book_state.dart';
part 'create_book_cubit.freezed.dart';

class CreateBookCubit extends Cubit<CreateBookState> {
  final BookRepository _bookRepository;
  CreateBookCubit(this._bookRepository)
      : super(const CreateBookState.initial());

  Future<void> createBook({required CreateBookDTO book}) async {
    emit(const CreateBookState.loading());
    try {
      await _bookRepository.createBook(book);
      emit(const CreateBookState.created());
    } catch (e) {
      emit(CreateBookState.error(e.toString()));
    }
  }
}
