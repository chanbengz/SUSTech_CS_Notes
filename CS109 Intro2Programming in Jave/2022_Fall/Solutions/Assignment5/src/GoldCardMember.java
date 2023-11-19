public class GoldCardMember extends Member {
    private double totalcost;

    public GoldCardMember(String info) {
        super(info);
        totalcost = 0;
    }

    @Override
    public double consume(int amount) {
        double actualcost;
        if (amount <= 2000) {
            actualcost = amount;
        } else if(amount <= 5000) {
            actualcost = 2000 + (amount - 2000) * 0.95;
        } else if(amount <= 10000) {
            actualcost = 4850 + (amount - 5000) * 0.9;
        } else if(amount <= 20000) {
            actualcost = 9350 + (amount - 10000) * 0.85;
        } else {
            actualcost = 17850 + (amount - 20000) * 0.8;
        }
        this.totalcost += actualcost;
        return actualcost;
    }

    @Override
    public double getTotalCost() {
        return this.totalcost;
    }

    @Override
    public String getGenderAgeCost() {
        return super.toString() + String.format(" %.1f",this.totalcost);
    }

    @Override
    public String toString() {
        return "GoldCardMember: " + super.toString();
    }
}
