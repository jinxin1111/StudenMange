package com.iflytek.util;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert implements Converter<String, Date> {
    @Override
    public Date convert(String source) {
        Date date=null;
        try {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            date=sdf.parse(source);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return date;
    }
}
