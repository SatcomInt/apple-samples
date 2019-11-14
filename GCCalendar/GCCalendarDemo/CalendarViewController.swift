//
//  CalendarViewController.swift
//  GCCalendarDemo
//
//  Created by Gray Campbell on 1/28/16.
//

import UIKit
import GCCalendar

// MARK: Properties & Initializers

class CalendarViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var calendarView: GCCalendarView!
    @IBOutlet weak var calendarHeight: NSLayoutConstraint!
    
}

// MARK: - View

extension CalendarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tintColor = UIColor(red: 1.0, green: 0.23, blue: 0.19, alpha: 1.0)
        self.navigationController!.toolbar.tintColor = tintColor
        self.navigationController!.navigationBar.tintColor = tintColor
        self.addToolbar()
        self.addCalendarView()
    }
}

// MARK: - Toolbar
extension CalendarViewController {
    
    fileprivate func addToolbar() {
        self.navigationController!.isToolbarHidden = false
        let today = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(self.today))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let displayMode = UIBarButtonItem(title: "Display Mode", style: .plain, target: self, action: #selector(self.displayMode))
        self.toolbarItems = [today, space, displayMode]
    }
    
    // MARK: Targets
    @objc func today() {
        self.calendarView.select(date: Date())
    }
    
    @objc func displayMode() {
        let displayMode = (self.calendarView.displayMode == .month) ? GCCalendarDisplayMode.week : GCCalendarDisplayMode.month
        self.calendarView.displayMode = displayMode
        self.calendarHeight.constant = (displayMode == .month) ? 200 : 60
    }
}

// MARK: - Calendar View
fileprivate extension CalendarViewController {
    
    func addCalendarView() {
        self.calendarView.delegate = self
        self.calendarView.displayMode = .month
        self.calendarHeight.constant = 200
        self.calendarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.calendarView)
    }
}

// MARK: - Constraints
fileprivate extension CalendarViewController {
    
    func addConstraints() {
        self.calendarView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        self.calendarView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.calendarView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.calendarView.heightAnchor.constraint(equalToConstant: 325).isActive = true
    }
}

// MARK: - GCCalendarViewDelegate
extension CalendarViewController: GCCalendarViewDelegate {
    
    func calendarView(_ calendarView: GCCalendarView, didSelectDate date: Date, inCalendar calendar: Calendar) {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMM yyyy", options: 0, locale: calendar.locale)
        self.navigationItem.title = dateFormatter.string(from: date)
    }
}
