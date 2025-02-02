//
//  YoutubePageConstant.swift
//  app
//
//  Created by djzhang on 4/27/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

let DEFAULT_BANNER_IMAGE_NAME = "default_banner"

extension ChannelBannerViewController {

    class func instance() -> ChannelBannerViewController {

        var viewController: ChannelBannerViewController = UIStoryboard(name: "ReusedViewControllers", bundle: nil).instantiateViewControllerWithIdentifier("ChannelBannerViewController") as! ChannelBannerViewController

        return viewController
    }
}