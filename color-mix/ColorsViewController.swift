//
//  ColorsViewController.swift
//  color-mix
//
//  Created by Arthur on 07/03/2024.
//  Copyright © 2024 Arthur. All rights reserved.
//

import UIKit


class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var savedColors: [UIColor] = [] // Array para armazenar as cores salvas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ColorsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedColors.count // Retorna o número de cores salvas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        // Remove todas as subviews existentes na célula para garantir que a célula esteja limpa
        for subview in cell.subviews {
            subview.removeFromSuperview()
        }
        
        // Cria uma subvisualização com a cor correspondente
        let colorView = UIView(frame: CGRect(x: 0, y: 0, width: 550, height: 50))
        colorView.backgroundColor = savedColors[indexPath.row]
        
        // Adiciona a subvisualização à célula
        cell.addSubview(colorView)
        
        return cell
    }
}


