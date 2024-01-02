import 'package:flutter/material.dart';
import 'package:hair_time/ui/common/list/generic_card_data.dart';

class GenericCardList extends StatelessWidget {
  List<GenericCardData> list;

  GenericCardList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          var isFirst = index == 0;
          var isLast = index == list.length - 1;

          return InkWell(
            onTap: item.action,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: isFirst
                    ? const BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.zero)
                    : isLast
                        ? const BorderRadius.vertical(bottom: Radius.circular(16), top: Radius.zero)
                        : BorderRadius.zero,
              ),
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (!isFirst) ...[
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.withOpacity(0.4),
                      )
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          // Icon(item.icon),
                          Text(item.title)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
