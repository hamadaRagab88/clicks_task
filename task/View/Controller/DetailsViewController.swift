//
//  DetailsViewController.swift
//  task
//
//  Created by Boo Doo on 8/28/21.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var sourceLBL: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    var article: Articles?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.showAnimatedGradientSkeleton()
        configureArticleData()
        
    }
    
   
    @IBAction func shareTapped(_ sender: Any) {
        share(url: article?.url ?? "")
    }
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
