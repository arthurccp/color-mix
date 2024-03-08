//
//  ThreeViewController.swift
//  color-mix
//
//  Created by Arthur on 02/03/2024.
//  Copyright © 2024 Arthur. All rights reserved.
//
import UIKit

class ThreeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Array para armazenar os dados da tabela
    var data = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer euismod leo at nisi fermentum, vel eleifend nibh ullamcorper.",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint.",
        "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth.",
        "Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure."
    ]
    
    // Array para controlar o estado de expansão das células
    var expandedCells = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura o delegate e dataSource da tableView
        tableView.delegate = self
        tableView.dataSource = self
        

    }

    
}

// MARK: - TableView DataSource Methods

extension ThreeViewController: UITableViewDataSource, UITableViewDelegate {
    /// Retorna o número de linhas na seção da tabela.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    /// Configura e retorna uma célula para o índice de linha especificado.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        setupCell(cell, at: indexPath)
        
        return cell
    }
    
    /// Configura a célula na posição especificada.
    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.preservesSuperviewLayoutMargins = false // Impede que as margens sejam substituídas pelo layout da célula
        cell.layoutMargins = UIEdgeInsets(top: 28, left: 0, bottom: 28, right: 0) // Define margens superior e inferior de 28 pontos
        
        cell.textLabel?.numberOfLines = expandedCells.contains(indexPath.row) ? 0 : 2
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = data[indexPath.row]
    }
    
    /// Trata a seleção de uma célula.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedCells.contains(indexPath.row) {
            expandedCells.remove(indexPath.row)
        } else {
            expandedCells.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    /// Retorna a altura da célula na posição especificada.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedCells.contains(indexPath.row) {
            // Retorna a altura necessária para exibir o texto completo
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: .greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.text = data[indexPath.row]
            label.sizeToFit()
            return label.frame.height + 20 // Adiciona um espaço extra para melhor aparência
        } else {
            // Retorna a altura padrão para exibir duas linhas de texto
            return 44
        }
    }
}
