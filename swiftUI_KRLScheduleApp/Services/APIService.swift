//
//  APIService.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    private init() {}
    
    func getStationList() async throws -> [Station] {
        guard let url = URL(string: Constant.stationListUrl) else {
            throw URLError(.badURL)
        }
        
        let stations = try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseDecodable(of: StationListModel.self) { response in
                switch response.result {
                case .success(let dataResponse):
                    continuation.resume(returning: dataResponse.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        
        return stations
    }
    
    func getStationDetail(id: String) async throws -> [DetailStation] {
        guard let url = URL(string: "\(Constant.stationDetailUrl)\(id)") else {
            throw URLError(.badURL)
        }
        
        let detailStation = try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseDecodable(of: StationDetailModel.self) { response in
                switch response.result {
                case .success(let dataResponse):
                    continuation.resume(returning: dataResponse.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        
        return detailStation
    }
    
    func getTrainDetail(id: String) async throws -> [TrainDetail] {
        guard let url = URL(string: "\(Constant.trainDetailUrl)\(id)") else {
            throw URLError(.badURL)
        }
        
        let trainDetail = try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseDecodable(of: TrainDetailModel.self) { response in
                switch response.result {
                case .success(let dataResponse):
                    continuation.resume(returning: dataResponse.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        
        return trainDetail
    }
}
