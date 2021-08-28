//
//  HomeViewControllerExtension.swift
//  task
//
//  Created by Boo Doo on 8/26/21.
//

import Foundation
import UIKit
import SkeletonView
extension HomeViewController {
    func configureView()
    {
        viewModel.delegate = self
        searchBar.delegate = self
        newsTableView.isSkeletonable = true
        self.navigationController?.navigationBar.isHidden = true
    }
    func configureSaerchBar(){
        searchBar.backgroundImage = UIImage()
        searchBar.setImage(UIImage(named: "search_icon"), for: .search, state: .normal)
        searchBar.delegate = self
    }
    func configureTableView()
    {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.tableFooterView = UIView()
        let newsCellNib = UINib(nibName: newCellIdentifier, bundle: nil)
        newsTableView.register(newsCellNib, forCellReuseIdentifier: newCellIdentifier)
        newsTableView.estimatedRowHeight = 200
        newsTableView.rowHeight = UITableView.automaticDimension
        
    }
    
}
extension HomeViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate{
        func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
            return newCellIdentifier
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.returnArticleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newCellIdentifier, for: indexPath) as! newsCell
        viewModel.configureCell(cell: cell, index: indexPath.row)
        cell.shareTapped = {
            let url = self.viewModel.returnArticleUrl(index: indexPath.row)
            self.share(url: url)
        }
          cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        detailsView.article = viewModel.returnArticleData(index: indexPath.row)
        detailsView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    
}

extension HomeViewController : ViewModelDelegate{
    func reloadTable() {
        aricles = viewModel.dataItems
        self.newsTableView.reloadData()
        self.view.hideSkeleton()
    }
}

extension HomeViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchText)
    }
}
