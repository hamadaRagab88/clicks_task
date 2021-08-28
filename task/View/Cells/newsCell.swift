//
//  newsCell.swift
//  task
//
//  Created by Boo Doo on 8/26/21.
//

import UIKit

class newsCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var sourceNameLBL: UILabel!
    var shareTapped: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    private func configureCell()
    {
        newImage.roundCorners(corners: [.topRight,.topLeft], radius: 7)
    }
    func setData(source: String, imageUrl: String, titel: String)
    {
        newImage.loadImageFrom(imgUrl: imageUrl)
        titleLBL.text = titel
        sourceNameLBL.text = source
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        shareTapped?()
    }
    
}
