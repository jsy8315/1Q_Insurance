package hana.hanafinal.coolsms;

import net.nurigo.sdk.NurigoApp;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageService {

    @Value("${coolsms.api.key}")
    private String apiKey;

    @Value("${coolsms.api.secret}")
    private String apiSecret;

    @Value("${coolsms.from}")
    private String from;

    public void sendSMS(String phoneNumber) throws Exception {
        DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
        Message message = new Message();
        message.setFrom("01098890636");
        message.setTo("01098890636");
        //message.setText("정수일님이 신청한 보험금 청구 심사가 완료되었습니다.");
        message.setText("정수일님이 신청한 보험 가입 요청 심사가 완료되었습니다.");
        
        try {
            messageService.send(message);
        } catch (NurigoMessageNotReceivedException exception) {
            // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
            System.out.println(exception.getFailedMessageList());
            throw new Exception(exception.getMessage());
        } catch (Exception exception) {
            throw new Exception("Failed to send SMS");
        }
    }
}



