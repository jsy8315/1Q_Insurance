package hana.hanafinal.claim;

import hana.hanafinal.diagnosis.DiagnosisDTO;
import hana.hanafinal.ocr.OcrDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.List;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.util.Iterator;
import java.util.UUID;


@Service
public class ClaimService {
    @Autowired
    private ClaimMapper claimMapper;
    private String imgFilePath = "C:\\Users\\JungSuyoung\\Documents\\HANA_FINAL\\hana-final\\hana-final\\";
    private String clovaSecret = "SEtSbmpvWUJXeFZkYlhidEV2UFJPc1ZkUXdVanFLd0c=";    // API Secret

    private String clovaApiUrl = "https://4ww5ipd22e.apigw.ntruss.com/custom/v1/25264/9aaf7b97ace8c6ea87412c5f8299f68ba0e020550815fda72322c9d3da45f8b2/infer";    // API URL

    private int templateId = 26517;

    public List<ClaimDTO> getMyProducts(int userId) {
        return claimMapper.getMyProducts(userId);
    }

    //마이페이지 조회를 위한 메서드
    public List<ClaimDTO04> getMyClaims(int userId) {
        return claimMapper.getMyClaims(userId);
    }

    public void insertClaim(ClaimDTO02 claimDTO02) {
        claimMapper.insertClaim(claimDTO02);
    }

    public void updateHospitalHistoryId(String historyId) {
        claimMapper.updateHospitalHistoryId(historyId);
    }
    public List<ClaimDTO03> getClaimsWithStatusOne() {
        return claimMapper.selectClaimsWithStatusOne();
    }
    public String saveFile(MultipartFile file, String folderPath) {
        if (file.isEmpty()) {
            return null;
        }

        String fileName = file.getOriginalFilename();
        String filePath = Paths.get(folderPath, fileName).toString();

        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return filePath;
    }

    public void saveImagePath(String diagnosisImagePath, String hospitalizationImagePath) {
        // Assuming you have a method in your mapper to save the image paths
        claimMapper.updateImagePaths(diagnosisImagePath, hospitalizationImagePath);
    }

