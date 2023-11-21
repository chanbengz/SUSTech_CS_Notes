import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import static org.junit.jupiter.api.Assertions.assertEquals;

@TestMethodOrder(MethodOrderer.Alphanumeric.class)
public class LocalMemberTest {
    static Member m1, m2;

    @Test
    void testSilverCardMemberConsume() {
        m1 = new SilverCardMember("H01 F 35 S");
        assertEquals( String.format("%.2f",2000.0),String.format("%.2f", m1.consume(2000)));
        assertEquals( String.format("%.2f", 2934.0),String.format("%.2f", m1.consume(3000)));
        assertEquals( String.format("%.2f",5900.0),String.format("%.2f", m1.consume(6000)));
        assertEquals( String.format("%.2f",2800.0),String.format("%.2f", m1.consume(3000)));
        assertEquals( String.format("%.2f",3850.0),String.format("%.2f", m1.consume(4000)));
        assertEquals( String.format("%.2f",0.0),String.format("%.2f", m1.consume(50)));
        assertEquals( String.format("%.2f",17484.0),String.format("%.2f", m1.getTotalCost()));
        assertEquals("H01 F 35 17484.0", m1.getGenderAgeCost().trim());
        assertEquals("SilverCardMember: H01 F 35 points=151.0", m1.toString().trim());
    }

    @Test
    void testGoldCardMemberConsume() {
        m2 = new GoldCardMember("C001 M 54 G");

        assertEquals(String.format("%.2f", 2000.0), String.format("%.2f", m2.consume(2000)));
        assertEquals(String.format("%.2f", 2950.0), String.format("%.2f", m2.consume(3000)));
        assertEquals(String.format("%.2f", 4850.0), String.format("%.2f", m2.consume(5000)));
        assertEquals(String.format("%.2f", 7550.0), String.format("%.2f", m2.consume(8000)));
        assertEquals(String.format("%.2f", 11050.0), String.format("%.2f", m2.consume(12000)));
        assertEquals(String.format("%.2f", 16150.0), String.format("%.2f", m2.consume(18000)));
        assertEquals(String.format("%.2f", 33850.0), String.format("%.2f", m2.consume(40000)));

        assertEquals(String.format("%.2f", 78400.0), String.format("%.2f", m2.getTotalCost()));

        assertEquals("C001 M 54 78400.0", m2.getGenderAgeCost().trim());
        assertEquals("GoldCardMember: C001 M 54", m2.toString().trim());
    }
    @Test
    void testGetGenderAgeCostAndToString() {

        Member m = new SilverCardMember("M01 F 33 S");
        m.consume(5000);
        m.consume(3000);
        m.consume(2000);
        m.consume(1234);
        assertEquals("M01 F 33 10902.0", m.getGenderAgeCost().trim());

        assertEquals("SilverCardMember: M01 F 33 points=41.0", m.toString().trim());
    }

    @Test
    void test05DefinedFields() throws NoSuchFieldException, NoSuchMethodException {
        Field memberId = Member.class.getDeclaredField("memberId");
        Field gender = Member.class.getDeclaredField("gender");
        Field age = Member.class.getDeclaredField("age");
        assertEquals(String.class,memberId.getType());
        assertEquals(char.class,gender.getType());
        assertEquals(int.class,age.getType());

        Constructor<?> constructor = Member.class.getDeclaredConstructor(String.class);
        assertEquals("public Member(java.lang.String)",constructor.toString());

        Method consume = Member.class.getDeclaredMethod("consume", int.class);
        Method getTotalCost = Member.class.getDeclaredMethod("getTotalCost");
        Method getGenderAgeCost = Member.class.getDeclaredMethod("getGenderAgeCost");
        Method toString = Member.class.getDeclaredMethod("toString");

        assertEquals(double.class, consume.getReturnType());
        assertEquals(double.class, getTotalCost.getReturnType());
        assertEquals(String.class, getGenderAgeCost.getReturnType());
        assertEquals(String.class, toString.getReturnType());
    }

}

