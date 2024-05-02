//
//  StationDetailModel.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

struct StationDetailModel: Codable {
    let status: Int
    let data: [DetailStation]
}

struct DetailStation: Codable, Identifiable {
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

extension DetailStation {
    static let dummyData: [DetailStation] = [
        DetailStation(
            id: "1",
            stationID: "S001",
            trainID: "T001",
            line: "COMMUTER LINE BOGOR",
            route: "BOGOR-DEPOK",
            color: "Red",
            destination: "DEPOK",
            timeEstimated: "15:30:00",
            destinationTime: "16:00:00",
            updatedAt: "2024-03-16T17:00:08.204Z"
        )
    ]
}
