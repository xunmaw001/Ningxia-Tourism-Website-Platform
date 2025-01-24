
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
 * 路线
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/luxian")
public class LuxianController {
    private static final Logger logger = LoggerFactory.getLogger(LuxianController.class);

    private static final String TABLE_NAME = "luxian";

    @Autowired
    private LuxianService luxianService;


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
        params.put("luxianDeleteStart",1);params.put("luxianDeleteEnd",1);
        CommonUtil.checkMap(params);
        PageUtils page = luxianService.queryPage(params);

        //字典表数据转换
        List<LuxianView> list =(List<LuxianView>)page.getList();
        for(LuxianView c:list){
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
        LuxianEntity luxian = luxianService.selectById(id);
        if(luxian !=null){
            //entity转view
            LuxianView view = new LuxianView();
            BeanUtils.copyProperties( luxian , view );//把实体数据重构到view中
            //级联表 景点介绍
            //级联表
            JingdainEntity jingdain = jingdainService.selectById(luxian.getJingdainId());
            if(jingdain != null){
            BeanUtils.copyProperties( jingdain , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段,当前表的级联注册表
            view.setJingdainId(jingdain.getId());
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
    public R save(@RequestBody LuxianEntity luxian, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,luxian:{}",this.getClass().getName(),luxian.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<LuxianEntity> queryWrapper = new EntityWrapper<LuxianEntity>()
            .eq("jingdain_id", luxian.getJingdainId())
            .eq("luxian_name", luxian.getLuxianName())
            .eq("luxian_address", luxian.getLuxianAddress())
            .eq("luxian_tujing_address", luxian.getLuxianTujingAddress())
            .eq("luxian_mudi_address", luxian.getLuxianMudiAddress())
            .eq("zan_number", luxian.getZanNumber())
            .eq("cai_number", luxian.getCaiNumber())
            .eq("luxian_types", luxian.getLuxianTypes())
            .eq("luxian_delete", 1)
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        LuxianEntity luxianEntity = luxianService.selectOne(queryWrapper);
        if(luxianEntity==null){
            luxian.setZanNumber(1);
            luxian.setCaiNumber(1);
            luxian.setLuxianClicknum(1);
            luxian.setLuxianDelete(1);
            luxian.setInsertTime(new Date());
            luxian.setCreateTime(new Date());
            luxianService.insert(luxian);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody LuxianEntity luxian, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,luxian:{}",this.getClass().getName(),luxian.toString());
        LuxianEntity oldLuxianEntity = luxianService.selectById(luxian.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        if("".equals(luxian.getLuxianPhoto()) || "null".equals(luxian.getLuxianPhoto())){
                luxian.setLuxianPhoto(null);
        }
        if("".equals(luxian.getLuxianContent()) || "null".equals(luxian.getLuxianContent())){
                luxian.setLuxianContent(null);
        }

            luxianService.updateById(luxian);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<LuxianEntity> oldLuxianList =luxianService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        ArrayList<LuxianEntity> list = new ArrayList<>();
        for(Integer id:ids){
            LuxianEntity luxianEntity = new LuxianEntity();
            luxianEntity.setId(id);
            luxianEntity.setLuxianDelete(2);
            list.add(luxianEntity);
        }
        if(list != null && list.size() >0){
            luxianService.updateBatchById(list);
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
            List<LuxianEntity> luxianList = new ArrayList<>();//上传的东西
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
                            LuxianEntity luxianEntity = new LuxianEntity();
//                            luxianEntity.setJingdainId(Integer.valueOf(data.get(0)));   //景点 要改的
//                            luxianEntity.setLuxianName(data.get(0));                    //路线名称 要改的
//                            luxianEntity.setLuxianUuidNumber(data.get(0));                    //路线编号 要改的
//                            luxianEntity.setLuxianPhoto("");//详情和图片
//                            luxianEntity.setLuxianAddress(data.get(0));                    //路线出发地点 要改的
//                            luxianEntity.setLuxianTujingAddress(data.get(0));                    //路线途径地点 要改的
//                            luxianEntity.setLuxianMudiAddress(data.get(0));                    //路线目的地点 要改的
//                            luxianEntity.setZanNumber(Integer.valueOf(data.get(0)));   //赞 要改的
//                            luxianEntity.setCaiNumber(Integer.valueOf(data.get(0)));   //踩 要改的
//                            luxianEntity.setLuxianTypes(Integer.valueOf(data.get(0)));   //路线类型 要改的
//                            luxianEntity.setLuxianClicknum(Integer.valueOf(data.get(0)));   //路线热度 要改的
//                            luxianEntity.setLuxianContent("");//详情和图片
//                            luxianEntity.setLuxianDelete(1);//逻辑删除字段
//                            luxianEntity.setInsertTime(date);//时间
//                            luxianEntity.setCreateTime(date);//时间
                            luxianList.add(luxianEntity);


                            //把要查询是否重复的字段放入map中
                                //路线编号
                                if(seachFields.containsKey("luxianUuidNumber")){
                                    List<String> luxianUuidNumber = seachFields.get("luxianUuidNumber");
                                    luxianUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> luxianUuidNumber = new ArrayList<>();
                                    luxianUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("luxianUuidNumber",luxianUuidNumber);
                                }
                        }

                        //查询是否重复
                         //路线编号
                        List<LuxianEntity> luxianEntities_luxianUuidNumber = luxianService.selectList(new EntityWrapper<LuxianEntity>().in("luxian_uuid_number", seachFields.get("luxianUuidNumber")).eq("luxian_delete", 1));
                        if(luxianEntities_luxianUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(LuxianEntity s:luxianEntities_luxianUuidNumber){
                                repeatFields.add(s.getLuxianUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [路线编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        luxianService.insertBatch(luxianList);
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
        List<LuxianView> returnLuxianViewList = new ArrayList<>();

        //查看收藏
        Map<String, Object> params1 = new HashMap<>(params);params1.put("sort","id");params1.put("yonghuId",request.getSession().getAttribute("userId"));
        params1.put("shangxiaTypes",1);
        params1.put("luxianYesnoTypes",2);
        PageUtils pageUtils = luxianCollectionService.queryPage(params1);
        List<LuxianCollectionView> collectionViewsList =(List<LuxianCollectionView>)pageUtils.getList();
        Map<Integer,Integer> typeMap=new HashMap<>();//购买的类型list
        for(LuxianCollectionView collectionView:collectionViewsList){
            Integer luxianTypes = collectionView.getLuxianTypes();
            if(typeMap.containsKey(luxianTypes)){
                typeMap.put(luxianTypes,typeMap.get(luxianTypes)+1);
            }else{
                typeMap.put(luxianTypes,1);
            }
        }
        List<Integer> typeList = new ArrayList<>();//排序后的有序的类型 按最多到最少
        typeMap.entrySet().stream().sorted((o1, o2) -> o2.getValue() - o1.getValue()).forEach(e -> typeList.add(e.getKey()));//排序
        Integer limit = Integer.valueOf(String.valueOf(params.get("limit")));
        for(Integer type:typeList){
            Map<String, Object> params2 = new HashMap<>(params);params2.put("luxianTypes",type);
            params2.put("shangxiaTypes",1);
            params2.put("luxianYesnoTypes",2);
            PageUtils pageUtils1 = luxianService.queryPage(params2);
            List<LuxianView> luxianViewList =(List<LuxianView>)pageUtils1.getList();
            returnLuxianViewList.addAll(luxianViewList);
            if(returnLuxianViewList.size()>= limit) break;//返回的推荐数量大于要的数量 跳出循环
        }
        params.put("shangxiaTypes",1);
        params.put("luxianYesnoTypes",2);
        //正常查询出来商品,用于补全推荐缺少的数据
        PageUtils page = luxianService.queryPage(params);
        if(returnLuxianViewList.size()<limit){//返回数量还是小于要求数量
            int toAddNum = limit - returnLuxianViewList.size();//要添加的数量
            List<LuxianView> luxianViewList =(List<LuxianView>)page.getList();
            for(LuxianView luxianView:luxianViewList){
                Boolean addFlag = true;
                for(LuxianView returnLuxianView:returnLuxianViewList){
                    if(returnLuxianView.getId().intValue() ==luxianView.getId().intValue()) addFlag=false;//返回的数据中已存在此商品
                }
                if(addFlag){
                    toAddNum=toAddNum-1;
                    returnLuxianViewList.add(luxianView);
                    if(toAddNum==0) break;//够数量了
                }
            }
        }else {
            returnLuxianViewList = returnLuxianViewList.subList(0, limit);
        }

        for(LuxianView c:returnLuxianViewList)
            dictionaryService.dictionaryConvert(c, request);
        page.setList(returnLuxianViewList);
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
        PageUtils page = luxianService.queryPage(params);

        //字典表数据转换
        List<LuxianView> list =(List<LuxianView>)page.getList();
        for(LuxianView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Integer id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        LuxianEntity luxian = luxianService.selectById(id);
            if(luxian !=null){

                //点击数量加1
                luxian.setLuxianClicknum(luxian.getLuxianClicknum()+1);
                luxianService.updateById(luxian);

                //entity转view
                LuxianView view = new LuxianView();
                BeanUtils.copyProperties( luxian , view );//把实体数据重构到view中

                //级联表
                    JingdainEntity jingdain = jingdainService.selectById(luxian.getJingdainId());
                if(jingdain != null){
                    BeanUtils.copyProperties( jingdain , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setJingdainId(jingdain.getId());
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
    public R add(@RequestBody LuxianEntity luxian, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,luxian:{}",this.getClass().getName(),luxian.toString());
        Wrapper<LuxianEntity> queryWrapper = new EntityWrapper<LuxianEntity>()
            .eq("jingdain_id", luxian.getJingdainId())
            .eq("luxian_name", luxian.getLuxianName())
            .eq("luxian_uuid_number", luxian.getLuxianUuidNumber())
            .eq("luxian_address", luxian.getLuxianAddress())
            .eq("luxian_tujing_address", luxian.getLuxianTujingAddress())
            .eq("luxian_mudi_address", luxian.getLuxianMudiAddress())
            .eq("zan_number", luxian.getZanNumber())
            .eq("cai_number", luxian.getCaiNumber())
            .eq("luxian_types", luxian.getLuxianTypes())
            .eq("luxian_clicknum", luxian.getLuxianClicknum())
            .eq("luxian_delete", luxian.getLuxianDelete())
//            .notIn("luxian_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        LuxianEntity luxianEntity = luxianService.selectOne(queryWrapper);
        if(luxianEntity==null){
                luxian.setZanNumber(1);
                luxian.setCaiNumber(1);
            luxian.setLuxianClicknum(1);
            luxian.setLuxianDelete(1);
            luxian.setInsertTime(new Date());
            luxian.setCreateTime(new Date());
        luxianService.insert(luxian);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

