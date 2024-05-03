//
//  TrainDetailModel.swift
//  KRLConnect
//
//  Created by MACBOOK PRO on 03/05/24.
//

import Foundation

struct TrainDetailModel: Codable {
    let status: Int
    let data: [TrainDetail]
}

struct TrainDetail: Codable, Identifiable {
    let id, stationID, trainID, line: String
    let route, color, destination, timeEstimated: String
    let destinationTime, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case stationID = "stationId"
        case trainID = "trainId"
        case line, route, color, destination, timeEstimated, destinationTime, updatedAt
    }
}

extension TrainDetail {
    static let dummyData: [TrainDetail] = [
        TrainDetail(
            id: "1",
            stationID: "S001",
            trainID: "T001",
            line: "COMMUTER LINE BOGOR",
            route: "BOGOR-DEPOK",
            color: "FF0000",
            destination: "DEPOK",
            timeEstimated: "08:00:00",
            destinationTime: "09:00:00",
            updatedAt: "2024-03-16T17:00:10.326Z"
        )
    ]
}
