package com.entity.model;

import com.entity.JingdainCommentbackEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 景点评价
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class JingdainCommentbackModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 景点
     */
    private Integer jingdainId;


    /**
     * 用户
     */
    private Integer yonghuId;


    /**
     * 评价内容
     */
    private String jingdainCommentbackText;


    /**
     * 评价时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 回复内容
     */
    private String replyText;


    /**
     * 回复时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date updateTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：景点
	 */
    public Integer getJingdainId() {
        return jingdainId;
    }


    /**
	 * 设置：景点
	 */
    public void setJingdainId(Integer jingdainId) {
        this.jingdainId = jingdainId;
    }
    /**
	 * 获取：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：用户
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：评价内容
	 */
    public String getJingdainCommentbackText() {
        return jingdainCommentbackText;
    }


    /**
	 * 设置：评价内容
	 */
    public void setJingdainCommentbackText(String jingdainCommentbackText) {
        this.jingdainCommentbackText = jingdainCommentbackText;
    }
    /**
	 * 获取：评价时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：评价时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：回复内容
	 */
    public String getReplyText() {
        return replyText;
    }


    /**
	 * 设置：回复内容
	 */
    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }
    /**
	 * 获取：回复时间
	 */
    public Date getUpdateTime() {
        return updateTime;
    }


    /**
	 * 设置：回复时间
	 */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
