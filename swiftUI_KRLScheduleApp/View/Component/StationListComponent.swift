//
//  StationListComponent.swift
//  swiftUI_KRLScheduleApp
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct StationListComponent: View {
    var station: Station
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 12) {
                    Image(systemName: "house.and.flag.fill")
                        .font(.title2)
                        .foregroundStyle(.green1)
                    Text(station.name.capitalized)
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.blue1)
                }
                
                HStack(spacing: 12) {
                    Image(systemName: "calendar.badge.clock")
                        .font(.title2)
                        .foregroundStyle(.green1)
                        .padding(.leading, 2)
                    Text(DateUtility.formatDate(dateString: station.updatedAt))
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                }
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(.train)
                .resizable()
                .scaledToFit()
                .frame(height: 54)
        }
        
    }
}

#Preview {
    StationListComponent(station: Station.dummyData[0])
        .padding()
}
