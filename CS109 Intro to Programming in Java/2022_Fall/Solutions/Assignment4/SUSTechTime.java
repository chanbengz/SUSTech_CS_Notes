package Assignment4;

enum WeekType{ Odd, Even, Every }
public class SUSTechTime {
    
    private WeekType weektype;
    private Weekday weekday;
    private String startTime;
    private String endTime;

    public SUSTechTime(String startTime, String endTime, Weekday weekday, WeekType weekType) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.weekday = weekday;
        this.weektype = weekType;
    }
    public String getStartTime() { return this.startTime; }
    public String getEndTime() { return this.endTime; }
    public Weekday getWeekday() { return this.weekday; }
    public WeekType getWeekType() { return this.weektype; }

    public String toString() {
        return "SUSTechTime{" + this.getStartTime() + " ~ " + this.getEndTime() + " | " + this.getWeekday()+ " | " + this.getWeekType() + " week}";
    }
}
