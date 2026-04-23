//
//  BackgroundView.swift
//  confido
//
//  Created by Muhammad Alief Rahman Fardillah on 22/04/26.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("")
            .resizable()
            .scaledToFit()
            .frame(width: 1000, height: 400)
            .background(.lightBrown.opacity(0.8))
            .clipShape(.rect(bottomLeadingRadius: 800, bottomTrailingRadius: 800))
            .offset(y: -300)
            .shadow(radius: 20)
            .blur(radius: 2)
    }
}

#Preview {
    BackgroundView()
}
