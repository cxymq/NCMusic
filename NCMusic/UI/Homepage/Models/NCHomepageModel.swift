// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nCHomepageModel = try? newJSONDecoder().decode(NCHomepageModel.self, from: jsonData)

import Foundation

// MARK: - NCHomepageModel
struct NCHomepageModel: Codable {
    let cursor: String?
    let blocks: [Block]?
    let hasMore: Bool?
    let blockUUIDs: JSONNull?
    let pageConfig: PageConfig?
    let guideToast: GuideToast?
    let internalTest: JSONNull?
    let titles: [JSONAny]?
    let blockCodeOrderList: JSONNull?
    let exposedResource: String?
    let demote: Bool?
}

// MARK: - Block
struct Block: Codable {
    let blockCode, showType: String?
    let dislikeShowType: Int?
    let extInfo: EXTInfoUnion?
    let canClose: Bool?
    let blockStyle: Int?
    let canFeedback, blockDemote: Bool?
    let action: String?
    let actionType: ActionType?
    let uiElement: BlockUIElement?
    let creatives: [Creative]?
    let resourceIDList: [String]?
    let alg, logInfo: String?

    enum CodingKeys: String, CodingKey {
        case blockCode, showType, dislikeShowType, extInfo, canClose, blockStyle, canFeedback, blockDemote, action, actionType, uiElement, creatives
        case resourceIDList = "resourceIdList"
        case alg, logInfo
    }
}

enum ActionType: String, Codable {
    case clientCustomized = "client_customized"
    case orpheus = "orpheus"
}

// MARK: - Creative
struct Creative: Codable {
    let creativeType: CreativeType?
    let creativeID, action: String?
    let actionType: ActionType?
    let uiElement: ResourceUIElement?
    let resources: [Resource]?
    let alg, logInfo: String?
    let position: Int?

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
    let uiElement: ResourceUIElement?
    let resourceType: ResourceType?
    let resourceState: JSONNull?
    let resourceID: String?
    let resourceURL: JSONNull?
    let resourceEXTInfo: ResourceEXTInfo?
    let action: String?
    let actionType: ActionType?
    let valid: Bool?
    let alg: String?
    let logInfo: String?
    let ctrp, likedCount, replyCount, resourceContentList: JSONNull?
    let position, playParams: JSONNull?

    enum CodingKeys: String, CodingKey {
        case uiElement, resourceType, resourceState
        case resourceID = "resourceId"
        case resourceURL = "resourceUrl"
        case resourceEXTInfo = "resourceExtInfo"
        case action, actionType, valid, alg, logInfo, ctrp, likedCount, replyCount, resourceContentList, position, playParams
    }
}

// MARK: - ResourceEXTInfo
struct ResourceEXTInfo: Codable {
    let playCount: Int?
    let highQuality: Bool?
    let specialType: Int?
    let artists: [Artist]?
    let song: ResourceEXTInfoSong?
    let songData: SongData?
    let songPrivilege: SongPrivilege?
    let commentSimpleData: CommentSimpleData?
}

