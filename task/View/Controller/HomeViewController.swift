//
//  HomeViewController.swift
//  task
//
//  Created by Boo Doo on 8/26/21.
//

import UIKit
import SkeletonView
class HomeViewController: BaseViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTableView: UITableView!
    let newCellIdentifier = "newsCell"
    var aricles = [Articles]()
    var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        view.showAnimatedGradientSkeleton()
        configureTableView()
        configureSaerchBar()
        viewModel.getNews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       
    }
    
}
