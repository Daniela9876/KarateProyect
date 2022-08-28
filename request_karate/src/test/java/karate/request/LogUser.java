package karate.request;

import com.intuit.karate.junit5.Karate;

public class LogUser {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:Karate/request/LogUser.feature").relativeTo(getClass());
    }


}
