//
//  TaskDetailTableViewController.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import UIKit

class TaskDetailTableViewController: UITableViewController,TaskDetailTableViewModelDelegate {
    
    
    
    @IBOutlet weak var addTaskTappedButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var deadLineDateLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // TODO: For Texting

    
    var viewModel : TaskDetailViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    var screenType: builderChoice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func handleOutput(_ output: ViewModelOutput) {

    }
    
    
    func navigate(to route: DetailViewRouter) {

    }
    
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {

    }
    
    func setAlert(messeges: String){
        
        let alert = UIAlertController(title: "Uyarı", message: messeges, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in switch action.style{
        case .default:
            print("default")
        case .cancel:
            print("Cancel")
        case.destructive:
            print("destructive")
        default:
            break
        }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    
    @IBAction func reminderSwitchChanged(_ sender: UISwitch) {
    }
}
// MARK: - Table view data source
extension TaskDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case IndexPath(row: 1 , section: 2 ):
            return reminderSwitch.isOn ? 150 : 0
        case IndexPath(row: 0 , section: 1 ):
            return 107
        default:
            return 44
        }
    }
    
}
extension TaskDetailTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
