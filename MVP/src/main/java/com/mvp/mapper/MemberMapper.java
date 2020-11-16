package com.mvp.mapper;

import com.mvp.domain.MemberVO;
import com.mvp.security.CustomUserDetails;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.lang.reflect.Member;

public interface MemberMapper {

    @Insert({"insert into mvp_member(id,pwd,name,email)" +
            " values(#{id},#{pwd},#{name},#{email})"})
    public void register(MemberVO vo);

    @Select("select * from mvp_member where id = #{id}")
    public CustomUserDetails findById(String id);

    @Update("update mvp_member set pwd = #{pwd}, email = #{email} where id = #{id}")
    public int update(MemberVO vo);

    @Select("select count(*) from mvp_member where id=#{id}")
    public int idCheck(String id);

}
