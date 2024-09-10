public class SilverCardMember extends Member {
    private double totalcost;
    private double points;
    public SilverCardMember(String info){
        super(info);
        totalcost = 0;
        points = 0;
    }

    @Override
    public String getGenderAgeCost() {
        return super.toString() + String.format(" %.1f",this.totalcost);
    }

    @Override
    public double getTotalCost() {
        return this.totalcost;
    }

    @Override
    public double consume(int amount) {
        double reward = 1.0, actualcost = 0;
        if(this.getTotalCost() >= 10000) reward = 1.5;

        if (amount > points) {
            actualcost = amount - points;
            points = 0;
        } else {
            points -= amount;
        }

        this.points += (amount / 30) * reward;
        this.totalcost += actualcost;
        return actualcost;
    }

    @Override
    public String toString() {
        return "SilverCardMember: " + super.toString() + String.format(" points=%.1f",this.points);
    }
}
