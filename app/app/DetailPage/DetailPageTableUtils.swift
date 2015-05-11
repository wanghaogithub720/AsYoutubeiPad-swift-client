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

let VIDEO_ROWS_IDENTIFER:[String] = [VIDEO_INFO_CELL_IDENTIFER,VIDEO_DESCRIPTION_CELL_IDENTIFER,VIDEO_STATISTIC_CELL_IDENTIFER]

let SUGGESTION_CELL_IDENTIFER = "suggestionCell"

let CHANNEL_INFO_CELL_IDENTIFER = "channelCell"


let HEADER_CELL_IDENTIFIER = "headerCell"

public enum DetailPageCellIdentifier {
    case VideoInfoCellIdentifier
    case ChannelInfoCellIdentifier
    case SuggestionListCellIdentifier
}



class DetailPageSection{
    var isOpen  = true
    var animatedObject : AnyObject?
    var sectionIdentifier :    DetailPageCellIdentifier?
    var sectionTitle = ""
    var identifer = ""
    var rowObjects :[AnyObject] = [AnyObject]()
    
    // MARK: animate object
    class func addAnimatedObject(section: DetailPageSection,index:Int){
        section.rowObjects.insert(section.animatedObject!, atIndex: index)
        section.isOpen  = true
    }
    
    class func removeAnimatedObject(section: DetailPageSection,index:Int){
        section.rowObjects.removeAtIndex(index)
        section.isOpen  = false
    }
    
    // MARK: make different sections
    class func makeVideoInfoSection(videoCache: YoutubeVideoCache) -> DetailPageSection{
        let section: DetailPageSection = DetailPageSection()
        
        section.sectionTitle = ""
        section.sectionIdentifier = DetailPageCellIdentifier.VideoInfoCellIdentifier
        section.identifer = VIDEO_INFO_CELL_IDENTIFER
        
        section.rowObjects.append(VideoInfoObject())
        section.rowObjects.append(VideoStatisticObject())
        
        section.animatedObject = VideoDescriptonObject()
        DetailPageSection.addAnimatedObject(section,index:1)
        
        return section
    }
    
    class func makeSuggestionVideoListSection(array:NSArray) -> DetailPageSection{
        let section: DetailPageSection = DetailPageSection()
        
        section.sectionTitle = "Suggestions"
        section.sectionIdentifier = DetailPageCellIdentifier.SuggestionListCellIdentifier
        section.identifer = SUGGESTION_CELL_IDENTIFER
        section.rowObjects = array as [AnyObject]
        
        return section
    }
    
}
