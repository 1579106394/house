package com.house.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 文件操作
 */
@Controller
@RequestMapping("/file/")
public class FileController {

    @Value("${UPLOAD_URL}")
    private String UPLOAD_URL;

    @RequestMapping("upload.action")
    @ResponseBody
    public Map<String, String> upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {

        // 重新随机生成文件名，防止文件名重复
        String name = UUID.randomUUID().toString().replaceAll("-", "");

        // 获取文件后缀
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());

        // 拼接文件名
        String filename=name+"."+ext;

        // 文件上传路径
        String path = UPLOAD_URL+filename;

        // 上传文件
        file.transferTo(new File(path));

        // 文件在服务器上的路径
        String imagePath = "/photo/" + filename;
        // 将路径返回到页面
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("url", imagePath);
        return dataMap;
    }

}
