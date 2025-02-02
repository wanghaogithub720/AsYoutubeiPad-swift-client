//
//  DetailPageTableUtils.swift
//  app
//
//  Created by djzhang on 5/10/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

let VIDEO_INFO_CELL_IDENTIFER = "videoInfoCell"
let VIDEO_DESCRIPTION_CELL_IDENTIFER = "descriptionCell"
let VIDEO_STATISTIC_CELL_IDENTIFER = "statisticCell"

let VIDEO_ROWS_INFO_IDENTIFER: [String] = [VIDEO_INFO_CELL_IDENTIFER, VIDEO_DESCRIPTION_CELL_IDENTIFER, VIDEO_STATISTIC_CELL_IDENTIFER]

let SECTION_TITLE_CELL_IDENTIFER = "headerCell"

let SUGGESTION_CELL_IDENTIFER = "suggestionCell"

let CHANNEL_INFO_CELL_IDENTIFER = "channelCell"


public enum DetailPageCellIdentifier {
    case VideoInfoCellIdentifier
    case VideoDescriptionCellIdentifier
    case VideoStatisticCellIdentifier
    case ChannelInfoCellIdentifier
    case SectionTitleCellIdentifier
    case SuggestionListCellIdentifier
}


class DetailPageSection: NSObject {
    var isOpen = true
    var animatedObject: AnyObject?
    var sectionIdentifier: DetailPageCellIdentifier?
    var sectionTitle = ""
    var identifer = ""
    var rowObjects: [AnyObject] = [AnyObject]()
    var rowHeight: CGFloat = 80
    var sectionHeaderHeight: CGFloat = 40
    var sectionFooterHeight: CGFloat = 20

    // MARK: animate object
    class func addAnimatedObject(section: DetailPageSection, index: Int) {
        section.rowObjects.insert(section.animatedObject!, atIndex: index)
    }

    class func removeAnimatedObject(section: DetailPageSection, index: Int) {
        section.rowObjects.removeAtIndex(index)
    }

    // MARK: make different sections
    class func insertVideoInfoSection(videoCache: YoutubeVideoCache, videoInfoTappedEnable: Bool) -> [String:DetailPageSection] {
        var dict: [String:DetailPageSection] = [String: DetailPageSection]()

        dict[VIDEO_INFO_CELL_IDENTIFER] = DetailPageSection.makeVideoInfoObjectSection(videoCache, videoInfoTappedEnable: videoInfoTappedEnable)
        dict[VIDEO_DESCRIPTION_CELL_IDENTIFER] = DetailPageSection.makeVideoDescriptionObjectSection(videoCache)
        dict[VIDEO_STATISTIC_CELL_IDENTIFER] = DetailPageSection.makeVideoStasticsObjectSection(videoCache)

        return dict
    }

    // MARK: video info section
    class func makeVideoInfoObjectSection(videoCache: YoutubeVideoCache, videoInfoTappedEnable: Bool) -> DetailPageSection {
        let section: DetailPageSection = DetailPageSection()

        section.sectionTitle = ""
        section.rowHeight = 60
        section.sectionHeaderHeight = 20
        section.sectionFooterHeight = 0
        section.sectionIdentifier = DetailPageCellIdentifier.VideoInfoCellIdentifier
        section.identifer = VIDEO_INFO_CELL_IDENTIFER

        let videoTitle = YoutubeParser.getVideoSnippetTitle(videoCache)
        let timeAgo = YoutubeParser.getVideoTimeAgoFromPublishedAt(videoCache)
        let viewCount = YoutubeParser.getVideoStatisticsViewCount(videoCache)


        let object: VideoInfoObject = VideoInfoObject(title: videoTitle, likeCount: "\(timeAgo), \(viewCount)")
        object.videoInfoTappedEnable = videoInfoTappedEnable
        object.isExpand = false
        section.rowObjects.append(object)

        return section
    }

    class func makeVideoDescriptionObjectSection(videoCache: YoutubeVideoCache) -> DetailPageSection {
        let section: DetailPageSection = DetailPageSection()

        section.sectionTitle = ""
        section.rowHeight = 160
        section.sectionHeaderHeight = 0
        section.sectionFooterHeight = 0
        section.sectionIdentifier = DetailPageCellIdentifier.VideoDescriptionCellIdentifier
        section.identifer = VIDEO_DESCRIPTION_CELL_IDENTIFER

        let desctiptionString = YoutubeParser.getVideoDescription(videoCache)
        section.rowObjects.append(VideoDescriptonObject(descriptionString: desctiptionString))

        section.animatedObject = section.rowObjects[0]

        return section
    }

    class func makeVideoStasticsObjectSection(videoCache: YoutubeVideoCache) -> DetailPageSection {
        let section: DetailPageSection = DetailPageSection()

        section.sectionTitle = ""
        section.rowHeight = 60
        section.sectionHeaderHeight = 0
        section.sectionFooterHeight = 40
        section.sectionIdentifier = DetailPageCellIdentifier.VideoStatisticCellIdentifier
        section.identifer = VIDEO_STATISTIC_CELL_IDENTIFER

        let likeCount = YoutubeParser.getVideoLikeCountFromStatistics(videoCache)
        let disLikeCount = YoutubeParser.getVideoDisLikeCountFromStatistics(videoCache)

        section.rowObjects.append(VideoStatisticObject(likeCount: likeCount, disLikeCount: disLikeCount))

        return section
    }


    // MARK: suggestion section
    class func makeSuggestionVideoListSection(array: NSArray) -> DetailPageSection {
        let section: DetailPageSection = DetailPageSection()

        section.sectionTitle = ""
        section.rowHeight = 80
        section.sectionHeaderHeight = 0
        section.sectionFooterHeight = 20
        section.sectionIdentifier = DetailPageCellIdentifier.SuggestionListCellIdentifier
        section.identifer = SUGGESTION_CELL_IDENTIFER
        section.rowObjects = array as [AnyObject]

        return section
    }

    // MARK: title section
    class func makeSectionTitleSection(title: String) -> DetailPageSection {
        let section: DetailPageSection = DetailPageSection()

        section.sectionTitle = "Suggestions"
        section.rowHeight = 40
        section.sectionHeaderHeight = 0
        section.sectionFooterHeight = 20
        section.sectionIdentifier = DetailPageCellIdentifier.SectionTitleCellIdentifier
        section.identifer = SECTION_TITLE_CELL_IDENTIFER
        section.rowObjects.append(SectionTitleObject(title: title))

        return section
    }

}
