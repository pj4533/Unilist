import Foundation

struct Token : Codable {
    let name : String
    let symbol : String
    let id : String
    let derivedETH : String
    
    func usdMarketPrice(withEtherPrice etherPrice: Double) -> Double {
        return (Double(self.derivedETH) ?? 0) * etherPrice
    }
    
    func usdMarketPriceString(withEtherPrice etherPrice: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        return currencyFormatter.string(from: NSNumber(value: self.usdMarketPrice(withEtherPrice: etherPrice))) ?? "???"
    }
}
