package com.lanou.mapper;

import com.lanou.bean.Glob;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dllo on 17/8/23.
 */
@Repository
public interface GlogMapper {
    List<Glob> findAllGlob();
}
