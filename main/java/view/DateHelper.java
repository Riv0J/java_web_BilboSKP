package view;

import java.time.LocalDate;
import java.time.MonthDay;
import java.time.ZoneId;
import java.util.Date;

public class DateHelper {
	
	public static MonthDay getMonthDay(Date fecha) {
		LocalDate localDate = fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return MonthDay.of(localDate.getMonth(), localDate.getDayOfMonth());
	}

}
