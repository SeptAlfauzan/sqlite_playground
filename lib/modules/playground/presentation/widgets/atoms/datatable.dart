import 'package:flutter/material.dart';

class Datatable extends StatefulWidget {
  final List<Map<String, dynamic>> records;
  const Datatable({super.key, required this.records});

  @override
  State<Datatable> createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  //final _bgColor = Color(0xFF242c2c);
  @override
  Widget build(BuildContext context) {
    final keys =
        widget.records.isEmpty ? [] : widget.records.first.keys.toList();
    final entries = widget.records.isEmpty ? [] : widget.records.toList();

    return widget.records.isEmpty
        ? Container(
            width: double.infinity,
          )
        : Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DataTable(
                  columns: <DataColumn>[
                    ...keys.map(
                      (key) => DataColumn(
                        label: Expanded(
                          //alignment: Alignment.centerLeft,
                          child: Text(key, textAlign: TextAlign.left),
                          //                  textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                  rows: const [],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowHeight: 0,
                      columns: <DataColumn>[
                        ...keys.map(
                          (key) => DataColumn(
                            label: Expanded(
                              child: Text(key),
                            ),
                          ),
                        )
                      ],
                      rows: entries
                          .map(
                            (entry) => DataRow(
                              cells: <DataCell>[
                                ...keys.map(
                                  (key) => DataCell(
                                    Text(
                                      entry[key].toString(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
