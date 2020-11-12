//
//  BidOrBuyAPIClient.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation

class BidOrBuyAPIClient {
    typealias TradeSearchCompletionHandler = (TradeSearch?, Error?) -> Void
    
    private let apiKey = "kfpP9jzHLmoTqRBtzGvxkYYF2GzfWfWhtgHGZVpB"
    private let decoder = JSONDecoder()
    private let session: URLSession
    
    private enum SuffixURL: String {
        case tradeSearch = "tradesearch"
    }
    
    private func baseUrl(_ suffixURL: SuffixURL, _ queryParam: String) -> URL {
        return URL(string: "https://demo.bidorbuy.co.za/services/v3/\(suffixURL.rawValue)?IncludedKeywords=\(queryParam)")!
    }
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    private func getBaseRequest<T: Codable>(_ queryParam: String,
                                            suffixURL: SuffixURL,
                                            completionHandler completion:  @escaping (_ object: T?,_ error: Error?) -> ()) {
        
        let url = baseUrl(suffixURL, queryParam)
        var request = URLRequest(url: url)
        request.setValue("kfpP9jzHLmoTqRBtzGvxkYYF2GzfWfWhtgHGZVpB", forHTTPHeaderField: "X-BOB-AUTHID")
        request.timeoutInterval = 20

        print("URL - \(url)")
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, ResponseError.requestFailed)
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            let response = try self.decoder.decode(T.self, from: data)
                            completion(response, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, ResponseError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    public func getTradeDetails(searchText: String, completionHandler completion: @escaping TradeSearchCompletionHandler) {
        getBaseRequest(searchText, suffixURL: .tradeSearch) { (result: TradeSearch?, error) in
            completion(result, error)
        }
    }
}
