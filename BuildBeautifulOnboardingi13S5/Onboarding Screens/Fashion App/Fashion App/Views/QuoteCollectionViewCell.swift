//
//  QuoteCollectionViewCell.swift
//  Fashion App
//
//  Created by Marcos Avila Rodriguez on 02/03/22.
//

import UIKit

protocol QuoteCollectionViewCellDelegate: AnyObject {
    func didTapExploreButton()
}

class QuoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var exploreButton: UIButton!
    
    weak var delegate: QuoteCollectionViewCellDelegate?
    
    func configure(with item: OnboardingItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
    }
    
    func showExploreButton(shouldShow: Bool){
        exploreButton.isHidden = !shouldShow
    }
    
    @IBAction func exploreButtonTapped(_ sender: Any) {
        delegate?.didTapExploreButton()
    }
}
