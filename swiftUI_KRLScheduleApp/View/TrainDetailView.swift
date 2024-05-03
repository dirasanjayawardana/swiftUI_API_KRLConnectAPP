//
//  TrainDetailView.swift
//  KRLConnect
//
//  Created by MACBOOK PRO on 03/05/24.
//

import SwiftUI

struct TrainDetailView: View {
    @StateObject private var trainDetailVM = TrainDetailVM()
    
    let id: String
    
    var body: some View {
        NavigationStack {
            List {
                if trainDetailVM.isLoading {
                    WaitingView()
                } else {
                    VStack {
                        ForEach(trainDetailVM.trainDetail) { train in
                            TrainDetailComponent(trainDetail: train)
                        }
                        .padding()
                    }
                    .background(Color.card1)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Train Detail")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await trainDetailVM.getTrainDetail(id: id)
            }
        }
    }
}

#Preview {
    TrainDetailView(id: "1485B")
}
