import 'package:flutter/material.dart';
import 'package:library_app/src/features/report/presentation/widgets/report_card.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {},
        color: Theme.of(context).primaryColor,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.separated(
              itemCount: 25,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => InkWell(
                onTap: () => router.push('/report/2'),
                child: const ReportCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}