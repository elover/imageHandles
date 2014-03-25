package com.springapp.mvc;

import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/")
public class HelloController {
    @RequestMapping(value = "imageHandles", method = RequestMethod.GET)
    public String imageHandles(ModelMap model) {
        return "imageHandles";
    }

    @RequestMapping(value = "imageHandles", method = RequestMethod.POST)
    public String imageHandlesPsot(@RequestParam("imageFile") CommonsMultipartFile imageFile, ModelMap model, RedirectAttributes redirectAttributes) throws IOException {
        String imageName = imageFile.getOriginalFilename();
        String path = "/Users/mac/Documents/javaEE-example/img/" + imageName;
        File newFile = new File(path);
        imageFile.transferTo(newFile);
        redirectAttributes.addFlashAttribute("imageName", imageName);
        return "redirect:imageHandles";
    }

    @RequestMapping(value = "imageHandles_ok", method = RequestMethod.POST)
    public String imageHandles_tool(@RequestParam("imageName") String imageName,
                                    @RequestParam("width") int width,
                                    @RequestParam("height") int height,
                                    @RequestParam("x") int x,
                                    @RequestParam("y") int y,
                                    ModelMap model, RedirectAttributes redirectAttributes) throws IOException {
        String path = "/Users/mac/Documents/javaEE-example/img/" + imageName;
        Thumbnails.of(path)
                .sourceRegion(x, y, width, height)
                .size(300, 300)
                .toFile(path);
        redirectAttributes.addFlashAttribute("imageName", imageName);
        return "redirect:imageHandles_ok";
    }

    @RequestMapping(value = "imageHandles_ok", method = RequestMethod.GET)
    public String imageHandles_ok(ModelMap model) {
        return "imageHandles_ok";
    }

}