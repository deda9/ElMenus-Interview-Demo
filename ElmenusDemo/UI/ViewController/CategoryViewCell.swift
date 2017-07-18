//
//  CategoryViewCell.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/18/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit
import LUExpandableTableView


/*
 * menu or Category cell which will be expanded
 */
class CategoryViewCell: LUExpandableTableViewSectionHeader {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var expandCollapseButton: UIButton!
  
    static let ID = "CategoryViewCell"

    override var isExpanded: Bool {
        didSet {
            // Change the title of the button when section header expand/collapse
            expandCollapseButton?.setTitle(isExpanded ? "Collapse" : "Expand", for: .normal)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        prepareTitleLabel()
        prepareCollapseButton()
        titleLabel?.isUserInteractionEnabled = true
        titleLabel?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnLabel)))
    }
    
    func updateData(_ category: Category?){
        if let name = category?.name {
            titleLabel.text = name
        }
        else{
            titleLabel.text = "No Name"
        }
    }
    
    //MARK: Prepare design
    private func prepareTitleLabel() {
        titleLabel.cellCategoryTitleStyle()
        titleLabel.cellCategoryTitleConstraintsLayout()
    }
    
    private func prepareCollapseButton(){
        expandCollapseButton.expandCollapseButtonLayoutConstraints()
    }
    
    @IBAction func expandCollapse(_ sender: UIButton) {
        // Send the message to his delegate that shold expand or collapse
        delegate?.expandableSectionHeader(self, shouldExpandOrCollapseAtSection: section)
    }
    
    @objc private func didTapOnLabel(_ sender: UIGestureRecognizer) {
        // Send the message to his delegate that was selected
        delegate?.expandableSectionHeader(self, wasSelectedAtSection: section)
    }
    
}
