//
//  VideoInfoObject.swift
//  app
//
//  Created by djzhang on 4/19/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class VideoInfoObject: NSObject {
    var videoInfoToggleProtocol: VideoInfoToggleProtocol?

    var maxHeightValue: CGFloat = 0
    var minHeightValue: CGFloat = VIDEO_INFO_TITLE_PANEL_HEIGHT

    var descriptionWidth: CGFloat = 0

    var fromValue: CGFloat?
    var isOpen: Bool = true

    var descriptionRect: CGRect?

    func prepareAnimate() {

        fromValue = 0
        if (isOpen == true) {
            fromValue = maxHeightValue
        }
    }

    func setDescriptionMaxHeight(max: CGFloat, _descriptionWidth: CGFloat) {
        descriptionWidth = _descriptionWidth
        currentRowHeight = max
        maxHeightValue = max
    }

    var title = "WebStorm 10 - New features"
    var likeCount = "2,222 views"
    var descriptionString = "Both -updateConstraints and -updateViewConstraints may be called multiple times during a view's lifetime. (Calling setNeedsUpdateConstraints on a view will trigger this to happen, for example.) As a result, you need to make sure to prevent creating and activating duplicate constraints -- either using a BOOL to only perform certain constraint setup only once, or by making sure to deactivate/remove existing constraints before creating & activating new ones."


    var currentRowHeight: CGFloat = 0
    
    class func convertToVideoInfoObject( videoCache: YoutubeVideoCache) -> VideoInfoObject{
        let videoTitle = YoutubeParser.getVideoSnippetTitle(videoCache)
        let descriptionString = YoutubeParser.getVideoDescription(videoCache)
        let channelTitle = YoutubeParser.getVideoSnippetChannelTitle(videoCache)
        let viewCount = YoutubeParser.getVideoStatisticsViewCount(videoCache)
        let timeAgo = YoutubeParser.getVideoTimeAgoFromPublishedAt(videoCache)
        
        let object:VideoInfoObject = VideoInfoObject()
        object.title = videoTitle
        object.likeCount = viewCount
        object.descriptionString = descriptionString
        
        return object
    }
    
    

}

