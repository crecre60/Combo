//
//  ViewController.swift
//  Combo
//
//  Created by Young Ju on 3/3/22.
//

import UIKit

class SurveyVC: UIViewController {

    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var serviceSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: serviceSelected)))
        
        self.serviceTitle.text = getCapitalizedServiceName(Choice: serviceSelected)
    }
    
    func getServiceName(choice : Int) -> String {
        return DataService.instance.getDivision(seq: choice)
    }
    
    func getCapitalizedServiceName(Choice : Int) -> String {
        return getServiceName(choice: Choice).capitalized  + " Service"
        //(DataService.instance.getDivision(seq: choice).capitalized) + "Service"
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        if serviceSelected < 2 {
            serviceSelected += 1
            self.serviceTitle.text = getCapitalizedServiceName(Choice: serviceSelected)
            tableView.backgroundView = UIImageView(image: UIImage(named: getServiceName(choice: serviceSelected)))
            tableView.reloadData()
        } else {
                 //***** To be interfaced with next screen
                //Placeholder: "StarVC"
               //
                //            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                //            let nextVC = storyBoard.instantiateViewController(withIdentifier: "StarVC") as! StarVC
                //
                //            nextVC.modalPresentationStyle = .fullScreen
                //            self.present(nextVC, animated: true, completion: nil)
            }
        }
    }

extension SurveyVC: UITableViewDelegate, UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SurveyTableViewCell", for: indexPath)
                as? SurveyTVCell else {
                    fatalError("Unable to create survey table view cell")
        }
        cell.question?.text = DataService.instance.getQuestions(division: DataService.instance.getDivision(seq: serviceSelected))[indexPath.row].questionAsked
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.sectionHeaderTopPadding = 0
        return 160
    }
    
}

