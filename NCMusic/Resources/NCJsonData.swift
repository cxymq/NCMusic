//
//  NCJsonData.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation

func loadJson(filename fileName: String) -> Data {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("error:\(error)")
        }
    }
    return Data()
}
