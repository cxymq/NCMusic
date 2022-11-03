//
//  NCHomepageModel.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/22.
//

import Foundation

// MARK: - NCHomepageModel
struct NCHomepageModel: Codable {
    var cursor: String?
    var blocks: [Block]?
    var hasMore: Bool?
    var blockUUIDs: JSONNull?
    var pageConfig: PageConfig?
    var guideToast: GuideToast?
    var internalTest: JSONNull?
    var titles: [JSONAny]?
    var blockCodeOrderList: JSONNull?
    var exposedResource: String?
    var demote: Bool?
}

// MARK: - Block
struct Block: Codable {
    var blockCode, showType: String?
    var dislikeShowType: Int?
    var extInfo: EXTInfoUnion?
    var canClose: Bool?
    var blockStyle: Int?
    var canFeedback: Bool?
    var action: String?
    var actionType: ActionType?
    var uiElement: BlockUIElement?
    var creatives: [Creative]?
    var alg, logInfo: String?
    var resourceIDList: [String]?

    enum CodingKeys: String, CodingKey {
        case blockCode, showType, dislikeShowType, extInfo, canClose, blockStyle, canFeedback, action, actionType, uiElement, creatives, alg, logInfo
        case resourceIDList = "resourceIdList"
    }
}

enum ActionType: String, Codable {
    case clientCustomized = "client_customized"
    case orpheus = "orpheus"
}

// MARK: - Creative
struct Creative: Codable {
    var creativeType: CreativeType?
    var creativeID, action: String?
    var actionType: ActionType?
    var uiElement: ResourceUIElement?
    var resources: [Resource]?
    var alg, logInfo: String?
    var position: Int?

    enum CodingKeys: String, CodingKey {
        case creativeType
        case creativeID = "creativeId"
        case action, actionType, uiElement, resources, alg, logInfo, position
    }
}

enum CreativeType: String, Codable {
    case list = "list"
    case scrollPlaylist = "scroll_playlist"
    case songListHomepage = "SONG_LIST_HOMEPAGE"
}

// MARK: - Resource
struct Resource: Codable {
    var uiElement: ResourceUIElement?
    var resourceType: ResourceType?
    var resourceState: JSONNull?
    var resourceID: String?
    var resourceURL: JSONNull?
    var resourceEXTInfo: ResourceEXTInfo?
    var action: String?
    var actionType: ActionType?
    var valid: Bool?
    var alg: String?
    var logInfo: String?
    var ctrp, resourceContentList: JSONNull?

    enum CodingKeys: String, CodingKey {
        case uiElement, resourceType, resourceState
        case resourceID = "resourceId"
        case resourceURL = "resourceUrl"
        case resourceEXTInfo = "resourceExtInfo"
        case action, actionType, valid, alg, logInfo, ctrp, resourceContentList
    }
}

// MARK: - ResourceEXTInfo
struct ResourceEXTInfo: Codable {
    var playCount: Int?
    var highQuality: Bool?
    var specialType: Int?
    var artists: [Artist]?
    var song: ResourceEXTInfoSong?
    var songData: SongData?
    var songPrivilege: SongPrivilege?
    var commentSimpleData: CommentSimpleData?
}

// MARK: - Artist
struct Artist: Codable {
    var name: String?
    var id, picID, img1V1ID: Int?
    var briefDesc: String?
    var picURL, img1V1URL: String?
    var albumSize: Int?
    var alias: [JSONAny]?
    var trans: String?
    var musicSize, topicPerson: Int?

    enum CodingKeys: String, CodingKey {
        case name, id
        case picID = "picId"
        case img1V1ID = "img1v1Id"
        case briefDesc
        case picURL = "picUrl"
        case img1V1URL = "img1v1Url"
        case albumSize, alias, trans, musicSize, topicPerson
    }
}

// MARK: - CommentSimpleData
struct CommentSimpleData: Codable {
    var content: String?
    var commentID: Int?
    var threadID: String?
    var userID: Int?
    var userName: String?

    enum CodingKeys: String, CodingKey {
        case content
        case commentID = "commentId"
        case threadID = "threadId"
        case userID = "userId"
        case userName
    }
}

