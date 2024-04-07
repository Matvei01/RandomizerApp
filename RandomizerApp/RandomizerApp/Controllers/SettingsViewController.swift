//
//  SettingsViewController.swift
//  RandomizerApp
//
//  Created by Matvei Khlestov on 06.04.2024.
//

import UIKit

// MARK: - SettingsViewController
final class SettingsViewController: UIViewController {
    
    // MARK: - Public Properties
    var randomNumber: RandomNumber!
    
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - UI Elements
    private lazy var maximumValueTF: UITextField = {
        createTextField(
            text: String(randomNumber.maximumValue),
            placeholder: "Maximum Value"
        )
    }()
    
    private lazy var minimumValueTF: UITextField = {
        createTextField(
            text: String(randomNumber.minimumValue),
            placeholder: "Minimum Value"
        )
    }()
    
    private lazy var valueTFStackView: UIStackView = {
        createStackView(subviews: [
            maximumValueTF,
            minimumValueTF
        ])
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
        view.addSubview(valueTFStackView)
    }
    
    func setupNavigationController() {
        title = "Settings"
        
        navigationItem.largeTitleDisplayMode = .never
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
    
    func createTextField(text: String, placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.text = text
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.delegate = self
        
        return textField
    }
    
    func createStackView(subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(
            arrangedSubviews: subviews
        )
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 31
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
}

// MARK: - Action
private extension SettingsViewController {
    @objc func saveButtonTapped() {
        view.endEditing(true)
        
        delegate.setNewValues(for: randomNumber)
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints
private extension SettingsViewController {
    func setConstraints() {
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

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
