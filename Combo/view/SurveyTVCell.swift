//
//  SurveyTableViewCell.swift
//  Combo
//
//  Created by Young Ju on 3/3/22.
//

import UIKit

class SurveyTVCell: UITableViewCell {
      
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
      cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }

}

extension SurveyTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let imageName = DataService.instance.getGradeImage(img: indexPath.row)
                 
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "GradesCVCell", for: indexPath) as? GradesCVCell else {
        fatalError("Unable to create survey table view cell")
}

        cell.gradeImage?.image = UIImage(systemName: imageName)
        cell.testLabel?.text = "testing"
    
        return cell
}
    
    
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}

