//
//  StationDetailView.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationDetailView: View {
    @StateObject private var stationDetailVM = StationDetailVM()
    @State private var selectedTime = -1
    
    let id: String
    
    var detailSearchResult: [DetailStation] {
        guard !(selectedTime == -1) else {
            return stationDetailVM.detailStations
        }
        return stationDetailVM.detailStations.filter { detail in
            detail.timeEstimated.prefix(2) == (selectedTime < 10 ? "0\(String(selectedTime))" : String(selectedTime))
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Select Departure Time")
                        .fontWeight(.bold)
                    Picker("Select Time", selection: $selectedTime) {
                        ForEach(Array(-1...23), id:\.self) { time in
                            if time == -1 {
                                Text("All time")
                            } else {
                                Text(time < 10 ? "0\(String(time)):00 WIB" : "\(String(time)):00 WIB")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .tag(time)
                            }
                            
                        }
                    }
                    .tint(.primary)
                }
                .pickerStyle(.automatic)

                
                List {
                    if stationDetailVM.isLoading {
                        WaitingView()
                    } else {
                        Group {
                            ForEach(detailSearchResult.indices, id: \.self) { index in
                                let detail = detailSearchResult[index]
                                
                                NavigationLink(destination: TrainDetailView(id: detail.trainID)) {
                                    if stationDetailVM.isLoading {
                                        StationDetailComponent(detailStation: detail)
                                            .redacted(reason: .placeholder)
                                    } else {
                                        StationDetailComponent(detailStation: detail)  
                                    }
                                }
                                .padding(.vertical, 16)
                                .padding(.horizontal, 12)
                                .background(index % 2 == 0 ? Color.card1 : Color.card2)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .overlay {
                    if detailSearchResult.isEmpty, !stationDetailVM.isLoading {
                        ContentUnavailableView.search(text: "\(String(selectedTime)):00 WIB")
                    }
                }
            }
            .task {
                await stationDetailVM.getStationDetail(id: id)
            }
            .navigationTitle("Station Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StationDetailView(id: "BJD")
}
