//
//  AsTableCellProtocols.swift
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 3/21/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit

let REAR_VIEW_WIDTH :CGFloat = 300.0

let TABLE_HEADER_VIEW_HEIGHT :CGFloat = 60.0
let TABLE_ROW_HEIGHT :CGFloat = 56.0
let TABLE_SECTION_HEADER_HEIGHT :CGFloat = 48.0

let LOGIN_ICON_WH:CGFloat = 26.0
let USER_ICON_WH:CGFloat = 32.0
let LEFT_MIDDLE_X:CGFloat = 34.0
let TITLE_FONT_SIZE:CGFloat = 16.0

let ICON_PADDING_LEFT:CGFloat = 16.0
let ICON_PADDING_RIGHT:CGFloat = 16.0
let LOGIN_OUT_ICON_PADDING_RIGHT:CGFloat = 16.0

let TAB_HEIGHT:CGFloat = 42

public enum LeftTableRowType {
    case LeftTableRowType_Header
    case LeftTableRowType_Section
    case LeftTableRowType_Row
}

protocol ASTableCellProtocols  {
    func updateForRowAtIndexPath(indexPath: NSIndexPath!, rowType:LeftTableRowType)
}
