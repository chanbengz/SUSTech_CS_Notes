package Assignment4;

import java.util.ArrayList;

public class Student {
    private int studentID;
    private ArrayList<Course> curriculum = new ArrayList<Course>();
    private int remainingCredit = 100;
    private ArrayList<Integer> selectedCredit = new ArrayList<Integer>();
    public Student(int studentID) {
        this.studentID = studentID;
    }
    public int getStudentID() { return this.studentID; }
    public ArrayList<Integer> getCredit() { return this.selectedCredit; }
    public ArrayList<Course> getCurriculum() { return this.curriculum; }
    public boolean selectCourse(Course course, int credit) {
        if(credit > this.remainingCredit || this.curriculum.contains(course)) return false;
        else if(TimeConflict(course)) {
            return false;
        } else {
            this.remainingCredit -= credit;
            this.curriculum.add(course);
            this.selectedCredit.add(credit);
            return true;
        }
    }
    private boolean TimeConflict(Course selected) {
        for(Course e : this.curriculum){
            for(SUSTechTime t : e.getTimeList()){
                if(selected.getTimeList().contains(t)) return true;
            }
        }
            
        return false;
    }
    public void dropCourse(Course course) {
        if(this.curriculum.contains(course)) {
            int index = this.curriculum.indexOf(course);
            this.remainingCredit -= this.selectedCredit.get(index);
            this.curriculum.remove(course);
            this.selectedCredit.remove(index);
        }
    }
    public void changeCredit(Course course, int credit) {
        if(this.curriculum.contains(course) && credit <= this.remainingCredit){
            int index = this.curriculum.indexOf(course);
            this.remainingCredit += this.selectedCredit.get(index) - credit;
            this.selectedCredit.set(index, credit);
        }
    }
}
