
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 景点订单
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/jingdainOrder")
public class JingdainOrderController {
    private static final Logger logger = LoggerFactory.getLogger(JingdainOrderController.class);

    private static final String TABLE_NAME = "jingdainOrder";

    @Autowired
    private JingdainOrderService jingdainOrderService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private ChatService chatService;//客服聊天
    @Autowired
    private DictionaryService dictionaryService;//字典
    @Autowired
    private GonggaoService gonggaoService;//公告
    @Autowired
    private JingdainService jingdainService;//景点介绍
    @Autowired
    private JingdainCollectionService jingdainCollectionService;//景点收藏
    @Autowired
    private JingdainCommentbackService jingdainCommentbackService;//景点评价
    @Autowired
    private JiudianService jiudianService;//酒店推荐
    @Autowired
    private JiudianCollectionService jiudianCollectionService;//酒店收藏
    @Autowired
    private JiudianCommentbackService jiudianCommentbackService;//酒店评价
    @Autowired
    private JiudianOrderService jiudianOrderService;//酒店订单
    @Autowired
    private LuxianService luxianService;//路线
    @Autowired
    private LuxianCollectionService luxianCollectionService;//路线收藏
    @Autowired
    private LuxianLiuyanService luxianLiuyanService;//路线留言
    @Autowired
    private ShangjiaService shangjiaService;//商家
    @Autowired
    private ShangpinService shangpinService;//商品
    @Autowired
    private ShangpinCollectionService shangpinCollectionService;//商品收藏
    @Autowired
    private ShangpinCommentbackService shangpinCommentbackService;//商品评价
    @Autowired
    private ShangpinOrderService shangpinOrderService;//商品订单
    @Autowired
    private YonghuService yonghuService;//用户
    @Autowired
    private UsersService usersService;//管理员


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("商家".equals(role))
            params.put("shangjiaId",request.getSession().getAttribute("userId"));
        CommonUtil.checkMap(params);
        PageUtils page = jingdainOrderService.queryPage(params);

