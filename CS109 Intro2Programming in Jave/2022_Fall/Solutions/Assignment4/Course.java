package Assignment4;

import java.util.ArrayList;

public class Course {
    private String teacherName;
    private String courseName;
    private String courseID;
    private int classID;
    private ArrayList<SUSTechTime> timeList;
    private int capacity;

    public Course(String teacherName, String courseName, String courseID, int classID, ArrayList<SUSTechTime> timeList, int capacity){
        this.teacherName=teacherName;
        this.courseName=courseName;
        this.courseID=courseID;
        this.classID=classID;
        this.capacity=capacity;
        this.timeList=timeList;
    }

    public String getCourseID() { return this.courseID; }
    public String getCourseName() { return this.courseName; }
    public int getClassID() { return this.classID; }
    public int getCapacity() { return this.capacity; }
    public String getTeacherName() { return this.teacherName; }
    public ArrayList<SUSTechTime> getTimeList() {return this.timeList; }

    public String toString() {
        return "Course{" + this.getCourseID() + " " + this.getCourseName() + "-class " + this.getClassID() + " | " + this.getCapacity() + "}";
    }
}