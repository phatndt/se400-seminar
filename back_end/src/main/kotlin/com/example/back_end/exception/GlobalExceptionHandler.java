package com.example.bookexchangebackend.exception;

import io.jsonwebtoken.security.SignatureException;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import javax.naming.AuthenticationException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NotFoundElementException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public ErrorMessage NotFoundElementsException(NotFoundElementException ex, WebRequest request) {
        return new ErrorMessage(HttpStatus.NOT_FOUND.value(), ex.getLocalizedMessage());
    }

    @ExceptionHandler(NullPointerException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    public ErrorMessage nullPointerException(NullPointerException ex, WebRequest request) {
        return new ErrorMessage(HttpStatus.BAD_REQUEST.value(), ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorMessage handleAllException(Exception ex, WebRequest request) {
        return new ErrorMessage(HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.toString() + ex.getLocalizedMessage());
    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public ErrorMessage NotFoundException(NotFoundException ex, WebRequest request) {
        return new ErrorMessage(HttpStatus.NOT_FOUND.value(), ex.getLocalizedMessage());
    }


    @ExceptionHandler(SignatureException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED)
    public ErrorMessage UnException(SignatureException ex, WebRequest request) {
        return new ErrorMessage(10100, ex.getMessage());
    }

}
