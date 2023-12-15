package com.easyfestival.www.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.service.EventService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event/*")
public class EventController {
	
	private final String UPLOAD_DIR="C:\\upload_file\\event";
	
	private int isOk;

	@Inject
	private EventService esv;

	@GetMapping("/eventRegister")
	public String eventRegister() {
		log.info("asdas21412421");
		return "/event/EventRegister";
	}

	@PostMapping("/eventRegister")
	public String eventRegister(eventVO evo) {
		log.info("evo는???" + evo);
		isOk = esv.eventRegister(evo);
		//이벤트 파일 db에 등록
		
		return "index";
	}

	@PostMapping("/image")
    public ResponseEntity<String> handleImageUpload(@RequestParam("file") MultipartFile file) {
        try {
            // 업로드된 파일의 원래 이름
            String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
            String baseName = FilenameUtils.getBaseName(originalFilename);
            String extension = FilenameUtils.getExtension(originalFilename);
            
            // 파일 저장 경로 설정
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            String uniqueFileName = UUID.randomUUID().toString() + "_" + baseName+"."+extension;
            String urlEncodedFileName = URLEncoder.encode(uniqueFileName, StandardCharsets.UTF_8.toString());
            // 파일 저장
            Path filePath = uploadPath.resolve(uniqueFileName);
            Files.copy(file.getInputStream(), filePath);

            // 이미지의 상대 경로를 반환 (예: /upload/filename.jpg)
            String relativePath = "/Eupload/" + urlEncodedFileName;

            return ResponseEntity.ok(relativePath);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error uploading image");
        }
    }
	
	@GetMapping("/OneventList")
	public String OneventList(Model m)
	{
		LocalDateTime now=LocalDateTime.now();
		
		List<eventVO>eList=esv.OneventList(now);
		for(int i=0;i<eList.size();i++)	//썸네일 따오기
		{
			if(eList.get(i).getEvContent().contains("<img"))
			{
				String content=eList.get(i).getEvContent();
				String img=content.substring(content.indexOf("<img"), content.indexOf("\">")+2);
				String src=img.substring(img.indexOf("\"")+1,img.indexOf("\">"));
				eList.get(i).setThumbnail(src);
			}
		}
		
		log.info("이벤트리스트:"+eList);
		m.addAttribute("list", eList);
		m.addAttribute("msg","on");
		return "/event/EventList";
	}
	
	@GetMapping("/LasteventList")
	public String LasteventList(Model m)
	{
		LocalDateTime now=LocalDateTime.now();
		
		List<eventVO>eList=esv.LasteventList(now);
		
		for(int i=0;i<eList.size();i++)	//썸네일 따오기
		{
			if(eList.get(i).getEvContent().contains("<img"))
			{
				String content=eList.get(i).getEvContent();
				String img=content.substring(content.indexOf("<img"), content.indexOf("\">")+2);
				String src=img.substring(img.indexOf("\"")+1,img.indexOf("\">"));
				eList.get(i).setThumbnail(src);
			}
		}
		
		log.info("이벤트리스트:"+eList);
		m.addAttribute("list", eList);
		m.addAttribute("msg","last");
		return "/event/EventList";
	}
	
	@GetMapping("/eventDetail")
	public String eventDetail(Model m,@RequestParam("evNo")int evNo)
	{
		eventVO evo=esv.detail(evNo);
		m.addAttribute("evo", evo);
		return "/event/EventDetail";
	}
	
	@GetMapping("/eventRemove")
	public String eventRemove(@RequestParam("evNo")int evNo)
	{
		isOk=esv.eventRemove(evNo);
		return "redirect:/event/eventList";
	}
	@GetMapping("/eventModify")
	public String eventModify(Model m,@RequestParam("evNo")int evNo)
	{
		eventVO evo=esv.detail(evNo);
		m.addAttribute("evo", evo);
		return "/event/EventModify";
	}
	@PostMapping("/eventModify")
	public String eventModify(eventVO evo)
	{
		isOk=esv.eventModify(evo);
		return "redirect:/event/OneventList";
	}
	
	

}
