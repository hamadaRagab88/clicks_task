//
//  HomeViewModel.swift
//  task
//
//  Created by Boo Doo on 8/28/21.
//

import Foundation
protocol ViewModelDelegate: class {
    func reloadTable()
}
class HomeViewModel {
    
    var dataItems:[Articles] = []
    var filter_items:[Articles] = []
    var new_model: NewsDataModel?
    weak var delegate: ViewModelDelegate?
    
    init() {
        new_model = NewsDataModel()
    }
    func getNews(){
        guard let modelData = new_model else { return }
        modelData.getNewsData { (response) in
            switch response{
            case .failure:
                print("error")
            case.success(let model):
                if let articles = model.articles {
                    self.dataItems = articles
                    self.filter_items = articles
                    self.delegate?.reloadTable()
                }
               
            }
        }
    }
    func configureCell(cell: newsCell, index: Int)
    {
        let currentCellData = dataItems[index]
        let title = currentCellData.title ?? ""
        let sorce = currentCellData.source?.name ?? ""
        let image_url = currentCellData.urlToImage ?? ""
        cell.setData(source: sorce, imageUrl: image_url, titel: title)
    }
    func returnArticleCount()->Int
    {
        return dataItems.count
    }
    func returnArticleData(index: Int) -> Articles{
        return dataItems[index]
    }
    func search(text: String){
        if text.count != 0 {
        dataItems = dataItems.filter {
            ($0.title?.lowercased().contains((text.lowercased())))!
    }
    }
        else{
            dataItems = filter_items
           
        }
        delegate?.reloadTable()
        
    }
    func returnArticleUrl(index: Int)-> String{
        return dataItems[index].url ?? ""
    }

}
