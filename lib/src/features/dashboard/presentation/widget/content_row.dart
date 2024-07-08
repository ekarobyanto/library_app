import 'package:flutter/material.dart';

class ContentRowContent {
  final String label;
  final String message;

  ContentRowContent({
    required this.label,
    required this.message,
  });
}

class ContentRow extends StatefulWidget {
  final List<ContentRowContent> contents;

  const ContentRow({
    super.key,
    required this.contents,
  });

  @override
  State<ContentRow> createState() => _ContentRowState();
}

class _ContentRowState extends State<ContentRow> {
  bool showRightScrollArrow = false;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.addListener(_scrollListener);
      }
    });
  }

  void _scrollListener() {
    final bool shouldShowRightScrollArrow = scrollController.position.pixels <
        scrollController.position.maxScrollExtent;

    if (showRightScrollArrow != shouldShowRightScrollArrow) {
      setState(() {
        showRightScrollArrow = shouldShowRightScrollArrow;
      });
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 80,
      child: Stack(
        children: [
          Scrollbar(
            controller: scrollController,
            child: ListView.separated(
              shrinkWrap: true,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.contents.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Text(widget.contents[index].label),
                  Text(
                    widget.contents[index].message,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showRightScrollArrow && scrollController.hasClients)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          if (!showRightScrollArrow &&
              scrollController.hasClients &&
              scrollController.position.pixels > 0)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
                onPressed: () {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
