//
//  VideoInfoDrawRectBlockCell.swift
//  app
//
//  Created by djzhang on 4/19/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class VideoInfoDrawRectBlockCell: NIDrawRectBlockCell {
    var videoInfoObject: VideoInfoObject?

    var descriptionLabel: NIAttributedLabel?
    var titleLabel: UILabel?
    var likeCountLabel: UILabel?
    var toggleButton: UIImageView?

    var toggleContainer: UIView?

    var group: Cartography.ConstraintGroup?

    var _font: UIFont?

    // MARK : static functions
    class func getDescriptionBlockCellFont() -> UIFont {
        return UIFont(name: "AmericanTypewriter", size: 12)!
    }

    class func getBlockCellHeight(object: VideoInfoObject, width: CGFloat) -> CGFloat {
        let boundingRect = object.descriptionString.boundingRectWithSize(CGSizeMake(width, CGFloat.max),
                options: .UsesLineFragmentOrigin | .UsesFontLeading,
                attributes: [NSFontAttributeName: VideoInfoDrawRectBlockCell.getDescriptionBlockCellFont()],
                context: nil)

        let cellHeight = boundingRect.size.height + 120
        return cellHeight
    }

    // MARK : Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // line01
        toggleContainer = UIView()
        titleLabel = UILabel()
        likeCountLabel = UILabel()
        makeButton()
        if let theToggleContainer: UIView = toggleContainer, theTitleLabel: UILabel = titleLabel, theLikeCountLabel: UILabel = likeCountLabel, theToggleButton: UIImageView = toggleButton {

            createTapGestureRecognizerForView(theToggleContainer)

            self.blockView.addSubview(theToggleContainer)

            theToggleContainer.addSubview(theTitleLabel)
            theToggleContainer.addSubview(theLikeCountLabel)
            theToggleContainer.addSubview(theToggleButton)

            layout(theToggleContainer) {
                view1 in

                // theTitleLabel
                view1.leading == view1.superview!.leading
                view1.trailing == view1.superview!.trailing

                view1.top == view1.superview!.top
                view1.height == VIDEO_INFO_TITLE_PANEL_HEIGHT
            }

        }

        // line02
        descriptionLabel = NIAttributedLabel()
        if let theDescriptionLabel: NIAttributedLabel = descriptionLabel {
//            makeDescriptionLabel(theDescriptionLabel)
            self.blockView.addSubview(theDescriptionLabel)
        }

        LayoutTitlePanel()
    }

    func createTapGestureRecognizerForView(view: UIView) {
        let playTap = UITapGestureRecognizer(target: self, action: "playTapped")
        playTap.numberOfTouchesRequired = 1
        playTap.numberOfTapsRequired = 1
        view.userInteractionEnabled = true
        view.addGestureRecognizer(playTap)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {

    }

    override func shouldUpdateCellWithObject(object: AnyObject!) -> Bool {
        super.shouldUpdateCellWithObject(object)

        let infoObject: VideoInfoObject = object.object as! VideoInfoObject

        if let infoObject: VideoInfoObject = videoInfoObject {
        } else {
            //            println("VideoInfoToggleProtocol  ... ")
            videoInfoObject = infoObject
        }

        showToggleImage(infoObject.isOpen)

        if let theDescriptionLabel: NIAttributedLabel = descriptionLabel, theTitleLabel: UILabel = titleLabel, theLikeCountLabel: UILabel = likeCountLabel {
            theDescriptionLabel.text = infoObject.descriptionString
            theTitleLabel.text = infoObject.title
            theLikeCountLabel.text = infoObject.likeCount

//            let rect: CGRect = CGRectMake(VIDEO_INFO_TABLEVIEW_MARGIN_LEFT_RIGHT, VIDEO_INFO_TITLE_PANEL_HEIGHT,
//                infoObject.descriptionWidth - VIDEO_INFO_TABLEVIEW_MARGIN_LEFT_RIGHT * 2, maxHeight)
//            theDescriptionLabel.frame = infoObject.descriptionRect!

//            println("shouldUpdateCellWithObject... +\(infoObject.descriptionRect)")
        }

        return true
    }

    
    func makeButton() {
        toggleButton = UIImageView()
        toggleButton!.backgroundColor = UIColor.clearColor()

        toggleButton!.image = UIImage(named: "collapse_guide")
        toggleButton!.image = UIImage(named: "expand_guide")
    }

    func LayoutTitlePanel() {
        if let theTitleLabel: UILabel = titleLabel, theLikeCountLabel: UILabel = likeCountLabel, theToggleButton: UIImageView = toggleButton {
            layout(theTitleLabel, theLikeCountLabel, theToggleButton) {
                view1, view2, view3 in

                // theTitleLabel
                view1.leading == view1.superview!.leading + 20
                view1.trailing == view1.superview!.trailing - 200

                view1.top == view1.superview!.top + 10
                view1.height == 14

                // theLikeCountLabel
                view2.leading == view2.superview!.leading + 20
                view2.trailing == view2.superview!.trailing - 200

                view2.top == view1.bottom + 4
                view2.height == 14

                // theToggleButton
                view3.top == view3.superview!.top
                view3.trailing == view3.superview!.trailing

                view3.width == VIDEO_INFO_TOGGLE_WIDTH_HEIGHT
                view3.height == VIDEO_INFO_TOGGLE_WIDTH_HEIGHT
            }
        }
    }

    func showToggleImage(isOpen: Bool) {
        println("btnTouched: + \(isOpen)")
        if (isOpen == true) {
            self.toggleButton!.image = UIImage(named: "expand_guide")
        } else {
            self.toggleButton!.image = UIImage(named: "collapse_guide")
        }
    }

    // MARK: UITapGestureRecognizer
    func playTapped() {
        if let infoObject: VideoInfoObject = videoInfoObject {
            infoObject.videoInfoToggleProtocol!.toggleVideoInfoPanel({
                (object, isOpen) -> Void in

            })
        }
    }

}