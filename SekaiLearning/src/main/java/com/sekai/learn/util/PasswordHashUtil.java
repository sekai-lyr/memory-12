package com.sekai.learn.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordHashUtil {

    private static final SecureRandom RANDOM = new SecureRandom();

    public static String hash(String password) {
        try {
            byte[] salt = new byte[16];
            RANDOM.nextBytes(salt);
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] hashed = md.digest(password.getBytes("UTF-8"));
            byte[] combined = new byte[salt.length + hashed.length];
            System.arraycopy(salt, 0, combined, 0, salt.length);
            System.arraycopy(hashed, 0, combined, salt.length, hashed.length);
            return Base64.getEncoder().encodeToString(combined);
        } catch (Exception e) {
            throw new RuntimeException("Password hashing failed", e);
        }
    }

    public static boolean verify(String password, String storedHash) {
        try {
            byte[] combined = Base64.getDecoder().decode(storedHash);
            byte[] salt = new byte[16];
            byte[] hash = new byte[combined.length - 16];
            System.arraycopy(combined, 0, salt, 0, 16);
            System.arraycopy(combined, 16, hash, 0, hash.length);
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] testHash = md.digest(password.getBytes("UTF-8"));
            return MessageDigest.isEqual(hash, testHash);
        } catch (Exception e) {
            return false;
        }
    }
}
