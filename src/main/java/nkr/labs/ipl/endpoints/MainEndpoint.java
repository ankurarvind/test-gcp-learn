package nkr.labs.ipl.endpoints;

import ch.qos.logback.core.CoreConstants;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

/**
 * This is the main entry class
 */
@RestController
public class MainEndpoint {

    private static final String DEFAULT_TIMEZONE = "Asia/Calcutta";

    @GetMapping("/hello")
    public String getSalutation(){
        return "Hello IPL";
    }

    @GetMapping("/time")
    public String getCurrentTime(){
     return "The time is " + getCurrentTimeAsPerTimeZone(DEFAULT_TIMEZONE);
    }

    @GetMapping("/time/{timezone}")
    public String getCurrentTimeAsPerTimeZone(@PathVariable("timezone") String timezone){
        if (timezone == null) timezone = DEFAULT_TIMEZONE;
        Calendar cal = Calendar.getInstance();
        TimeZone tz = TimeZone.getTimeZone(timezone);
        cal.setTimeZone(tz);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm a");
        sdf.setTimeZone(tz);
        String formattedTime = sdf.format(cal.getTime());
        return formattedTime;
    }
}
