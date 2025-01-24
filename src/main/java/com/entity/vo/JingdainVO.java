package com.entity.vo;

import com.entity.JingdainEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 景点介绍
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("jingdain")
public class JingdainVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 景点名称
     */

    @TableField(value = "jingdain_name")
    private String jingdainName;


    /**
     * 景点编号
     */

    @TableField(value = "jingdain_uuid_number")
    private String jingdainUuidNumber;


    /**
     * 景点照片
     */

    @TableField(value = "jingdain_photo")
    private String jingdainPhoto;


    /**
     * 景点地点
     */

    @TableField(value = "jingdain_address")
    private String jingdainAddress;


    /**
     * 赞
     */

    @TableField(value = "zan_number")
    private Integer zanNumber;


    /**
     * 踩
     */

    @TableField(value = "cai_number")
    private Integer caiNumber;


    /**
     * 景点类型
     */

    @TableField(value = "jingdain_types")
    private Integer jingdainTypes;


    /**
     * 景点门票
     */

    @TableField(value = "jingdain_kucun_number")
    private Integer jingdainKucunNumber;


    /**
     * 现价/积分
     */

    @TableField(value = "jingdain_new_money")
    private Double jingdainNewMoney;


    /**
     * 景点热度
     */

    @TableField(value = "jingdain_clicknum")
    private Integer jingdainClicknum;


    /**
     * 景点介绍
     */

    @TableField(value = "jingdain_content")
    private String jingdainContent;


    /**
     * 逻辑删除
     */

    @TableField(value = "jingdain_delete")
    private Integer jingdainDelete;


    /**
     * 录入时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：景点名称
	 */
    public String getJingdainName() {
        return jingdainName;
    }


    /**
	 * 获取：景点名称
	 */

    public void setJingdainName(String jingdainName) {
        this.jingdainName = jingdainName;
    }
    /**
	 * 设置：景点编号
	 */
    public String getJingdainUuidNumber() {
        return jingdainUuidNumber;
    }


    /**
	 * 获取：景点编号
	 */

    public void setJingdainUuidNumber(String jingdainUuidNumber) {
        this.jingdainUuidNumber = jingdainUuidNumber;
    }
    /**
	 * 设置：景点照片
	 */
    public String getJingdainPhoto() {
        return jingdainPhoto;
    }


    /**
	 * 获取：景点照片
	 */

    public void setJingdainPhoto(String jingdainPhoto) {
        this.jingdainPhoto = jingdainPhoto;
    }
    /**
	 * 设置：景点地点
	 */
    public String getJingdainAddress() {
        return jingdainAddress;
    }


    /**
	 * 获取：景点地点
	 */

    public void setJingdainAddress(String jingdainAddress) {
        this.jingdainAddress = jingdainAddress;
    }
    /**
	 * 设置：赞
	 */
    public Integer getZanNumber() {
        return zanNumber;
    }


    /**
	 * 获取：赞
	 */

    public void setZanNumber(Integer zanNumber) {
        this.zanNumber = zanNumber;
    }
    /**
	 * 设置：踩
	 */
    public Integer getCaiNumber() {
        return caiNumber;
    }


    /**
	 * 获取：踩
	 */

    public void setCaiNumber(Integer caiNumber) {
        this.caiNumber = caiNumber;
    }
    /**
	 * 设置：景点类型
	 */
    public Integer getJingdainTypes() {
        return jingdainTypes;
    }


    /**
	 * 获取：景点类型
	 */

    public void setJingdainTypes(Integer jingdainTypes) {
        this.jingdainTypes = jingdainTypes;
    }
    /**
	 * 设置：景点门票
	 */
    public Integer getJingdainKucunNumber() {
        return jingdainKucunNumber;
    }


    /**
	 * 获取：景点门票
	 */

    public void setJingdainKucunNumber(Integer jingdainKucunNumber) {
        this.jingdainKucunNumber = jingdainKucunNumber;
    }
    /**
	 * 设置：现价/积分
	 */
    public Double getJingdainNewMoney() {
        return jingdainNewMoney;
    }


    /**
	 * 获取：现价/积分
	 */

    public void setJingdainNewMoney(Double jingdainNewMoney) {
        this.jingdainNewMoney = jingdainNewMoney;
    }
    /**
	 * 设置：景点热度
	 */
    public Integer getJingdainClicknum() {
        return jingdainClicknum;
    }


    /**
	 * 获取：景点热度
	 */

    public void setJingdainClicknum(Integer jingdainClicknum) {
        this.jingdainClicknum = jingdainClicknum;
    }
    /**
	 * 设置：景点介绍
	 */
    public String getJingdainContent() {
        return jingdainContent;
    }


    /**
	 * 获取：景点介绍
	 */

    public void setJingdainContent(String jingdainContent) {
        this.jingdainContent = jingdainContent;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getJingdainDelete() {
        return jingdainDelete;
    }


    /**
	 * 获取：逻辑删除
	 */

    public void setJingdainDelete(Integer jingdainDelete) {
        this.jingdainDelete = jingdainDelete;
    }
    /**
	 * 设置：录入时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：录入时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间  show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