        //字典表数据转换
        List<JingdainOrderView> list =(List<JingdainOrderView>)page.getList();
        for(JingdainOrderView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JingdainOrderEntity jingdainOrder = jingdainOrderService.selectById(id);
        if(jingdainOrder !=null){
            //entity转view
            JingdainOrderView view = new JingdainOrderView();
            BeanUtils.copyProperties( jingdainOrder , view );//把实体数据重构到view中
            //级联表 景点介绍
            //级联表
            JingdainEntity jingdain = jingdainService.selectById(jingdainOrder.getJingdainId());
            if(jingdain != null){
            BeanUtils.copyProperties( jingdain , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setJingdainId(jingdain.getId());
            }
            //级联表 用户
            //级联表
            YonghuEntity yonghu = yonghuService.selectById(jingdainOrder.getYonghuId());
            if(yonghu != null){
            BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setYonghuId(yonghu.getId());
            }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody JingdainOrderEntity jingdainOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,jingdainOrder:{}",this.getClass().getName(),jingdainOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            jingdainOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        jingdainOrder.setCreateTime(new Date());
        jingdainOrder.setInsertTime(new Date());
        jingdainOrderService.insert(jingdainOrder);

        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody JingdainOrderEntity jingdainOrder, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,jingdainOrder:{}",this.getClass().getName(),jingdainOrder.toString());
        JingdainOrderEntity oldJingdainOrderEntity = jingdainOrderService.selectById(jingdainOrder.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            jingdainOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

            jingdainOrderService.updateById(jingdainOrder);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<JingdainOrderEntity> oldJingdainOrderList =jingdainOrderService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        jingdainOrderService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //.eq("time", new SimpleDateFormat("yyyy-MM-dd").format(new Date()))
        try {
            List<JingdainOrderEntity> jingdainOrderList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("../../upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            JingdainOrderEntity jingdainOrderEntity = new JingdainOrderEntity();
//                            jingdainOrderEntity.setJingdainOrderUuidNumber(data.get(0));                    //订单编号 要改的
//                            jingdainOrderEntity.setJingdainId(Integer.valueOf(data.get(0)));   //景点 要改的
//                            jingdainOrderEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            jingdainOrderEntity.setBuyNumber(Integer.valueOf(data.get(0)));   //购买数量 要改的
//                            jingdainOrderEntity.setJingdainOrderTime(sdf.parse(data.get(0)));          //预约时间 要改的
//                            jingdainOrderEntity.setJingdainOrderTruePrice(data.get(0));                    //实付价格 要改的
//                            jingdainOrderEntity.setJingdainOrderTypes(Integer.valueOf(data.get(0)));   //订单类型 要改的
//                            jingdainOrderEntity.setInsertTime(date);//时间
//                            jingdainOrderEntity.setCreateTime(date);//时间
                            jingdainOrderList.add(jingdainOrderEntity);


                            //把要查询是否重复的字段放入map中
                                //订单编号
                                if(seachFields.containsKey("jingdainOrderUuidNumber")){
                                    List<String> jingdainOrderUuidNumber = seachFields.get("jingdainOrderUuidNumber");
                                    jingdainOrderUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> jingdainOrderUuidNumber = new ArrayList<>();
                                    jingdainOrderUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("jingdainOrderUuidNumber",jingdainOrderUuidNumber);
                                }
                        }

                        //查询是否重复
                         //订单编号
                        List<JingdainOrderEntity> jingdainOrderEntities_jingdainOrderUuidNumber = jingdainOrderService.selectList(new EntityWrapper<JingdainOrderEntity>().in("jingdain_order_uuid_number", seachFields.get("jingdainOrderUuidNumber")));
                        if(jingdainOrderEntities_jingdainOrderUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingdainOrderEntity s:jingdainOrderEntities_jingdainOrderUuidNumber){
                                repeatFields.add(s.getJingdainOrderUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [订单编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        jingdainOrderService.insertBatch(jingdainOrderList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }




    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = jingdainOrderService.queryPage(params);

        //字典表数据转换
        List<JingdainOrderView> list =(List<JingdainOrderView>)page.getList();
        for(JingdainOrderView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Integer id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JingdainOrderEntity jingdainOrder = jingdainOrderService.selectById(id);
            if(jingdainOrder !=null){


                //entity转view
                JingdainOrderView view = new JingdainOrderView();
                BeanUtils.copyProperties( jingdainOrder , view );//把实体数据重构到view中

                //级联表
                    JingdainEntity jingdain = jingdainService.selectById(jingdainOrder.getJingdainId());
                if(jingdain != null){
                    BeanUtils.copyProperties( jingdain , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setJingdainId(jingdain.getId());
                }
                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(jingdainOrder.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody JingdainOrderEntity jingdainOrder, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,jingdainOrder:{}",this.getClass().getName(),jingdainOrder.toString());
            JingdainEntity jingdainEntity = jingdainService.selectById(jingdainOrder.getJingdainId());
            if(jingdainEntity == null){
                return R.error(511,"查不到该景点介绍");
            }
            // Double jingdainNewMoney = jingdainEntity.getJingdainNewMoney();

            if(false){
            }
            else if(jingdainEntity.getJingdainNewMoney() == null){
                return R.error(511,"现价/积分不能为空");
            }
            else if((jingdainEntity.getJingdainKucunNumber() -jingdainOrder.getBuyNumber())<0){
                return R.error(511,"购买数量不能大于库存数量");
            }

            //计算所获得积分
            Double buyJifen =0.0;
            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
                return R.error(511,"用户金额不能为空");
            double balance = yonghuEntity.getNewMoney() - jingdainEntity.getJingdainNewMoney()*jingdainOrder.getBuyNumber();//余额
            if(balance<0)
                return R.error(511,"余额不够支付");
            jingdainOrder.setJingdainOrderTypes(101); //设置订单状态为已购买
            jingdainOrder.setJingdainOrderTruePrice(jingdainEntity.getJingdainNewMoney()*jingdainOrder.getBuyNumber()); //设置实付价格
            jingdainOrder.setYonghuId(userId); //设置订单支付人id
            jingdainOrder.setJingdainOrderUuidNumber(String.valueOf(new Date().getTime()));
            jingdainOrder.setInsertTime(new Date());
            jingdainOrder.setCreateTime(new Date());
                jingdainEntity.setJingdainKucunNumber( jingdainEntity.getJingdainKucunNumber() -jingdainOrder.getBuyNumber());
                jingdainService.updateById(jingdainEntity);
                jingdainOrderService.insert(jingdainOrder);//新增订单
            //更新第一注册表
            yonghuEntity.setNewMoney(balance);//设置金额
            yonghuService.updateById(yonghuEntity);


            return R.ok();
    }


    /**
    * 退款
    */
    @RequestMapping("/refund")
    public R refund(Integer id, HttpServletRequest request){
        logger.debug("refund方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        String role = String.valueOf(request.getSession().getAttribute("role"));

            JingdainOrderEntity jingdainOrder = jingdainOrderService.selectById(id);//当前表service
            Integer buyNumber = jingdainOrder.getBuyNumber();
            Integer jingdainId = jingdainOrder.getJingdainId();
            if(jingdainId == null)
                return R.error(511,"查不到该景点介绍");
            JingdainEntity jingdainEntity = jingdainService.selectById(jingdainId);
            if(jingdainEntity == null)
                return R.error(511,"查不到该景点介绍");
            //获取商家信息
//            Integer shangjiaId = jingdainEntity.getShangjiaId();
//            ShangjiaEntity shangjiaEntity = shangjiaService.selectById(shangjiaId);//商家
            Double jingdainNewMoney = jingdainEntity.getJingdainNewMoney();
            if(jingdainNewMoney == null)
                return R.error(511,"景点介绍价格不能为空");

            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
            return R.error(511,"用户金额不能为空");
            Double zhekou = 1.0;

                //计算金额
                Double money = jingdainEntity.getJingdainNewMoney() * buyNumber  * zhekou;
                //计算所获得积分
                Double buyJifen = 0.0;
                yonghuEntity.setNewMoney(yonghuEntity.getNewMoney() + money); //设置金额


                //修改商家余额
//                shangjiaEntity.setNewMoney(shangjiaEntity.getNewMoney() - money);

            jingdainEntity.setJingdainKucunNumber(jingdainEntity.getJingdainKucunNumber() + buyNumber);

            jingdainOrder.setJingdainOrderTypes(102);//设置订单状态为已退款
            jingdainOrderService.updateAllColumnById(jingdainOrder);//根据id更新
//            shangjiaService.updateById(shangjiaEntity);
            yonghuService.updateById(yonghuEntity);//更新用户信息
            jingdainService.updateById(jingdainEntity);//更新订单中景点介绍的信息

            return R.ok();
    }

    /**
    * 评价
    */
    @RequestMapping("/commentback")
    public R commentback(Integer id, String commentbackText, Integer jingdainCommentbackPingfenNumber, HttpServletRequest request){
        logger.debug("commentback方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
            JingdainOrderEntity jingdainOrder = jingdainOrderService.selectById(id);
        if(jingdainOrder == null)
            return R.error(511,"查不到该订单");
        Integer jingdainId = jingdainOrder.getJingdainId();
        if(jingdainId == null)
            return R.error(511,"查不到该景点介绍");

        JingdainCommentbackEntity jingdainCommentbackEntity = new JingdainCommentbackEntity();
            jingdainCommentbackEntity.setId(id);
            jingdainCommentbackEntity.setJingdainId(jingdainId);
            jingdainCommentbackEntity.setYonghuId((Integer) request.getSession().getAttribute("userId"));
            jingdainCommentbackEntity.setJingdainCommentbackText(commentbackText);
            jingdainCommentbackEntity.setInsertTime(new Date());
            jingdainCommentbackEntity.setReplyText(null);
            jingdainCommentbackEntity.setUpdateTime(null);
            jingdainCommentbackEntity.setCreateTime(new Date());
            jingdainCommentbackService.insert(jingdainCommentbackEntity);

            jingdainOrder.setJingdainOrderTypes(105);//设置订单状态为已评价
            jingdainOrderService.updateById(jingdainOrder);//根据id更新
            return R.ok();
    }

    /**
     * 游玩
     */
    @RequestMapping("/receiving")
    public R receiving(Integer id , HttpServletRequest request){
        logger.debug("refund:,,Controller:{},,ids:{}",this.getClass().getName(),id.toString());
        JingdainOrderEntity  jingdainOrderEntity = jingdainOrderService.selectById(id);
        jingdainOrderEntity.setJingdainOrderTypes(104);//设置订单状态为游玩
        jingdainOrderService.updateById( jingdainOrderEntity);
        return R.ok();
    }

}

