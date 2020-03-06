//
//  NewsTableViewCell.swift
//  XebiaTest
//
//  Created by MohitTomar-iOS on 05/03/2020.
//  Copyright © 2020 Engineer.AI All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension NSObject {
    
    // Name Of class
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    ///Method to configure data table view cell
    func configure(whitViewModel dataItem:NewsDataModel, row: Int) {
        titleLbl.text = dataItem.title
        dateLbl.text = dataItem.published_date
        authorLbl.text = dataItem.byline
        newsImg.layer.cornerRadius = newsImg.frame.height / 2
        newsImg.layer.masksToBounds = true
        Alamofire.request(dataItem.mediaUrl?[0] ?? AppConstants.dummyImage).responseImage { response in
            if let image = response.result.value {
                DispatchQueue.main.async {
                    self.newsImg.image = image
                }
            }
        }
    }

}
