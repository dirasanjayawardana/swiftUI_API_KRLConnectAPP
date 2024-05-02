//
//  StationDetailView.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationDetailView: View {
    @StateObject private var stationDetailVM = StationDetailVM()
    let id: String
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(stationDetailVM.detailStations.indices, id: \.self) { index in
                        let detail = stationDetailVM.detailStations[index]
                        StationDetailComponent(detailStation: detail)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 16)
                            .background(index % 2 == 0 ? Color.card1 : Color.card2)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .listStyle(.plain)
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
