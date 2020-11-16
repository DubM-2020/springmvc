package com.mvp.mapper;

import com.mvp.domain.AudioVO;
import com.mvp.domain.FileAttachVO;
import com.mvp.domain.MediaVO;
import com.mvp.domain.MemberVO;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface AdminMapper {

    @SelectKey(keyProperty = "no", resultType = Integer.class, before = true,
            statement = "select seq_mediano.nextval from dual")
    @Insert("insert into media (no,title,category,type)" +
            " values(#{no},#{title},#{category},#{type})")
    public void register(MediaVO dto);

    @Insert("insert into audio (no,singer,content) values (#{no},#{singer},#{content})")
    public void audioContent(AudioVO audio);

    @Insert("insert into mvp_file (uuid,filename,uploadpath,image,no)" +
            " values(#{uuid},#{fileName},#{uploadPath},#{image},#{no})")
    public void insert(FileAttachVO vo);

    @Select("select * from media where no = #{no}")
    public MediaVO read(int no);

    @Select("select * from mvp_file where no = #{no}")
    public List<FileAttachVO> getFileList(int no);

    @Update("update media set title = #{title},category = #{category},type = #{type} where no = #{no}")
    public int update(MediaVO dto);

    @Delete("delete from media where no = #{no}")
    public int delete(int no);

    @Delete("delete from mvp_file where uuid = #{uuid}")
    public void remove(String uuid);

    @Delete("delete mvp_file where no = #{no}")
    public void deleteAll(int no);

    @Select("select * from mvp_member where auth = upper('role_user')")
    public List<MemberVO> getAllMember();

    @Select("select enabled from mvp_member where id=#{id}")
    public int userStatus(String id);

    @Update("update mvp_member set enabled=#{value} where id=#{id} ")
    public int userConfig(Map<String,Object> map);

    @Delete("delete from mvp_member where id=#{id}")
    public int userDelete(String id);
}
