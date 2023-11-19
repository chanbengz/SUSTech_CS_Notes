public abstract class Member implements Comparable {
    private String memberId;
    private char gender;
    private int age;

    public Member(String info){
        String temp[] = info.split(" ");
        this.memberId = temp[0];
        this.gender = temp[1].charAt(0);
        this.age = Integer.parseInt(temp[2]);
    }
    public abstract double consume(int amount);

    public double getTotalCost() {
        return 0;
    }

    public String getGenderAgeCost() {
        return null;
    }

    public String getMemberId() {
        return this.memberId;
    }

    public int getAge() {
        return this.age;
    }

    public char getGender() {
        return this.gender;
    }

    @Override
    public int compareTo(Object o) {
        Member m = (Member) o;
        if (this.getAge() == m.getAge()) {
            return this.getTotalCost() < m.getTotalCost() ? 1 : -1;
        } else {
            return this.getAge() > m.getAge() ? 1 : -1;
        }
    }

    @Override
    public String toString() {
        return String.format("%s %c %d", this.memberId, this.gender, this.age);
    }
}
