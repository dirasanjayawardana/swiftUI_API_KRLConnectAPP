//
//  TrainDetailVM.swift
//  KRLConnect
//
//  Created by MACBOOK PRO on 03/05/24.
//

import Foundation

@MainActor
class TrainDetailVM: ObservableObject {
    @Published var trainDetail = [TrainDetail]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func getTrainDetail(id: String) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        do {
            trainDetail = try await APIService.shared.getTrainDetail(id: id)
        } catch {
            errorMessage = "\(error.localizedDescription). Failed to get dari from API"
            print(errorMessage ?? "N/A")
        }
    }
}
