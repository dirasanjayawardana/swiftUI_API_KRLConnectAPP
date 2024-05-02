//
//  StationDetailVM.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

@MainActor
class StationDetailVM: ObservableObject {
    @Published var detailStations = [DetailStation]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func getStationDetail(id: String) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        do {
            detailStations = try await APIService.shared.getStationDetail(id: id)
        } catch {
            errorMessage = "\(error.localizedDescription). Failed to get dari from API"
            print(errorMessage ?? "N/A")
        }
    }
}
