import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/report/cubit/report_cubit.dart';
import 'package:library_app/src/features/report/presentation/widgets/report_card.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/error.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Report'),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              label: "New Report",
              icon: Icons.post_add_outlined,
              onPressed: () => router.push('/create-report'),
            ),
          )
        ],
      ),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            failed: (message) => ErrorFetch(
              message: message,
              onRetry: () => context.read<ReportCubit>().getReport(false),
            ),
            success: (reports) => RefreshIndicator(
              onRefresh: () async =>
                  context.read<ReportCubit>().getReport(false),
              color: Theme.of(context).primaryColor,
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.separated(
                    itemCount: reports.length,
                    clipBehavior: Clip.none,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => router.push('/report/${reports[index].id}'),
                      child: ReportCard(report: reports[index]),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