    public OcrDTO getReadDiagnosis(String filePath) throws IOException {
        OcrDTO ocrDTO = new OcrDTO();

        // 해당 이미지 Clova OCR 이용 문자 json string 추출
        String fileOCR = fileOCR(filePath);

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            JsonNode rootNode = objectMapper.readTree(fileOCR);
            JsonNode imagesNode = rootNode.get("images");
            //JsonNode fieldsNode = imagesNode.get(0).get("fields");

            if (imagesNode == null) {
                System.out.println("ImagesNode is null");
                return null; // or throw an appropriate exception
            }

            JsonNode fieldsNode;
            if (imagesNode.isArray() && imagesNode.size() > 0 && imagesNode.get(0) != null) {
                fieldsNode = imagesNode.get(0).get("fields");
            } else {
                System.out.println("ImagesNode is empty or the first element is null");
                return null; // or throw an appropriate exception
            }

            if(fieldsNode == null) {
                System.out.println("FieldsNode is null");
                return null; // or throw an appropriate exception
            }


            JsonNode field01diagnosisnameNode = findInferTextByFieldName(fieldsNode, "성명");
            if(field01diagnosisnameNode == null) {
                System.out.println("field01diagnosisnameNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field02diagnosisssnNode = findInferTextByFieldName(fieldsNode, "주민등록번호");
            if(field02diagnosisssnNode == null) {
                System.out.println("field02diagnosisssnNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field03diagnosismainNode = findInferTextByFieldName(fieldsNode, "주병명");
            if(field02diagnosisssnNode == null) {
                System.out.println("field02diagnosisssnNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field04diagnosisside01Node = findInferTextByFieldName(fieldsNode, "부병명01");
            if(field04diagnosisside01Node == null) {
                System.out.println("field04diagnosisside01Node is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field05diagnosisside02Node = findInferTextByFieldName(fieldsNode, "부병명02");
            if(field05diagnosisside02Node == null) {
                System.out.println("field05diagnosisside02Node is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field06diagnosismaincodeNode = findInferTextByFieldName(fieldsNode, "주병명분류번호");
            if(field06diagnosismaincodeNode == null) {
                System.out.println("field06diagnosismaincodeNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field07diagnosisside01codeNode = findInferTextByFieldName(fieldsNode, "부병명분류번호01");
            if(field07diagnosisside01codeNode == null) {
                System.out.println("field07diagnosisside01codeNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field08diagnosisside02codeNode = findInferTextByFieldName(fieldsNode, "부병명분류번호02");
            if(field08diagnosisside02codeNode == null) {
                System.out.println("field08diagnosisside02codeNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field09diagnosissurgeryNode = findInferTextByFieldName(fieldsNode, "수술명");
            if(field09diagnosissurgeryNode == null) {
                System.out.println("field09diagnosissurgeryNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field10diagnosisdepartmentNode = findInferTextByFieldName(fieldsNode, "진료과");
            if(field10diagnosisdepartmentNode == null) {
                System.out.println("field10diagnosisdepartmentNode is null");
                return null; // 또는 적절한 예외 처리
            }
            JsonNode field11diagnosisdateNode = findInferTextByFieldName(fieldsNode, "진단일");
            if(field11diagnosisdateNode == null) {
                System.out.println("field11diagnosisdateNode is null");
                return null; // 또는 적절한 예외 처리
            }

            ocrDTO.setDiagnosisname(field01diagnosisnameNode.asText());
            ocrDTO.setDiagnosisssn(field02diagnosisssnNode.asText());
            ocrDTO.setDiagnosismain(field03diagnosismainNode.asText());
            ocrDTO.setDiagnosisside01(field04diagnosisside01Node.asText());
            ocrDTO.setDiagnosisside02(field05diagnosisside02Node.asText());
            ocrDTO.setDiagnosismaincode(field06diagnosismaincodeNode.asText());
            ocrDTO.setDiagnosisside01code(field07diagnosisside01codeNode.asText());
            ocrDTO.setDiagnosisside02code(field08diagnosisside02codeNode.asText());
            ocrDTO.setDiagnosissurgery(field09diagnosissurgeryNode.asText());
            ocrDTO.setDiagnosisdepartment(field10diagnosisdepartmentNode.asText());
            ocrDTO.setDiagnosisdate(field11diagnosisdateNode.asText());

            // 결과 출력
            System.out.println("{");
            System.out.println(" \"환자이름\":\"" + field01diagnosisnameNode.asText() + "\",");
            System.out.println(" \"주민번호\":\"" + field02diagnosisssnNode.asText() + "\"");
            System.out.println(" \"주병명\":\"" + field03diagnosismainNode.asText() + "\"");
            System.out.println(" \"부병명01\":\"" + field04diagnosisside01Node.asText() + "\"");
            System.out.println(" \"부병명02\":\"" + field05diagnosisside02Node.asText() + "\"");
            System.out.println(" \"주병명 진단코드\":\"" + field06diagnosismaincodeNode.asText() + "\"");
            System.out.println(" \"부병명 진단코드01\":\"" + field07diagnosisside01codeNode.asText() + "\"");
            System.out.println(" \"부병명 진단코드02\":\"" + field08diagnosisside02codeNode.asText() + "\"");
            System.out.println(" \"수술명\":\"" + field09diagnosissurgeryNode.asText() + "\"");
            System.out.println(" \"진료과목\":\"" + field10diagnosisdepartmentNode.asText() + "\"");
            System.out.println(" \"진료날짜\":\"" + field11diagnosisdateNode.asText() + "\"");
            System.out.println("}");
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        }
        return ocrDTO;
    }

    public String fileOCR(String filePath) {
        // API 요청을 위한 이미지 파일 경로 설정
        String imageFile = imgFilePath + filePath;
        System.out.println(imageFile);
        try {
            URL url = new URL(clovaApiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setReadTimeout(30000);
            con.setRequestMethod("POST");
            String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-OCR-SECRET", clovaSecret);

            // JSON 요청 메시지 생성
            JSONObject json = new JSONObject();
            json.put("version", "V2");
            json.put("requestId", UUID.randomUUID().toString());
            json.put("timestamp", System.currentTimeMillis());
            JSONObject image = new JSONObject();
            image.put("format", "png");
            image.put("name", "demo");
            JSONArray templateIds = new JSONArray();
            templateIds.put(templateId);
            image.put("templateIds", templateIds);
            JSONArray images = new JSONArray();
            images.put(image);
            json.put("images", images);
            String postParams = json.toString();

            // 요청 파라미터 로깅 추가
            System.out.println("OCR Request Parameters: " + postParams); // 이 부분 추가

            // API 연결 및 요청 전송
            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            File file = new File(imageFile);

            // 파일 존재 여부 및 정보 출력
            if (file.exists() && !file.isDirectory()) {
                System.out.println("File exists. File name: " + file.getName() + ", File size: " + file.length() + " bytes");
            } else {
                System.out.println("File does not exist or it's a directory.");
                return "File error";
            }

            writeMultiPart(wr, postParams, file, boundary);
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            // API 응답 처리
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            String result = response.toString();

            // OCR 응답 로그 추가
            System.out.println("OCR Response: " + result);

            return result;
        } catch (Exception e) {
            // 예외 처리
            System.out.println("API 요청 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
        }
        return "실패"; // 예외 발생 시 실패 메시지 반환
    }


    private static JsonNode findInferTextByFieldName(JsonNode fieldsNode, String fieldName) {
        Iterator<JsonNode> elements = fieldsNode.elements();
        while (elements.hasNext()) {
            JsonNode fieldNode = elements.next();
            if (fieldNode.get("name").asText().equals(fieldName)) {
                return fieldNode.get("inferText");
            }
        }
        return null;  // 해당 name을 가진 field가 없으면 null 반환
    }
    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws IOException {
        // JSON 요청 메시지 업로드
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");
        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();
        // 이미지 파일 업로드
        if (file != null && file.isFile()) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
            fileString.append("\"" + file.getName() + "\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
                out.write("\r\n".getBytes());
            }

            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
        }
    }

