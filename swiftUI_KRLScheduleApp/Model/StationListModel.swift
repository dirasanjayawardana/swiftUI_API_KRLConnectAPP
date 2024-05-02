//
//  StationListModel.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

struct StationListModel: Codable {
    let status: Int
    let data: [Station]
}

struct Station: Codable, Identifiable {
    let id, name: String
    let daop, fgEnable: Int
    let haveSchedule: Bool
    let updatedAt: String
}

extension Station {
    static let dummyData: [Station] = [
        Station(
            id: "1",
            name: "Station A",
            daop: 1,
            fgEnable: 1,
            haveSchedule: true,
            updatedAt: "2024-03-10T15:15:19.997Z"
        )
    ]
}
