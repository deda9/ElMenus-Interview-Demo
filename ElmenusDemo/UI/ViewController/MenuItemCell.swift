//
//  MenuItemCell.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Cartography

class MenuItemCell: UITableViewCell {
    
    static let ID = "MenuItemCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCell()
        prepareTitleLabel()
        prepareDescription()
        prepareLikeButton()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame,
                                                  UIEdgeInsetsMake(10, 10, 10, 10))
    }
    
    
    private func prepareCell() {
        selectionStyle = .none
    }
    
    private func prepareTitleLabel() {
        titleLabel.cellMenuItemTitleStyle()
        titleLabel.cellMenuItemTitleConstraintsLayout()
    }
    
    private func prepareDescription() {
        descriptionLabel.cellMenuItemDescriptionStyle()
        descriptionLabel.cellMenuItemDescriptionConstraintsLayout(topParent: titleLabel,
                                                                  bottomParent: likeButton)
    }
    
    private func prepareLikeButton(){
        likeButton.cellMenuItemLikeButtonStyle()
        likeButton.cellMenuItemLikeButtonConstraintsLayout()
    }
    
    
    //MARK: update
    func updateContent(data: SubCategory?) {
        setTitle(data)
        setDescription(data)
    }
    
    private func setTitle(_ data: SubCategory?){
        titleLabel.text = data?.name
    }
    
    private func setDescription(_ data: SubCategory?){
        if let description = data?.descriptionField{
            descriptionLabel.text = description
        }else{
            hideDescription()
        }
    }
    
    private func hideDescription(){
        descriptionLabel.isHidden =  true
        
        var descriptionFrame = descriptionLabel.frame
        descriptionFrame.size.width = 0
        descriptionFrame.size.height = 0
        
        descriptionLabel.frame = descriptionFrame
    }
    
    //MARK: Actions
    @IBAction func doLike(_ sender: Any) {
        var message = "Thank you for like "
        if let text = titleLabel.text {
            message = message + text
        }
        
        UIHelper.showSuccessMessage(message)
    }
}
