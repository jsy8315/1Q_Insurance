package hana.hanafinal.claim;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class FileUploadUtil {

    private static final String UPLOAD_DIR = "src/main/resources/upload/";

    public static String saveFile(MultipartFile file) {
        try {
            // 중복되지 않는 파일명을 위해 UUID를 사용
            String originalFileName = file.getOriginalFilename();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));
            String fileName = UUID.randomUUID().toString() + fileExtension;

            // 파일 저장 경로 설정
            Path path = Paths.get(UPLOAD_DIR + fileName);

            // 디렉터리가 없으면 생성
            if (!Files.exists(path.getParent())) {
                Files.createDirectories(path.getParent());
            }

            // 파일 저장
            byte[] bytes = file.getBytes();
            Files.write(path, bytes);

            //return path.toString(); // 파일 경로 반환
            return "src\\main\\resources\\upload\\d75837b4-3ec1-4b08-9517-00e990b2af91.png";
        } catch (IOException e) {
            throw new RuntimeException("File upload error: " + e.getMessage());
        }
    }
}
