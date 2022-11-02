// To parse this JSON data, do
//
//     final performance = performanceFromJson(jsonString);

import 'dart:convert';

List<Performance> performanceFromJson(String str) => List<Performance>.from(json.decode(str).map((x) => Performance.fromJson(x)));

String performanceToJson(List<Performance> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Performance {
    Performance({
        this.id,
        required this.label,
        this.chartPeriodCode,
        required this.changePercent,
    });

    int? id;
    String label;
    String? chartPeriodCode;
    double changePercent;

    factory Performance.fromJson(Map<String, dynamic> json) => Performance(
        id: json["ID"],
        label: json["Label"],
        chartPeriodCode: json["ChartPeriodCode"],
        changePercent: json["ChangePercent"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Label": label,
        "ChartPeriodCode": chartPeriodCode,
        "ChangePercent": changePercent,
    };
}
