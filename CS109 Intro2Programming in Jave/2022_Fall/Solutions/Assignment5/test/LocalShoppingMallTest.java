import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;


@TestMethodOrder(MethodOrderer.Alphanumeric.class)
public class LocalShoppingMallTest {

    @Test
    void testAddOrGetMember() {
        ShoppingMall shoppingMall = new ConcreteShoppingMall();
        shoppingMall.addMember("M01 F 29 S");
        shoppingMall.addMember("M02 M 40 G");
        shoppingMall.addMember("M03 F 39 S");
        List<String> members = new ArrayList<>();
        members.add("M04 M 50 S");
        members.add("M10 M 25 S");
        members.add("M22 F 55 G");
        shoppingMall.addMember(members);
        assertEquals("SilverCardMember: M01 F 29 points=0.0", shoppingMall.getMember("M01").toString());
        assertEquals("GoldCardMember: M02 M 40", shoppingMall.getMember("M02").toString());
        assertEquals("SilverCardMember: M03 F 39 points=0.0", shoppingMall.getMember("M03").toString());
        assertEquals("SilverCardMember: M04 M 50 points=0.0", shoppingMall.getMember("M04").toString());
        assertEquals("SilverCardMember: M10 M 25 points=0.0", shoppingMall.getMember("M10").toString());
        assertEquals("GoldCardMember: M22 F 55", shoppingMall.getMember("M22").toString());
    }



    @Test
    void testExample() {
        List<String> records;
        ShoppingMall shoppingMall = new ConcreteShoppingMall();
        shoppingMall.addMember("M01 F 29 S");
        shoppingMall.addMember("M02 M 40 G");
        shoppingMall.addMember("M03 F 39 S");
        List<String> members = new ArrayList<>();
        members.add("M04 M 50 S");
        members.add("M10 M 25 S");
        members.add("M22 F 55 G");
        shoppingMall.addMember(members);


        assertEquals(8000, shoppingMall.placeOrder("M01", 8000, ProductCategory.WATCH));
        assertEquals(2734, shoppingMall.placeOrder("M01", 3000, ProductCategory.DIGITAL_PRODUCT));
        assertEquals(1900, shoppingMall.placeOrder("M01", 2000, ProductCategory.LUGGAGE));
        assertEquals(2950, shoppingMall.placeOrder("M02", 3000, ProductCategory.PERFUME));
        assertEquals(19450, shoppingMall.placeOrder("M02", 22000, ProductCategory.DIGITAL_PRODUCT));
        assertEquals(2760, shoppingMall.placeOrder("M02", 2800, ProductCategory.DRINKS));
        assertEquals(9000, shoppingMall.placeOrder("M04", 9000, ProductCategory.JEWELRY));
        assertEquals(6300, shoppingMall.placeOrder("M10", 6300, ProductCategory.SKINCARE));

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(out);
        records = shoppingMall.getMemberRecords("M01");
        assertEquals(3, records.size());
        Collections.sort(records);
        assertEquals("M01 WATCH 8000 8000", records.get(2).trim());
        assertEquals("M01 DIGITAL_PRODUCT 3000 2734", records.get(0).trim());
        assertEquals("M01 LUGGAGE 2000 1900", records.get(1).trim());

        records = shoppingMall.getMemberRecords("M02");
        assertEquals(3, records.size());
        Collections.sort(records);
        assertEquals("M02 PERFUME 3000 2950", records.get(2).trim());
        assertEquals("M02 DIGITAL_PRODUCT 22000 19450", records.get(0).trim());
        assertEquals("M02 DRINKS 2800 2760", records.get(1).trim());

        records = shoppingMall.getMemberRecords("M04");
        assertEquals(1, records.size());
        Collections.sort(records);
        assertEquals("M04 JEWELRY 9000 9000", records.get(0).trim());
        records = shoppingMall.getMemberRecords("M10");
        assertEquals(1, records.size());
        Collections.sort(records);
        assertEquals("M10 SKINCARE 6300 6300", records.get(0).trim());
        records = shoppingMall.getMemberRecords("M22");
        Collections.sort(records);
        assertEquals(0, records.size());

        records = shoppingMall.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 1 6300", records.get(0).trim());
        assertEquals("DIGITAL_PRODUCT 2 22184", records.get(1).trim());
        assertEquals("WATCH 1 8000", records.get(2).trim());
        assertEquals("JEWELRY 1 9000", records.get(3).trim());
        assertEquals("DRINKS 1 2760", records.get(4).trim());
        assertEquals("LUGGAGE 1 1900", records.get(5).trim());
        assertEquals("PERFUME 1 2950", records.get(6).trim());

        shoppingMall.addMember("MS1 M 22 S");
        shoppingMall.addMember("MS2 M 22 S");
        shoppingMall.placeOrder("MS1", 1000, ProductCategory.DRINKS);
        shoppingMall.placeOrder("MS1", 100, ProductCategory.DRINKS);
        shoppingMall.placeOrder("MS2", 1100, ProductCategory.DRINKS);

        records = shoppingMall.getMemberRecordByGenderAndAge('M', 20, 40);
        assertEquals(4, records.size());
        assertEquals("MS2 M 22 1100.0", records.get(0).trim());
        assertEquals("MS1 M 22 1067.0", records.get(1).trim());
        assertEquals("M10 M 25 6300.0", records.get(2).trim());
        assertEquals("M02 M 40 25160.0", records.get(3).trim());

        assertEquals(12634, (int) shoppingMall.getTotalCost("M01"));
        assertEquals(25160, (int) shoppingMall.getTotalCost("M02"));
        assertEquals(55261, (int) shoppingMall.getTotalIncome());
    }