// MARK: - Artist
struct Artist: Codable {
    let name: String?
    let id, picID, img1V1ID: Int?
    let briefDesc: String?
    let picURL, img1V1URL: String?
    let albumSize: Int?
    let alias: [JSONAny]?
    let trans: String?
    let musicSize, topicPerson: Int?

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
    let content: String?
    let commentID: Int?
    let threadID: String?
    let userID: Int?
    let userName: String?

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
    let name: String?
    let id, pst, t: Int?
    let ar: [Ar]?
    let alia: [JSONAny]?
    let pop, st: Int?
    let rt: Rt?
    let fee, v: Int?
    let crbt: JSONNull?
    let cf: String?
    let al: Al?
    let dt: Int?
    let h: L?
    let m, l: L?
    let sq, hr: L?
    let a: JSONNull?
    let cd: String?
    let no: Int?
    let rtURL: JSONNull?
    let ftype: Int?
    let rtUrls: [JSONAny]?
    let djID, copyright, sID, mark: Int?
    let originCoverType: Int?
    let originSongSimpleData, tagPicList: JSONNull?
    let resourceState: Bool?
    let version: Int?
    let songJumpInfo, entertainmentTags: JSONNull?
    let single: Int?
    let noCopyrightRcmd: JSONNull?
    let rtype: Int?
    let rurl: JSONNull?
    let mst, cp, mv, publishTime: Int?
    let videoInfo: VideoInfo?

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

// MARK: - L
struct L: Codable {
    let br, fid, size, vd: Int?
    let sr: Int?
}

enum Rt: String, Codable {
    case empty = ""
    case the600902000008749538 = "600902000008749538"
}

// MARK: - VideoInfo
struct VideoInfo: Codable {
    let moreThanOne: Bool?
    let video: Video?
}

// MARK: - Video
struct Video: Codable {
    let vid: String?
    let type: Int?
    let title: String?
    let playTime: Int?
    let coverURL: String?
    let publishTime: Int?
    let artists, alias: JSONNull?

    enum CodingKeys: String, CodingKey {
        case vid, type, title, playTime
        case coverURL = "coverUrl"
        case publishTime, artists, alias
    }
}

// MARK: - SongData
struct SongData: Codable {
    let name: String?
    let id, position: Int?
    let alias: [JSONAny]?
    let status, fee, copyrightID: Int?
    let disc: String?
    let no: Int?
    let artists: [Artist]?
    let album: Album?
    let starred: Bool?
    let popularity, score, starredNum, duration: Int?
    let playedNum, dayPlays, hearTime: Int?
    let sqMusic, hrMusic: Music?
    let ringtone: Rt?
    let crbt, audition: JSONNull?
    let copyFrom, commentThreadID: String?
    let rtURL: JSONNull?
    let ftype: Int?
    let rtUrls: [JSONAny]?
    let copyright: Int?
    let transName, sign: JSONNull?
    let mark, originCoverType: Int?
    let originSongSimpleData: JSONNull?
    let single: Int?
    let noCopyrightRcmd: JSONNull?
    let bMusic: Music?
    let mp3URL: JSONNull?
    let rtype: Int?
    let rurl: JSONNull?
    let mvid: Int?
    let hMusic: Music?
    let mMusic, lMusic: Music?

    enum CodingKeys: String, CodingKey {
        case name, id, position, alias, status, fee
        case copyrightID = "copyrightId"
        case disc, no, artists, album, starred, popularity, score, starredNum, duration, playedNum, dayPlays, hearTime, sqMusic, hrMusic, ringtone, crbt, audition, copyFrom
        case commentThreadID = "commentThreadId"
        case rtURL = "rtUrl"
        case ftype, rtUrls, copyright, transName, sign, mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, bMusic
        case mp3URL = "mp3Url"
        case rtype, rurl, mvid, hMusic, mMusic, lMusic
    }
}

// MARK: - Album
struct Album: Codable {
    let name: String?
    let id: Int?
    let type: TypeEnum?
    let size: Int?
    let picID: Double?
    let blurPicURL: String?
    let companyID: Int?
    let pic: Double?
    let picURL: String?
    let publishTime: Int?
    let albumDescription, tags: String?
    let company: String?
    let briefDesc: String?
    let artist: Artist?
    let songs, alias: [JSONAny]?
    let status, copyrightID: Int?
    let commentThreadID: String?
    let artists: [Artist]?
    let subType: SubType?
    let transName: JSONNull?
    let onSale: Bool?
    let mark, gapless: Int?
    let picIDStr: String?

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
    }
}

enum SubType: String, Codable {
    case remix = "Remix"
    case 录音室版 = "录音室版"
}

enum TypeEnum: String, Codable {
    case single = "Single"
    case 专辑 = "专辑"
}

