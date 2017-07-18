//
//  RestuarantsViewController.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit
import LUExpandableTableView


/*
 * Restaurant view contoller talk to the view model and preapre the table and ask for the network request
 */
class RestuarantsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: LUExpandableTableView!
    
    var categoriesList: NSMutableArray = []
    var heights: [Int: CGFloat] = [:]
    lazy var apiCoordinator = APICoordinator()
    lazy var MENMU_ITEM_CELL_IDENTIFIRE = "MenuItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreeenTitle()
        prepareTableView()
        getCatrgoryList()
    }
    
    //MARK: Prepare design
    private func prepareTableView(){
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none;
        tableView.menusTableLayoutConstraints()
        
        tableView.register(UINib(nibName: MENMU_ITEM_CELL_IDENTIFIRE, bundle: Bundle.main), forCellReuseIdentifier: MENMU_ITEM_CELL_IDENTIFIRE)
        tableView.register(UINib(nibName: CategoryViewCell.ID, bundle: Bundle.main),
                           forHeaderFooterViewReuseIdentifier: CategoryViewCell.ID)
        
        tableView.expandableTableViewDataSource = self
        tableView.expandableTableViewDelegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func getCatrgoryList(){
        apiCoordinator.getCategoryList(self)
    }
}

//MARK: YNTableViewDelegate
extension RestuarantsViewController: LUExpandableTableViewDataSource{
    func numberOfSections(in expandableTableView: LUExpandableTableView) -> Int {
        return categoriesList.count
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        let category: Category = categoriesList.object(at: section) as! Category
        
        if let subCategory = category.subCategory{
            return subCategory.count
        }
        return 0
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItemCell = expandableTableView.dequeueReusableCell(withIdentifier: MENMU_ITEM_CELL_IDENTIFIRE) as? MenuItemCell else {
            #if DEBUG
                assertionFailure("Cell shouldn't be nil")
            #endif
            return MenuItemCell.init(style: .default, reuseIdentifier: MENMU_ITEM_CELL_IDENTIFIRE)
        }
        let category = categoriesList.object(at: indexPath.section) as! Category
        let subCategory = category.subCategory
        menuItemCell.updateContent(data: subCategory?[indexPath.row] )
        menuItemCell.setNeedsLayout()
        menuItemCell.layoutIfNeeded()
        return menuItemCell
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        
        guard let sectionHeader = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryViewCell.ID) as? CategoryViewCell else {
            
            #if DEBUG
                assertionFailure("Section header shouldn't be nil")
            #endif
            
            return CategoryViewCell()
        }
        
        let category = categoriesList.object(at: section) as! Category
        sectionHeader.updateData(category)
        return sectionHeader
    }
}

// MARK: - LUExpandableTableViewDelegate
extension RestuarantsViewController: LUExpandableTableViewDelegate {
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}


//MARK: CategoryRequestDelegate
extension RestuarantsViewController: CategoryRequestDelegate{
    
    func categoryRequestWillSend(){
        if(!isNetworkConnected()){
            showNoNetworkConnectedMessage()
            return
        }
        showProgressDialog()
    }
    
    func categoryRequestSucceeded(data: CategoryResponse?){
        hideProgressDialog()
        if let array = data?.categoriesList {
            categoriesList.addObjects(from: array)
            print(categoriesList.count)
            tableView.reloadData()
        }
        else{
            showInfoMessage("There is no data now, Stay tuned")
        }
    }
    
    func categoryRequestFailed(){
        hideProgressDialog()
        showErrorMessage("Something went wrong, try again later")
    }
    
    func categoryRequestEmptyResponse(){
        hideProgressDialog()
        showInfoMessage("There is no data now, Stay tuned")
    }
    
}