// MARK: - ResourceEXTInfoSong
struct ResourceEXTInfoSong: Codable {
    var name: String?
    var id, pst, t: Int?
    var ar: [Ar]?
    var alia: [JSONAny]?
    var pop, st: Int?
    var rt: String?
    var fee, v: Int?
    var crbt: JSONNull?
    var cf: String?
    var al: Al?
    var dt: Int?
    var h, m, l: H?
    var sq, hr: H?
    var a: JSONNull?
    var cd: String?
    var no: Int?
    var rtURL: JSONNull?
    var ftype: Int?
    var rtUrls: [JSONAny]?
    var djID, copyright, sID, mark: Int?
    var originCoverType: Int?
    var originSongSimpleData, tagPicList: JSONNull?
    var resourceState: Bool?
    var version: Int?
    var songJumpInfo, entertainmentTags: JSONNull?
    var single: Int?
    var noCopyrightRcmd: JSONNull?
    var rtype: Int?
    var rurl: JSONNull?
    var mst, cp, mv, publishTime: Int?
    var videoInfo: VideoInfo?

    enum CodingKeys: String, CodingKey {
        case name, id, pst, t, ar, alia, pop, st, rt, fee, v, crbt, cf, al, dt, h, m, l, sq, hr, a, cd, no
        case rtURL = "rtUrl"
        case ftype, rtUrls
        case djID = "djId"
        case copyright
        case sID = "s_id"
        case mark, originCoverType, originSongSimpleData, tagPicList, resourceState, version, songJumpInfo, entertainmentTags, single, noCopyrightRcmd, rtype, rurl, mst, cp, mv, publishTime, videoInfo
    }
}

// MARK: - VideoInfo
struct VideoInfo: Codable {
    var moreThanOne: Bool?
    var video: Video?
}

// MARK: - Video
struct Video: Codable {
    var vid: String?
    var type: Int?
    var title: String?
    var playTime: Int?
    var coverURL: String?
    var publishTime: Int?
    var artists, alias: JSONNull?

    enum CodingKeys: String, CodingKey {
        case vid, type, title, playTime
        case coverURL = "coverUrl"
        case publishTime, artists, alias
    }
}

// MARK: - SongData
struct SongData: Codable {
    var name: String?
    var id, position: Int?
    var alias: [JSONAny]?
    var status, fee, copyrightID: Int?
    var disc: String?
    var no: Int?
    var artists: [Artist]?
    var album: Album?
    var starred: Bool?
    var popularity, score, starredNum, duration: Int?
    var playedNum, dayPlays, hearTime: Int?
    var sqMusic, hrMusic: Music?
    var ringtone: String?
    var crbt, audition: JSONNull?
    var copyFrom, commentThreadID: String?
    var rtURL: JSONNull?
    var ftype: Int?
    var rtUrls: [JSONAny]?
    var copyright: Int?
    var transName, sign: JSONNull?
    var mark, originCoverType: Int?
    var originSongSimpleData: JSONNull?
    var single: Int?
    var noCopyrightRcmd: JSONNull?
    var rtype: Int?
    var rurl, mp3URL: JSONNull?
    var hMusic, mMusic, lMusic, bMusic: Music?
    var mvid: Int?

    enum CodingKeys: String, CodingKey {
        case name, id, position, alias, status, fee
        case copyrightID = "copyrightId"
        case disc, no, artists, album, starred, popularity, score, starredNum, duration, playedNum, dayPlays, hearTime, sqMusic, hrMusic, ringtone, crbt, audition, copyFrom
        case commentThreadID = "commentThreadId"
        case rtURL = "rtUrl"
        case ftype, rtUrls, copyright, transName, sign, mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, rtype, rurl
        case mp3URL = "mp3Url"
        case hMusic, mMusic, lMusic, bMusic, mvid
    }
}

// MARK: - Album
struct Album: Codable {
    var name: String?
    var id: Int?
    var type: TypeEnum?
    var size: Int?
    var picID: Double?
    var blurPicURL: String?
    var companyID: Int?
    var pic: Double?
    var picURL: String?
    var publishTime: Int?
    var albumDescription, tags: String?
    var company: String?
    var briefDesc: String?
    var artist: Artist?
    var songs, alias: [JSONAny]?
    var status, copyrightID: Int?
    var commentThreadID: String?
    var artists: [Artist]?
    var subType: SubType?
    var transName: String?
    var onSale: Bool?
    var mark, gapless: Int?
    var picIDStr: String?
    var transNames: [String]?

