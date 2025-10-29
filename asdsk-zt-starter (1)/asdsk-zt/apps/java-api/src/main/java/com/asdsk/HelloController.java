package com.asdsk;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/healthz")
    public Object healthz() {
        return java.util.Map.of("status", "ok");
    }

    @GetMapping("/api/hello")
    public Object hello() {
        return java.util.Map.of("message", "Hello from Java API");
    }
}
