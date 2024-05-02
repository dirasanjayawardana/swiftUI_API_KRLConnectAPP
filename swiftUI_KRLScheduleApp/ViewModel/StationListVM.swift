//
//  StationListVM.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

@MainActor
class StationListVM: ObservableObject {
    @Published var stations = [Station]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func getStationList() async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        do {
            stations = try await APIService.shared.getStationList()
        } catch {
            errorMessage = "\(error.localizedDescription). Failed to get dari from API"
            print(errorMessage ?? "N/A")
        }
    }
}
