import Foundation

class UniswapDataSource {
    func getTokens(entities: [TokenListEntity], withSuccess success: ((_ tokens: [Token]) -> Void)?, failure: ((_ error: Error?) -> Void)? ) {
        
        let parameters : [String:Any] = [
            "query" : "query($tokenIds: [String]!) {  tokens(where: { id_in: $tokenIds } ) { id name symbol derivedETH totalSupply totalLiquidity    }  }",
            "variables" : [
                "tokenIds" : entities.map({$0.address.lowercased()})
            ]
        ]
        
        let url = URL(string: "https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) 
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        struct TokensReponse : Codable {
            let tokens : [Token]?
        }
        struct GraphQLResponse : Codable {
            let data: TokensReponse?
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let graphQLResponse = try decoder.decode(GraphQLResponse.self, from: data)
                    
                    success?(graphQLResponse.data?.tokens ?? [])
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getTokenList(urlString: String, withSuccess success: ((_ tokens: [TokenListEntity]) -> Void)?, failure: ((_ error: Error?) -> Void)? ) {
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        struct TokenListResponse : Codable {
            let tokens: [TokenListEntity]?
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let tokenListResponse = try decoder.decode(TokenListResponse.self, from: data)
                    
                    success?(tokenListResponse.tokens ?? [])                    
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
