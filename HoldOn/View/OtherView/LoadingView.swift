//
//  LoadingView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 28.12.23.
//

import SwiftUI

struct LoadingView: View {
    
    var barWidth: CGFloat = 200
    var barHeight: CGFloat = 8
    
var markerWidth: CGFloat {
    barWidth / 2
}
    
    @State var onLeftSide = false
    
    var markerOffset: CGFloat {
        barWidth * 0.65
    }
    
    var body: some View {
        ZStack {
            Color("Main")
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Loading...")
                    .foregroundStyle(Color("TextColor"))
                    .font(.subheadline)
                
                ZStack {
                    RoundedRectangle(cornerRadius: .infinity)
                    RoundedRectangle(cornerRadius: .infinity)
                        .foregroundStyle(Color("MinorColor"))
                        .frame(width: markerWidth)
                        .offset(x: onLeftSide ? markerOffset : -markerOffset)
                }
                .frame(width: barWidth, height: barHeight)
                .clipShape(RoundedRectangle(cornerRadius: .infinity))
                .animation(.easeInOut(duration: 0.8).repeatForever(), value: onLeftSide)
                .onTapGesture {
                    onLeftSide.toggle()
                }
                .onAppear {
                    onLeftSide = true
                }
            }
            .foregroundStyle(Color("TextColor"))
        }
    }
}

#Preview {
    LoadingView()
}
