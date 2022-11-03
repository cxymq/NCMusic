//
//  NCRecommendResModel.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation

struct NCRecommendResModel: Codable {
    let id, type: Int
    let name, copywriter: String
    let picURL: String
    let playcount, createTime: Int
    let creator: Creator
    let trackCount, userID: Int
    let alg: String
}

// MARK: - Creator
struct Creator: Codable {
    let remarkName: String
    let mutual: Bool
    let avatarImgIDStr, backgroundImgIDStr: String
    let avatarImgID, backgroundImgID: Int
    let detailDescription: String
    let defaultAvatar: Bool
    let expertTags: [String]
    let djStatus: Int
    let followed: Bool
    let backgroundURL: String
    let userID, accountStatus, vipType, province: Int
    let avatarURL: String
    let authStatus, userType: Int
    let nickname: String
    let gender, birthday, city: Int
    let creatorDescription, signature: String
    let authority: Int
}
