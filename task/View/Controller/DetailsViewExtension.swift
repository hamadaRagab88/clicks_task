//
//  DetailsViewExtension.swift
//  task
//
//  Created by Boo Doo on 8/28/21.
//

import Foundation
import UIKit
extension DetailsViewController{
    func configureView()
    {
        self.view.isSkeletonable  = true
    }
    
    func configureArticleData()
    {
        guard let articleData = article else {
            return
        }
        let articleImage = articleData.urlToImage ?? ""
        let articleDescription = articleData.description ?? ""
        let sourceName = articleData.source?.name ?? ""
        let titel = articleData.title ?? ""
        newImage.loadImageFrom(imgUrl: articleImage)
        sourceLBL.text = sourceName
        descriptionLBL.text = articleDescription
        titleLBL.text = titel
        view.hideSkeleton()
    }
}
