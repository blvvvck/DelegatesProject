//
//  DataTransferProtocol.swift
//  DelegatesProject
//
//  Created by Ildar Zalyalov on 02.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import Foundation

/// Протокол для передачи данных между контроллерами обратно
protocol DataTransferProtocol {
    /// Обработка нажатия return на клаве
    ///
    /// - Parameter text: входящий текст
    func didPressReturn(with text: String)
}

extension DataTransferProtocol {
    
    func didPressReturn(with text: String) {
        print(text)
    }
}
