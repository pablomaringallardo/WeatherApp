//
//  TodayTimeView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 5/3/24.
//

import SwiftUI

struct TodayTimeView: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 343, height: 217)
            .foregroundStyle(color.opacity(0.3))
            .overlay {
                VStack {
                    HStack {
                        Text("Today")
                            .padding(.leading)
                        Spacer()
                        Text("Mar, 9")
                            .padding(.trailing)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    
                }
            }
    }
}
    #Preview {
        TodayTimeView(color: Color.bgTextNight)
    }