    enum CodingKeys: String, CodingKey {
        case name, id, type, size
        case picID = "picId"
        case blurPicURL = "blurPicUrl"
        case companyID = "companyId"
        case pic
        case picURL = "picUrl"
        case publishTime
        case albumDescription = "description"
        case tags, company, briefDesc, artist, songs, alias, status
        case copyrightID = "copyrightId"
        case commentThreadID = "commentThreadId"
        case artists, subType, transName, onSale, mark, gapless
        case picIDStr = "picId_str"
        case transNames
    }
}

enum SubType: String, Codable {
    case remix = "Remix"
    case 录音室版 = "录音室版"
}

enum TypeEnum: String, Codable {
    case ep = "EP"
    case single = "Single"
    case 专辑 = "专辑"
}

// MARK: - Music
struct Music: Codable {
    var name: JSONNull?
    var id, size: Int?
    var musicExtension: Extension?
    var sr, dfsID, bitrate, playTime: Int?
    var volumeDelta: Int?

    enum CodingKeys: String, CodingKey {
        case name, id, size
        case musicExtension = "extension"
        case sr
        case dfsID = "dfsId"
        case bitrate, playTime, volumeDelta
    }
}

enum Extension: String, Codable {
    case flac = "flac"
    case mp3 = "mp3"
}

// MARK: - SongPrivilege
struct SongPrivilege: Codable {
    var id, fee, payed, realPayed: Int?
    var st, pl, dl, sp: Int?
    var cp, subp: Int?
    var cs: Bool?
    var maxbr, fl: Int?
    var pc: JSONNull?
    var toast: Bool?
    var flag: Int?
    var paidBigBang, preSell: Bool?
    var playMaxbr, downloadMaxbr: Int?
    var maxBrLevel, playMaxBrLevel, downloadMaxBrLevel: MaxBrLevel?
    var plLevel: LLevel?
    var dlLevel: DLLevel?
    var flLevel: LLevel?
    var rscl: JSONNull?
    var freeTrialPrivilege: FreeTrialPrivilege?
    var chargeInfoList: [ChargeInfoList]?
}

enum DLLevel: String, Codable {
    case hires = "hires"
    case none = "none"
}

enum MaxBrLevel: String, Codable {
    case exhigh = "exhigh"
    case hires = "hires"
    case lossless = "lossless"
}

enum LLevel: String, Codable {
    case exhigh = "exhigh"
    case none = "none"
    case standard = "standard"
}

enum ResourceType: String, Codable {
    case list = "list"
    case song = "song"
}

// MARK: - ResourceUIElement
struct ResourceUIElement: Codable {
    var mainTitle: Title?
    var image: Image?
    var labelTexts: [String]?
    var rcmdShowType: RcmdShowType?
    var subTitle: SubTitle?
}

// MARK: - Image
struct Image: Codable {
    var imageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }
}

// MARK: - Title
struct Title: Codable {
    var title: String?
}

enum RcmdShowType: String, Codable {
    case rcmdShowTypeDEFAULT = "DEFAULT"
}

// MARK: - SubTitle
struct SubTitle: Codable {
    var title, titleType: String?
}

enum EXTInfoUnion: Codable {
    case extInfoElementArray([EXTInfoElement])
    case purpleEXTInfo(PurpleEXTInfo)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([EXTInfoElement].self) {
            self = .extInfoElementArray(x)
            return
        }
        if let x = try? container.decode(PurpleEXTInfo.self) {
            self = .purpleEXTInfo(x)
            return
        }
        throw DecodingError.typeMismatch(EXTInfoUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EXTInfoUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .extInfoElementArray(let x):
            try container.encode(x)
        case .purpleEXTInfo(let x):
            try container.encode(x)
        }
    }
}

