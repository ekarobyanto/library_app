import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/model/query_params.dart';

part 'book_list_cubit.freezed.dart';
part 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  final BookRepository bookRepository;
  BookListCubit({required this.bookRepository})
      : super(const BookListState.initial());

  getBooks(String url, QueryParams? params) async {
    emit(const _Loading());
    try {
      final books =
          await bookRepository.getBooksFromUrl(url: url, query: params);
      emit(_Success(books: books));
    } catch (e) {
      emit(const _Error(message: 'Failed to get books'));
    }
  }
}
