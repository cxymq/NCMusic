//
//  NCRecommendSongsModel.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation

struct NCDailySongs: Codable {
    let dailySongs: [NCRecommendSongsModel]
}

struct NCRecommendSongsModel: Codable {
    let name: String
    let id, pst, t: Int
    let ar: [Ar]
    let alia: [String?]
    let pop, st: Int
    let rt: String?
    let fee, v: Int
    let crbt: String?
    let cf: String
    let al: Al
    let dt: Int
    let h, m, l: H
    var sq, hr: H?
    let a: String?
    var cd: String
    let no: Int
    let rtUrl: String?
    let ftype: Int
    let rtUrls: [String?]
    let djId, copyright, sId, mark: Int
    let originCoverType: Int
    let originSongSimpleData: OriginSongSimpleData?
    let tagPicList: String?
    let resourceState: Bool
    let version: Int
    let songJumpInfo, entertainmentTags: String?
    let single: Int
    let noCopyrightRcmd: String?
    let rtype: Int
    let rurl: String?
    let mst, cp, mv, publishTime: Int
    let reason: String
    let privilege: Privilege
    let alg: String
}

// MARK: - OriginSongSimpleData
struct OriginSongSimpleData: Codable {
    let songId: Int
    let name: String
    let artists: [AlbumMeta]
    let albumMeta: AlbumMeta
}

// MARK: - AlbumMeta
struct AlbumMeta: Codable {
    let id: Int
    let name: String
}
