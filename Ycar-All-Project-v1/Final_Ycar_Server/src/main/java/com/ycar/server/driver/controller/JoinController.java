package com.ycar.server.driver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.server.driver.model.DriverInfo;
import com.ycar.server.driver.service.AuthService;
import com.ycar.server.driver.service.JoinService;

@RestController
@RequestMapping("/join")
public class JoinController {
	
	
	@Autowired
	private JoinService joinService;
	
	//직장인증 중 메일인증
	@Autowired
	private AuthService authService;
	
	@PostMapping
	@CrossOrigin
	public int join(@RequestBody DriverInfo driverInfo){
		int result = joinService.joinDriver(driverInfo);
		System.out.println("잘 들어갔니 3 ======" + result);
		return result;
	}
	
	@CrossOrigin
	@GetMapping("/mailAuth")
	public ResponseEntity<String> mailAuth(@RequestParam("cemail") String cemail){
		String code = authService.send(cemail);
		System.out.println("인증번호 잘 전송되었나?=====" + code);
		return new ResponseEntity<String>(code, HttpStatus.OK);
	}
	
	@CrossOrigin
	@GetMapping("/idcheck")
	public ResponseEntity<String> idcheck(@RequestParam("id")String id){
		return new ResponseEntity<String>(joinService.idCheck(id),HttpStatus.OK);
	}
}
