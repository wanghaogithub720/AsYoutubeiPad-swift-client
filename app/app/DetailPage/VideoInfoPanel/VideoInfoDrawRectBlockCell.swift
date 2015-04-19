//
//  VideoInfoDrawRectBlockCell.swift
//  app
//
//  Created by djzhang on 4/19/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit


class VideoInfoDrawRectBlockCell: NIDrawRectBlockCell {
    
    var descriptionLabel: NIAttributedLabel?
    var _font: UIFont?
    
    // MARK : static functions
    class func getDescriptionBlockCellFont() -> UIFont {
        return UIFont(name: "AmericanTypewriter", size: 12)!
    }
    
    class func getBlockCellHeight(object: VideoInfoObject, width: CGFloat) -> CGFloat {
        let boundingRect = object.descriptionString.boundingRectWithSize(CGSizeMake(width - 40, CGFloat.max),
            options: .UsesLineFragmentOrigin | .UsesFontLeading,
            attributes:[NSFontAttributeName:VideoInfoDrawRectBlockCell.getDescriptionBlockCellFont()],
            context:nil)
        
        return boundingRect.size.height
    }
    
    // MARK : Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        descriptionLabel = NIAttributedLabel()
        
        
        if let subView: NIAttributedLabel = descriptionLabel {
            makeLabel(subView)
            self.blockView.addSubview(subView)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        
    }
    
    override func shouldUpdateCellWithObject(object: AnyObject!) -> Bool {
        super.shouldUpdateCellWithObject(object)
        
        let infoObject: VideoInfoObject = object.object as! VideoInfoObject
        
        if let subView: NIAttributedLabel = descriptionLabel {
            subView.text = infoObject.descriptionString
            LayoutUtils.LayoutFullView(subView)
        }
        
        return true
    }
    
    func makeLabel(label: NIAttributedLabel) {
        label.numberOfLines = 0
        //        label.lineBreakMode = NSLineBreakByWordWrapping
        label.font = VideoInfoDrawRectBlockCell.getDescriptionBlockCellFont()
        
        // When the user taps a link we can change the way the link text looks.
        label.attributesForHighlightedLink = [NSForegroundColorAttributeName: UIColor.redColor()]
        
        // In order to handle the events generated by the user tapping a link we must implement the
        // delegate.
        //    label.delegate = self;
        
        // By default the label will not automatically detect links. Turning this on will cause the label
        // to pass through the text with an NSDataDetector, highlighting any detected URLs.
        label.autoDetectLinks = true
        
        // By default links do not have underlines and this is generally accepted as the standard on iOS.
        // If, however, you do wish to show underlines, you can enable them like so:
        label.linksHaveUnderlines = true
    }
    
    
}