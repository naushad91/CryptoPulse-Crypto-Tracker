//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Naushad Ali Khan on 01/12/25.
//


import SwiftUI



struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
                     VStack {
                         homeheader
                         columnTitles
                         if !showPortfolio {
                             allCoinsList
                                 .transition(.move(edge: .leading))
                         }
                         
                         if showPortfolio {
                             portfolioCoinsList
                                 .transition(.move(edge: .trailing))
                         }
                         
                         Spacer(minLength: 0)
                     }
        }
    }
}

// Preview
#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(HomeViewModel())   // 🔥 add this
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
    
    // MARK: - All Coins List
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(
                    coin: coin,
                    showHoldingsColumn: false
                )
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }


    // MARK: - Portfolio Coins List
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(
                    coin: coin,
                    showHoldingsColumn: true
                )
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }

    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            
            Spacer()
            
            if showPortfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(
                    width: UIScreen.main.bounds.width / 3.5,
                    alignment: .trailing
                )
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }

    
    
    
    
}
