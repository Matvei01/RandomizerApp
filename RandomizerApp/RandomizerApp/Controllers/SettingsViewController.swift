//
//  SettingsViewController.swift
//  RandomizerApp
//
//  Created by Matvei Khlestov on 06.04.2024.
//

import UIKit

// MARK: - SettingsViewController
final class SettingsViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var maximumValueTF: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Maximum Value"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var minimumValueTF: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Minimum Value"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var valueTFStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                maximumValueTF,
                minimumValueTF
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 31
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods
private extension SettingsViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setupNavigationController()
    }
    
    func addSubviews() {
        view.addSubview(
            valueTFStackView
        )
    }
    
    func setupNavigationController() {
        title = "Settings"
        navigationItem.rightBarButtonItem = createBarButtonItem(
            type: .save,
            action: #selector(saveButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = createBarButtonItem(
            type: .cancel,
            action: #selector(cancelButtonTapped)
        )
    }
    
    func createBarButtonItem(type: UIBarButtonItem.SystemItem,
                             action: Selector) -> UIBarButtonItem {
        
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: type,
            target: self,
            action: action
        )
        return barButtonItem
    }
}

// MARK: - Action
private extension SettingsViewController {
    @objc func saveButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints
private extension SettingsViewController {
    func setConstraints() {
        setConstraintsForValueTFStackView()
    }
    
    func setConstraintsForValueTFStackView() {
        NSLayoutConstraint.activate([
            valueTFStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 71
            ),
            valueTFStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 32
            ),
            valueTFStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -32
            )
        ])
    }
}
