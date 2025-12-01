//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Naushad Ali Khan on 01/12/25.
//

import SwiftUI

//struct CoinRowView: View {
//    let coin: CoinModel
//    var showHoldingsColumn: Bool = true
//    
//    var body: some View {
//        GeometryReader { geo in
//            HStack(spacing: 0) {
//                
//                Text("\(coin.rank)")
//                    .font(.caption)
//                    .foregroundColor(Color.theme.secondaryText)
//                    .frame(minWidth: 30)
//                
//                Circle()
//                    .frame(width: 30, height: 30)
//                
//                Text(coin.symbol.uppercased())
//                    .font(.headline)
//                    .padding(.leading, 6)
//                    .foregroundColor(Color.theme.accent)
//                
//                Spacer()
//                
//                if showHoldingsColumn {
//                    VStack(alignment: .trailing) {
//                        Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
//                            .bold()
//                        Text((coin.currentHoldings ?? 0).asNumberString())
//                    }
//                    .foregroundColor(Color.theme.accent)
//                }
//                
//                VStack(alignment: .trailing) {
//                    Text(coin.currentPrice.asCurrencyWith6Decimals())
//                        .bold()
//                        .foregroundColor(Color.theme.accent)
//                    
//                    Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
//                        .foregroundColor(
//                            (coin.priceChangePercentage24H ?? 0) >= 0 ?
//                            Color.theme.green :
//                            Color.theme.red
//                        )
//                }
//                .frame(width: geo.size.width / 3, alignment: .trailing)
//            }
//        }
//        .frame(height: 55)
//    }
//}

// MARK: - Preview


import SwiftUI

struct CoinRowView: View {

    let coin: CoinModel
    let showHoldingsColumn: Bool

    var body: some View {
        HStack(spacing: 0) {

            leftColumn

            Spacer()

            if showHoldingsColumn {
                centerColumn
            }

            rightColumn
        }
        .padding(.vertical, 4)
    }
}

// Simple #Preview - Light
#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
        .previewLayout(.sizeThatFits)
        .padding()
}



extension CoinRowView {

    // LEFT COLUMN
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)

            Circle()
                .frame(width: 30, height: 30)

            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }


    // CENTER COLUMN (Holdings)
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()

            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }


    // RIGHT COLUMN (Price + 24h change)
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)

            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing) // keep your old style
    }
}