// MARK: - EXTInfoElement
struct EXTInfoElement: Codable {
    var liveID: Int?
    var title: String?
    var anchorID: Int?
    var coverID: Double?
    var cover: String?
    var liveURL: LiveURL?
    var playBackURL: JSONNull?
    var orientationScope, onlineNumber, liveStatus, startTime: Int?
    var endTime, roomID: Int?
    var channelID: JSONNull?
    var liveType, appKeyType, type, startStreamTag: Int?
    var agoraRoomNo: Int?
    var bgCoverURL: String?
    var backgroundAnimateURL: JSONNull?
    var rtcSupplierType, popularity: Int?
    var verticalCoverID: Double?
    var verticalCover: String?
    var userInfo: UserInfo?
    var recLiveDTO: RecLiveDTO?
    var coverTag, privateTag: String?
    var borderTag: JSONNull?
    var startStreamTagName: String?
    var tags: JSONNull?
    var dynamicCover: DynamicCover?
    var audioCoverIDS: [String]?
    var supplementParamToClient: SupplementParamToClient?
    var cloudMusicMyFollowRecInfo: CloudMusicMyFollowRecInfo?
    var adSpreadDto: JSONNull?

    enum CodingKeys: String, CodingKey {
        case liveID = "liveId"
        case title
        case anchorID = "anchorId"
        case coverID = "coverId"
        case cover
        case liveURL = "liveUrl"
        case playBackURL = "playBackUrl"
        case orientationScope, onlineNumber, liveStatus, startTime, endTime
        case roomID = "roomId"
        case channelID = "channelId"
        case liveType, appKeyType, type, startStreamTag, agoraRoomNo
        case bgCoverURL = "bgCoverUrl"
        case backgroundAnimateURL = "backgroundAnimateUrl"
        case rtcSupplierType, popularity
        case verticalCoverID = "verticalCoverId"
        case verticalCover, userInfo, recLiveDTO, coverTag, privateTag, borderTag, startStreamTagName, tags, dynamicCover
        case audioCoverIDS = "audioCoverIds"
        case supplementParamToClient, cloudMusicMyFollowRecInfo, adSpreadDto
    }
}

// MARK: - CloudMusicMyFollowRecInfo
struct CloudMusicMyFollowRecInfo: Codable {
}

// MARK: - DynamicCover
struct DynamicCover: Codable {
    var priorityLevel, type: Int?
    var playURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case priorityLevel, type
        case playURL = "playUrl"
    }
}

// MARK: - LiveURL
struct LiveURL: Codable {
    var httpPullURL: String?
    var hlsPullURL: String?
    var rtmpPullURL: String?

    enum CodingKeys: String, CodingKey {
        case httpPullURL = "httpPullUrl"
        case hlsPullURL = "hlsPullUrl"
        case rtmpPullURL = "rtmpPullUrl"
    }
}

// MARK: - RecLiveDTO
struct RecLiveDTO: Codable {
    var skipURL, typeDesc: String?
    var cardType: Int?
    var alg, anchorID: String?
    var liveRoomNo, songID, accompanimentID: Int?
    var supplemetParam: SupplemetParam?
    var ops: String?
    var recCoverID: Double?
    var recCover: String?
    var coverTag: String?
    var segID: Int?

    enum CodingKeys: String, CodingKey {
        case skipURL = "skipUrl"
        case typeDesc, cardType, alg
        case anchorID = "anchorId"
        case liveRoomNo
        case songID = "songId"
        case accompanimentID = "accompanimentId"
        case supplemetParam, ops
        case recCoverID = "recCoverId"
        case recCover, coverTag
        case segID = "segId"
    }
}

// MARK: - SupplemetParam
struct SupplemetParam: Codable {
    var hpModuletitle, coverID, liveOnlineNumber: String?

    enum CodingKeys: String, CodingKey {
        case hpModuletitle = "hp_moduletitle"
        case coverID, liveOnlineNumber
    }
}

// MARK: - SupplementParamToClient
struct SupplementParamToClient: Codable {
    var ops: String?
}

// MARK: - UserInfo
struct UserInfo: Codable {
    var userID: Int?
    var nickname: String?
    var avatarURL: String?
    var authStatus, userType: Int?
    var authName: JSONNull?
    var liveRoomNo, vipType, gender: Int?
    var artistName: JSONNull?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
        case avatarURL = "avatarUrl"
        case authStatus, userType, authName, liveRoomNo, vipType, gender, artistName
    }
}

// MARK: - PurpleEXTInfo
struct PurpleEXTInfo: Codable {
    var banners: [Banner]?
}

