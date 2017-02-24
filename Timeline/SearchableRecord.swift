//
//  SearchableRecord.swift
//  Timeline
//
//  Created by Christian McMullin on 2/21/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
