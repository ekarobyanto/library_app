import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/features/report/data/report_repository.dart';
import 'package:library_app/src/features/report/presentation/cubit/report_detail_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_header.dart';
import 'package:library_app/src/widgets/error.dart';
import 'package:library_app/src/widgets/loading.dart';

class ReportDetail extends StatelessWidget {
  final String reportId;
  const ReportDetail({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ReportDetailCubit(context.read<ReportRepository>())
                ..getReportDetail(reportId),
        ),
        BlocProvider(
          create: (context) =>
              BookDetailCubit(bookRepository: context.read<BookRepository>()),
        ),
      ],
      child: BlocListener<ReportDetailCubit, ReportDetailState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (report) =>
                context.read<BookDetailCubit>().getBookDetail(report.book.id!),
          );
        },
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ApplicationAppbar(
              title: 'Report Detail',
              onBackButtonPressed: () => router.pop(),
            ),
            body: BlocBuilder<ReportDetailCubit, ReportDetailState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () => const Center(child: LoadingWidget()),
                  failed: (message) => ErrorFetch(
                    message: message,
                    onRetry: () => context
                        .read<ReportDetailCubit>()
                        .getReportDetail(reportId),
                  ),
                  success: (report) => Scrollbar(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<BookDetailCubit, BookDetailState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => const SizedBox(),
                                success: (book) => BookHeader(
                                  book: book,
                                  showDetailButton: true,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Report',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Text(
                                  report.description,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
