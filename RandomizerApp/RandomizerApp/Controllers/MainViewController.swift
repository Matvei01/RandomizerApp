//
//  MainViewController.swift
//  RandomizerApp
//
//  Created by Matvei Khlestov on 05.04.2024.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var randomValueLabel: UILabel = {
        let label = UILabel()
        label.text = "?"
        label.font = .systemFont(ofSize: 98)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var fromLabel: UILabel = {
        let label = UILabel()
        label.text = "from"
        label.font = .systemFont(ofSize: 29)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var toLabel: UILabel = {
        let label = UILabel()
        label.text = "to"
        label.font = .systemFont(ofSize: 29)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var minimumValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var maximumValueLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var randomLabelsStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                fromLabel,
                minimumValueLabel,
                fromLabel,
                maximumValueLabel
            ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var getRandomNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .background
        button.setTitle("Get Result", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 29)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setupNavigationController()
    }
    
    func addSubviews() {
        setupSubviews(
            randomLabelsStackView,
            randomValueLabel,
            getRandomNumberButton
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func setupNavigationController() {
        title = "Randomizer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            style: .plain,
            target: self,
            action: #selector(settingsButtonTapped)
        )
    }
}

// MARK: -  Action
private extension MainViewController {
    @objc func settingsButtonTapped() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

// MARK: - Constraints
private extension MainViewController {
    func setConstraints() {
        setConstraintsForRandomLabelsStackView()
        setConstraintsForRandomValueLabel()
        setConstraintsForGetRandomNumberButton()
    }
    
    func setConstraintsForRandomLabelsStackView() {
        NSLayoutConstraint.activate([
            randomLabelsStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            randomLabelsStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            randomLabelsStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            )
        ])
    }
    
    func setConstraintsForRandomValueLabel() {
        NSLayoutConstraint.activate([
            randomValueLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            randomValueLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }
    
    func setConstraintsForGetRandomNumberButton() {
        NSLayoutConstraint.activate([
            getRandomNumberButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20
            ),
            getRandomNumberButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 57.5
            ),
            getRandomNumberButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -57.5
            )
        ])
    }
}

