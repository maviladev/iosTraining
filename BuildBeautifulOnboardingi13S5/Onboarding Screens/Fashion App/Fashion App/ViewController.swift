//
//  ViewController.swift
//  Fashion App
//
//  Created by Marcos Avila Rodriguez on 25/02/22.
//

import UIKit

struct OnboardingItem {
    let title: String
    let detail: String
}


class ViewController: UIViewController {

    @IBOutlet weak var netButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let items: [OnboardingItem] = [
        .init(title: "Diana Vreeland",
              detail: "Fashion is part of the daily air and it changes all the time, with all the events. You can even see the approaching of a revolution in clothes. You can see and feel everything in clothes."),
              
        .init(title: "Gianni Versace",
              detail: "Don't be into trends. Don't make fashion own you, but you decide what you are, what you want to express by the way you dress and the way to live."),
              
        .init(title: "Karl Lagerfeld",
              detail: "One is never over-dressed or under-dressed with a Little Black Dress."),
              
        .init(title: "Miuccia Prada",
              detail: "What you wear is how you present yourself to the world, especially today, when human contacts are so quick. Fashion is instant language."),
              
        .init(title: "Bette Midler",
              detail: "I firmly believe that with the right footwear one can rule the world."),
              
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
    

    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! QuoteCollectionViewCell
        let item = items[indexPath.item]
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class QuoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
 
    func configure(with item: OnboardingItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
    }
    
}
