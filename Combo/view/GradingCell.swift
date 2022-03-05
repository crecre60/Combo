    //
    //  SurveyTableViewCell.swift
    //  Combo
    //
    //  Created by Young Ju on 3/3/22.
    //
 //
//  GradingCell.swift
//  Combo
//
//  Created by Young Ju on 3/5/22.
//

import UIKit

protocol GradingCellDelegate: AnyObject {
    func upButtonTapped(with seq: Int)
    func smileButtonTapped(with seq: Int)
    func downButtonTapped(with seq: Int)
}

class GradingCell: UITableViewCell {
    
    weak var delegate: GradingCellDelegate?
    static let identifier = "GradingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "GradingCell", bundle: nil)
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet var gradeButtons: [UIButton]!
    @IBOutlet var downButton: UIButton!
    @IBOutlet var smileButton: UIButton!
    @IBOutlet var upButton: UIButton!

    @IBAction func upButtonTapped(_ sender: Any) {
    }
    @IBAction func smileButtonTapped(_ sender: Any) {
    }
     
    @IBAction func downButtonTapped(_ sender: Any) {
    }
    func configure(with seq: Int) {
        upButton.setImage(UIImage( named: ""), for: .normal)
        smileButton.setImage(UIImage( named: ""), for: .normal)
        downButton.setImage(UIImage( named: ""), for: .normal)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//    extension SurveyTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 3
//        }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let imageName = DataService.instance.getGradeImage(img: indexPath.row)
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "GradesCVCell", for: indexPath) as? GradesCVCell else {
//            fatalError("Unable to create survey table view cell")
//    }
//
//        cell.gradeButton?.setImage( UIImage(systemName: imageName), for: .normal)
//
//            return cell
//    }
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 120, height: 120)
//        }
//
//    }


