//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Naushad Ali Khan on 01/12/25.
//


import SwiftUI



struct HomeView: View {
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                homeheader
                Spacer(minLength: 0)

            }
        }
    }
}


// Preview
#Preview {
    NavigationStack {
        HomeView()
    }
}

extension HomeView{
    private var homeheader:some View{
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus": "info")
                .animation(.none, value: showPortfolio)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(
                    Angle(degrees: showPortfolio ? 180 : 0)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
