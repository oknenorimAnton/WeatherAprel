//
//  MainViewController.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//
import SVGKit
import UIKit

protocol MainDisplayLogic: AnyObject {
    func update(sections: [Section])
    func showError()
}

final class MainViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CurrentForecastTableViewCell.self)
        tableView.register(FutureForecastTableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var sections: [Section] = []
    
    var presenter: MainPresentationLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        presenter?.viewDidLoad()
    }
}

extension MainViewController: MainDisplayLogic {
    func update(sections: [Section]) {
        self.sections = sections
        tableView.reloadData()
    }
    
    func showError() {}
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let rowType = sections[section].rows[row]
        
        switch rowType {
        case let .currentForecast(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentForecastTableViewCell", for: indexPath) as? CurrentForecastTableViewCell else {
                fatalError("not found CurrentForecastTableViewCell")
            }
            cell.configureCell(with: viewModel)
            return cell
            
        case let .futureForecast(viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FutureForecastTableViewCell", for: indexPath) as? FutureForecastTableViewCell else {
                fatalError("not found FutureForecastTableViewCell")
            }
            cell.configureCell(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = sections[section].type
        
        switch sectionType {
        case .currentForecast:
            return nil
        case .futureForecast:
            return "Прогноз"
        }
    }
}

extension MainViewController: UITableViewDelegate {}

private extension MainViewController {
    func setupViewController() {
        view.backgroundColor = .systemBackground
        addSubview()
        setupConstrains()
    }
    
    func addSubview() {
        view.addSubview(tableView)
    }
    func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