// MARK: - Music
struct Music: Codable {
    let name: JSONNull?
    let id, size: Int?
    let musicExtension: Extension?
    let sr, dfsID, bitrate, playTime: Int?
    let volumeDelta: Int?

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
    let id, fee, payed, realPayed: Int?
    let st, pl, dl, sp: Int?
    let cp, subp: Int?
    let cs: Bool?
    let maxbr, fl: Int?
    let pc: JSONNull?
    let toast: Bool?
    let flag: Int?
    let paidBigBang, preSell: Bool?
    let playMaxbr, downloadMaxbr: Int?
    let maxBrLevel, playMaxBrLevel, downloadMaxBrLevel: MaxBrLevel?
    let plLevel: LLevel?
    let dlLevel: DLLevel?
    let flLevel: LLevel?
    let rscl: JSONNull?
    let freeTrialPrivilege: FreeTrialPrivilege?
    let chargeInfoList: [ChargeInfoList]?
}

enum DLLevel: String, Codable {
    case hires = "hires"
    case lossless = "lossless"
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
    let mainTitle: Title?
    let image: Image?
    let labelTexts: [String]?
    let rcmdShowType: RcmdShowType?
    let subTitle: SubTitle?
}

// MARK: - Image
struct Image: Codable {
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }
}

// MARK: - Title
struct Title: Codable {
    let title: String?
}

enum RcmdShowType: String, Codable {
    case rcmdShowTypeDEFAULT = "DEFAULT"
}

// MARK: - SubTitle
struct SubTitle: Codable {
    let title, titleID, titleType: String?

    enum CodingKeys: String, CodingKey {
        case title
        case titleID = "titleId"
        case titleType
    }
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
    let liveID: Int?
    let title: String?
    let anchorID: Int?
    let coverID: Double?
    let cover: String?
    let liveURL: LiveURL?
    let playBackURL: JSONNull?
    let orientationScope, onlineNumber, liveStatus, startTime: Int?
    let endTime, roomID: Int?
    let channelID: JSONNull?
    let liveType, appKeyType, type, startStreamTag: Int?
    let agoraRoomNo: Int?
    let bgCoverURL: String?
    let backgroundAnimateURL: JSONNull?
    let rtcSupplierType, popularity: Int?
    let verticalCoverID: Double?
    let verticalCover: String?
    let userInfo: UserInfo?
    let recLiveDTO: RecLiveDTO?
    let coverTag: String?
    let privateTag: String?
    let borderTag: JSONNull?
    let startStreamTagName: String?
    let tags: JSONNull?
    let dynamicCover: DynamicCover?
    let audioCoverIDS: [String]?
    let supplementParamToClient: SupplementParamToClient?
    let cloudMusicMyFollowRecInfo: CloudMusicMyFollowRecInfo?
    let adSpreadDto, payChatRecommendSimpleDto: JSONNull?

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
        case supplementParamToClient, cloudMusicMyFollowRecInfo, adSpreadDto, payChatRecommendSimpleDto
    }
}

// MARK: - CloudMusicMyFollowRecInfo
struct CloudMusicMyFollowRecInfo: Codable {
}

// MARK: - DynamicCover
struct DynamicCover: Codable {
    let priorityLevel, type: Int?
    let playURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case priorityLevel, type
        case playURL = "playUrl"
    }
}

// MARK: - LiveURL
struct LiveURL: Codable {
    let httpPullURL: String?
    let hlsPullURL: String?
    let rtmpPullURL: String?

    enum CodingKeys: String, CodingKey {
        case httpPullURL = "httpPullUrl"
        case hlsPullURL = "hlsPullUrl"
        case rtmpPullURL = "rtmpPullUrl"
    }
}

// MARK: - RecLiveDTO
struct RecLiveDTO: Codable {
    let skipURL, typeDesc: String?
    let cardType: Int?
    let alg: String?
    let anchorID: String?
    let liveRoomNo: Int?
    let songID, accompanimentID: Int?
    let supplemetParam: SupplemetParam?
    let ops: String?
    let recCoverID: Double?
    let recCover: String?
    let coverTag: String?
    let segID: Int?

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
    let hpModuletitle, coverID, liveOnlineNumber: String?

