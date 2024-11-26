import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sources_response/source.dart';
import 'package:flutter_application_1/news/news_list.dart';
import 'package:flutter_application_1/tabs/tab_item.dart';

class SourceTab extends StatefulWidget {
  SourceTab(this.sources);
  List<Source> sources;

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources
                .map(
                  (Source) => TabItem(
                    sourceName: Source.name ?? '',
                    isSelected:
                        widget.sources.indexOf(Source) == selectedTabIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedTabIndex].id!),
        )
      ],
    );
  }
}
