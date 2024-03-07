//
//  DropDownCustom.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 4/3/24.
//

import SwiftUI

struct DropDownCustom: View {
    let prompt: String
    let options: [Capital]
    var isDay: Bool
    
    @State private var isExpanded = false
    @Binding var selection: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location.circle")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    if !selection.isEmpty {
                        Text(selection)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    } else {
                        Text(prompt)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .frame(height: 40)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation { isExpanded.toggle() }
                }
                
                if isExpanded {
                    ScrollView {
                        VStack(alignment: .leading){
                            ForEach(options, id: \.self) { option in
                                HStack {
                                    Text(option.name)
                                        .foregroundStyle(selection == option.name ? (isDay ? Color.bgTextDay : Color.white) : .white)
                                        .padding(.horizontal)
                                    
                                    if selection == option.name {
                                        Image(systemName: "checkmark")
                                            .font(.subheadline)
                                            .foregroundStyle(isDay ? Color.bgTextDay : Color.white)
                                    }
                                    
                                }
                                .frame(height: 40)
                                .padding(.horizontal)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selection = option.name
                                        isExpanded.toggle()
                                    }
                                }
                                
                            }
                        }
                    }
                    .frame(maxHeight: 250)
                    .transition(.move(edge: .bottom))
                    .scrollIndicators(.never)
                }
            }
            .background(isDay ? Color.bgTextDay.opacity(0.3) : Color.bgTextNight.opacity(0.3))
            
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
            
        }
    }
}



#Preview {
    
    ZStack {
        Color.black
        DropDownCustom(prompt: "Seleccione un tipo", options: capitals, isDay: true, selection: .constant(""))
    }
}
