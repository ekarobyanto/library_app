import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';

part 'library_state.dart';
part 'library_cubit.freezed.dart';

class LibraryBook {
  final String title;
  final String url;
  final List<Book> books;

  LibraryBook({required this.title, required this.books, this.url = ''});
}

class LibraryCubit extends Cubit<LibraryState> {
  final BookRepository bookRepository;
  LibraryCubit({required this.bookRepository})
      : super(const LibraryState.success([]));

  getBooks() async => await Future.wait([
        bookRepository
            .getBooksFromUrl(url: '/mybook', params: {"limit": "5"}).then(
          (value) => emit(LibraryState.success([
            ...(state as _Success)
                .results
                .where((e) => e.title != 'My Books')
                .toList(),
            LibraryBook(title: 'My Books', books: value, url: '/mybook')
          ])),
        ),
        bookRepository
            .getBooksFromUrl(url: '/favorite', params: {"limit": "5"}).then(
          (value) => emit(LibraryState.success([
            ...(state as _Success)
                .results
                .where((e) => e.title != 'Favorite Books')
                .toList(),
            LibraryBook(title: 'Favorite Books', books: value, url: '/favorite')
          ])),
        ),
      ]);
}
