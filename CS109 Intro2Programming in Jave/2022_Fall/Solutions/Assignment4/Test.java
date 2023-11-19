package Assignment4;

import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        SUSTechTime t1 = new SUSTechTime("8:00", "10:00", Weekday.Monday, WeekType.Every);
        SUSTechTime t2 = new SUSTechTime("10:00", "12:00", Weekday.Tuesday, WeekType.Every);
        SUSTechTime t3 = new SUSTechTime("14:00", "16:00", Weekday.Friday, WeekType.Odd);
        ArrayList<SUSTechTime> l1 = new ArrayList<SUSTechTime>();
        ArrayList<SUSTechTime> l2 = new ArrayList<SUSTechTime>();
        ArrayList<SUSTechTime> l3 = new ArrayList<SUSTechTime>();
        l1.add(t1);
        l1.add(t2);
        l2.add(t2);
        l2.add(t3);
        l3.add(t1);
        l3.add(t3);
        Course CS109_1 = new Course("Max", "Computer_programming", "CS109", 1, l1, 1); //the capacity is only one for demostration.
        Course MA101 = new Course("Alice", "Math", "MA101", 1, l2, 80);
        Course MA107 = new Course("Jack", "Linear_algebra", "MA107", 1, l3, 80);
        Student Anya = new Student(12711001);
        Student Jinrun = new Student(12011216);
        Anya.selectCourse(CS109_1, 40);
        Anya.selectCourse(MA101, 50);
        Jinrun.selectCourse(CS109_1, 35);
        Jinrun.selectCourse(MA107, 15);
        Administrator Kent = new Administrator();
        Kent.getDatabase().addCourse(CS109_1);
        Kent.getDatabase().addCourse(MA101);
        Kent.getDatabase().addCourse(MA107);
        Kent.addStudent(Anya);
        Kent.addStudent(Jinrun);
        Kent.generateCurriculum();
        ArrayList<Course> Anya_curriculum = Anya.getCurriculum();
        for(Course course: Anya_curriculum){
            System.out.println(course.getCourseID()+" "+course.getClassID());
        }
        System.out.println();
        ArrayList<Course> Jinrun_curriculum = Jinrun.getCurriculum();
        for(Course course: Jinrun_curriculum){
            System.out.println(course.getCourseID()+" "+course.getClassID());
        }
    }
}
