package shoppingmall.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateRangeUtil {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static Timestamp parseStartDate(String startDateStr) throws ParseException {
        if (startDateStr == null || startDateStr.isEmpty()) {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH, -1);
            return new Timestamp(cal.getTimeInMillis());
        } else {
            return new Timestamp(sdf.parse(startDateStr).getTime());
        }
    }

    public static Timestamp parseEndDate(String endDateStr) throws ParseException {
        Calendar cal = Calendar.getInstance();
        if (endDateStr == null || endDateStr.isEmpty()) {
            cal.setTime(new Date());
        } else {
            cal.setTime(sdf.parse(endDateStr));
        }
        cal.add(Calendar.DATE, 1);  // 실제 종료일보다 하루 더한 값
        return new Timestamp(cal.getTimeInMillis());
    }

    public static String formatEndDateForDisplay(Timestamp endDatePlusOneDay) {
        // 화면에는 하루 뺀 값으로 보여줌
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(endDatePlusOneDay.getTime());
        cal.add(Calendar.DATE, -1);
        return sdf.format(cal.getTime());
    }
    
    public static String formatStartDateForDisplay(Timestamp date) {
        return sdf.format(date);
    }
}