    enum CodingKeys: String, CodingKey {
        case hpModuletitle = "hp_moduletitle"
        case coverID, liveOnlineNumber
    }
}

// MARK: - SupplementParamToClient
struct SupplementParamToClient: Codable {
    let ops: String?
}

// MARK: - UserInfo
struct UserInfo: Codable {
    let userID: Int?
    let nickname: String?
    let avatarURL: String?
    let authStatus, userType: Int?
    let authName: JSONNull?
    let liveRoomNo, vipType, gender: Int?
    let artistName: JSONNull?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
        case avatarURL = "avatarUrl"
        case authStatus, userType, authName, liveRoomNo, vipType, gender, artistName
    }
}

// MARK: - PurpleEXTInfo
struct PurpleEXTInfo: Codable {
    let banners: [Banner]?
}

// MARK: - Banner
struct Banner: Codable {
    let adLocation, monitorImpress: JSONNull?
    let bannerID: String?
    let extMonitor, pid: JSONNull?
    let pic: String?
    let program, video, adurlV2, adDispatchJSON: JSONNull?
    let dynamicVideoData, monitorType, adid: JSONNull?
    let titleColor, requestID: String?
    let exclusive: Bool?
    let bannerBizType, scm: String?
    let event: JSONNull?
    let alg, sCtrp: String?
    let song: BannerSong?
    let targetID: Int?
    let showAdTag: Bool?
    let adSource, showContext: JSONNull?
    let targetType: Int?
    let typeTitle: String?
    let url: String?
    let encodeID: String?
    let extMonitorInfo, monitorClick, monitorImpressList, logContext: JSONNull?
    let monitorBlackList, monitorClickList: JSONNull?

    enum CodingKeys: String, CodingKey {
        case adLocation, monitorImpress
        case bannerID = "bannerId"
        case extMonitor, pid, pic, program, video, adurlV2
        case adDispatchJSON = "adDispatchJson"
        case dynamicVideoData, monitorType, adid, titleColor
        case requestID = "requestId"
        case exclusive, bannerBizType, scm, event, alg
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
    let name: String?
    let id, pst, t: Int?
    let ar: [Ar]?
    let alia: [String]?
    let pop, st: Int?
    let rt: String?
    let fee, v: Int?
    let crbt: JSONNull?
    let cf: String?
    let al: Al?
    let dt: Int?
    let h, m, l, sq: L?
    let hr: L?
    let a: JSONNull?
    let cd: String?
    let no: Int?
    let rtURL: JSONNull?
    let ftype: Int?
    let rtUrls: [JSONAny]?
    let djID, copyright, sID, mark: Int?
    let originCoverType: Int?
    let originSongSimpleData, tagPicList: JSONNull?
    let resourceState: Bool?
    let version: Int?
    let songJumpInfo, entertainmentTags: JSONNull?
    let single: Int?
    let noCopyrightRcmd: JSONNull?
    let rtype: Int?
    let rurl: JSONNull?
    let mst, cp, mv, publishTime: Int?
    let videoInfo: VideoInfo?
    let alg: String?

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
    let subTitle: Title?
    let button: Button?
    let rcmdShowType: RcmdShowType?
}

// MARK: - Button
struct Button: Codable {
    let action: String?
    let actionType: ActionType?
    let text: String?
    let iconURL, biData: JSONNull?

    enum CodingKeys: String, CodingKey {
        case action, actionType, text
        case iconURL = "iconUrl"
        case biData
    }
}

// MARK: - GuideToast
struct GuideToast: Codable {
    let hasGuideToast: Bool?
    let toastList: [JSONAny]?
}

// MARK: - PageConfig
struct PageConfig: Codable {
    let refreshToast, nodataToast: String?
    let refreshInterval: Int?
    let title: JSONNull?
    let fullscreen: Bool?
    let abtest, songLabelMarkPriority: [String]?
    let songLabelMarkLimit: Int?
    let homepageMode: String?
    let showModeEntry: Bool?
    let orderInfo: String?
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

