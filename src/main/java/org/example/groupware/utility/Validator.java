package org.example.groupware.utility;

public class Validator {

    public static boolean EmailValidate(String email) {
        String emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailPattern);
    }

    public static boolean PasswordValidate(String password) {
        String passwordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+-=]).{8,}$";
        return password.matches(passwordPattern);
    }

    public static boolean NameValidate(String name) {
        String namePattern = "^[가-힣]+$";
        return name.matches(namePattern);
    }

    public static boolean AgeValidate(int age) {
        String age2=String.valueOf(age);
        String agePattern = "^[0-9]+$";
        return age2.matches(agePattern);
    }

    public static boolean PhoneValidate(String mobile) {
        String mobilePattern = "^[0-9]{11}$";
        return mobile.matches(mobilePattern);
    }


}