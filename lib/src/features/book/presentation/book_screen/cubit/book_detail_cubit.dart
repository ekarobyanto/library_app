import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'book_detail_cubit.freezed.dart';
part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final BookRepository bookRepository;
  BookDetailCubit({required this.bookRepository})
      : super(const BookDetailState.initial());

  Future<void> getBookDetail(String id) async {
    emit(const BookDetailState.loading());
    try {
      final book = await bookRepository.getBookById(id);
      logger.i(book);
      emit(BookDetailState.success(book: book));
    } catch (e) {
      emit(BookDetailState.error(message: e.toString()));
    }
  }
}
