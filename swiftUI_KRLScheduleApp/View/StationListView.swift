//
//  ContentView.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationListView: View {
    @StateObject private var stationListVM = StationListVM()
    @State private var searchInput = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(stationListVM.stations.indices, id: \.self) { index in
                    let station = stationListVM.stations[index]
                    NavigationLink(destination: StationDetailView(id: station.id)) {
                        if stationListVM.isLoading {
                            StationListComponent(station: station)
                                .redacted(reason: .placeholder)
                        } else {
                            StationListComponent(station: station)
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 26)
                    .background(index % 2 == 0 ? Color.card1 : Color.card2)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .listStyle(.plain)
            .task {
                await stationListVM.getStationList()
            }
            .navigationTitle("KRLConnect")
            .toolbar(content: {
                
            })
            // .searchable(
            //     text: $searchInput,
            //     placement: .navigationBarDrawer(displayMode: .always),
            //     prompt: "Search stations"
            // )
        }
    }
}

#Preview {
    StationListView()
}
