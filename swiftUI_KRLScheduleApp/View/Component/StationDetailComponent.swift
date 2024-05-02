//
//  StationDetailComponent.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationDetailComponent: View {
    let detailStation: DetailStation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(.train)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(detailStation.line.capitalized)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "map.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Route : \(detailStation.route.capitalized)")
                            .lineLimit(1, reservesSpace: true)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Destination : \(detailStation.destination.capitalized)")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    Text(detailStation.timeEstimated)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.blue1)
                    //Text("-")
                    Text(detailStation.destinationTime)                        .fontWeight(.bold)
                        .foregroundStyle(.green1)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    StationDetailComponent(detailStation: DetailStation.dummyData[0])
        .padding()
}
