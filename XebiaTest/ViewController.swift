//
//  ViewController.swift
//  XebiaTest
//
//  Created by MohitTomar-iOS on 05/03/2020.
//  Copyright © 2020 Engineer.AI All rights reserved.
//

import UIKit
import HAActionSheet

class ViewController: UIViewController {

  var viewModel = NYViewModel()
    let options = ["Day",
    "Week",
    "Month"]
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.accessibilityIdentifier = "Onboarding View"
        self.title = "Day"
        
        
        addRightBarButtonItem()
        viewModel.delegate = self
        viewModel.getNews(type: .oneDay)
    }
    
    // MARK: BarButtonItem
    func addRightBarButtonItem(){

        let changeBtn = UIBarButtonItem(title: "Range", style: .plain, target: self, action: #selector(showOptionSheet))
        navigationItem.rightBarButtonItem = changeBtn
    }
    
    
    
    // MARK: AlertView
    func showAlertView(message:String)  {
        let alert = UIAlertController(title: "New York Times API", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.newsTableView.accessibilityIdentifier = "news table"
    }
}

extension ViewController:ViewModelDelegate{
    // MARK: ReloadTable
    @objc func reloadTable(type: Int) {
        switch type {
        case 1:
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        default:
            DispatchQueue.main.async {
                self.showAlertView(message: "Api request failed")
            }
        }
        
    }
}

// MARK: TableViewDeleagte and DataSource
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataItems?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.stringRepresentation) as! NewsTableViewCell
        if viewModel.dataItems?.results?.count ?? 0 > 0 {
                   let dataItems = viewModel.dataItems?.results![indexPath.row]
                   cell.configure(whitViewModel: dataItems!, row: indexPath.row)
               }
               return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AppConstants.NewsTableView.heightForRow)
    }
    
}

extension ViewController{
    // MARK: ActionSheet
    @objc func showOptionSheet(){
        let sheet = HAActionSheet(fromView: self.view, sourceData: options)
        sheet.buttonCornerRadius = 16
        sheet.show { (canceled, index) in
          if !canceled {
            self.title = self.options[index!]
            switch index {
            case 0:
                self.viewModel.getNews(type: .oneDay)
            case 1:
                self.viewModel.getNews(type: .sevenDays)
            case 2:
                self.viewModel.getNews(type: .thirtyDays)
            default:
                self.viewModel.getNews(type: .oneDay)
            }
          }
        }
    }
}



