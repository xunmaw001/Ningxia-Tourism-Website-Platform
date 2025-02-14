package com.entity;

import com.annotation.ColumnInfo;
import javax.validation.constraints.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.*;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.utils.DateUtil;


/**
 * 景点订单
 *
 * @author 
 * @email
 */
@TableName("jingdain_order")
public class JingdainOrderEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public JingdainOrderEntity() {

	}

	public JingdainOrderEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ColumnInfo(comment="主键",type="int(11)")
    @TableField(value = "id")

    private Integer id;


    /**
     * 订单编号
     */
    @ColumnInfo(comment="订单编号",type="varchar(200)")
    @TableField(value = "jingdain_order_uuid_number")

    private String jingdainOrderUuidNumber;


    /**
     * 景点
     */
    @ColumnInfo(comment="景点",type="int(11)")
    @TableField(value = "jingdain_id")

    private Integer jingdainId;


    /**
     * 用户
     */
    @ColumnInfo(comment="用户",type="int(11)")
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 购买数量
     */
    @ColumnInfo(comment="购买数量",type="int(11)")
    @TableField(value = "buy_number")

    private Integer buyNumber;


    /**
     * 预约时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="预约时间",type="timestamp")
    @TableField(value = "jingdain_order_time")

    private Date jingdainOrderTime;


    /**
     * 实付价格
     */
    @ColumnInfo(comment="实付价格",type="decimal(10,2)")
    @TableField(value = "jingdain_order_true_price")

    private Double jingdainOrderTruePrice;


    /**
     * 订单类型
     */
    @ColumnInfo(comment="订单类型",type="int(11)")
    @TableField(value = "jingdain_order_types")

    private Integer jingdainOrderTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="订单创建时间",type="timestamp")
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间  listShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="创建时间",type="timestamp")
    @TableField(value = "create_time",fill = FieldFill.INSERT)

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
	 * 获取：订单编号
	 */
    public String getJingdainOrderUuidNumber() {
        return jingdainOrderUuidNumber;
    }
    /**
	 * 设置：订单编号
	 */

    public void setJingdainOrderUuidNumber(String jingdainOrderUuidNumber) {
        this.jingdainOrderUuidNumber = jingdainOrderUuidNumber;
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
	 * 获取：购买数量
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }
    /**
	 * 设置：购买数量
	 */

    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 获取：预约时间
	 */
    public Date getJingdainOrderTime() {
        return jingdainOrderTime;
    }
    /**
	 * 设置：预约时间
	 */

    public void setJingdainOrderTime(Date jingdainOrderTime) {
        this.jingdainOrderTime = jingdainOrderTime;
    }
    /**
	 * 获取：实付价格
	 */
    public Double getJingdainOrderTruePrice() {
        return jingdainOrderTruePrice;
    }
    /**
	 * 设置：实付价格
	 */

    public void setJingdainOrderTruePrice(Double jingdainOrderTruePrice) {
        this.jingdainOrderTruePrice = jingdainOrderTruePrice;
    }
    /**
	 * 获取：订单类型
	 */
    public Integer getJingdainOrderTypes() {
        return jingdainOrderTypes;
    }
    /**
	 * 设置：订单类型
	 */

    public void setJingdainOrderTypes(Integer jingdainOrderTypes) {
        this.jingdainOrderTypes = jingdainOrderTypes;
    }
    /**
	 * 获取：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 设置：订单创建时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间  listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }
    /**
	 * 设置：创建时间  listShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "JingdainOrder{" +
            ", id=" + id +
            ", jingdainOrderUuidNumber=" + jingdainOrderUuidNumber +
            ", jingdainId=" + jingdainId +
            ", yonghuId=" + yonghuId +
            ", buyNumber=" + buyNumber +
            ", jingdainOrderTime=" + DateUtil.convertString(jingdainOrderTime,"yyyy-MM-dd") +
            ", jingdainOrderTruePrice=" + jingdainOrderTruePrice +
            ", jingdainOrderTypes=" + jingdainOrderTypes +
            ", insertTime=" + DateUtil.convertString(insertTime,"yyyy-MM-dd") +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
