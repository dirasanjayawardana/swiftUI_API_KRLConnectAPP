//
//  TrainDetailView.swift
//  KRLConnect
//
//  Created by MACBOOK PRO on 03/05/24.
//

import SwiftUI

struct TrainDetailComponent: View {
    let trainDetail: TrainDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(.train)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(trainDetail.line.capitalized)
                    .font(.title3)
                    .fontWeight(.bold)
                
                
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "map.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Route : \(trainDetail.route.capitalized)")
                            .lineLimit(1, reservesSpace: true)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Destination : \(trainDetail.destination.capitalized)")
                            .lineLimit(1, reservesSpace: true)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    Text("\(trainDetail.timeEstimated.prefix(5)) WIB")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.blue1)
                    //Text("-")
                    Text("\(trainDetail.destinationTime.prefix(5)) WIB")                        .fontWeight(.bold)
                        .foregroundStyle(.green1)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    TrainDetailComponent(trainDetail: TrainDetail.dummyData[0])
        .padding()
}
