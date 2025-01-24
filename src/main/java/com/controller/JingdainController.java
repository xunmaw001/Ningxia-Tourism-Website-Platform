
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
 * 景点介绍
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/jingdain")
public class JingdainController {
    private static final Logger logger = LoggerFactory.getLogger(JingdainController.class);

    private static final String TABLE_NAME = "jingdain";

    @Autowired
    private JingdainService jingdainService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private ChatService chatService;//客服聊天
    @Autowired
    private DictionaryService dictionaryService;//字典
    @Autowired
    private GonggaoService gonggaoService;//公告
    @Autowired
    private JingdainCollectionService jingdainCollectionService;//景点收藏
    @Autowired
    private JingdainCommentbackService jingdainCommentbackService;//景点评价
    @Autowired
    private JingdainOrderService jingdainOrderService;//景点订单
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
        params.put("jingdainDeleteStart",1);params.put("jingdainDeleteEnd",1);
        CommonUtil.checkMap(params);
        PageUtils page = jingdainService.queryPage(params);

        //字典表数据转换
        List<JingdainView> list =(List<JingdainView>)page.getList();
        for(JingdainView c:list){
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
        JingdainEntity jingdain = jingdainService.selectById(id);
        if(jingdain !=null){
            //entity转view
            JingdainView view = new JingdainView();
            BeanUtils.copyProperties( jingdain , view );//把实体数据重构到view中
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
    public R save(@RequestBody JingdainEntity jingdain, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,jingdain:{}",this.getClass().getName(),jingdain.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<JingdainEntity> queryWrapper = new EntityWrapper<JingdainEntity>()
            .eq("jingdain_name", jingdain.getJingdainName())
            .eq("jingdain_address", jingdain.getJingdainAddress())
            .eq("zan_number", jingdain.getZanNumber())
            .eq("cai_number", jingdain.getCaiNumber())
            .eq("jingdain_types", jingdain.getJingdainTypes())
            .eq("jingdain_kucun_number", jingdain.getJingdainKucunNumber())
            .eq("jingdain_delete", 1)
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JingdainEntity jingdainEntity = jingdainService.selectOne(queryWrapper);
        if(jingdainEntity==null){
            jingdain.setZanNumber(1);
            jingdain.setCaiNumber(1);
            jingdain.setJingdainClicknum(1);
            jingdain.setJingdainDelete(1);
            jingdain.setInsertTime(new Date());
            jingdain.setCreateTime(new Date());
            jingdainService.insert(jingdain);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody JingdainEntity jingdain, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,jingdain:{}",this.getClass().getName(),jingdain.toString());
        JingdainEntity oldJingdainEntity = jingdainService.selectById(jingdain.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        if("".equals(jingdain.getJingdainPhoto()) || "null".equals(jingdain.getJingdainPhoto())){
                jingdain.setJingdainPhoto(null);
        }
        if("".equals(jingdain.getJingdainContent()) || "null".equals(jingdain.getJingdainContent())){
                jingdain.setJingdainContent(null);
        }

            jingdainService.updateById(jingdain);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<JingdainEntity> oldJingdainList =jingdainService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        ArrayList<JingdainEntity> list = new ArrayList<>();
        for(Integer id:ids){
            JingdainEntity jingdainEntity = new JingdainEntity();
            jingdainEntity.setId(id);
            jingdainEntity.setJingdainDelete(2);
            list.add(jingdainEntity);
        }
        if(list != null && list.size() >0){
            jingdainService.updateBatchById(list);
        }

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
            List<JingdainEntity> jingdainList = new ArrayList<>();//上传的东西
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
                            JingdainEntity jingdainEntity = new JingdainEntity();
//                            jingdainEntity.setJingdainName(data.get(0));                    //景点名称 要改的
//                            jingdainEntity.setJingdainUuidNumber(data.get(0));                    //景点编号 要改的
//                            jingdainEntity.setJingdainPhoto("");//详情和图片
//                            jingdainEntity.setJingdainAddress(data.get(0));                    //景点地点 要改的
//                            jingdainEntity.setZanNumber(Integer.valueOf(data.get(0)));   //赞 要改的
//                            jingdainEntity.setCaiNumber(Integer.valueOf(data.get(0)));   //踩 要改的
//                            jingdainEntity.setJingdainTypes(Integer.valueOf(data.get(0)));   //景点类型 要改的
//                            jingdainEntity.setJingdainKucunNumber(Integer.valueOf(data.get(0)));   //景点门票 要改的
//                            jingdainEntity.setJingdainNewMoney(data.get(0));                    //现价/积分 要改的
//                            jingdainEntity.setJingdainClicknum(Integer.valueOf(data.get(0)));   //景点热度 要改的
//                            jingdainEntity.setJingdainContent("");//详情和图片
//                            jingdainEntity.setJingdainDelete(1);//逻辑删除字段
//                            jingdainEntity.setInsertTime(date);//时间
//                            jingdainEntity.setCreateTime(date);//时间
                            jingdainList.add(jingdainEntity);


                            //把要查询是否重复的字段放入map中
                                //景点编号
                                if(seachFields.containsKey("jingdainUuidNumber")){
                                    List<String> jingdainUuidNumber = seachFields.get("jingdainUuidNumber");
                                    jingdainUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> jingdainUuidNumber = new ArrayList<>();
                                    jingdainUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("jingdainUuidNumber",jingdainUuidNumber);
                                }
                        }

                        //查询是否重复
                         //景点编号
                        List<JingdainEntity> jingdainEntities_jingdainUuidNumber = jingdainService.selectList(new EntityWrapper<JingdainEntity>().in("jingdain_uuid_number", seachFields.get("jingdainUuidNumber")).eq("jingdain_delete", 1));
                        if(jingdainEntities_jingdainUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingdainEntity s:jingdainEntities_jingdainUuidNumber){
                                repeatFields.add(s.getJingdainUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [景点编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        jingdainService.insertBatch(jingdainList);
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
    * 个性推荐
    */
    @IgnoreAuth
    @RequestMapping("/gexingtuijian")
    public R gexingtuijian(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("gexingtuijian方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        CommonUtil.checkMap(params);
        List<JingdainView> returnJingdainViewList = new ArrayList<>();

        //查询订单
        Map<String, Object> params1 = new HashMap<>(params);params1.put("sort","id");params1.put("yonghuId",request.getSession().getAttribute("userId"));
        params1.put("shangxiaTypes",1);
        params1.put("jingdainYesnoTypes",2);
        PageUtils pageUtils = jingdainOrderService.queryPage(params1);
        List<JingdainOrderView> orderViewsList =(List<JingdainOrderView>)pageUtils.getList();
        Map<Integer,Integer> typeMap=new HashMap<>();//购买的类型list
        for(JingdainOrderView orderView:orderViewsList){
            Integer jingdainTypes = orderView.getJingdainTypes();
            if(typeMap.containsKey(jingdainTypes)){
                typeMap.put(jingdainTypes,typeMap.get(jingdainTypes)+1);
            }else{
                typeMap.put(jingdainTypes,1);
            }
        }
        List<Integer> typeList = new ArrayList<>();//排序后的有序的类型 按最多到最少
        typeMap.entrySet().stream().sorted((o1, o2) -> o2.getValue() - o1.getValue()).forEach(e -> typeList.add(e.getKey()));//排序
        Integer limit = Integer.valueOf(String.valueOf(params.get("limit")));
        for(Integer type:typeList){
            Map<String, Object> params2 = new HashMap<>(params);params2.put("jingdainTypes",type);
            params2.put("shangxiaTypes",1);
            params2.put("jingdainYesnoTypes",2);
            PageUtils pageUtils1 = jingdainService.queryPage(params2);
            List<JingdainView> jingdainViewList =(List<JingdainView>)pageUtils1.getList();
            returnJingdainViewList.addAll(jingdainViewList);
            if(returnJingdainViewList.size()>= limit) break;//返回的推荐数量大于要的数量 跳出循环
        }
        params.put("shangxiaTypes",1);
        params.put("jingdainYesnoTypes",2);
        //正常查询出来商品,用于补全推荐缺少的数据
        PageUtils page = jingdainService.queryPage(params);
        if(returnJingdainViewList.size()<limit){//返回数量还是小于要求数量
            int toAddNum = limit - returnJingdainViewList.size();//要添加的数量
            List<JingdainView> jingdainViewList =(List<JingdainView>)page.getList();
            for(JingdainView jingdainView:jingdainViewList){
                Boolean addFlag = true;
                for(JingdainView returnJingdainView:returnJingdainViewList){
                    if(returnJingdainView.getId().intValue() ==jingdainView.getId().intValue()) addFlag=false;//返回的数据中已存在此商品
                }
                if(addFlag){
                    toAddNum=toAddNum-1;
                    returnJingdainViewList.add(jingdainView);
                    if(toAddNum==0) break;//够数量了
                }
            }
        }else {
            returnJingdainViewList = returnJingdainViewList.subList(0, limit);
        }

        for(JingdainView c:returnJingdainViewList)
            dictionaryService.dictionaryConvert(c, request);
        page.setList(returnJingdainViewList);
        return R.ok().put("data", page);
    }

    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = jingdainService.queryPage(params);

        //字典表数据转换
        List<JingdainView> list =(List<JingdainView>)page.getList();
        for(JingdainView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Integer id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JingdainEntity jingdain = jingdainService.selectById(id);
            if(jingdain !=null){

                //点击数量加1
                jingdain.setJingdainClicknum(jingdain.getJingdainClicknum()+1);
                jingdainService.updateById(jingdain);

                //entity转view
                JingdainView view = new JingdainView();
                BeanUtils.copyProperties( jingdain , view );//把实体数据重构到view中

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
    public R add(@RequestBody JingdainEntity jingdain, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,jingdain:{}",this.getClass().getName(),jingdain.toString());
        Wrapper<JingdainEntity> queryWrapper = new EntityWrapper<JingdainEntity>()
            .eq("jingdain_name", jingdain.getJingdainName())
            .eq("jingdain_uuid_number", jingdain.getJingdainUuidNumber())
            .eq("jingdain_address", jingdain.getJingdainAddress())
            .eq("zan_number", jingdain.getZanNumber())
            .eq("cai_number", jingdain.getCaiNumber())
            .eq("jingdain_types", jingdain.getJingdainTypes())
            .eq("jingdain_kucun_number", jingdain.getJingdainKucunNumber())
            .eq("jingdain_clicknum", jingdain.getJingdainClicknum())
            .eq("jingdain_delete", jingdain.getJingdainDelete())
//            .notIn("jingdain_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JingdainEntity jingdainEntity = jingdainService.selectOne(queryWrapper);
        if(jingdainEntity==null){
                jingdain.setZanNumber(1);
                jingdain.setCaiNumber(1);
            jingdain.setJingdainClicknum(1);
            jingdain.setJingdainDelete(1);
            jingdain.setInsertTime(new Date());
            jingdain.setCreateTime(new Date());
        jingdainService.insert(jingdain);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