    @Test
    void testSimple0() {
        double tmpDouble;
        List<String> records;
        ShoppingMall m = new ConcreteShoppingMall();
        m.addMember("M01 F 90 G");
        assertEquals("GoldCardMember: M01 F 90", m.getMember("M01").toString().trim());
        assertEquals(7255, (int) (m.placeOrder("M01", 7673, ProductCategory.WATCH)));
        assertEquals(8335, (int) (m.placeOrder("M01", 8873, ProductCategory.LUGGAGE)));
        records = m.getMemberRecords("M01");
        Collections.sort(records);
        assertEquals(2, records.size());
        assertEquals("M01 LUGGAGE 8873 8336", records.get(0).toString().trim());
        assertEquals("M01 WATCH 7673 7256", records.get(1).toString().trim());
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 0 0", records.get(1).toString().trim());
        assertEquals("WATCH 1 7256", records.get(2).toString().trim());
        assertEquals("JEWELRY 0 0", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 1 8336", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        records = m.getMemberRecordByGenderAndAge('F', 1, 100);
        assertEquals(1, records.size());
        assertEquals("M01 F 90 15591.4", records.get(0).toString().trim());
        records = m.getMemberRecordByGenderAndAge('M', 1, 100);
        assertEquals(0, records.size());
        tmpDouble = m.getTotalCost("M01");
        assertEquals(String.format("%.2f", 15591.400000000001), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalIncome();
        assertEquals(String.format("%.2f", 15591.4), String.format("%.2f", tmpDouble));
    }


    @Test
    void testSimple1() {
        double tmpDouble;
        List<String> records;
        ShoppingMall m1 = new ConcreteShoppingMall();
        m1.addMember("M01 M 57 S");
        m1.addMember(Arrays.asList("M02 F 62 S", "M03 F 57 G"));
        assertEquals("SilverCardMember: M01 M 57 points=0.0", m1.getMember("M01").toString().trim());
        assertEquals("SilverCardMember: M02 F 62 points=0.0", m1.getMember("M02").toString().trim());
        assertEquals("GoldCardMember: M03 F 57", m1.getMember("M03").toString().trim());
        assertNull(m1.getMember("M04"));
        assertNull(m1.getMember("M05"));
        assertNull(m1.getMember("M06"));
        assertEquals(1933, (int) m1.placeOrder("M01", 1933, ProductCategory.WATCH));
        assertEquals(5799, (int) m1.placeOrder("M01", 5863, ProductCategory.DIGITAL_PRODUCT));
        assertEquals(2924, (int) m1.placeOrder("M01", 3119, ProductCategory.WATCH));
        assertEquals(7000, (int) m1.placeOrder("M02", 7000, ProductCategory.SKINCARE));
        assertEquals(9148, (int) m1.placeOrder("M02", 9381, ProductCategory.WATCH));
        assertEquals(6802, (int) m1.placeOrder("M02", 7114, ProductCategory.PERFUME));
        records = m1.getMemberRecords("M01");
        Collections.sort(records);
        assertEquals(3, records.size());
        assertEquals("M01 DIGITAL_PRODUCT 5863 5799", records.get(0).toString().trim());
        assertEquals("M01 WATCH 1933 1933", records.get(1).toString().trim());
        assertEquals("M01 WATCH 3119 2924", records.get(2).toString().trim());
        records = m1.getMemberRecords("M02");
        Collections.sort(records);
        assertEquals(3, records.size());
        assertEquals("M02 PERFUME 7114 6802", records.get(0).toString().trim());
        assertEquals("M02 SKINCARE 7000 7000", records.get(1).toString().trim());
        assertEquals("M02 WATCH 9381 9148", records.get(2).toString().trim());
        records = m1.getMemberRecords("M03");
        Collections.sort(records);
        assertEquals(0, records.size());
        records = m1.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 1 7000", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 5799", records.get(1).toString().trim());
        assertEquals("WATCH 3 14005", records.get(2).toString().trim());
        assertEquals("JEWELRY 0 0", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 0 0", records.get(5).toString().trim());
        assertEquals("PERFUME 1 6802", records.get(6).toString().trim());
        records = m1.getMemberRecordByGenderAndAge('F', 1, 100);
        assertEquals(1, records.size());
        assertEquals("M02 F 62 22950.0", records.get(0).toString().trim());
        records = m1.getMemberRecordByGenderAndAge('M', 1, 100);
        assertEquals(1, records.size());
        assertEquals("M01 M 57 10656.0", records.get(0).toString().trim());
        tmpDouble = m1.getTotalCost("M01");
        assertEquals(String.format("%.2f", 10656.0), String.format("%.2f", tmpDouble));
        tmpDouble = m1.getTotalCost("M02");
        assertEquals(String.format("%.2f", 22950.0), String.format("%.2f", tmpDouble));
        tmpDouble = m1.getTotalCost("M03");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        tmpDouble = m1.getTotalIncome();
        assertEquals(String.format("%.2f", 33606.0), String.format("%.2f", tmpDouble));
    }

    @Test
    void testmedium0() {
        double tmpDouble;
        List<String> records;
        ShoppingMall m = new ConcreteShoppingMall();
        assertNull(m.getMember("M76"));
        m.addMember("M73 M 24 S");
        m.addMember("M32 M 11 S");
        m.addMember("M10 M 55 G");
        m.addMember("M83 F 42 G");
        m.addMember("M36 M 75 G");
        m.addMember("M63 M 50 S");
        m.addMember("M59 M 90 S");
        m.addMember("M35 M 13 S");
        m.addMember(Arrays.asList("M43 M 49 G", "M75 M 7 S", "M40 F 37 S", "M28 M 58 G"));
        m.addMember(Arrays.asList("M81 F 20 S", "M16 F 47 S", "M12 F 79 G"));
        assertEquals(9406, (int) m.placeOrder("M40", 9406, ProductCategory.PERFUME));
        assertEquals(9510, (int) m.placeOrder("M73", 9510, ProductCategory.DIGITAL_PRODUCT));
        assertEquals(5441, (int) m.placeOrder("M32", 5441, ProductCategory.LUGGAGE));
        assertEquals(2857, (int) m.placeOrder("M73", 3174, ProductCategory.SKINCARE));
        assertEquals(1767, (int) m.placeOrder("M10", 1767, ProductCategory.DRINKS));
        assertEquals(4584, (int) m.placeOrder("M12", 4721, ProductCategory.SKINCARE));
        assertEquals(5876, (int) m.placeOrder("M35", 5876, ProductCategory.JEWELRY));
        assertEquals(157, (int) m.placeOrder("M75", 157, ProductCategory.DRINKS));
        assertEquals(8769, (int) m.placeOrder("M10", 9355, ProductCategory.SKINCARE));
        assertEquals(7253, (int) m.placeOrder("M81", 7253, ProductCategory.LUGGAGE));
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 3 16211", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 9510", records.get(1).toString().trim());
        assertEquals("WATCH 0 0", records.get(2).toString().trim());
        assertEquals("JEWELRY 1 5876", records.get(3).toString().trim());
        assertEquals("DRINKS 2 1924", records.get(4).toString().trim());
        assertEquals("LUGGAGE 2 12694", records.get(5).toString().trim());
        assertEquals("PERFUME 1 9406", records.get(6).toString().trim());
        tmpDouble = m.getTotalIncome();
        assertEquals(String.format("%.2f", 55621.45), String.format("%.2f", tmpDouble));
        assertEquals(6709, (int) m.placeOrder("M28", 7066, ProductCategory.DRINKS));
        assertEquals(3703, (int) m.placeOrder("M75", 3708, ProductCategory.JEWELRY));
        assertEquals(8819, (int) m.placeOrder("M40", 9132, ProductCategory.DIGITAL_PRODUCT));
        assertEquals(3888, (int) m.placeOrder("M81", 4129, ProductCategory.PERFUME));
        assertEquals(826, (int) m.placeOrder("M10", 826, ProductCategory.LUGGAGE));
        assertEquals(8475, (int) m.placeOrder("M32", 8656, ProductCategory.WATCH));
        assertEquals(7518, (int) m.placeOrder("M75", 7641, ProductCategory.LUGGAGE));
        assertEquals(6752, (int) m.placeOrder("M81", 6889, ProductCategory.LUGGAGE));
        assertEquals(1946, (int) m.placeOrder("M81", 2290, ProductCategory.LUGGAGE));
        assertEquals(430, (int) m.placeOrder("M63", 430, ProductCategory.DIGITAL_PRODUCT));
        assertEquals("GoldCardMember: M43 M 49", m.getMember("M43").toString().trim());
        assertEquals("SilverCardMember: M35 M 13 points=195.0", m.getMember("M35").toString().trim());
        assertEquals("GoldCardMember: M83 F 42", m.getMember("M83").toString().trim());
        assertNull(m.getMember("M45"));
        assertEquals("SilverCardMember: M63 M 50 points=14.0", m.getMember("M63").toString().trim());
        assertEquals("SilverCardMember: M35 M 13 points=195.0", m.getMember("M35").toString().trim());
        assertNull(m.getMember("M94"));
        assertNull(m.getMember("M98"));
        assertEquals("SilverCardMember: M75 M 7 points=254.0", m.getMember("M75").toString().trim());
        assertNull(m.getMember("M93"));
        assertEquals("GoldCardMember: M83 F 42", m.getMember("M83").toString().trim());
        assertEquals("SilverCardMember: M32 M 11 points=288.0", m.getMember("M32").toString().trim());
        assertEquals("GoldCardMember: M43 M 49", m.getMember("M43").toString().trim());
        assertEquals("SilverCardMember: M59 M 90 points=0.0", m.getMember("M59").toString().trim());
        assertEquals("SilverCardMember: M75 M 7 points=254.0", m.getMember("M75").toString().trim());
        assertNull(m.getMember("M24"));
        assertNull(m.getMember("M04"));
        assertNull(m.getMember("M42"));
        assertNull(m.getMember("M82"));
        assertNull(m.getMember("M02"));
        assertEquals(5748, (int) m.placeOrder("M10", 5998, ProductCategory.LUGGAGE));
        assertEquals(3337, (int) m.placeOrder("M35", 3532, ProductCategory.DRINKS));
        assertEquals(3764, (int) m.placeOrder("M43", 3857, ProductCategory.JEWELRY));
        assertEquals(1298, (int) m.placeOrder("M59", 1298, ProductCategory.LUGGAGE));
        assertEquals(1895, (int) m.placeOrder("M75", 2149, ProductCategory.JEWELRY));
        assertEquals(277, (int) m.placeOrder("M40", 581, ProductCategory.PERFUME));
        assertEquals(6489, (int) m.placeOrder("M35", 6606, ProductCategory.WATCH));
        assertEquals(2381, (int) m.placeOrder("M75", 2488, ProductCategory.DRINKS));
        assertEquals(7325, (int) m.placeOrder("M12", 7751, ProductCategory.LUGGAGE));
        assertEquals(19, (int) m.placeOrder("M40", 48, ProductCategory.JEWELRY));
        assertEquals(4705, (int) m.placeOrder("M43", 4848, ProductCategory.LUGGAGE));
        assertEquals(4652, (int) m.placeOrder("M83", 4792, ProductCategory.PERFUME));
        assertEquals(2251, (int) m.placeOrder("M40", 2253, ProductCategory.WATCH));
        assertEquals(9233, (int) m.placeOrder("M36", 9870, ProductCategory.DRINKS));
        assertEquals(5534, (int) m.placeOrder("M12", 5761, ProductCategory.WATCH));
        assertEquals(2265, (int) m.placeOrder("M43", 2279, ProductCategory.PERFUME));
        assertEquals(6655, (int) m.placeOrder("M35", 6875, ProductCategory.JEWELRY));
        assertEquals(4075, (int) m.placeOrder("M32", 4363, ProductCategory.WATCH));
        assertEquals(5978, (int) m.placeOrder("M10", 6254, ProductCategory.LUGGAGE));
        assertEquals(4421, (int) m.placeOrder("M12", 4549, ProductCategory.WATCH));
        records = m.getMemberRecords("M36");
        Collections.sort(records);
        assertEquals(1, records.size());
        assertEquals("M36 DRINKS 9870 9233", records.get(0).toString().trim());
        records = m.getMemberRecords("M73");
        Collections.sort(records);
        assertEquals(2, records.size());
        assertEquals("M73 DIGITAL_PRODUCT 9510 9510", records.get(0).toString().trim());
        assertEquals("M73 SKINCARE 3174 2857", records.get(1).toString().trim());
        records = m.getMemberRecords("M12");
        Collections.sort(records);
        assertEquals(4, records.size());
        assertEquals("M12 LUGGAGE 7751 7326", records.get(0).toString().trim());
        assertEquals("M12 SKINCARE 4721 4585", records.get(1).toString().trim());
        assertEquals("M12 WATCH 4549 4422", records.get(2).toString().trim());
        assertEquals("M12 WATCH 5761 5535", records.get(3).toString().trim());
        records = m.getMemberRecords("M59");
        Collections.sort(records);
        assertEquals(1, records.size());
        assertEquals("M59 LUGGAGE 1298 1298", records.get(0).toString().trim());
        records = m.getMemberRecords("M10");
        Collections.sort(records);
        assertEquals(5, records.size());
        assertEquals("M10 DRINKS 1767 1767", records.get(0).toString().trim());
        assertEquals("M10 LUGGAGE 5998 5748", records.get(1).toString().trim());
        assertEquals("M10 LUGGAGE 6254 5979", records.get(2).toString().trim());
        assertEquals("M10 LUGGAGE 826 826", records.get(3).toString().trim());
        assertEquals("M10 SKINCARE 9355 8770", records.get(4).toString().trim());
        records = m.getMemberRecords("M16");
        Collections.sort(records);
        assertEquals(0, records.size());
        records = m.getMemberRecords("M63");
        Collections.sort(records);
        assertEquals(1, records.size());
        assertEquals("M63 DIGITAL_PRODUCT 430 430", records.get(0).toString().trim());
        records = m.getMemberRecords("M75");
        Collections.sort(records);
        assertEquals(5, records.size());
        assertEquals("M75 DRINKS 157 157", records.get(0).toString().trim());
        assertEquals("M75 DRINKS 2488 2382", records.get(1).toString().trim());
        assertEquals("M75 JEWELRY 2149 1895", records.get(2).toString().trim());
        assertEquals("M75 JEWELRY 3708 3703", records.get(3).toString().trim());
        assertEquals("M75 LUGGAGE 7641 7518", records.get(4).toString().trim());
        records = m.getMemberRecords("M12");
        Collections.sort(records);
        assertEquals(4, records.size());
        assertEquals("M12 LUGGAGE 7751 7326", records.get(0).toString().trim());
        assertEquals("M12 SKINCARE 4721 4585", records.get(1).toString().trim());
        assertEquals("M12 WATCH 4549 4422", records.get(2).toString().trim());
        assertEquals("M12 WATCH 5761 5535", records.get(3).toString().trim());
        records = m.getMemberRecords("M81");
        Collections.sort(records);
        assertEquals(4, records.size());
        assertEquals("M81 LUGGAGE 2290 1947", records.get(0).toString().trim());
        assertEquals("M81 LUGGAGE 6889 6752", records.get(1).toString().trim());
        assertEquals("M81 LUGGAGE 7253 7253", records.get(2).toString().trim());
        assertEquals("M81 PERFUME 4129 3888", records.get(3).toString().trim());
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 3 16211", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 3 18759", records.get(1).toString().trim());
        assertEquals("WATCH 6 31247", records.get(2).toString().trim());
        assertEquals("JEWELRY 6 21913", records.get(3).toString().trim());
        assertEquals("DRINKS 6 23585", records.get(4).toString().trim());
        assertEquals("LUGGAGE 11 54793", records.get(5).toString().trim());
        assertEquals("PERFUME 5 20488", records.get(6).toString().trim());
        records = m.getMemberRecordByGenderAndAge('F', 85, 87);
        assertEquals(0, records.size());
        records = m.getMemberRecordByGenderAndAge('M', 31, 75);
        assertEquals(5, records.size());
        assertEquals("M43 M 49 10734.8", records.get(0).toString().trim());
        assertEquals("M63 M 50 430.0", records.get(1).toString().trim());
        assertEquals("M10 M 55 23089.3", records.get(2).toString().trim());
        assertEquals("M28 M 58 6709.4", records.get(3).toString().trim());
        assertEquals("M36 M 75 9233.0", records.get(4).toString().trim());
        records = m.getMemberRecordByGenderAndAge('M', 74, 98);
        assertEquals(2, records.size());
        assertEquals("M36 M 75 9233.0", records.get(0).toString().trim());
        assertEquals("M59 M 90 1298.0", records.get(1).toString().trim());
        records = m.getMemberRecordByGenderAndAge('F', 35, 49);
        assertEquals(2, records.size());
        assertEquals("M40 F 37 20773.0", records.get(0).toString().trim());
        assertEquals("M83 F 42 4652.4", records.get(1).toString().trim());
        records = m.getMemberRecordByGenderAndAge('F', 40, 42);
        assertEquals(1, records.size());
        assertEquals("M83 F 42 4652.4", records.get(0).toString().trim());
        records = m.getMemberRecordByGenderAndAge('F', 1, 49);
        assertEquals(3, records.size());
        assertEquals("M81 F 20 19839.5", records.get(0).toString().trim());
        assertEquals("M40 F 37 20773.0", records.get(1).toString().trim());
        assertEquals("M83 F 42 4652.4", records.get(2).toString().trim());
        tmpDouble = m.getTotalCost("M12");
        assertEquals(String.format("%.2f", 21867.3), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M10");
        assertEquals(String.format("%.2f", 23089.300000000003), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M40");
        assertEquals(String.format("%.2f", 20773.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M16");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M36");
        assertEquals(String.format("%.2f", 9233.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M73");
        assertEquals(String.format("%.2f", 12367.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M10");
        assertEquals(String.format("%.2f", 23089.300000000003), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M73");
        assertEquals(String.format("%.2f", 12367.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M10");
        assertEquals(String.format("%.2f", 23089.300000000003), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalCost("M59");
        assertEquals(String.format("%.2f", 1298.0), String.format("%.2f", tmpDouble));
        tmpDouble = m.getTotalIncome();
        assertEquals(String.format("%.2f", 186996.20), String.format("%.2f", tmpDouble));
    }

    @Test
    void testRandom() {
        double tmpDouble;
        List<String> records;
        ShoppingMall m = new ConcreteShoppingMall();
        assertNull(m.getMember("M42"));
        assertNull(m.getMember("M73"));
        m.addMember("M47 F 89 G");
        m.addMember("M96 F 2 G");
        m.addMember("M45 F 1 S");
        m.addMember("M97 F 83 G");
        m.addMember("M33 M 45 S");
        m.addMember("M60 F 62 S");
        m.addMember("M24 M 94 G");
        m.addMember("M02 M 50 G");
        m.addMember("M09 M 1 S");
        m.addMember("M26 F 8 S");
        assertEquals("SilverCardMember: M09 M 1 points=0.0", m.getMember("M09").toString().trim());
        tmpDouble = m.getTotalCost("M47");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        m.addMember("M52 M 43 S");
        m.addMember(Arrays.asList("M29 F 88 S", "M11 M 92 G", "M25 F 14 G", "M28 F 77 G"));
        assertNull(m.getMember("M30"));
        m.addMember("M43 F 73 S");
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 0 0", records.get(1).toString().trim());
        assertEquals("WATCH 0 0", records.get(2).toString().trim());
        assertEquals("JEWELRY 0 0", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 0 0", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        records = m.getMemberRecordByGenderAndAge('M', 29, 34);
        assertEquals(0, records.size());
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 0 0", records.get(1).toString().trim());
        assertEquals("WATCH 0 0", records.get(2).toString().trim());
        assertEquals("JEWELRY 0 0", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 0 0", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        assertNull(m.getMember("M49"));
        m.addMember("M76 F 48 S");
        assertEquals("GoldCardMember: M25 F 14", m.getMember("M25").toString().trim());
        records = m.getMemberRecords("M97");
        Collections.sort(records);
        assertEquals(0, records.size());
        assertEquals(7201, (int) m.placeOrder("M29", 7201, ProductCategory.DIGITAL_PRODUCT));
        m.addMember("M50 M 3 S");
        records = m.getMemberRecords("M96");
        Collections.sort(records);
        assertEquals(0, records.size());
        records = m.getMemberRecordByGenderAndAge('M', 33, 34);
        assertEquals(0, records.size());
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 7201", records.get(1).toString().trim());
        assertEquals("WATCH 0 0", records.get(2).toString().trim());
        assertEquals("JEWELRY 0 0", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 0 0", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        assertNull(m.getMember("M86"));
        records = m.getMemberRecordByGenderAndAge('M', 18, 48);
        assertEquals(0, records.size());
        m.addMember("M70 F 14 G");
        tmpDouble = m.getTotalCost("M47");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        assertEquals("SilverCardMember: M45 F 1 points=0.0", m.getMember("M45").toString().trim());
        assertNull(m.getMember("M21"));
        records = m.getMemberRecords("M45");
        Collections.sort(records);
        assertEquals(0, records.size());
        assertEquals(9188, (int) m.placeOrder("M45", 9188, ProductCategory.JEWELRY));
        tmpDouble = m.getTotalCost("M52");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        assertNull(m.getMember("M66"));
        assertEquals(6586, (int) (m.placeOrder("M97", 6929, ProductCategory.LUGGAGE)));
        assertEquals("SilverCardMember: M45 F 1 points=306.0", m.getMember("M45").toString().trim());
        assertEquals("GoldCardMember: M02 M 50", m.getMember("M02").toString().trim());
        assertEquals(4968, (int) m.placeOrder("M28", 5132, ProductCategory.LUGGAGE));
        m.addMember("M12 F 56 S");
        m.addMember(Arrays.asList("M37 F 82 S", "M79 F 73 G"));
        records = m.getMemberRecordByGenderAndAge('M', 20, 56);
        assertEquals(0, records.size());
        assertEquals(2038, (int) m.placeOrder("M79", 2040, ProductCategory.LUGGAGE));
        assertEquals(5872, (int) m.placeOrder("M96", 6136, ProductCategory.LUGGAGE));
        assertEquals("GoldCardMember: M79 F 73", m.getMember("M79").toString().trim());
        m.addMember("M58 M 16 S");
        assertEquals(7743, (int) m.placeOrder("M11", 8215, ProductCategory.WATCH));
        assertNull(m.getMember("M64"));
        records = m.getMemberRecords("M28");
        Collections.sort(records);
        assertEquals(1, records.size());
        assertEquals("M28 LUGGAGE 5132 4969", records.get(0).toString().trim());
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 7201", records.get(1).toString().trim());
        assertEquals("WATCH 1 7744", records.get(2).toString().trim());
        assertEquals("JEWELRY 1 9188", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 4 19465", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        assertEquals(9209, (int) m.placeOrder("M28", 9844, ProductCategory.LUGGAGE));
        tmpDouble = m.getTotalCost("M37");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 7201", records.get(1).toString().trim());
        assertEquals("WATCH 1 7744", records.get(2).toString().trim());
        assertEquals("JEWELRY 1 9188", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 5 28675", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        tmpDouble = m.getTotalCost("M58");
        assertEquals(String.format("%.2f", 0.0), String.format("%.2f", tmpDouble));
        records = m.getCostByCategory();
        assertEquals(7, records.size());
        assertEquals("SKINCARE 0 0", records.get(0).toString().trim());
        assertEquals("DIGITAL_PRODUCT 1 7201", records.get(1).toString().trim());
        assertEquals("WATCH 1 7744", records.get(2).toString().trim());
        assertEquals("JEWELRY 1 9188", records.get(3).toString().trim());
        assertEquals("DRINKS 0 0", records.get(4).toString().trim());
        assertEquals("LUGGAGE 5 28675", records.get(5).toString().trim());
        assertEquals("PERFUME 0 0", records.get(6).toString().trim());
        m.addMember("M14 F 64 G");
        m.addMember(Arrays.asList("M05 M 2 S", "M31 M 82 G", "M54 M 87 G"));
        records = m.getMemberRecordByGenderAndAge('M', 52, 94);
        assertEquals(1, records.size());
        assertEquals("M11 M 92 7743.5", records.get(0).toString().trim());
        records = m.getMemberRecords("M76");
        Collections.sort(records);
        assertEquals(0, records.size());
        m.addMember("M27 F 82 G");
    }

    @Test
    void testDefinedFieldAndMethod() throws NoSuchFieldException, NoSuchMethodException {
        Field members = ConcreteShoppingMall.class.getDeclaredField("members");
        ParameterizedType t = (ParameterizedType) members.getGenericType();
        assertEquals(List.class, t.getRawType());
        assertEquals(Member.class, t.getActualTypeArguments()[0]);

        Method addMembers = ShoppingMall.class.getDeclaredMethod("addMember", List.class);
        Method addMember = ShoppingMall.class.getDeclaredMethod("addMember", String.class);
        assertEquals(void.class, addMembers.getReturnType());
        assertEquals(void.class, addMember.getReturnType());

        Method getMember = ShoppingMall.class.getDeclaredMethod("getMember", String.class);
        Method placeOrder = ShoppingMall.class.getDeclaredMethod("placeOrder", String.class, int.class, ProductCategory.class);
        Method getMemberRecords = ShoppingMall.class.getDeclaredMethod("getMemberRecords", String.class);
        Method getCostByCategory = ShoppingMall.class.getDeclaredMethod("getCostByCategory");
        Method getMemberRecordByGenderAndAge = ShoppingMall.class.getDeclaredMethod("getMemberRecordByGenderAndAge", char.class, int.class, int.class);
        Method getTotalCost = ShoppingMall.class.getDeclaredMethod("getTotalCost", String.class);
        Method getTotalIncome = ShoppingMall.class.getDeclaredMethod("getTotalIncome");

        assertEquals(Member.class, getMember.getReturnType());
        assertEquals(double.class, placeOrder.getReturnType());
        assertEquals(List.class, getMemberRecords.getReturnType());
        assertEquals(List.class, getCostByCategory.getReturnType());
        assertEquals(List.class, getMemberRecordByGenderAndAge.getReturnType());
        assertEquals(double.class, getTotalCost.getReturnType());
        assertEquals(double.class, getTotalIncome.getReturnType());
    }

    @Test
    void testPolymorphism() throws NoSuchFieldException, IllegalAccessException {
        ShoppingMall shoppingMall = new ConcreteShoppingMall();
        Member member = new TestMember("M01 F 89 M");
        Field memberListField = ConcreteShoppingMall.class.getDeclaredField("members");
        memberListField.setAccessible(true);
        Object memberListObj = memberListField.get(shoppingMall);
        memberListField.setAccessible(false);
        List<Member> memberList = (List<Member>) memberListObj;
        memberList.add(member);
        assertEquals("M01 F 89", shoppingMall.getMember("M01").toString().trim());
        assertEquals(25, (int) shoppingMall.placeOrder("M01", 50, ProductCategory.DRINKS));
    }

    static class TestMember extends Member {

        public TestMember(String info) {
            super(info);
        }

        @Override
        public double consume(int amount) {
            return amount / 2.0;
        }
    }


}

