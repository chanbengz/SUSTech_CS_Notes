package Assignment4;

import java.util.ArrayList;

public class CourseDatabase {
    private ArrayList<Course> courseList = new ArrayList<Course>();
    public void addCourse(Course newCourse){ this.courseList.add(newCourse); }
    public void removeCourse(String courseID, int classID){ this.courseList.removeIf(e -> e.getCourseID().equals(courseID) && e.getClassID() == classID);; }
    public void removeCourse(Course course) { this.courseList.remove(course); }
    public ArrayList<Course> getCourseList() { return this.courseList; }
    public ArrayList<Course> searchCourseByID(String courseID) {
        ArrayList<Course> res = new ArrayList<Course>();
        this.courseList.forEach((e) -> {
            if(e.getCourseID().equals(courseID)) {
                res.add(e);
            }
        });
        return res;
    }
    public ArrayList<Course> searchCourseByTeacherName(String teacherName) {
        ArrayList<Course> res = new ArrayList<Course>();
        this.courseList.forEach((e) -> {
            if(e.getTeacherName().equals(teacherName)) {
                res.add(e);
            }
        });
        return res;
    }
    public ArrayList<Course> searchCourseByCourseName(String courseName) {
        ArrayList<Course> res = new ArrayList<Course>();
        this.courseList.forEach((e) -> {
            if(e.getCourseName().equals(courseName)) {
                res.add(e);
            }
        });
        return res;
    }
    public ArrayList<Course> searchCourseByCourseTime(String startTime, String endTime) {
        ArrayList<Course> res = new ArrayList<Course>();
        this.courseList.forEach((e) -> {
            e.getTimeList().forEach((f) -> {
                if(f.getStartTime().equals(startTime)&&f.getEndTime().equals(endTime)) {
                    res.add(e);
                }
            });
        });
        return res;
    }
}
