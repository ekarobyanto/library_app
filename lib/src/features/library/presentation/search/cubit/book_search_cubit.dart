import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'book_search_state.dart';
part 'book_search_cubit.freezed.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  final BookRepository bookRepository;
  BookSearchCubit({required this.bookRepository})
      : super(const BookSearchState.initial());

  checkInit() {
    logger.i("BookSearchCubit initialized");
  }

  findBooks(String query) async {
    try {
      emit(const BookSearchState.loading());
      final books = await bookRepository.getBooksFromUrl(
        url: '/book',
        params: {'book_name': query},
      );
      emit(BookSearchState.success(books: books));
    } catch (err) {
      logger.e(err);
    }
  }
}
