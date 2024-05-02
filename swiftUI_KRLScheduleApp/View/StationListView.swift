//
//  ContentView.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationListView: View {
    @StateObject private var stationListVM = StationListVM()
    @State private var searchInput: String = ""
    
    var stationSearchResult: [Station] {
        guard !searchInput.isEmpty else {
            return stationListVM.stations
        }
        return stationListVM.stations.filter { station in
            station.name.lowercased().contains(searchInput.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if stationListVM.isLoading {
                    WaitingView()
                } else {
                    Group {
                        ForEach(stationSearchResult.indices, id: \.self) { index in
                            let station = stationSearchResult[index]
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
                }
                
            }
            .listStyle(.plain)
            .task {
                await stationListVM.getStationList()
            }
            .navigationTitle("KRLConnect")
            .searchable(
                text: $searchInput,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search stations"
            )
        }
    }
}

#Preview {
    StationListView()
}

@ViewBuilder
func WaitingView() -> some View {
    VStack(spacing: 20, content: {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.secondary)
        
        Text("loading...")
    })
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 600)
}
