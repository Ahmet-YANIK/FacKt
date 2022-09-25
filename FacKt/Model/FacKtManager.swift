//
//  FacKtManager.swift
//  FacKt
//
//  Created by ahmet on 10.04.22.
//

import Foundation
import UIKit
protocol FacktManagerDelegate {
    func didUpdateFact (_ fact: ReturnedData)
    func didUpdateTodayFact (_ fact: ReturnedData)
    func alarm (_ laguage: String)
}

struct FacKtManager {
    
    var delegate: FacktManagerDelegate?
    
    func getFact(_ language: String,_ type: String) {
        let urlString = "https://uselessfacts.jsph.pl/\(type).json?language=\(language)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if (error != nil){
                    print(error!)
                    self.delegate?.alarm(language)
                    return
                }
                if let safeData = data {
                    if   let fact = self.parseJSON(safeData){
                        switch type {
                        case "random": self.delegate?.didUpdateFact(fact)
                        case "today":  self.delegate?.didUpdateTodayFact(fact)
                        default: print("Didnt Update")
                        }

                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ factData: Data)  -> ReturnedData? {
        let decoder = JSONDecoder()
        do {
             let decodedData = try decoder.decode(FactData.self, from: factData)
             let text = decodedData.text
             let source = decodedData.source
             let fact = ReturnedData(factText: text, factSource: source)
            return fact
            
        } catch{
            return nil
        }
        }
}
