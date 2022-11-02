// To parse this JSON data, do
//
//     final overview = overviewFromJson(jsonString);

import 'dart:convert';

Overview overviewFromJson(String str) => Overview.fromJson(json.decode(str));

String overviewToJson(Overview data) => json.encode(data.toJson());

class Overview {
    Overview({
        this.id,
        this.security,
        this.industryId,
        this.industry,
        required this.sectorId,
        required this.sector,
        this.mcap,
        this.ev,
        this.evDateEnd,
        this.bookNavPerShare,
        this.ttmpe,
        required this.ttmYearEnd,
        required this.overviewYield,
        required this.yearEnd,
        this.sectorSlug,
        this.industrySlug,
        this.securitySlug,
        this.pegRatio,
    });

    int? id;
    String? security;
    int? industryId;
    String? industry;
    int sectorId;
    String sector;
    double? mcap;
    dynamic? ev;
    dynamic evDateEnd;
    double? bookNavPerShare;
    double? ttmpe;
    int ttmYearEnd;
    double overviewYield;
    int yearEnd;
    String? sectorSlug;
    String? industrySlug;
    String? securitySlug;
    double? pegRatio;

    factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        id: json["ID"],
        security: json["Security"],
        industryId: json["IndustryID"],
        industry: json["Industry"],
        sectorId: json["SectorID"],
        sector: json["Sector"],
        mcap: json["MCAP"].toDouble(),
        ev: json["EV"],
        evDateEnd: json["EVDateEnd"],
        bookNavPerShare: json["BookNavPerShare"].toDouble(),
        ttmpe: json["TTMPE"].toDouble(),
        ttmYearEnd: json["TTMYearEnd"],
        overviewYield: json["Yield"].toDouble(),
        yearEnd: json["YearEnd"],
        sectorSlug: json["SectorSlug"],
        industrySlug: json["IndustrySlug"],
        securitySlug: json["SecuritySlug"],
        pegRatio: json["PEGRatio"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Security": security,
        "IndustryID": industryId,
        "Industry": industry,
        "SectorID": sectorId,
        "Sector": sector,
        "MCAP": mcap,
        "EV": ev,
        "EVDateEnd": evDateEnd,
        "BookNavPerShare": bookNavPerShare,
        "TTMPE": ttmpe,
        "TTMYearEnd": ttmYearEnd,
        "Yield": overviewYield,
        "YearEnd": yearEnd,
        "SectorSlug": sectorSlug,
        "IndustrySlug": industrySlug,
        "SecuritySlug": securitySlug,
        "PEGRatio": pegRatio,
    };
}
