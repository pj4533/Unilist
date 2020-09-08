import Foundation
import ArgumentParser

struct Unilist: ParsableCommand {
    static let configuration = CommandConfiguration(
    	commandName: "unilist",
        abstract: "Uniswap List Info"
    )

    @Argument(help: "Uniswap list url")
    var url: String

	func run() {
        
        let cmcDataSource = CoinGeckoDataSource()
        cmcDataSource.getETHPrice(withSuccess: { (ethPrice) in
            let datasource = UniswapDataSource()
            datasource.getTokenList(urlString: self.url, withSuccess: { (entities) in
                datasource.getTokens(entities: entities, withSuccess: { (tokens) in
                    
                    var totalPrice : Double = 0
                    var numberWithPrice : Double = 0
                    
                    for token in tokens {
                        
                        print("\(token.name) (\(token.symbol)) \(token.usdMarketPriceString(withEtherPrice: ethPrice))")
                        
                        if (Double(token.derivedETH) ?? 0) > 0 {
                            numberWithPrice = numberWithPrice + 1
                            totalPrice = totalPrice + token.usdMarketPrice(withEtherPrice: ethPrice)
                        }
                    }
                    
                    let currencyFormatter = NumberFormatter()
                    currencyFormatter.usesGroupingSeparator = true
                    currencyFormatter.numberStyle = .currency
                    
                    print("\n\nIndex: \(currencyFormatter.string(from: NSNumber(value:totalPrice / numberWithPrice)) ?? "???")")

                }) { (error) in
                    print(error?.localizedDescription ?? "Unknown error")
                }
            }) { (error) in
                print(error?.localizedDescription ?? "Unknown error")
            }
        }) { (error) in
            print(error?.localizedDescription ?? "Unknown error")
        }
        
        
        // Run GCD main dispatcher, this function never returns, call exit() elsewhere to quit the program or it will hang
        dispatchMain()
    }
}

Unilist.main()
