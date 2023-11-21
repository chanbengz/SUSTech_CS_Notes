package Assignment4;

import java.util.ArrayList;
import java.util.Comparator;

public class Administrator {
    private ArrayList<Student> studentList = new ArrayList<Student>();
    private CourseDatabase database = new CourseDatabase();

    public void addStudent(Student student){ this.studentList.add(student); }
    public void addStudent(int studentID) { this.studentList.add(new Student(studentID)); }

    public CourseDatabase getDatabase() { return this.database; }
    public void generateCurriculum() {
        this.database.getCourseList().forEach((e)->{
            ArrayList<Integer> credits = new ArrayList<Integer>();
            ArrayList<Student> students = new ArrayList<Student>();
            studentList.forEach((s)->{
                if(s.getCurriculum().contains(e)){
                    int index = s.getCurriculum().indexOf(e);
                    credits.add(s.getCredit().get(index));
                    students.add(s);
                }
            });

            credits.sort(Comparator.reverseOrder());
            if(credits.size() > e.getCapacity()) {
                credits.subList(e.getCapacity(), credits.size()).forEach((c)->{
                    students.forEach((s)->{
                        if(s.getCredit().contains(c)) {
                            s.dropCourse(e);
                        }
                    });
                });
            }
        });
    }
}