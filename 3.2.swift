struct Task {
    let title: String
    let description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
    }
    
    func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        } else {
            print("Task not found")
        }
    }
    
    func displayAllTasks() {
        print("All Tasks:")
        for task in tasks {
            print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        print("Completed Tasks:")
        for task in completedTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { !$0.isCompleted }
        print("Outstanding Tasks:")
        for task in outstandingTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}

let todoList = ToDoList()

todoList.addTask(title: "Task 1", description: "Go shopping")
todoList.addTask(title: "Task 2", description: "Cook dinner")
todoList.addTask(title: "Task 3", description: "Go to a doctor appointment")

todoList.changeTaskStatus(title: "Task 1", isCompleted: true)

todoList.displayAllTasks()

todoList.displayCompletedTasks()

todoList.displayOutstandingTasks()

todoList.removeTask(title: "Task 2")

todoList.clearCompletedTasks()

todoList.displayAllTasks()