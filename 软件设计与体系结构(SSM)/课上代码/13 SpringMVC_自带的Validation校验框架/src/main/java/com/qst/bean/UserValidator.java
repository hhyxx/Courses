package com.qst.bean;

import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Repository("userValidator")
public class UserValidator implements Validator {

    public boolean supports(Class<?> clazz) {
    	return User.class.isAssignableFrom(clazz);
    }    

    public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", null,"登录名不能为空");
		ValidationUtils.rejectIfEmpty(errors, "pwd", null,"密码不能为空");
		User user=(User)target;
		if(user.getName().length()>10) {
			errors.rejectValue("name", null,"用户名不能超过10个字符");
		}
    }
}




