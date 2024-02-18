import Foundation

struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
}

class StudentJournal {
    var students: [Student]

    init() {
        self.students = []
    }
 
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let student = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(student)
    }

    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    func displayStudentsInfo() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
        }
    }

    func listStudentsByGPA() -> [Student] {
        return students.sorted(by: { $0.averageGrade > $1.averageGrade })
    }

    func averageScore() -> Double {
        let totalGrades = students.reduce(0.0, { $0 + $1.averageGrade })
        return totalGrades / Double(students.count)
    }

    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

let journal = StudentJournal()
journal.addStudent(firstName: "Karina", lastName: "Dautova", averageGrade: 85.5)
journal.addStudent(firstName: "Alina", lastName: "Ibraimova", averageGrade: 92.0)
journal.addStudent(firstName: "Marina", lastName: "Marchenko", averageGrade: 78.3)

print("Displaying all students info:")
journal.displayStudentsInfo()

print("\nStudents listed by GPA:")
let studentsByGPA = journal.listStudentsByGPA()
for student in studentsByGPA {
    print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
}

print("\nAverage Score of all students: \(journal.averageScore())")

if let highestGPAStudent = journal.studentWithHighestGPA() {
    print("\nStudent with the highest GPA:")
    print("Name: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
}

journal.removeStudent(firstName: "Marina", lastName: "Marchenko")

print("\nDisplaying all students info:")
journal.displayStudentsInfo()