import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: '',
              height: MediaQuery.sizeOf(context).height * .25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) => LoadingIndicator(),
              errorWidget: (_, __, ___) =>
                  Icon(Icons.image_not_supported_outlined),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'BBC NEWS',
            style:
                titleSmallStyle?.copyWith(fontSize: 10, color: AppTheme.gray),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'XSDFGJKDFGKL;',
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeago.format(fifteenAgo),
              style:
                  titleSmallStyle?.copyWith(fontSize: 13, color: AppTheme.gray),
            ),
          )
        ],
      ),
    );
  }
}
