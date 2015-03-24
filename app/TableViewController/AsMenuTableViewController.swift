//
//  AsMenuTableViewController.swift
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 3/16/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit



class AsMenuTableViewController: UIViewController ,ASTableCellProtocols,  ASTableViewDataSource, ASTableViewDelegate ,AuthorUserFetchingDelegate{
    
    
    var menuTableWidth:CGFloat!
    
    var tableView: ASTableView
    var leftMenuSectionsUtils :LeftMenuSectionsUtils = LeftMenuSectionsUtils()
    var menuSections : [MenuSectionItemInfo] = []
    
    convenience init(viewWidth:CGFloat) {
        self.init()
        self.menuTableWidth = viewWidth
    }
    
    // MARK: UIViewController.
    required override init() {
        self.tableView = ASTableView()
        super.init(nibName: nil, bundle: nil)
        self.tableView.asyncDataSource = self
        self.tableView.asyncDelegate = self
        
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        if (YoutubeUserProfile.sharedInstance.isLogin == true) {
            menuSections = self.leftMenuSectionsUtils.getSignInMenuItemTreeArray()
        }else{
            menuSections = self.leftMenuSectionsUtils.getSignOutMenuItemTreeArray()
        }
        
        
        YoutubeFetcher.sharedInstance._delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("storyboards are incompatible with truth and beauty")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.view.addSubview(self.tableView)
    }
    
    override func viewWillLayoutSubviews() {
        self.tableView.frame = self.view.bounds
    }
    
    func setupUI(){
        let backgroundImage =  UIImage(named: "mt_side_menu_bg")?.stretchableImageWithLeftCapWidth(1, topCapHeight: 0)
        
        let backgroundView = UIView(frame: self.view.bounds)
        backgroundView.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        self.view.addSubview(backgroundView)
    }
    
    // MARK: ASTableView data source and delegate.
    func tableView(tableView: ASTableView!, nodeForRowAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
        var cell: ASCellNode!
        var sectionInfo : MenuSectionItemInfo = menuSections[indexPath.section]
        let row = sectionInfo.rows[indexPath.row]
        
        var rowType :MenuRowType = sectionInfo.rowType
        switch rowType {
        case MenuRowType.LMenuTreeRowUserHeader:
            let _isLogin = YoutubeUserProfile.sharedInstance.isLogin
            cell = AsMenuTableHeaderCell(nodeCellSize:  CGSizeMake(self.menuTableWidth, 50+20),parent: self.parentViewController! , delegate: self)
        case MenuRowType.LMenuTreeRowSectionTitle:
            cell = AsMenuTableSectionTitleCell(nodeCellSize: CGSizeMake(self.menuTableWidth, 20), title: row.title)
        default:
            cell = AsMenuTableRowCell(nodeCellSize: CGSizeMake(self.menuTableWidth, TABLE_ROW_HEIGHT), title: row.title, iconUrl: row.imageUrl, isRemoteImage: false)
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return menuSections.count
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return menuSections[section].rows.count
    }
    
    //    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String {
    //        return menuSections[section].headerTitle
    //    }
    
    
    // MARK: ASTableView table view and delegate.
    func tableView(tableView: UITableView!, shouldHighlightRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    
    func tableView(tableView: UITableView!, willDisplayHeaderView view:UIView!, forSection section: NSInteger!) {
        var x = 0
    }
    
    
    
    // MARK: ASTableCellProtocols delegate.
    func updateForRowAtIndexPath(indexPath: NSIndexPath!, rowType:LeftTableRowType){
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    // MARK: - protocol for AuthorUserFetchingDelegate
    func endFetchingUserChannel(channel :GTLYouTubeChannel){
        self.updateForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), rowType: .LeftTableRowType_Header)
    }
    
    func endFetchingUserSubscriptions(array:NSArray){
        var rows : [MenuRowItemInfo] =  YoutubeModelParser.convertToMenuRowArrayFromSubscriptions(array)
        menuSections = self.leftMenuSectionsUtils.getSignInMenuItemTreeArrayWithSubscriptions(rows)
        
        //        self.tableView.insertSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.None)
    }
    
}
