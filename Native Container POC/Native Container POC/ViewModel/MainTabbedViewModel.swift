//
//  MainTabbedViewModel.swift
//  Native Container POC
//
//  Created by Amanda Ragone on 8/6/20.
//  Copyright © 2020 Amanda Ragone. All rights reserved.
//

import Foundation

protocol MainTabbedViewModelProtocol: class {

    var selectedModuleName: String? { get set }
    
    var moduleDidChange: ((MainTabbedViewModelProtocol) -> ())? { get set }
    
}

class MainTabbedViewModel: NSObject, ObservableObject, MainTabbedViewModelProtocol{
    
    var selectedModuleName: String? {
        didSet {
            self.moduleDidChange?(self)
        }
    }
    
    var moduleDidChange: ((MainTabbedViewModelProtocol) -> ())?
    
    override init() {
        super.init()
    }

}