// MARK: - Banner
struct Banner: Codable {
    var adLocation, monitorImpress: JSONNull?
    var bannerID: String?
    var extMonitor, pid: JSONNull?
    var pic: String?
    var program, video, adurlV2, adDispatchJSON: JSONNull?
    var dynamicVideoData, monitorType, adid: JSONNull?
    var titleColor, requestID: String?
    var exclusive: Bool?
    var scm: String?
    var event: JSONNull?
    var alg, sCtrp: String?
    var song: BannerSong?
    var targetID: Int?
    var showAdTag: Bool?
    var adSource, showContext: JSONNull?
    var targetType: Int?
    var typeTitle: String?
    var url: String?
    var encodeID: String?
    var extMonitorInfo, monitorClick, monitorImpressList, logContext: JSONNull?
    var monitorBlackList, monitorClickList: JSONNull?

    enum CodingKeys: String, CodingKey {
        case adLocation, monitorImpress
        case bannerID = "bannerId"
        case extMonitor, pid, pic, program, video, adurlV2
        case adDispatchJSON = "adDispatchJson"
        case dynamicVideoData, monitorType, adid, titleColor
        case requestID = "requestId"
        case exclusive, scm, event, alg
        case sCtrp = "s_ctrp"
        case song
        case targetID = "targetId"
        case showAdTag, adSource, showContext, targetType, typeTitle, url
        case encodeID = "encodeId"
        case extMonitorInfo, monitorClick, monitorImpressList, logContext, monitorBlackList, monitorClickList
    }
}

// MARK: - BannerSong
struct BannerSong: Codable {
    var name: String?
    var id, pst, t: Int?
    var ar: [Ar]?
    var alia: [JSONAny]?
    var pop, st: Int?
    var rt: String?
    var fee, v: Int?
    var crbt: JSONNull?
    var cf: String?
    var al: Al?
    var dt: Int?
    var h, m, l: H?
    var sq, hr: H?
    var a: JSONNull?
    var cd: String?
    var no: Int?
    var rtURL: JSONNull?
    var ftype: Int?
    var rtUrls: [JSONAny]?
    var djID, copyright, sID, mark: Int?
    var originCoverType: Int?
    var originSongSimpleData, tagPicList: JSONNull?
    var resourceState: Bool?
    var version: Int?
    var songJumpInfo, entertainmentTags: JSONNull?
    var single: Int?
    var noCopyrightRcmd: JSONNull?
    var rtype: Int?
    var rurl: JSONNull?
    var mst, cp, mv, publishTime: Int?
    var videoInfo: VideoInfo?
    var alg: String?

    enum CodingKeys: String, CodingKey {
        case name, id, pst, t, ar, alia, pop, st, rt, fee, v, crbt, cf, al, dt, h, m, l, sq, hr, a, cd, no
        case rtURL = "rtUrl"
        case ftype, rtUrls
        case djID = "djId"
        case copyright
        case sID = "s_id"
        case mark, originCoverType, originSongSimpleData, tagPicList, resourceState, version, songJumpInfo, entertainmentTags, single, noCopyrightRcmd, rtype, rurl, mst, cp, mv, publishTime, videoInfo, alg
    }
}

// MARK: - BlockUIElement
struct BlockUIElement: Codable {
    var subTitle: Title?
    var button: Button?
    var rcmdShowType: RcmdShowType?
}

// MARK: - Button
struct Button: Codable {
    var action: String?
    var actionType: ActionType?
    var text: String?
    var iconURL, biData: JSONNull?

    enum CodingKeys: String, CodingKey {
        case action, actionType, text
        case iconURL = "iconUrl"
        case biData
    }
}

// MARK: - GuideToast
struct GuideToast: Codable {
    var hasGuideToast: Bool?
    var toastList: [JSONAny]?
}

// MARK: - PageConfig
struct PageConfig: Codable {
    var refreshToast, nodataToast: String?
    var refreshInterval: Int?
    var title: JSONNull?
    var fullscreen: Bool?
    var abtest, songLabelMarkPriority: [String]?
    var songLabelMarkLimit: Int?
    var homepageMode: String?
    var showModeEntry: Bool?
    var orderInfo: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
