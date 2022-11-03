//
//  NCBaseModel.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/30.
//

import Foundation
// MARK: - Al
struct Al: Codable {
    let id: Int
    let name: String
    let picUrl: String
    let tns: [String?]
    let picStr: String?
    let pic: Int
}

// MARK: - Ar
struct Ar: Codable {
    let id: Int
    let name: String
    let tns, alias: [String?]
}

// MARK: - H
struct H: Codable {
    let br, fid, size, vd: Int
    let sr: Int
}

// MARK: - Privilege
struct Privilege: Codable {
    let id, fee, payed, st: Int
    let pl, dl, sp, cp: Int
    let subp: Int
    let cs: Bool
    let maxbr, fl: Int
    let toast: Bool
    let flag: Int
    let preSell: Bool
    let playMaxbr, downloadMaxbr: Int
    let maxBrLevel, playMaxBrLevel, downloadMaxBrLevel, plLevel: String
    let dlLevel, flLevel: String
    let rscl: String?
    let freeTrialPrivilege: FreeTrialPrivilege
    let chargeInfoList: [ChargeInfoList]
}

// MARK: - ChargeInfoList
struct ChargeInfoList: Codable {
    let rate: Int
    let chargeUrl, chargeMessage: String?
    let chargeType: Int
}

// MARK: - FreeTrialPrivilege
struct FreeTrialPrivilege: Codable {
    let resConsumable, userConsumable: Bool
    let listenType: Int
}
