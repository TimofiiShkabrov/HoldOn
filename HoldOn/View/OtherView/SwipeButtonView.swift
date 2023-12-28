//
//  SwipeButtonView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 28.12.23.
//

import SwiftUI

struct SwipeButtonView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: .infinity)
        }
        .frame(width: 200, height: 8)
        .foregroundStyle(Color("TextColor"))
        .opacity(0.5)
        .padding(8)
        .padding(.bottom, 16)
    }
}

#Preview {
    SwipeButtonView()
}
