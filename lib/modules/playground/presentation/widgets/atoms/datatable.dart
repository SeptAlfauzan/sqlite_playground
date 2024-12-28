import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Datatable extends StatefulWidget {
  final List<Map<String, dynamic>> records;
  const Datatable({super.key, required this.records});

  @override
  State<Datatable> createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  @override
  Widget build(BuildContext context) {
    final keys =
        widget.records.isEmpty ? [] : widget.records.first.keys.toList();
    final entries = widget.records.isEmpty ? [] : widget.records.toList();

    return widget.records.isEmpty
        ? const SizedBox(
            width: 20,
            height: 20,
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                ...keys
                    .map((key) => DataColumn(
                          label: Expanded(
                            child: Text(
                              key,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ))
                    .toList()
              ],
              rows: [
                ...entries.map(
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
              ],
            ),
          );
  }
}
